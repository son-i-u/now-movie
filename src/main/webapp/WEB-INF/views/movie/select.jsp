 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="../includes/header.jsp"%>
<body class="sb-nav-fixed">
	<%@ include file="../includes/nav.jsp"%>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<h1 class="mt-4">아래 영화중 재밌는 영화 있으셨나요? 고객님을 위한 추천 시스템에 이용됩니다.</h1>

				<!-- 영화 리스트 이미지 출력  / 버튼에 이미지 삽입 -->
				<div class="row">
					<c:forEach items="${list }" var="movie">
						<div class="col-xl-2" id="${movie.movie_id }">
							${movie.movie_nm }

							<button class="card-button" type="button" id="${movie.movie_id }"
								onclick="movieselect(${movie.movie_id}); ">
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
				var $form = $('<form></form>');
				$(document.body).append($form);
				
				<!-- ��ȣ ���� ���� ���� document body�� �߰� -->
				var $form = $('<form></form>');
				$(document.body).append($form);
				
				$(document).ready(
					function() {
						
						
					});
							
				    // 클릭시 선택 영화 배열에 추가 
				    function movieselect(data) {
						console.log(data + "클릭했습니다.");
						movieArray.push(data);
						console.log(movieArray.length+ "선택한 movie 수입니다.");
				
				    }
				 	
				    
				    // moviearray를 post로 전달
				    function moviePost(){
				    	
				    	$form.attr('action','/movie/select');
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