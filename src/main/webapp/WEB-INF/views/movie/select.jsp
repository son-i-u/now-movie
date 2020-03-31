
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="../includes/header.jsp"%>
<body class="sb-nav-fixed">
	<%@ include file="../includes/nav.jsp"%>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
			<div class="fixed" href="#bottom" title=Top>
					<a class="remote-control" href="#top">
						<p style="padding:5px;">TOP</p>
					</a>
				
					<a class="remote-control" href="#bottom">
						<p style="padding:5px;">BOTTOM</p>
					</a>
				</div>

				<h1 id='top'>선호 영화 선택</h1>
				<p>고객님을 위한 추천 시스템에 이용됩니다.</p>
				<ol class="breadcrumb mb-4">
					<li>영화 다시 부르기
						<button class="btn" type="button" onclick="reload()">
							<img class="btn-img" src="/resources/images/icons/reload.png"
								style="height: 20px; width: 20px">
						</button>
					</li>
				</ol>


				<!-- 영화 리스트 이미지 출력  / 버튼에 이미지 삽입 -->
				<div class="row" style="margin-top: 3%;">
					<c:forEach items="${list }" var="movie">
						<div class="col-xl-2 col-md-3 col-4" id="${movie.movie_id }">
							${movie.movie_nm } <a id="${movie.movie_id }"
								onclick="movieselect(${movie.movie_id}); "> <img
								src="<spring:url value="${movie.img_loc }"/>" alt="..."
								id="${movie.movie_id}img" class="normal-card"
								style="height: 230px; width: 310px">
						</div>

					</c:forEach>

					<!-- 접근 거부방지를 위한 -->
					<sec:csrfInput />

				</div>

				<!-- 제출 버튼 -->
				<div class="container-login100-form-btn m-t-17">
					<button class='submit_btn login100-form-btn' type="button"
						onclick="moviePost()" style="margin: 30px 0px; float: right;">
						submit</button>
				</div>

			</div>
		</main>
	</div>

	<style>
.col-xl-2 {
	font-size: 1em;
	font-weight: bold;
	margin-top: 5%;
	font-family: 돋움;
	margin-top: 5%;
}

.login100-form {
	text-align: center;
	margin-top: 30px;
	padding-right: 40%;
	padding-left: 40%;
	height: 5%;
}

.login100-form-btn {
	font-weight: bold;
	font-size: 1.5em;
}
</style>

	<script type="text/javascript">

					var movieArray = [];
					var lastCheck = true;
					var $form = $('<form></form>');
					$(document.body).append($form);
					
					$(document).ready(function() {


					});

					// 클릭시 선택 영화 배열에 추가 
					function movieselect(data) {
						
						if(lastCheck == false){
							lastCheck = !lastCheck;
							return;
						}
						/* 이미지 변경을 위한 class 변경 */
						var class_id = $("#"+data+"img").attr('class');

						if(class_id == 'card-img-top'){
							
							/* 재클릭한 영화는 배열에서 제거 */
							$("#"+data+"img").attr('class','normal-card');
							const idx = movieArray.indexOf(data);
							if ( idx > -1 ) movieArray.splice(idx,1);
							
						}else{
							console.log(data + "클릭했습니다.");
							movieArray.push(data);
							console.log(movieArray.length+ "선택한 movie 수입니다.");
							$("#"+data+"img").attr('class','selected-card');
						}
						
				    }
				 	
					/* 새로고침 */
				    function reload(){
						location.reload();
					}
					
				    // moviearray를 post로 전달
				    function moviePost(){
				    	
				    	/* 선택 영화 없을 시 경고 알림 */
				    	if(movieArray.length == 0){
				    		
				    		alert("선호 영화를 선택해 주세요");
				    		lastCheck = !lastCheck;
				    		/*
				    		 var delConfirm = confirm('선호 영화를 선택해 주세요');
				    		   if (delConfirm) {
				    			   self.location="/movie/recommend";
				    		   }
				    		   else {
				    		      //취소하고 계속 진행
				    			  lastCheck = !lastCheck;
				    		   }
				    		*/
				    	}else{
				    		
				    		/* 선택 영화 있을 시 그대로 제출 */
				    		$form.attr('action','/movie/select');
					    	$form.attr('method','post');
					    	
					    	var test = $('<input name="test" type="hidden" value="test">');
					    	var mArray = $('<input name="movieArray" type="hidden" value='+movieArray+'>');
					    	var sec = $('<sec:csrfInput/>');
					    	
					    	$form.append(test);  
					    	$form.append(mArray);
					    	$form.append(sec);
					    	$form.submit();
					    	
					    	lastCheck = !lastCheck
	    	
					    }
				    }
				    	
				    	
							
</script>
</body>
</html>