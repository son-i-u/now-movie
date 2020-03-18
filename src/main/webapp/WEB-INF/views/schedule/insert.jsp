
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

				<form role="form" action="/schedule/insert" method="post">
					<div class="form-group">
						<label>theator_id</label> <input class="form-control"
							name='theator_id'>
					</div>

					<div class="form-group">
						<label>movie_id</label> <input class="form-control"
							name='movie_id'>
					</div>

					<div class="form-group">
						<label>start_time</label>
						 <input class="form-control"
							name='start_time'>
					</div>

					<div class="form-group">
						<label>end_time</label> <input class="form-control"
							name='end_time'>
					</div>
					
					<button type="submit" class="btn btn-default">Submit
						Button</button>
					<button type="reset" class="btn btn-default">Reset Button</button>

					<!-- 접근 거부방지를 위한 -->
					<sec:csrfInput />
				</form>

			</div>
		</main>
</body>
</html>