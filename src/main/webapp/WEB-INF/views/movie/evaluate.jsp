<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="../includes/header.jsp"%>
<body class="sb-nav-fixed">
	<%@ include file="../includes/nav.jsp"%>

	<div id="layoutSidenav_content">
		<main>
			<c:forEach items="${mncList}" var="movie">
				<div class="center-form">
					<img src="<spring:url value="${movie.img_loc }"/>"
						class="movie-img" alt="...">

					<!-- �򰡹�ư -->
					<div class="form-group">
						<label>�󸶳� ��ſ�̳���?</label>
						<div class="checkbox">
							<label> <input type="radio" name="${movie.movie_id}"
								onclick="movieScore(${movie.movie_id},'1')">1��
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="radio" name="${movie.movie_id}"
								onclick="movieScore(${movie.movie_id},'2')">2��
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="radio" name="${movie.movie_id}"
								onclick="movieScore(${movie.movie_id},'3')">3��
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="radio" name="${movie.movie_id}"
								onclick="movieScore(${movie.movie_id},'4')">4��
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="radio" name="${movie.movie_id}"
								onclick="movieScore(${movie.movie_id},'5')">5��
							</label>
						</div>

					</div>
				</div>
			</c:forEach>
			<!-- ���� ��ư -->
			<button type="button" onclick="selectPost()">submit</button>
		</main>
	</div>

	<script type="text/javascript">
				var movieArray = new Array();
				var scoreArray = new Array();
				
	    		var $form = $('<form></form>');
	    		$(document.body).append($form);
				
				$(document).ready(
					function($) {
						
				});
							
			
				     /*Ŭ���� ��ȭ���� �迭�� �߰� */
				    function movieScore(data, score) {
				    	console.log('�����Ͱ� �߰��˴ϴ�.');

						const idx = movieArray.indexOf(data);
						if ( idx > -1 ){
							movieArray.splice(idx,1);
						 	scoreArray.splice(idx,1);
						}
							
						movieArray.push(data);
						scoreArray.push(score);
						
						console.log(movieArray.length + "movieArray length �Դϴ�.");
						console.log(scoreArray.length + "scoreArray length �Դϴ�.");
				    }
				  
				    /* post�� ���� */
				    function selectPost(){
				    	
				    	/* ���� ��ȭ ���� �� ��� �˸� */
				    	if(movieArray.length == 0){
				    		 var delConfirm = confirm('���Ͻ� ��ȭ�� �����ϴ�. ��� �����Ͻðڽ��ϱ�?');
				    		   if (delConfirm) {
				    			   self.location="/movie/recommend";
				    		   }
				    		   else {
				    		      /* ����ϰ� ��ȭ �� �ٽ� ���� */
				    		   }
				    	}else if(movieArray.length < ${fn:length(mncList)}){
				    		var delConfirm = confirm('������ ����  ��ȭ�� �ֽ��ϴ�. ��� �����Ͻðڽ��ϱ�?');
				    		   if (delConfirm) {
				    			   self.location="/movie/recommend";
				    		   }
				    		   else {
				    		       	/*  ����ϰ� ��ȭ �� �ٽ� ���� */
				    		   }
				    	}else{
				    		
				    		/*  �� ��ȭ ���� �� �״�� ���� */
					    	$form.attr('action','/movie/evaluate');
					    	$form.attr('method','post');
					    	
					    	var mArray = $('<input name="movieArray" type="hidden" value='+movieArray+'>');
					    	var sArray = $('<input name="scoreArray" type="hidden" value='+scoreArray+'>');
					    	var sec = $('<sec:csrfInput/>');
					    	
					    	$form.append(mArray);
					    	$form.append(sArray);
					    	$form.append(sec);
					    	$form.submit();
				    	}
				    }
							
</script>
</body>
</html>