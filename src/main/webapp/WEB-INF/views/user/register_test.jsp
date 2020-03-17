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


				<form action="/user/register_test" method="post" role="form"
					id="usercheck" name="user_info">

					<div class="form-group">
						<label for="id">아이디</label> <input type="text"
							class="form-control" id="USER_ID" name="USER_ID" placeholder="ID">
						<div class="eheck_font" id="id_check"></div>
					</div>

					<div class="form-group">
						<label for="pw">비밀번호</label> <input type="password"
							class="form-control" id="PWD" name="PWD" placeholder="PASSWORD">
						<div class="eheck_font" id="pw_check"></div>
					</div>

					<div class="form-group">
						<label for="pw2">비밀번호 확인</label> <input type="password"
							class="form-control" id="PWD2" name="PWD2"
							placeholder="Confirm Password">
						<div class="eheck_font" id="pw2_check"></div>
					</div>


					<div class="form-group">
						<label for="BIRTH">생년월일</label> <input type="tel"
							class="form-control" id="BIRTH" name="BIRTH"
							placeholder="ex) 19990101">
						<div class="eheck_font" id="birth_check"></div>
					</div>


					<div class="form-group">
						<label for="PHONE_NUM">휴대폰 번호('-'없이 번호만 입력해주세요)</label> <input
							type="tel" class="form-control" id="PHONE_NUM" name="PHONE_NUM"
							placeholder="Phone Number">
						<div class="eheck_font" id="phone_check"></div>
					</div>

					<div class="form-group">
						<label for="GENDER">성별 </label> <input type="checkbox" id="GENDER"
							name="GENDER" value="남">남 <input type="checkbox"
							id="GENDER" name="GENDER" value="여">여
					</div>


					<div class="form-group text-center">
						<button type="submit" class="btn btn-primary">회원가입</button>
					</div>

					<!-- 접근 거부방지를 위한 -->
					<sec:csrfInput />
				</form>



			</div>
		</main>
	</div>

	<script>
		
	</script>

</body>
</html>