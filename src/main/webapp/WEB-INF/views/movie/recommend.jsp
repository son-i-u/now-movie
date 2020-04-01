<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<body class="sb-nav-fixed">
	<%@ include file="../includes/nav.jsp"%>
	<div id="layoutSidenav_content">
		<div class="container-fluid">
			<h3 id="top" class="mt-4" >${ loginID }님 맞춤 추천 영화</h3>
			
				<div class="fixed" href="#bottom" title=Top>
					<a class="remote-control" href="#top">
						<p style="padding:5px;">TOP</p>
					</a>
				
					<a class="remote-control" href="#bottom">
						<p style="padding:5px;">BOTTOM</p>
					</a>
				</div>
			
			<ol class="breadcrumb mb-4 text-center">
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
				<li>이내의 영화
					<image onclick="refresh();" src="/resources/images/icons/reload.png" style="height: 20px; width: 20px"></image>
				</li>
			</ol>

			<!-- 영화 리스트 이미지 출력  / 버튼에 이미지 삽입 -->
			<div class="row" id="cardContainer"></div>
			<div id="bottom"></div>
		</div>
	</div>
	
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
	
	function movieSelect(movie_nm, movie_id, schedule_id) {
		var user_watching = sessionStorage.getItem('user_watching');
		
		if(sessionStorage.getItem('schedule_id') == schedule_id){
			alert("이미 이 영화를 보고 있습니다.");
		}
		else if(user_watching == 'false'){
			alert(movie_nm + "을(를) 선택했습니다.");
			sessionStorage.setItem('schedule_id', schedule_id);
			location.href = '/movie/nowMovie?movie_id=' + movie_id + '&schedule_id=' + schedule_id;
		}
		else {
			var result = confirm("이미 보고있는 영화가 있습니다. 이 영화로 바꾸시겠습니까?");
			
			if(result){
				alert("지금 보고있는 영화를 바꿉니다.");
				location.href = '/movie/changeMovie?movie_id=' + movie_id + '&schedule_id=' + schedule_id
						+ '&prev_schedule=' + String(sessionStorage.getItem('schedule_id'));
			}else{
				alert(movie_nm + "을(를) 그대로 시청합니다.");
			}
		}
	}
	
	function refresh() {
		
		location.href="/movie/refresh";
	}

	///////////////////////////////////////
	///////////LOCATION LOGIC//////////////
	///////////////////////////////////////

	var jsonArr = new Array(); //모든 객체 저장 배열

	/* 현재 위치를 저장할 변수 생성 */
	var lat1 = sessionStorage.getItem('user_lat');
	var lon1 = sessionStorage.getItem('user_lon');
	console.log("user location: " + lat1 + ", " + lon1);

	/* calculate distance between coords */
	function distance(lat2, lon2) {
		var dist = 0;
		var result = ''; 
		
		/* 거리 구하기 */
		if ((lat1 == lat2) && (lon1 == lon2)) {
			return '0m';
		} else {
			dist = (lat1 - lat2) * (lat1 - lat2) + (lon1 - lon2) * (lon1 - lon2);
			dist = Math.sqrt(dist);
			
			if(dist < 0){
				dist = dist * 10;
				dist = Math.round(dist);
				dist = dist / 10;
			}
			else
				dist = Math.round(dist);
		}
		
		/* 단위 쪼개기 */
		if(dist > 1000){
			dist = dist / 10;
			dist = Math.round(dist);
			dist = dist / 100;
			result = result + dist + 'km';
		}
		else
			result = result + dist + 'm';
		
		return result;
	}
	
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
	
		json.schedule_id = '${ prefer.schedule_id }';
		json.start_time = '${ prefer.start_time }';
		json.end_time = '${ prefer.end_time }';
		json.left_min = '${ prefer.left_min }';	
		json.distance = distance(json.latitude, json.longitude);
		
		jsonArr.push(json);
	</c:forEach>	
	console.log(jsonArr);

	///////////////////////////////////////
	///////////HTML TAG MAKING/////////////
	///////////////////////////////////////
	
	/* 현재 시간 설정 */
    var nowTime = new Date();	
	var nowString = String(nowTime);
	var now_hour, now_min;
	now_hour = Number(nowString.substring(16, 18));
	now_min = Number(nowString.substring(19, 21));
	sessionStorage.setItem('user_watching', 'false');

	function isUserWatching(movieTime, schedule_id) {
		var movie_hour, movie_min;
		movie_hour = Number(movieTime.substring(11, 13));
		movie_min = Number(movieTime.substring(14, 16));
		console.log("영화 끝: " + movie_hour + ":" + movie_min);
		console.log("지금: " + now_hour + ":" + now_min);
		
		if(movie_hour > now_hour){
			console.log(movie_hour - now_hour + "시간 남음: 영화가 아직 끝나지 않았습니다.");
			sessionStorage.setItem('user_watching', 'true');
			sessionStorage.setItem('movie_hour', movie_hour);
			sessionStorage.setItem('movie_min', movie_min);
			sessionStorage.setItem('schedule_id', schedule_id);
			console.log("지금 보고있는 영화: " + sessionStorage.getItem('schedule_id'));
		}
		else if(movie_hour == now_hour) {
			if(movie_min > now_min){
				console.log(movie_min - now_min + "분 남음: 영화가 아직 끝나지 않았습니다.");
				sessionStorage.setItem('schedule_id', schedule_id);
			}
		}
		else{
			console.log("지금 보고 있는 영화가 없습니다.");
		}	
	}
	
	<c:forEach items="${ preferScheduleList }" var="preferSchedule">
		console.log('${preferSchedule}');
		if("${preferSchedule.score}" < 0){
			console.log("평가하지 않은 영화가 있습니다.");
			isUserWatching(String('${preferSchedule.end_time}'), String("${preferSchedule.schedule_id}"));
		}	
		
		console.log("end: " + "${preferSchedule.end_time}");
		console.log("now: " + nowTime);
		console.log(typeof("${preferSchedule.end_time}"));
		
		console.log("${preferSchedule.end_time}" >= nowTime);
		console.log("${preferSchedule.end_time}" < nowTime);
	</c:forEach>	
	
	/* Delete all movie info card */
	function removeAllChildNodes(element) {

		while (element.hasChildNodes()) {
			element.removeChild(element.firstChild);
		}
	}

	function printCard(prefer, i) {
		
		var card = document.createElement('div');

		var itemStr = '<div class="card" style="max-width: 540px;"><div class="row">'
				+ '<div class="col-5" onclick="toDetailPage(' + prefer.movie_id + ')">'
				+ '<img src="<spring:url value="' + prefer.img_loc + '"/>"'
				+ 'class="card-img" alt="..."></div>'
				+ '<div class="col-7" style="padding-left: 0px;">'
				+ '<div class="card-body">'
				+ '<h5 class="card-title">'
				+ prefer.movie_nm
				+ '</h5>'
				+ '<p class="card-text">'
				+ prefer.actor
				+ '</p>'
				+ '<p class="card-text text-right" style="margin: 0px;"><small class="text-muted">'
				+ prefer.theator_nm
				+ ' '
				+ '<label id="distance' + i + '"><strong>'
				+ prefer.distance
				+ '</strong></label>'
				+ '</small></p>'
				+ '<p class="card-text text-right" style="margin: 0px;"><small class="text-muted"><strong>'
				+ prefer.left_min
				+ '분</strong> 뒤 시작 </small></p>'
				+'<button id="select" class="login100-form-btn" onclick="movieSelect(\'' 
						+ prefer.movie_nm + '\', ' + prefer.movie_id + ', ' + prefer.schedule_id
				+ ');">영화 보기</button>' 
				+ '</div></div></div></div>';

		card.innerHTML = itemStr;
		card.className = 'col-xl-6 col-lg-6 col-md-6 cardForm'

		document.getElementById("cardContainer").appendChild(card);
	}

	/* Create Movie Card */
	function createMovieCard(limit) {
		
		var size = jsonArr.length;
		for(var i = 0; i < size; i++){
			if(jsonArr[i].left_min <= limit)
				printCard(jsonArr[i], i);
		}

		var last = document.createElement('p');
		last.className = 'center-text';
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
	
</body>
</html>
