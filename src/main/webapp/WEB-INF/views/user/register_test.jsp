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
						<label for="id">���̵�</label> <input type="text"
							class="form-control" id="USER_ID" name="USER_ID" placeholder="ID">
						<div class="eheck_font" id="id_check"></div>
					</div>

					<div class="form-group">
						<label for="pw">��й�ȣ</label> <input type="password"
							class="form-control" id="PWD" name="PWD" placeholder="PASSWORD">
						<div class="eheck_font" id="pw_check"></div>
					</div>

					<div class="form-group">
						<label for="pw2">��й�ȣ Ȯ��</label> <input type="password"
							class="form-control" id="PWD2" name="PWD2"
							placeholder="Confirm Password">
						<div class="eheck_font" id="pw2_check"></div>
					</div>


					<div class="form-group">
						<label for="BIRTH">�������</label> <input type="tel"
							class="form-control" id="BIRTH" name="BIRTH"
							placeholder="ex) 19990101">
						<div class="eheck_font" id="birth_check"></div>
					</div>


					<div class="form-group">
						<label for="PHONE_NUM">�޴��� ��ȣ('-'���� ��ȣ�� �Է����ּ���)</label> <input
							type="tel" class="form-control" id="PHONE_NUM" name="PHONE_NUM"
							placeholder="Phone Number">
						<div class="eheck_font" id="phone_check"></div>
					</div>

					<div class="form-group">
						<label for="GENDER">���� </label> <input type="checkbox" id="GENDER"
							name="GENDER" value="��">�� <input type="checkbox"
							id="GENDER" name="GENDER" value="��">��
					</div>


					<div class="form-group text-center">
						<button type="submit" class="btn btn-primary">ȸ������</button>
					</div>

					<!-- ���� �źι����� ���� -->
					<sec:csrfInput />
				</form>



			</div>
		</main>
	</div>

	<script>
		
	</script>

</body>
</html>