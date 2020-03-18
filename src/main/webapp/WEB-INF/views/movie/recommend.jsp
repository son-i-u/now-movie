<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authentication property="name" var="loginID" />

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
<%@ include file="../includes/header.jsp"%>

<script type="text/javascript">		
		function toDetailPage(movie_id){
			
			location.href = '/movie/info?id=' + movie_id;
		}
		
		/* Delete all movie info card */
		function removeAllChildNodes(element) {
						
			var size = element.length;
			//console.log("size = "+ size);
			
			//for(i = 0; i < size; i++) 
			{
				while (element.hasChildNodes()) {
		        	element.removeChild(element.firstChild);
		        }
			} 
	    }
		
		/* Create Movie Card */
		function createMovieCard(limit){
			
			<c:forEach items="${ movieInfoList }" var="prefer">
			if ('${prefer.left_min}' <= limit){
				//console.log('${prefer.movie_nm}');
				//console.log('${prefer.theator_id}');
				
				var card = document.createElement('div');
				
		        var itemStr = '<div class="card" style="max-width: 540px;" onclick="toDetailPage(${ prefer.movie_id });"><div class="row">'
		        				+ '<div class="col-4">' + '<img src="<spring:url value="${ prefer.img_loc }"/>"'
								+ 'class="card-img" alt="..."></div>'
								+ '<div class="col-8">'
		        				+ '<div class="card-body">'
		        				+ '<h5 class="card-title">${ prefer.movie_nm }</h5>'
		        				+ '<p class="card-text">주연: ${ prefer.actor }</p>'
								+ '<p class="card-text">영화코드: ${ prefer.movie_id }</p>'
								+ '<p class="card-text">'
								+ '<small class="text-muted"> ${ prefer.left_min }분 뒤 시작 </small>'
								+ '</p></div></div></div></div>';
		        
		        card.innerHTML = itemStr;
		        card.className = 'col-xl-6 col-lg-6 cardForm'
		        
		        document.getElementById("cardContainer").appendChild(card);
			}
		</c:forEach>
		
		var last = document.createElement('p');
		last.innerHTML = "마지막 결과입니다.";
		document.getElementById("cardContainer").appendChild(last);
		}
		
		/* When Drop Down menu is clicked */
		function timeLimit(limit){
			
			var card = document.getElementById("cardContainer");
			document.getElementById("dropdownMenuButton").innerText = limit;
			removeAllChildNodes(card);
			
			if(limit == '30분')
				createMovieCard(30);
			else if (limit == '1시간')
				createMovieCard(60);
			else if (limit == '2시간')
				createMovieCard(120);
		}
		
		window.onload=function(){			
			createMovieCard(30);
		}
</script>

<body class="sb-nav-fixed">
	<%@ include file="../includes/nav.jsp"%>
	<div id="layoutSidenav_content">
		<div class="container-fluid">
			<h1 class="mt-4">${ loginID }님,이런영화 어때요?</h1>
			<ol class="breadcrumb mb-4">
				<li>시작하기</li>
				<li>
					<div class="dropdown">
						<button class="btn btn-secondary dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">30분</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" onclick="timeLimit('30분')">30분</a> 
							<a class="dropdown-item" onclick="timeLimit('1시간')">1시간</a> 
							<a class="dropdown-item" onclick="timeLimit('2시간')">2시간</a>
						</div>
					</div>
				</li>
				<li>이내의 영화입니다.</li>
			</ol>

			<!-- 영화 리스트 이미지 출력  / 버튼에 이미지 삽입 -->
			<div class="row" id="cardContainer"></div>
			
		</div>
	</div>

	
</body>
</html>
