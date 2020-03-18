
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

				<p>get일때</p>
				시작 위치 (위도,경도) : <br> <span id="startlat">위도</span>&deg; <span
					id="startlon">경도</span>&deg; <br> <br> 현재 위치 (위도,경도) : <br>
				<span id="currentlat">위도</span>&deg; <span id="currentlon">경도</span>&deg;
				<br> <br> <span id="acc">정확도</span>미터 정도의 정확도를 보임 <br>
				<br>

				<button type="button" onclick="submit()">submit</button>

			</div>
		</main>
	</div>




	<script type="text/javascript">
		$(document).ready(function() {

		});

		var subLat;
		var subLon;

		var $form = $('<form></form>');
		$(document.body).append($form);

		function submit() {
			console.log(subLat + "입니다..");
			console.log(subLon + "입니다..");

			$form.attr('action', '/sample/gpstest');
			$form.attr('method', 'post');

			var lat = $('<input name="lat" type="hidden" value='+subLat+'>');
			var lon = $('<input name="lon" type="hidden" value='+subLon+'>');
			var sec = $('<sec:csrfInput/>');

			$form.append(lat);
			$form.append(lon);
			$form.append(sec);
			$form.submit();

		}

		if (navigator.geolocation) {
			alert('Geolocation API 사용이 가능합니다.');
		} else {
			alert('해당 브라우저에서 Geolocation API를 지원하지 않습니다.');
		}

		navigator.geolocation
				.getCurrentPosition(function(position) {
					console.log(position.coords.latitude + ", "
							+ position.coords.longitude);

					document.getElementById('currentlat').innerHTML = position.coords.latitude;
					document.getElementById('currentlon').innerHTML = position.coords.longitude;

					subLat = position.coords.latitude;
					subLon = position.coords.longitude;
				});

		navigator.geolocation.getCurrentPosition(success, function(error) {
			switch (error.code) {
			case error.PERMISSION_DENIED:
				// 사용자가 위치정보 사용을 허용하지 않았을 때
				break;
			case error.POSITION_UNAVAILABLE:
				// 위치 정보 사용이 불가능할 때
				break;
			case error.TIMEOUT:
				// 위치 정보를 가져오려 시도했지만, 시간이 초과되었을 때
				break;
			case error.UNKNOWN_ERROR:
				// 기타 알 수 없는 오류가 발생하였을 때
				break;
			}
		});
	</script>
</body>
</html>
<!--  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌표 읽기</title>

<script type="text/javascript">
	window.onload = function() {
		if (navigator.geolocation == undefined) {
			alert('본 기기가 위치 정보를 지원하지 않습니다.');
			return;
		}

		/*
		사용자의 현재 기기의 위치를 Position 오브젝트 형으로 반환
		getCurrentPosition(successCallback,errorCallback,options)
		<옵션>
		frequency : 위치 정보를 가져올 시간 간격으로 단위는 밀리세컨드(ms) 기본값은 10000
		enableHighAccuracy : 위치 정보의 정확성을 최상으로 할지 여부 지정
		timeout : 기기로부터 위치 정보를 가져올 때까지의 최대 대기 시간. 
				  단위는 밀리세컨드(ms)
		maximumAge: 위치 정보를 캐싱하는 기간을 지정, 단위는 밀리세컨드(ms)
		 */

		navigator.geolocation.getCurrentPosition(success, fail, {
			timeout : 10000
		});

		//위도,경도값 호출이 가능한 경우
		function success(position) {
			/*
			latitude : 위도
			longitude : 경도
			altitude : 고도
			accuracy : 위도와 경도의 정확도
			altitudeAccuracy : 고도의 정확도
			heading : 방향(북쪽으로부터 시계방향으로 현재 방향까지의 각도)
			speed : 현재 기기의 속도를 meter per second
			 */

			document.getElementById('startlat').innerHTML = position.coords.latitude;
			document.getElementById('startlon').innerHTML = position.coords.longitude;
		}

		//위도,경도값 호출이 불가능한 경우
		function fail(error) {
			alert('에러 발생 코드 : ' + error.code);
			/*
			0 : 알 수 없는 오류
			1 : 권한 거부
			2 : 위치 추적 실패
			3 : 시간 초과
			 */
		}

		//현재 위치를 계속 확인
		//watchPosition : 일정 간격으로 기기의 위치가 바뀌면 현재 기기의 위치를
		//				  position 오브젝트 형으로 반환
		var watchId = navigator.geolocation.watchPosition(function(position) {
			var lat = position.coords.latitude;
			var lon = position.coords.longitude;
			var acc = position.coords.accuracy;

			document.getElementById('currentlat').innerHTML = lat;
			document.getElementById('currentlon').innerHTML = lon;
			document.getElementById('acc').innerHTML = acc;
		});

		//위치 추적 해제
		var btn = document.getElementById('btn');
		btn.addEventListener('click', function() {
			//clearWatch : watchPosition 메서드로 위치 추적을 하는 것을 해제
			navigator.geolocation.clearWatch(watchId);
			alert('위치 추적이 해제됨');
		}, false);
	};
	
</script>
</head>

<body>
	시작 위치 (위도,경도) :
	<br>
	<span id="startlat">위도</span>&deg;
	<span id="startlon">경도</span>&deg;
	<br>
	<br> 현재 위치 (위도,경도) :
	<br>
	<span id="currentlat">위도</span>&deg;
	<span id="currentlon">경도</span>&deg;
	<br>
	<br>
	<span id="acc">정확도</span>미터 정도의 정확도를 보임
	<br>
	<br>
	<button id="btn">위치 추적 해제</button>
</body>
</html>
-->
