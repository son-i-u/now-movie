<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<c:forEach items="${ preferList }" var="prefer">
						<div class="col-xl-2" id="${ prefer.user_id }">
							<p>user_id: ${ prefer.user_id }</p>
							<p>movie_name: ${ prefer.movie_id }</p>
							<p>score: ${ prefer.score }</p>
						</div>
					</c:forEach>
				
				<div class="row">
					<div class="col-xl-6 col-lg-6">
						<div class="card" style="max-width: 540px;">
							<div class="row">
								<div class="col-4">
									<img src="http://placehold.it/300x390" class="card-img"
										alt="...">
								</div>
								<div class="col-8">
									<div class="card-body">
										<h5 class="card-title">상학옹의 하루</h5>
										<p class="card-text">주연: 이상학</p>
										<p class="card-text">
											<small class="text-muted">시작 50분 전</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6">
						<div class="card" style="max-width: 540px;">
							<div class="row">
								<div class="col-4">
									<img src="http://placehold.it/300x390" class="card-img"
										alt="...">
								</div>
								<div class="col-8">
									<div class="card-body">
										<h5 class="card-title">점심은 까르보불닭</h5>
										<p class="card-text">주연: 손지경</p>
										<p class="card-text">
											<small class="text-muted">시작 35분 전</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6">
						<div class="card" style="max-width: 540px;">
							<div class="row">
								<div class="col-4">
									<img src="http://placehold.it/300x390" class="card-img"
										alt="...">
								</div>
								<div class="col-8">
									<div class="card-body">
										<h5 class="card-title">레미제라블</h5>
										<p class="card-text">주연: 유재연</p>
										<p class="card-text">
											<small class="text-muted">시작 35분 전</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6">
						<div class="card" style="max-width: 540px;">
							<div class="row">
								<div class="col-4">
									<img src="http://placehold.it/300x390" class="card-img"
										alt="...">
								</div>
								<div class="col-8">
									<div class="card-body">
										<h5 class="card-title">레미제라블</h5>
										<p class="card-text">주연: 유재연</p>
										<p class="card-text">
											<small class="text-muted">시작 35분 전</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6">
						<div class="card" style="max-width: 540px;">
							<div class="row">
								<div class="col-4">
									<img src="http://placehold.it/300x390" class="card-img"
										alt="...">
								</div>
								<div class="col-8">
									<div class="card-body">
										<h5 class="card-title">레미제라블</h5>
										<p class="card-text">주연: 유재연</p>
										<p class="card-text">
											<small class="text-muted">시작 35분 전</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6">
						<div class="card" style="max-width: 540px;">
							<div class="row">
								<div class="col-4">
									<img src="http://placehold.it/300x390" class="card-img"
										alt="...">
								</div>
								<div class="col-8">
									<div class="card-body">
										<h5 class="card-title">레미제라블</h5>
										<p class="card-text">주연: 유재연</p>
										<p class="card-text">
											<small class="text-muted">시작 35분 전</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6">
						<div class="card" style="max-width: 540px;">
							<div class="row">
								<div class="col-4">
									<img src="http://placehold.it/300x390" class="card-img"
										alt="...">
								</div>
								<div class="col-8">
									<div class="card-body">
										<h5 class="card-title">레미제라블</h5>
										<p class="card-text">주연: 유재연</p>
										<p class="card-text">
											<small class="text-muted">시작 35분 전</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6">
						<div class="card" style="max-width: 540px;">
							<div class="row">
								<div class="col-4">
									<img src="http://placehold.it/300x390" class="card-img"
										alt="...">
								</div>
								<div class="col-8">
									<div class="card-body">
										<h5 class="card-title">레미제라블</h5>
										<p class="card-text">주연: 유재연</p>
										<p class="card-text">
											<small class="text-muted">시작 35분 전</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6">
						<div class="card" style="max-width: 540px;">
							<div class="row">
								<div class="col-4">
									<img src="http://placehold.it/300x390" class="card-img"
										alt="...">
								</div>
								<div class="col-8">
									<div class="card-body">
										<h5 class="card-title">레미제라블</h5>
										<p class="card-text">주연: 유재연</p>
										<p class="card-text">
											<small class="text-muted">시작 35분 전</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6">
						<div class="card" style="max-width: 540px;">
							<div class="row">
								<div class="col-4">
									<img src="http://placehold.it/300x390" class="card-img"
										alt="...">
								</div>
								<div class="col-8">
									<div class="card-body">
										<h5 class="card-title">레미제라블</h5>
										<p class="card-text">주연: 유재연</p>
										<p class="card-text">
											<small class="text-muted">시작 35분 전</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6">
						<div class="card" style="max-width: 540px;">
							<div class="row">
								<div class="col-4">
									<img src="http://placehold.it/300x390" class="card-img"
										alt="...">
								</div>
								<div class="col-8">
									<div class="card-body">
										<h5 class="card-title">레미제라블</h5>
										<p class="card-text">주연: 유재연</p>
										<p class="card-text">
											<small class="text-muted">시작 35분 전</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6">
						<div class="card" style="max-width: 540px;">
							<div class="row">
								<div class="col-4">
									<img src="http://placehold.it/300x390" class="card-img"
										alt="...">
								</div>
								<div class="col-8">
									<div class="card-body">
										<h5 class="card-title">레미제라블</h5>
										<p class="card-text">주연: 유재연</p>
										<p class="card-text">
											<small class="text-muted">시작 35분 전</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6">
						<div class="card" style="max-width: 540px;">
							<div class="row">
								<div class="col-4">
									<img src="http://placehold.it/300x390" class="card-img"
										alt="...">
								</div>
								<div class="col-8">
									<div class="card-body">
										<h5 class="card-title">레미제라블</h5>
										<p class="card-text">주연: 유재연</p>
										<p class="card-text">
											<small class="text-muted">시작 35분 전</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
</body>
</html>
