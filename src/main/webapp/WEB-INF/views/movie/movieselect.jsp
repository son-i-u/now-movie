<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

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

				<div class="row">
					<c:forEach items="${list }" var="movie">
						<div class="col-xl-2">
						${movie.img_loc }
							<img src="<spring:url value="${movie.img_loc }"/>"
								class="card-img" alt="...">
						</div>
					</c:forEach>
				</div>
</body>
</html>
