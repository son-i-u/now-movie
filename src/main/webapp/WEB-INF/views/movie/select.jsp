<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
				<h1 class="mt-4">�Ʒ� ��ȭ�� ��մ� ��ȭ �����̳���? ������ ���� ��õ �ý��ۿ� �̿�˴ϴ�.</h1>

				<!-- ��ȭ ����Ʈ �̹��� ���  / ��ư�� �̹��� ���� -->
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
					<!-- ���� ��ư -->
					<button type="button" onclick="moviePost()">submit</button>

					<!-- ���� �źι����� ���� -->
					<sec:csrfInput />

				</div>

	<script type="text/javascript">
		var movieArray = [];
		
		$(document).ready(
			function() {
			});
					
		    //Ŭ���� ���� ��ȭ �迭�� �߰�
		    function movieselect(data) {
				console.log(data + "Ŭ���߽��ϴ�.");
				movieArray.push(data);
				console.log(movieArray.length+ "������ movie ���Դϴ�.");
		
		    }
	  
	
	    
	    //moviearray�� post�� ����
	    function moviePost(){
	    	var $form = $('<form></form>');
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
