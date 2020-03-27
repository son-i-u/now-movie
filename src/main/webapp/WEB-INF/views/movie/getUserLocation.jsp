<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			document.getElementById("userLon").value = lon1;
			document.getElementById("userLat").value = lat1;
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
	<p>위지 정보를 받아오는 중입니다...</p>
	<!-- Form 말고 세션에 저장하는 방식으로 ㄱㄱ -->
	<form id ="location" action="/movie/recommend" method="POST">
		<input type="hidden" id="userLon" name="userLon" value='0'></input>
		<input type="hidden" id="userLat" name="userLat" value='0'></input>
		
		<!-- 접근 거부방지를 위한 -->
		<sec:csrfInput /> 
    </form>
    
    <script type="text/javascript">
    	window.onload = function(){
    		setInterval(function(){
    			if(document.getElementById('userLon').value != '0' && document.getElementById('userLat') != '0')
        			document.getElementById('location').submit();
    			else 
    				return;
    		},100);
    	};
    </script>
</body>
</html>