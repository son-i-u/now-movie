<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<sec:authentication property="name" var="loginID" />

<!DOCTYPE html>
<html lang="en">
<%@ include file="../includes/header.jsp"%>
<body class="sb-nav-fixed">
	<%@ include file="../includes/nav.jsp"%>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">${ loginID }님,요청하신영화정보입니다.</h2>
						<h1 class="page-header">movie info</h1>
					</div>
					<!--  /.col-lg-12 -->
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading"></div>
							<!-- /.panel-heading -->

							<div class="panel-body">
								<c:forEach items="${ info }" var="movie">
									<div class="col-xl-2" id="${movie.movie_id }">
										<div class="form-group">
											<img src="<spring:url value="${ movie.img_loc }"/>"
											class="card-img" alt="...">
										</div>

										<div class="form-group">
											<label>영화이름</label> <input class="form-control" name='bno'
												value="${ movie.movie_nm }" readonly="readonly">
										</div>

										<div class="form-group">
											<label>장르</label> 
											<input class="form-control" name='title'
												value="${ movie.genre }" readonly="readonly">
										</div>

										<div class="form-group">
											<label>배우</label>
											<input class="form-control" name='title'
												value="${ movie.actor }" readonly="readonly">
										</div>

										<div class="form-group">
											<label>국가</label> 
											<input class="form-control" name='writer'
												value="${ movie.nation }" readonly="readonly">
										</div>

										<button data-oper='list' class="btn btn-info"
											onclick="location.href='/movie/recommend'">List</button>
									</div>
								</c:forEach>
							</div>
							<!-- end panel-body -->
						</div>
						<!-- end panel-body -->
					</div>
					<!--  end panel -->
				</div>
				<!-- /.row -->
			</div>
		</main>
	</div>
</body>
</html>
