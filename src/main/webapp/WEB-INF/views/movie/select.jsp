
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
				<h1 id="top">선호 영화 선택</h1>
				<div class="show_info">
					<span class="bold_text_1">선호영화를 선택하세요</span>
					<button class="btn" type="button" onclick="reload()">
						<img class="btn-img" src="/resources/images/icons/reload_white.jpg"
							style="height: 30px; width: 30px;">
					</button>
				</div>

				<div class="fixed" href="#bottom" title=Top>
					<a class="remote-control" href="#top">
						<p style="padding: 5px;">TOP</p>
					</a> <a class="remote-control" href="#bottom">
						<p style="padding: 5px;">BOTTOM</p>
					</a>
				</div>

				<!-- 영화 리스트 이미지 출력  / 버튼에 이미지 삽입 -->
				<div class="row card-wrapper" style="margin-top: 3%;">

					<c:forEach items="${list }" var="movie">

						<div class="col-xl-2 col-md-3 col-sm-4 col-4"
							id="${movie.movie_id }">
							<a id="${movie.movie_id }"
								onclick="movieselect(${movie.movie_id});">
								<hr
									style="background-color: #990000; margin-left: 0%; padding-left: 0%; width: 100%; height: 1%;">
								<img src="<spring:url value='${movie.img_loc }'/>" alt="..."
								id="${movie.movie_id}img" class="normal-card"
								onerror="this.src='http://placehold.it/200x290'">
							</a>

							<p class="text-center">${movie.movie_nm }</p>
						</div>
					</c:forEach>

					<!-- 접근 거부방지를 위한 -->
					<sec:csrfInput />

				</div>

				<!-- 제출 버튼 -->
				<div class="container-login100-form-btn m-t-17">
					<button id="bottom" class='submit-btn login100-form-btn'
						type="button" onclick="moviePost()"
						style="margin: 30px 0px; float: right;">submit</button>
				</div>
			</div>
		</main>
	</div>

	<style>
@charset "utf-8";

/* All Device */
/*모든 해상도를 위한 공통 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨.*/

/* Mobile Device */
/*768px 미만 해상도의 모바일 기기를 위한 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨. 미디어 쿼리를 지원하지 않는 모바일 기기를 위해 미디어 쿼리 구문을 사용하지 않는다.*/

/*@media all and (device-width:320px) and (device-height:480px) { … } // 스크린 너비가 320px '그리고' 높이가 480px 이면 실행*/
/*@media all and (min-device-width:320px) and (min-device-height:480px) { … } // 스크린 너비가 최소 320px 이상 '그리고' 높이가 최소 480px 이상이면 실행*/

/* Tablet &amp; Desktop Device */
/* 반응형 페이지 */
@media screen and (min-width: 100px) and (max-width:768px) {
	.col-xl-2 {
		flex: 0 0 25%;
		max-width: 25%;
		margin-bottom: 1rem;
		margin-right: 0rem;
		margin-left: 0rem;
		padding-right: 0rem;
		padding-left: 0rem;
		height: auto;
	}
	.normal-card {
		max-width: 100%;
	}
	.selected-card {
		filter: brightness(50%);
	}
	.moive_id_font {
		max-width: 100%;
	}

	/*text*/
	.bold_text_1 {
		color: #FFFFFF;
		font-size: 1.6rem;
		font-weight: bold;
	}
}

@media screen and (min-width: 769px) and (max-width:1167px) {
	.col-xl-2 {
		flex: 0 0 16.6666666667%;
		max-width: 16.6666666667%;
		margin-bottom: 1rem;
		margin-right: 0rem;
		margin-left: 0rem;
		padding-right: 0rem;
		padding-left: 0rem;
		height: auto;
	}
	.normal-card {
		max-width: 100%;
	}
	.selected-card {
		filter: brightness(50%);
	}
	.moive_id_font {
		max-width: 100%;
	}

	/*text*/
	.bold_text_1 {
		color: #FFFFFF;
		font-size: 2rem;
		font-weight: bold;
	}
}

@media screen and (min-width: 1168px) {
	.col-xl-2 {
		flex: 0 0 8.3333333333%;
		max-width: 8.3333333333%;
		margin-bottom: 1rem;
		margin-right: 0rem;
		margin-left: 0rem;
		padding-right: 0rem;
		padding-left: 0rem;
		height: auto;
	}
	.normal-card {
		max-width: 100%;
	}
	.selected-card {
		filter: brightness(50%);
	}
	.moive_id_font {
		max-width: 100%;
	}

	/*text*/
	.bold_text_1 {
		color: #FFFFFF;
		font-size: 2rem;
		font-weight: bold;
	}
}

body {
	background-color: black;
}

.text-center {
	color: #5d5d5d;
	font-size: 0.8rem;
	font-weight: bold;
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

.selected-card {
	filter: brightness(50%);
}

.row {
	margin-top: 10%;
	margin-right: 0%;
	margin-left: 0%;
	margin-right: 0%;
}

.container-fluid {
	border-top-style: solid;
	border-bottom-style: solid;
	border-width: 3px;
	border-color: #e6e6e6;
	padding-bottom: 10%;
}
</style>


	<script type="text/javascript">
		var movieArray = [] ;
		var lastCheck = true ;
		var $form = $('<form> </form> '); $(document.body ).append ($form);
		
		 $(document ).ready (function() { 
				/* height by width */
				var cw = $('.col-xl-2').width();
				var ch = cw *1.8;
				$('.normal-card').css({'height':ch+'px'});
			 
			 
		 });
		 
		 $(window).resize(function() { 
			 /* height by width */
				var cw = $('.col-xl-2').width();
				var ch = cw *1.7;
				$('.normal-card').css({'height':ch+'px'});
		 });
		 
		 
		//클릭시 선택 영화 배열에 추가 
		function movieselect (data) {if (lastCheck == false){ lastCheck =
		!lastCheck;return;
	
			}	
		/* 이미지 변경을 위한 class 변경 */
		var class_id = $("#"+data+ "img ").attr ('class');

			if (class_id == 'selected-card'){
			/* 재클릭한 영화는 배열에서 제거 */ $("#"+data +"img").attr('class','normal-card');const
			idx = movieArray.indexOf(data);if ( idx > -1 ) movieArray.splice(idx,1);
	
			}else {
				
				console .log(data + " 클릭했습니다.");movieArray .push(data);console
			.log("선택한 movie 수: " + movieArray.length); $("#"+data
			+"img").attr('class','selected-card');
	
			}
			
		}

		/* 새로고침 */
		function reload (){
			location .reload();
		}

		//moviearray를 post로 전달
	    function moviePost (){
		/* 선택 영화 없을 시 경고 알림 */
		if (movieArray.length == 0){
			alert("선호 영화를 선택해주세요");
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
			}else {
			/* 선택 영화 있을 시 그대로 제출 */
			$form .attr('action','/movie/select');
			$form.attr('method','post');
			var test = $('<input name="test" type="hidden" value="test">');
			var mArray = $('<input name="movieArray" type="hidden" value='+movieArray+'>');
			var sec = $('<sec:csrfInput/>');
								$form.append(test); $form.append(mArray); $form.append(sec);
								$form.submit();lastCheck = !lastCheck }
		
		}
		

	
		</script>


</body>
</html>