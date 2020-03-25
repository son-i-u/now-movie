<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authentication property="name" var="loginID" />

<!DOCTYPE html>
<html lang="en">
<%@ include file="../includes/header.jsp"%>

<!-- Kakao services 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d101820d01fc7c6e277e618c7103d0b1&libraries=services"></script>

<script type="text/javascript">
	/*로그인 안했으면 추천 페이지에 들어오지 못함 */
	
	if ('${ loginID }' == "anonymousUser" || '${ loginID }' == null) {

		self.location = "/customLogin";
	}

	/* 선호 영화를 하나도 선택하지 않았으면 영화 선택 페이지로 이동 */
	else if ('${ preferList.size() }' < 1) {

		self.location = "/movie/select";
	}

	function toDetailPage(movie_id) {

		location.href = '/movie/info?id=' + movie_id;
	}

	///////////////////////////////////////
	///////////LOCATION LOGIC//////////////
	///////////////////////////////////////

	var jsonArr = new Array(); //모든 객체 저장 배열
		
	/* 주소-좌표 변환 객체를 생성 */
	var geocoder = new kakao.maps.services.Geocoder();

	/* 현재 위치를 저장할 변수 생성 */
	var lat1 = 0, lon1 = 0;
	
	/* 모든 데이터 json화 */
	<c:forEach items="${ movieInfoList }" var="prefer">
		var json = new Object();
		json.movie_id = '${ prefer.movie_id }';
		json.movie_nm = '${ prefer.movie_nm }';
		json.movie_nm_en = '${ prefer.movie_nm_en }';
		json.genre = '${ prefer.genre }';
		json.director = '${ prefer.director }';
		json.actor = '${ prefer.actor }';
		json.nation = '${ prefer.nation }';
		json.img_loc = '${ prefer.img_loc }';
	
		json.theator_id = '${ prefer.theator_id }';
		json.theator_nm = '${ prefer.theator_nm }';
		json.location = '${ prefer.location }';
		json.latitude = '${ prefer.latitude }';
		json.longitude = '${ prefer.longitude }';
	
		json.start_time = '${ prefer.start_time }';
		json.end_time = '${ prefer.end_time }';
		json.left_min = '${ prefer.left_min }';	
		json.distance = 0;
		
		jsonArr.push(json);
	</c:forEach>	
	console.log(jsonArr);

	/* Get User's Longitude & Latitude */
	function getUserLocation() {
		// Geolocation API에 액세스할 수 있는지를 확인
		if (navigator.geolocation) {
			//위치 정보를 얻기
			navigator.geolocation.getCurrentPosition(function(pos) {
				lon1 = pos.coords.longitude;
				lat1 = pos.coords.latitude;
				console.log("user: " + lon1 + ", " + lat1);
			});
		} else {
			alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
		}
	}
	getUserLocation();

	/* calculate distance between coords */
	function distance(lat2, lon2) {
		
		console.log("lat1: " + lat1 + ", lon1: "+ lon1);
		console.log("lat2: " + lat2 + ", lon1: "+ lon2);
		
		if ((lat1 == lat2) && (lon1 == lon2)) {
			return 0;
		} else {
			dist = (lat1 - lat2) * (lat1 - lat2) + (lon1 - lon2) * (lon1 - lon2);
			dist = Math.sqrt(dist);
			return dist;
		}
	}

	///////////////////////////////////////
	///////////HTML TAG MAKING/////////////
	///////////////////////////////////////

	/* Delete all movie info card */
	function removeAllChildNodes(element) {

		while (element.hasChildNodes()) {
			element.removeChild(element.firstChild);
		}
	}

	function printCard(prefer, dist, i) {
		console.log("printCard");
		var card = document.createElement('div');

		var itemStr = '<div class="card" style="max-width: 540px;" onclick="toDetailPage('
				+ prefer.movie_id
				+ ');"><div class="row">'
				+ '<div class="col-4">'
				+ '<img src="<spring:url value="' + prefer.img_loc + '"/>"'
				+ 'class="card-img" alt="..."></div>'
				+ '<div class="col-8">'
				+ '<div class="card-body">'
				+ '<h5 class="card-title">'
				+ prefer.movie_nm
				+ '</h5>'
				+ '<p class="card-text">주연:'
				+ prefer.actor
				+ '</p>'
				+ '<p class="card-text">'
				+ '<small class="text-muted">'
				+ prefer.theator_nm
				+ ' '
				+ '<label id="distance' + i + '">'
				+ dist
				+ '</label>'
				+ 'km </small></p>'
				+ '<p class="card-text">'
				+ '<small class="text-muted">'
				+ prefer.left_min
				+ '분 뒤 시작 </small></p>' + '</div></div></div></div>';

		card.innerHTML = itemStr;
		card.className = 'col-xl-6 col-lg-6 cardForm'

		document.getElementById("cardContainer").appendChild(card);
	}

	var dist = 0;
	var index = 0;
	/* Create Movie Card */
	function createMovieCard(limit) {
		
		<c:forEach items="${ movieInfoList }" var="prefer">
		if ('${prefer.left_min}' <= limit) {
			
			/* VO to JSON */
			var json = new Object();
			json.movie_id = '${ prefer.movie_id }';
			json.movie_nm = '${ prefer.movie_nm }';
			json.movie_nm_en = '${ prefer.movie_nm_en }';
			json.genre = '${ prefer.genre }';
			json.director = '${ prefer.director }';
			json.actor = '${ prefer.actor }';
			json.nation = '${ prefer.nation }';
			json.img_loc = '${ prefer.img_loc }';

			json.theator_id = '${ prefer.theator_id }';
			json.theator_nm = '${ prefer.theator_nm }';
			json.location = '${ prefer.location }';
			json.latitude = '${ prefer.latitude }';
			json.longitude = '${ prefer.longitude }';

			json.start_time = '${ prefer.start_time }';
			json.end_time = '${ prefer.end_time }';
			json.left_min = '${ prefer.left_min }';

			var address = '${ prefer.location }';

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(address,
					function(result, status) {
						// 정상적으로 검색이 완료됐으면 
						printCard(json, dist, index);
						if (status === kakao.maps.services.Status.OK) {
							//console.log(result);
							var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
							dist = 0;
							$('#distance' + String(index)).html(dist);
						}
						
						index = index + 1;
					});

		}
		</c:forEach>

		var last = document.createElement('p');
		last.innerHTML = "마지막 결과입니다."; //wait
		document.getElementById("cardContainer").appendChild(last); //wait
	}

	/* When Drop Down menu is clicked */
	function timeLimit(limit) {

		var card = document.getElementById("cardContainer");
		document.getElementById("dropdownMenuButton").innerText = limit;
		removeAllChildNodes(card);

		if (limit == '30분')
			createMovieCard(30);
		else if (limit == '1시간')
			createMovieCard(60);
		else if (limit == '2시간')
			createMovieCard(120);
	}

	/* default time limit = 30min */
	window.onload = function() {
		createMovieCard(30);
	}
</script>

<body class="sb-nav-fixed">
	<%@ include file="../includes/nav.jsp"%>
	<div id="layoutSidenav_content">
		<div class="container-fluid">
			<h1 class="mt-4">${ loginID }님,이런영화어때요?</h1>
			<ol class="breadcrumb mb-4">
				<li>시작하기</li>
				<li>
					<div class="dropdown">
						<button class="btn btn-secondary dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">30분</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" onclick="timeLimit('30분')">30분</a> <a
								class="dropdown-item" onclick="timeLimit('1시간')">1시간</a> <a
								class="dropdown-item" onclick="timeLimit('2시간')">2시간</a>
						</div>
					</div>
				</li>
				<li>이내의 영화입니다.</li>
			</ol>

    		userLat : ${userLat}
    		userLon : ${userLon}

			<!-- 영화 리스트 이미지 출력  / 버튼에 이미지 삽입 -->
			<div class="row" id="cardContainer"></div>
		</div>
	</div>
</body>
</html>
