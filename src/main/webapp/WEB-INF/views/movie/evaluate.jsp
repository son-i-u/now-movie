<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="../includes/header.jsp"%>
<body class="sb-nav-fixed">
	<%@ include file="../includes/nav.jsp"%>

	<div id="layoutSidenav_content">
		<main>
			<c:forEach items="${mncList}" var="movie">
				<div class="center-form">
					<img src="<spring:url value="${movie.img_loc }"/>"
						class="movie-img" alt="...">

					<!-- 평가버튼 -->
					<div class="form-group">
						<label>얼마나 즐거우셨나요?</label>
						<div class="checkbox">
							<label> <input type="checkbox" value="" onclick = "movieScore(${movie.movie_id},'1')">1점
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox" value="" onclick = "movieScore(${movie.movie_id},'2')">2점
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox" value="" onclick = "movieScore(${movie.movie_id},'3')">3점
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox" value="" onclick = "movieScore(${movie.movie_id},'4')">4점
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox" value="" onclick = "movieScore(${movie.movie_id},'5')">5점
							</label>
						</div>

					</div>
				</div>
			</c:forEach>
					<!-- 제출 버튼 -->
					<button type="button" onclick="selectPost()">submit</button>
		</main> 
	</div>

	<script type="text/javascript">
				var movieArray = new Array();
				var scoreArray = new Array();
				
				$(document).ready(
					function() {
					});
							
				    <!--클릭시 영화점수 배열에 추가 -->
				    function movieScore(data, score) {
				    	movieArray.push(data);
				    	scoreArray.push(score);
				    }
				  
				    <!--  post로 전달 -->
				    function selectPost(){
				    	var $form = $('<form></form>');
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
							
</script>
</body>
</html>