<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Kakao services 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d101820d01fc7c6e277e618c7103d0b1&libraries=services"></script>
</head>
<body>
	<!-- refresh
	여기서 userloc 받아서 다시 recommend로 redirect -->

	<script>
		/* 주소-좌표 변환 객체를 생성 */
		var geocoder = new kakao.maps.services.Geocoder();

		/* 현재 위치를 저장할 변수 생성 */
		var lat1 = 443576.4212633609, lon1 = 189284.08033630642;

		/* Get User's Longitude & Latitude */
		function isGeoUseable() {
			return new Promise(function(resolve, reject) {
				if (navigator.geolocation) {
					resolve();
				} else
					reject();
			});
		}

		function getUserLoc() {
			return new Promise(function(resolve, reject) {
				navigator.geolocation.getCurrentPosition(function(pos) {
					//console.log("userloc");
					//lon1 = pos.coords.longitude;
					//lat1 = pos.coords.latitude;
					console.log("user: " + lon1 + ", " + lat1);
					resolve();
				});
			});
		}

		var callback = function(result, status) {

			if (status === kakao.maps.services.Status.OK) {
				//lon1 = result[0].x;
				//lat1 = result[0].y;
				console.log("NEW user: " + lon1 + ", " + lat1);
				sessionStorage.setItem('user_lat', lat1);
				sessionStorage.setItem('user_lon', lon1);
			}
		};

		function transCoords() {
			return new Promise(function(resolve, reject) {

				geocoder.transCoord(lon1, lat1, callback, {
					input_coord : kakao.maps.services.Coords.WGS84,
					output_coord : kakao.maps.services.Coords.WTM
				});

				if (lat1 > 40 && lon1 > 130)
					resolve();
			});
		}

		//비동기적 함수 호출
		isGeoUseable().then(getUserLoc).then(transCoords);
	</script>
</body>
</html>