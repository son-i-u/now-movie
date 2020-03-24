
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

<script type="text/javascript">
	
	var jungu_array = new Array(2).fill(false);

	/* 입력 정규식 */
	var start_timeJ = /^([0-9]{3,4})-?([0-9]{2})-?([0-9]{2}) ?([0-9]{2}):?([0-9]{2}):?([0-9]{2})$/;
	var end_timeJ   = /^([0-9]{3,4})-?([0-9]{2})-?([0-9]{2}) ?([0-9]{2}):?([0-9]{2}):?([0-9]{2})$/;


	$(document).ready(function() {

		$('#start_time').blur(function() {
			if (start_timeJ.test($(this).val())) {
				$("#start_tm_check").text('');
				jungu_array[0] = start_timeJ.test($(this).val());
			} else {
				$('#start_tm_check').text('yyyy-mm-dd hh:mi:ss 형식만 가능합니다');
				$('#start_tm_check').css('color', 'red');
			}
		});
		
		$('#end_time').blur(function() {
			if (end_timeJ.test($(this).val())) {
				$("#end_tm_check").text('');
				jungu_array[1] = start_timeJ.test($(this).val());
			} else {
				$('#end_tm_check').text('yyyy-mm-dd hh:mi:ss 형식만 가능합니다');
				$('#end_tm_check').css('color', 'red');
			}
		});

	});

	function submit_check() {

		/* input 값들 */
		var theator_idn = $("#theator_id").val();
		var movie_idn = $("#movie_id").val();
		var start_timen = $("#start_time").val();
		var end_timen = $("#end_time").val();
		
		/* 입력 항목 확인 */
		if (theator_idn == "" || movie_idn == "" || start_timen == ""
				|| end_time == "") {
			alert('입력하지 않은 항목이 있습니다');
			return;
		}

		/* 정규식 확인 */
		for(var i=0; i<jungu_array.length; i++){
			if(jungu_array[i] == false){
				alert('형식을 맞춰주세요');
				return;
			}
		}
		
		var formObj = $("form");
		$(document.body).append(formObj);
		formObj.submit();
	};
</script>


<body class="sb-nav-fixed">
	<%@ include file="../includes/nav.jsp"%>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<form role="form" action="/schedule/insert" method="post">
					<div class="form-group">
						<label>theator_id</label> <input class="form-control"
							name='theator_id' id='theator_id' maxlength='20'
							placeholder="영과관 ID를 입력하세요">
					</div>

					<div class="form-group">
						<label>movie_id</label> <input class="form-control"
							name='movie_id' id='movie_id' maxlength='20'
							placeholder="영화 ID를 입력하세요">
					</div>

					<div class="form-group">
						<label>start_time</label> <input class="form-control"
							name='start_time' id='start_time'
							placeholder="yyyy-mm-dd hh:mi:ss">
						<div class="eheck_font" id="start_tm_check"></div>
					</div>

					<div class="form-group">
						<label>end_time</label> <input class="form-control"
							name='end_time' id='end_time' placeholder="yyyy-mm-dd hh:mi:ss">
							<div class="eheck_font" id="end_tm_check"></div>
					</div>

					<button type="button" onclick="submit_check()"
						class="btn btn-default">Submit Button</button>
					<button type="reset" class="btn btn-default">Reset Button</button>

					<!-- 접근 거부방지를 위한 -->
					<sec:csrfInput />
				</form>

			</div>
		</main>
	</div>





</body>
</html>