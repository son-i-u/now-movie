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
	var arrNumber = new Array(); //거리 결과 저장 배열
	
	/* 주소-좌표 변환 객체를 생성 */
	var geocoder = new kakao.maps.services.Geocoder();

	/* 현재 위치를 저장할 변수 생성 */
	var lat1 = 0, lon1 = 0;
	
	function wait(msecs) {

		var start = new Date().getTime();
		var cur = start;
		while (cur - start < msecs) {
			cur = new Date().getTime();
		}
	}

	/* Get User's Longitude & Latitude */
	function getUserLocation() {
		// Geolocation API에 액세스할 수 있는지를 확인
		if (navigator.geolocation) {
			//위치 정보를 얻기
			navigator.geolocation.getCurrentPosition(function(pos) {
				lon1 = pos.coords.longitude;
				lat1 = pos.coords.latitude;
			});
		} else {
			alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
		}
	}
	getUserLocation();

	/* calculate distance between coords */
	function distance(lat2, lon2, unit) {
		//console.log("lat1: " + lat1);
		//console.log("lon1: " + lon1);
		//console.log("lat2: " + lat2);
		//console.log("lon2: " + lon2);
		if ((lat1 == lat2) && (lon1 == lon2)) {
			return 0;
		} else {
			var radlat1 = Math.PI * lat1 / 180;
			var radlat2 = Math.PI * lat2 / 180;
			var theta = lon1 - lon2;
			var radtheta = Math.PI * theta / 180;
			var dist = Math.sin(radlat1) * Math.sin(radlat2)
					+ Math.cos(radlat1) * Math.cos(radlat2)
					* Math.cos(radtheta);
			if (dist > 1) {
				dist = 1;
			}
			dist = Math.acos(dist);
			dist = dist * 180 / Math.PI;
			dist = dist * 60 * 1.1515;
			if (unit == "K") {
				dist = dist * 1.609344
			}
			if (unit == "N") {
				dist = dist * 0.8684
			}
			return dist;
		}
	}

	
	
	var callback = function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			//console.log(result[0].x); // 126.570667
			//console.log(result[0].y); // 33.45070100000001
			arrNumber.push(distance(result[0].y, result[0].x,"K"));
		}
		
	};

	//WTM 좌표를 WGS84 좌표계의 좌표로 변환한다
	function test(){
		<c:forEach items="${ movieInfoList }" var="prefer">
			//console.log('${prefer}');
			arrNumber.push('${prefer.theator_nm}');
			geocoder.transCoord('${ prefer.longitude }', '${ prefer.latitude }', callback, {
				input_coord : kakao.maps.services.Coords.WTM,
				output_coord : kakao.maps.services.Coords.WGS84	
			});
		</c:forEach>
	}
	test();
	
	window.onload = function() {
		console.log(arrNumber);
		for(var i=0;i<arrNumber.length;i++){ //배열 출력
		    console.log(arrNumber[i]);
		}
	}
</script>

</head>
<body>console test page
</body>
</html>