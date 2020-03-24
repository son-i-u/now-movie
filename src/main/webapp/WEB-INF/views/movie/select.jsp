
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
				<h1 class="mt-2">아래 영화중 재밌는 영화 있으셨나요? 고객님을 위한 추천 시스템에 이용됩니다.</h1>

				<!-- 영화 리스트 이미지 출력  / 버튼에 이미지 삽입 -->
				<div class="row">
					<c:forEach items="${list }" var="movie">
						<div class="col-xl-2" id="${movie.movie_id }">
							${movie.movie_nm } <a id="${movie.movie_id }"
								onclick="movieselect(${movie.movie_id}); "> <img
								src="<spring:url value="${movie.img_loc }"/>" alt="..."
								id="${movie.movie_id}img" class="jk_card">
						</div>
					</c:forEach>

					<!-- 접근 거부방지를 위한 -->
					<sec:csrfInput />

				</div>
				<!-- 제출 버튼 -->
				<button class='submit_btn' type="button" onclick="moviePost()">submit</button>
			</div>
		</main>
	</div>



	<script type="text/javascript">

					var movieArray = [];
					var lastCheck = true;
					var $form = $('<form></form>');
					$(document.body).append($form);
					
					$(document).ready(function() {


					});

					// 클릭시 선택 영화 배열에 추가 
					function movieselect(data) {
						
						if(lastCheck == false){
							lastCheck = !lastCheck;
							return;
						}
						/* 이미지 변경을 위한 class 변경 */
						var class_id = $("#"+data+"img").attr('class');

						if(class_id == 'card-img'){
							
							/* 재클릭한 영화는 배열에서 제거 */
							$("#"+data+"img").attr('class','jk_card');
							const idx = movieArray.indexOf(data);
							if ( idx > -1 ) movieArray.splice(idx,1);
							
						}else{
							console.log(data + "클릭했습니다.");
							movieArray.push(data);
							console.log(movieArray.length+ "선택한 movie 수입니다.");
							$("#"+data+"img").attr('class','card-img');
						}
						
				    }
				 	
				    
				    // moviearray를 post로 전달
				    function moviePost(){
				    	
				    	/* 선택 영화 없을 시 경고 알림 */
				    	if(movieArray.length == 0){
				    		
				    		alert("선호 영화를 선택해 주세요");
				    		lastCheck = !lastCheck;
				    		/*
				    		 var delConfirm = confirm('선호 영화를 선택해 주세요');
				    		   if (delConfirm) {
				    			   self.location="/movie/recommend";
				    		   }
				    		   else {
				    		      //취소하고 계속 진행
				    			  lastCheck = !lastCheck;
				    		   }
				    		*/
				    	}else{
				    		
				    		/* 선택 영화 있을 시 그대로 제출 */
				    		$form.attr('action','/movie/select');
					    	$form.attr('method','post');
					    	
					    	var test = $('<input name="test" type="hidden" value="test">');
					    	var mArray = $('<input name="movieArray" type="hidden" value='+movieArray+'>');
					    	var sec = $('<sec:csrfInput/>');
					    	
					    	$form.append(test);  
					    	$form.append(mArray);
					    	$form.append(sec);
					    	$form.submit();
					    	
					    	lastCheck = !lastCheck
	    	
					    }
				    }
				    	
				    	
							
</script>
</body>
</html>
