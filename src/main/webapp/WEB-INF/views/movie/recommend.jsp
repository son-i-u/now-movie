<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<sec:authentication property="name" var="loginID" />

<!DOCTYPE html>
<html lang="en">
<%@ include file="../includes/header.jsp"%>

<script type="text/javascript">
		function test(movie_id){
			 location.href = '/movie/info?id=' + movie_id;
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
				<c:forEach items="${ preferList }" var="prefer">
					<div class="col-xl-6 col-lg-6">
						<div class="card" style="max-width: 540px;" onclick="test(${ prefer.movie_id });">
							<div class="row">
								<div class="col-4">
									<img src="<spring:url value="${ prefer.img_loc }"/>"
										class="card-img" alt="...">
								</div>
								<div class="col-8">
									<div class="card-body">
										<h5 class="card-title">${ prefer.movie_nm }</h5>
										<p class="card-text">주연: ${ prefer.actor }</p>
										<p class="card-text">영화코드: ${ prefer.movie_id }</p>
										<p class="card-text">
											<small class="text-muted">시작 50분 전</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	
</body>
</html>
