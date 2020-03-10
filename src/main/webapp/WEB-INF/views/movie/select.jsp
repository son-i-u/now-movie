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
			<div class="container-fluid">
				<h1 class="mt-4">이런 영화 어때요?</h1>
				<ol class="breadcrumb mb-4">
					<li>시작하기</li>
					<li>
						<div class="dropdown">
							<button class="btn btn-secondary dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">30분</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="#">30분</a> <a
									class="dropdown-item" href="#">1시간</a> <a class="dropdown-item"
									href="#">2시간</a>
							</div>
						</div>
					</li>
					<li>이내의 영화입니다.</li>
				</ol>


				<!-- 영화 리스트 이미지 출력  / 버튼에 이미지 삽입 -->
				<div class="row">
					<c:forEach items="${list }" var="movie">
						<div class="col-xl-2" id="${movie.movie_id }">
							${movie.movie_nm }

							<button type="button" id="${movie.movie_id }"
								onclick="movieselect(${movie.movie_id})">
								<img src="<spring:url value="${movie.img_loc }"/>"
									class="card-img" alt="...">
							</button>
							<input type='hidden' name="${movie.movie_id }"
								value="${movie.movie_id }">

						</div>
					</c:forEach>
					<!-- 제출 버튼 -->
					<button type="button" onclick="moviePost()">submit</button>

					<!-- 접근 거부방지를 위한 -->
					<sec:csrfInput />

				</div>

				<script type="text/javascript">
				var movieArray = [];
				
				$(document).ready(
					function() {
					});
							
				    <!--클릭시 선택 영화 배열에 추가 -->
				    function movieselect(data) {
						console.log(data + "클릭했습니다.");
						movieArray.push(data);
						console.log(movieArray.length+ "선택한 movie 수입니다.");
					
				    	<!-- 클릭시 이미지버튼 테두리 변경 -->
				    }
				    
				    <!-- moviearray를 post로 전달 -->
				    function moviePost(){
				    	var $form = $('<form></form>');
				    	$form.attr('action','/movie/movieselect');
				    	$form.attr('method','post');
				    	
				    	var test = $('<input name="test" type="hidden" value="test">');
				    	var mArray = $('<input name="movieArray" type="hidden" value='+movieArray+'>');
				    	var sec = $('<sec:csrfInput/>');
				    	
				    	$form.append(test);  
				    	$form.append(mArray);
				    	$form.append(sec);
				    	$form.submit();
				    }
							
</script>
</body>
</html>
