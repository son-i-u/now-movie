
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

<script type="text/javascript">
	
</script>


<body class="sb-nav-fixed">
	<%@ include file="../includes/nav.jsp"%>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<div style="margin-top: 10%;"></div>
				<form role="form" action="/schedule/movieInsert" method="post"
					enctype="multipart/form-data" onsubmit="return check()">
					<div class="form-group">
						<label>MOVIE_NM</label> <input class="form-control"
							name='movie_nm' id='movie_nm' maxlength='20'>
					</div>

					<div class="form-group">
						<label>MOVIE_NM_EN</label> <input class="form-control"
							name='movie_nm_en' id='movie_nm_en' maxlength='20'>
					</div>

					<div class="form-group">
						<label>GENRE</label> <input class="form-control" name='genre'
							id='genre' maxlength='20'>
					</div>

					<div class="form-group">
						<label>DIRECTOR</label> <input class="form-control"
							name='director' id='director' maxlength='20'>
					</div>

					<div class="form-group">
						<label>ACTOR</label> <input class="form-control" name='actor'
							id='actor' maxlength='20'>
					</div>

					<div class="form-group">
						<label>NATION</label> <input class="form-control" name='nation'
							id='nation' maxlength='20'>
					</div>

					<div class="form-group">
						<label>IMG_LOC 자동으로 movie_id.type 으로 올라갑니다. 입력하지 마세요</label> <input
							class="form-control" name='img_loc' id='img_loc'>
					</div>

					<!--  
					<div class="form-group">
						<label>이미지를 올리세요</label> <input name="uploadFile" id="file-upload"
							type="file" accept=".jpg,.jpeg,.png" multiple><br>
					</div>
-->
					<!-- 접근 거부방지를 위한 -->
					<sec:csrfInput />

					<input type="submit" class="btn btn-default">
					<button type="reset" class="btn btn-default">Reset Button</button>


				</form>

			</div>
		</main>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {

		});
		function check() {
			s
			var check = true;

			return check;

		};
	</script>



</body>
</html>