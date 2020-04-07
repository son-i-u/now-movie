<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script>
	/* 지금 시간과 비교해 상영중인 영화를 저장할 배열 */
	var onScreenArr = new Array();
	
	/* 현재 시간 설정 */
	var nowTime = new Date();	
	var nowString = String(nowTime);
	var now_day, now_hour, now_min;
	now_day = Number(nowString.substring(8, 10));
	now_hour = Number(nowString.substring(16, 18));
	now_min = Number(nowString.substring(19, 21));
	console.log("지금: " + now_day + "일 " + now_hour + ":" + now_min);
	
	function removeAllChildNodes(element) {
		console.log(element);
		while (element.hasChildNodes()) {
			element.removeChild(element.firstChild);
		}
	}
	
	<c:forEach items="${preferScheduleList}" var="preferSchedule">
		/* 영화 상영 종료 시간 저장 */
		var movie_day, movie_hour, movie_min;
		movie_day = Number('${preferSchedule.end_time}'.substring(8, 10));
		movie_hour = Number('${preferSchedule.end_time}'.substring(11, 13));
		movie_min = Number('${preferSchedule.end_time}'.substring(14, 16));
		console.log("영화 끝: " + movie_hour + ":" + movie_min);

		if(movie_day > now_day){
			console.log(24 + movie_hour - now_hour + "시간 남음: 영화가 아직 끝나지 않았습니다.");
			onScreenArr.push('${preferSchedule.movie_id}');
		}
		else if(movie_hour > now_hour){
			console.log(movie_hour - now_hour + "시간 남음: 영화가 아직 끝나지 않았습니다.");
			onScreenArr.push('${preferSchedule.movie_id}');
		}
		else if(movie_hour == now_hour) {
			if(movie_min > now_min){
				console.log(movie_min - now_min + "분 남음: 영화가 아직 끝나지 않았습니다.");
				onScreenArr.push('${preferSchedule.movie_id}');
			}
			else
				console.log("상영이 완료된 영화 스케줄 입니다.")
		}
		else{
			console.log("지금 보고 있는 영화가 없습니다.");
		}
	</c:forEach>
	
	console.log(onScreenArr);
	
	window.onload = function(){
		for(var i = 0; i < onScreenArr.length; i++){
			var scoreBoard = document.getElementById("eval" + onScreenArr[i]);
			console.log(scoreBoard);
			
			removeAllChildNodes(scoreBoard);
			
			/* 점수판이 사라진 자리에 텍스트 생성 */			
			var block = document.createElement('p');
			var text = "아직 상영중인 영화입니다.";
			
			block.className = "text-center";
			block.innerHTML = text;
			scoreBoard.appendChild(block);
		}
	}
</script>

</head>


<%@ include file="../includes/header.jsp"%>
<body class="sb-nav-fixed">
	<%@ include file="../includes/nav.jsp"%>

	<div id="layoutSidenav_content">

		<main>
			<div style="margin-top: 5%;"></div>
			<div class="show_info"
				style="margin-bottom: 20px; padding-top: 30px;">
				<span class="bold_text_1">영화관람 즐거우셨나요?</span>
			</div>

			<c:forEach items="${mncList}" var="movie">
				<div class="col-12" style="margin: 0px;">
					<div class="wrap-login100 p-t-50 p-b-90 center">
						<img src="<spring:url value="${movie.img_loc }"/>"
							class="movie-img score-inline" alt="..."
							onerror="this.src='http://placehold.it/200x290'">
					</div>
					<!-- 평가버튼 -->
					<div id="eval${movie.movie_id}" class="form-group"
						style="text-align: center; margin-right: 16px;">
						<div class="checkbox score-inline">
							<label><input type="radio" name="${movie.movie_id}"
								id="${movie.movie_id}"
								onclick="movieScore(${movie.movie_id},'1')"><span>
									1점</span> </label>

						</div>
						<div class="checkbox score-inline">
							<label><input type="radio" name="${movie.movie_id}"
								id="${movie.movie_id}"
								onclick="movieScore(${movie.movie_id},'2')"> <span>
									2점</span></label>

						</div>
						<div class="checkbox score-inline">
							<label> <input type="radio" name="${movie.movie_id}"
								id="${movie.movie_id}"
								onclick="movieScore(${movie.movie_id},'3')"> <span>
									3점</span>
							</label>
						</div>
						<div class="checkbox score-inline">
							<label> <input type="radio" name="${movie.movie_id}"
								id="${movie.movie_id}"
								onclick="movieScore(${movie.movie_id},'4')"> <span>
									4점</span>
							</label>
						</div>
						<div class="checkbox score-inline">
							<label> <input type="radio" name="${movie.movie_id}"
								id="${movie.movie_id}"
								onclick="movieScore(${movie.movie_id},'5')"> <span>
									5점</span>

							</label>
						</div>
					</div>
				</div>
			</c:forEach>
	</div>
	<div class="fixed" href="#bottom" title=Top>
		<a class="remote-control" href="#top">
			<p style="padding: 5px;">TOP</p>
		</a> <a class="remote-control" href="#bottom">
			<p style="padding: 5px;">BOTTOM</p>
		</a>
	</div>

	<!-- 제출 버튼 -->
	<div id="bottom" class="container-login100-form-btn m-t-17">
		<button type="button" onclick="selectPost()" class="login100-form-btn"
			style="margin: 10px 0px">submit</button>
	</div>
	</main>
	</div>

	<style>
.container-login100-form-btn {
	max-width: 33.3333%;
	margin-left: 33.3333%;
}

/*text*/
.bold_text_1 {
	color: #5d5d5d;
	font-size: 2rem;
	font-weight: bold;
}

.show_info {
	text-align: center;
}

input[type=radio] {
	display: none;
}

input[type=radio]:checked+span {
	border: 1px solid #23a3a7;
	background: #23a3a7;
	color: #fff;
}

input[type=radio]+span {
	display: inline-block;
	background: none;
	border: 1px solid #dfdfdf;
	padding: 0px 10px;
	text-align: center;
	height: 35px;
	line-height: 33px;
	font-weight: 500;
	cursor: pointer;
}
</style>
	<script type="text/javascript">
				var movieArray = new Array();
				var scoreArray = new Array();
				
	    		var $form = $('<form></form>');
	    		$(document.body).append($form);
				
				$(document).ready(
					function($) {
						
				});
							
			
				     /*클릭시 영화점수 배열에 추가 */
				    function movieScore(data, score) {
				    	console.log('데이터가 추가됩니다.');

						const idx = movieArray.indexOf(data);
						if ( idx > -1 ){
							movieArray.splice(idx,1);
						 	scoreArray.splice(idx,1);
						}
							
						movieArray.push(data);
						scoreArray.push(score);
						
						console.log(movieArray.length + "movieArray length 입니다.");
						console.log(scoreArray.length + "scoreArray length 입니다.");
				    }
				  
				    /* post로 전달 */
				    function selectPost(){
				    	
				    	/* 선택 영화 없을 시 경고 알림 */
				    	if(movieArray.length == 0){
				    		 var delConfirm = confirm('평가하신 영화가 없습니다. 계속 진행하시겠습니까?');
				    		   if (delConfirm) {
				    			   self.location="/movie/recommend";
				    		   }
				    		   else {
				    		      /* 취소하고 영화 평가 다시 진행 */
				    		   }
				    	}else if(movieArray.length < ${fn:length(mncList)}){
				    		var delConfirm = confirm('평가하지 않은  영화가 있습니다. 계속 진행하시겠습니까?');
				    		   if (delConfirm) {
				    			   self.location="/movie/recommend";
				    		   }
				    		   else {
				    		       	/*  취소하고 영화 평가 다시 진행 */
				    		   }
				    	}else{
				    		
				    		/*  평가 영화 있을 시 그대로 제출 */
					    	$form.attr('action','/movie/evaluate');
					    	$form.attr('method','post');
					    	
					    	var mArray = $('<input name="movieArray" type="hidden" value='+movieArray+'>');
					    	var sArray = $('<input name="scoreArray" type="hidden" value='+scoreArray+'>');
					    	var sec = $('<sec:csrfInput/>');
					    	
					    	$form.append(mArray);
					    	$form.append(sArray);
					    	$form.append(sec);
					    	$form.submit();
				    	}
				    }
							
</script>
</body>
</html>