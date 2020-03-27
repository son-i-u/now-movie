<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/htm14/loose.dtd">
<html http-equiv="Content-type" content="text/html; charset=UTF-8">

<%@ include file="includes/header.jsp"%>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/resources/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
	
	<!-- Kakao services 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d101820d01fc7c6e277e618c7103d0b1&libraries=services"></script>

<script>	

	/* 주소-좌표 변환 객체를 생성 */
	var geocoder = new kakao.maps.services.Geocoder();
	
	/* 현재 위치를 저장할 변수 생성 */
	var lat1 = 0, lon1 = 0;

	
	//////////////////////////////////////////////////////////
	

	/* Get User's Longitude & Latitude */
	function isGeoUseable(){
		return new Promise(function(resolve, reject){
			if (navigator.geolocation) {
				resolve();
			}
			else
				reject();
		});
	}
	
	function getUserLoc(){
		return new Promise(function(resolve, reject){
			navigator.geolocation.getCurrentPosition(function(pos) {
				//console.log("userloc");
				lon1 = pos.coords.longitude;
				lat1 = pos.coords.latitude;
				console.log("user: " + lon1 + ", " + lat1);
				resolve();
			});
		});
	}
		
	var callback = function(result, status) {
		
		if (status === kakao.maps.services.Status.OK) {
			lon1 = result[0].x;
			lat1 = result[0].y;
			console.log("NEW user: " + lon1 + ", " + lat1); 
			sessionStorage.setItem('user_lat', lat1);
			sessionStorage.setItem('user_lon', lon1);
		}
	};
	
	function transCoords(){
		return new Promise(function(resolve, reject){
				
			geocoder.transCoord(lon1, lat1, callback, {
				input_coord : kakao.maps.services.Coords.WGS84,
				output_coord : kakao.maps.services.Coords.WTM	
			});
			
			if(lat1 > 40 && lon1 > 130)
				resolve();
		});
	}
	
	//비동기적 함수 호출
	isGeoUseable()
		.then(getUserLoc)
		.then(transCoords);
</script>
</head>

<body>
	<h2><c:out value="${error }"/></h2>
	<h2><c:out value="${logout }"/></h2>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w" method='post' action="/login">
					<span class="login100-form-title p-b-51">
						now movie
					</span>
		
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Username is required">
						<input class="input100" type="text" name="username" placeholder="Username">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100"></span>
					</div>
					
					<input type='hidden' name="${_csrf.parameterName }" value="${_csrf.token }">
					
					<div class="flex-sb-m w-full p-t-3 p-b-24">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								Remember me
							</label>
						</div>

						<div>
							<a href="/user/register" class="txt1">
								Join us!
							</a>
						</div>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn">
							Login
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	

	<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="/resources/vendor/animsition/js/animsition.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/select2/select2.min.js"></script>
	<script src="/resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="/resources/vendor/countdowntime/countdowntime.js"></script>
	<script src="/resources/js/main.js"></script>
	
	<c:if test="${param.logout != null }">
	<script>
		$(document).ready(function(){
			if (history.state) {
				return;
			}
			alert("로그아웃 되었습니다.");
			
			history.replaceState({},null,null);
		});
	</script>
	</c:if>	
</body>
</html>