<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>지금영화 회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">
td {
	border: 1px solid #000000;
	border-collapse: collapse;
}
</style>
</head>

<%@ include file="../includes/header.jsp"%>
<body class="sb-nav-fixed">
</body>
<%@ include file="../includes/nav.jsp"%>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">







			<!-- 				<style type="text/css">
td {
	border: 1px solid #000000;
	border-collapse: collapse;
}
</style> -->

			<script type="text/javascript">

//모든 공백 체크 정규식
var empJ = /\s/g;
//아이디 정규식
var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/;
// 이름 정규식
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
// 휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/



var birthJ = false;

$(document).ready(function() {

//아이디 중복확인
	$("#USER_ID").blur(function() {
		if($('#USER_ID').val()==''){
			$('#id_check').text('아이디를 입력하세요.');
			$('#id_check').css('color', 'red'); 
		} 
		else if(idJ.test($('#USER_ID').val())!=true){
			$('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.');
			$('#id_check').css('color', 'red');
		} 
		else if($('#USER_ID').val()!=''){
			var USER_ID=$('#USER_ID').val();
			$.ajax({
				async : true,
				type : 'POST',
				data : USER_ID,//USER_ID라는 이름으로 USER_ID라는 데이터를 @WebServlet("/idsearch.do")에 보내겠다
				url : "/user/idCheck",
				dateType: 'json',
				contentType: "application/json; charset=UTF-8",
				success : function(data) {

					if(data.cnt > 0){
						$('#id_check').text('중복된 아이디 입니다.');
						$('#id_check').css('color', 'red');
						$("#usercheck").attr("disabled", true);
					}
					else{
						if(idJ.test(USER_ID)){
							$('#id_check').text('사용가능한 아이디 입니다.');
							$('#id_check').css('color', 'blue');
							$("#usercheck").attr("disabled", false);
						}
						else if(USER_ID==''){
							$('#id_check').text('아이디를 입력해주세요.');
							$('#id_check').css('color', 'red');
							$("#usercheck").attr("disabled", true);
						}
						else{
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
							$('#id_check').css('color', 'red');
							$("#usercheck").attr("disabled", true);
						}
					}

				}

			});//ajax/// 
		}//else if

	});//blur

	$('form').on('submit',function(){
		var inval_Arr = new Array(5).fill(false);
		if (idJ.test($('#USER_ID').val())) {
			inval_Arr[0] = true; 
		}
		else {
			inval_Arr[0] = false;
			alert('아이디를 확인하세요.');
			return false;
		}
// 비밀번호가 같은 경우 && 비밀번호 정규식
		if (($('#PWD').val() == ($('#PWD2').val())) && pwJ.test($('#PWD').val())) 
		{
			inval_Arr[1] = true;
		} 
		else {
			inval_Arr[1] = false;
			alert('비밀번호를 확인하세요.');
			return false;
		}

		// 생년월일 정규식
		if (birthJ) {
			console.log(birthJ);
			inval_Arr[2] = true; 
		}
		else {
			inval_Arr[2] = false;
			alert('생년월일을 확인하세요.');
			return false;
		} 

		// 휴대폰번호 정규식
		if (phoneJ.test($('#PHONE_NUM').val())) {
			console.log(phoneJ.test($('#PHONE_NUM').val()));
			inval_Arr[3] = true;
		} 
		
		else {
			inval_Arr[3] = false;
			alert('휴대폰 번호를 확인하세요.');
			return false;
		}
		//성별 확인
		/* if((user_info.GENDER[0].checked==false&&user_info.GENDER[1].checked==false)||
				(user_info.GENDER[0].checked==true&&user_info.GENDER[1].checked==true)){ */
		if(!(user_info.GENDER[0].checked^user_info.GENDER[1].checked)){
			inval_Arr[4] = false;
			alert('성별을 확인하세요.');
			return false;

		}
		else{
			inval_Arr[4] = true;
		} 
		
		


		//전체 유효성 검사
		var validAll = true;
		for(var i = 0; i < inval_Arr.length; i++){
			if(inval_Arr[i] == false){
				validAll = false;
			}
		}
		if(validAll == true){ // 유효성 모두 통과
			alert('회원가입이 완료되었습니다.'); 
		} 
		else{
			alert('정보를 다시 확인하세요.')
		}
	});


	$('#USER_ID').blur(function() {

		if (idJ.test($('#USER_ID').val())) {
			console.log('true');
			$('#id_check').text('');
			} else {
				console.log('false');
				$('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
				$('#id_check').css('color', 'red');
				}
		});

	$('#PWD').blur(function() {
		if (pwJ.test($('#PWD').val())) {
			console.log('true');
			$('#pw_check').text('');
			} else {
				console.log('false');
				$('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
				$('#pw_check').css('color', 'red');
				}
		});


	//1~2 패스워드 일치 확인
	$('#PWD2').blur(function() {
		if ($('#PWD').val() != $(this).val()) {
			$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
			$('#pw2_check').css('color', 'red');
			} else {
				$('#pw2_check').text('');
				}
		});




	// 생일 유효성 검사
	var birthj = false;

	//생년월일 birthJ 유효성 검사
	$('#BIRTH').blur(function(){
		var dateStr = $(this).val(); 
		var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
		var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
		var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
		var today = new Date(); // 날짜 변수 선언
		var yearNow = today.getFullYear(); // 올해 연도 가져옴

		if (dateStr.length <=8) {
			// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
			if (year > yearNow || year < 1900 ){
				$('#birth_check').text('생년월일을 확인해주세요');
				$('#birth_check').css('color', 'red');
				} 
			else if (month < 1 || month > 12) {
				$('#birth_check').text('생년월일을 확인해주세요 ');
				$('#birth_check').css('color', 'red'); 

			}else if (day < 1 || day > 31) {
				$('#birth_check').text('생년월일을 확인해주세요 ');
				$('#birth_check').css('color', 'red'); 

			}else if ((month==4 || month==6 || month==9 || month==11) && day==31) { 
				$('#birth_check').text('생년월일을 확인해주세요 ');
				$('#birth_check').css('color', 'red'); 
				}else if (month == 2) {
					var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));

					if (day>29 || (day==29 && !isleap)) {

						$('#birth_check').text('생년월일을 확인해주세요 ');
						$('#birth_check').css('color', 'red'); 

					}else{
						$('#birth_check').text('');
						birthJ = true;
						}
					}else{
						$('#birth_check').text(''); 
						birthJ = true;
						}//end of if
						}else{
							//1.입력된 생년월일이 8자 초과할때 : auth:false
							$('#birth_check').text('생년월일을 확인해주세요 ');
							$('#birth_check').css('color', 'red'); 
							}
		}); //End of method /*






		// 휴대전화
		$('#PHONE_NUM').blur(function(){
			if(phoneJ.test($(this).val())){
				console.log(nameJ.test($(this).val()));
				$("#PHONE_NUM").text('');
				} else {
					$('#phone_check').text('휴대폰번호를 확인해주세요 ');
					$('#phone_check').css('color', 'red');
					}
			});
		});


</script>
			<body>
				<div style="margin-top: 10%; ">

					<article class="container">
						<div class="page-header">
							<div class="col-md-6 col-md-offset-3">
								<h3>회원가입</h3>
							</div>

						</div>
						<div class="col-sm-6 col-md-offset-3">

							<form action="/user/register" method="post" role="form"
								id="usercheck" name="user_info">

								<div class="form-group">
									<label for="id">아이디</label> <input type="text"
										class="form-control" id="USER_ID" name="USER_ID"
										placeholder="ID" autocomplete="off">
									<div class="eheck_font" id="id_check"></div>
								</div>

								<div class="form-group">
									<label for="pw">비밀번호</label> <input type="password"
										class="form-control" id="PWD" name="PWD"
										placeholder="PASSWORD">
									<div class="eheck_font" id="pw_check"></div>
								</div>
								<div class="form-group">
									<label for="pw2">비밀번호 확인</label> <input type="password"
										class="form-control" id="PWD2" name="PWD2"
										placeholder="Confirm Password">
									<div class="eheck_font" id="pw2_check"></div>
								</div>


								<div class="form-group">
									<label for="BIRTH">생년월일</label> <input type="tel"
										class="form-control" id="BIRTH" name="BIRTH"
										placeholder="ex) 19990101">
									<div class="eheck_font" id="birth_check"></div>
								</div>


								<div class="form-group">
									<label for="PHONE_NUM">휴대폰 번호('-'없이 번호만 입력해주세요)</label> <input
										type="tel" class="form-control" id="PHONE_NUM"
										name="PHONE_NUM" placeholder="Phone Number">
									<div class="eheck_font" id="phone_check"></div>
								</div>

								<div class="form-group">
									<label for="GENDER">성별 </label> <input type="checkbox"
										id="GENDER" name="GENDER" value="male">남 <input
										type="checkbox" id="GENDER" name="GENDER" value="female">여
								</div>



								<div class="form-group text-center">
									<button type="submit" class="btn btn-primary">회원가입</button>
								</div>

								<!-- 접근 거부방지를 위한 -->
								<sec:csrfInput />
							</form>
						</div>
					</article>
				</div>
			</body>
		</div>
	</main>
</div>
<!-- </body> -->

</html>





<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="../includes/header.jsp"%>
<body class="sb-nav-fixed">
	<%@ include file="../includes/nav.jsp"%>

	<div class="bg-primary" id="layoutSidenav_content">
		<main>
			<div class="container-fluid">

				<div id="layoutAuthentication">
					<div id="layoutAuthentication_content">
						<main>
							<div class="container">
								<div class="row justify-content-center">
									<div class="col-lg-7">
										<div class="card shadow-lg border-0 rounded-lg mt-5">
											<div class="card-header">
												<h3 class="text-center font-weight-light my-4">Create
													Account</h3>
											</div>
											<div class="card-body">
												<form>
													<div class="form-row">
														<div class="col-md-6">
															<div class="form-group">
																<label class="small mb-1" for="inputFirstName">First
																	Name</label><input class="form-control py-4"
																	id="inputFirstName" type="text"
																	placeholder="Enter first name" />
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label class="small mb-1" for="inputLastName">Last
																	Name</label><input class="form-control py-4" id="inputLastName"
																	type="text" placeholder="Enter last name" />
															</div>
														</div>
													</div>
													<div class="form-group">
														<label class="small mb-1" for="inputEmailAddress">Email</label><input
															class="form-control py-4" id="inputEmailAddress"
															type="email" aria-describedby="emailHelp"
															placeholder="Enter email address" />
													</div>
													<div class="form-row">
														<div class="col-md-6">
															<div class="form-group">
																<label class="small mb-1" for="inputPassword">Password</label><input
																	class="form-control py-4" id="inputPassword"
																	type="password" placeholder="Enter password" />
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label class="small mb-1" for="inputConfirmPassword">Confirm
																	Password</label><input class="form-control py-4"
																	id="inputConfirmPassword" type="password"
																	placeholder="Confirm password" />
															</div>
														</div>
													</div>
													<div class="form-group mt-4 mb-0">
														<a class="btn btn-primary btn-block" href="login.html">Create
															Account</a>
													</div>
												</form>
											</div>
											<div class="card-footer text-center">
												<div class="small">
													<a href="register.html">Have an account? Go to login</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</main>
					</div>
					<div id="layoutAuthentication_footer">
						<footer class="py-4 bg-light mt-auto">
							<div class="container-fluid">
								<div
									class="d-flex align-items-center justify-content-between small">
									<div class="text-muted">Copyright &copy; Your Website
										2019</div>
									<div>
										<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
											&amp; Conditions</a>
									</div>
								</div>
							</div>
						</footer>
					</div>
				</div>


			</div>
		</main>
	</div>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="/resources/dist/js/scripts.js"></script>
</body>
</html> --%>