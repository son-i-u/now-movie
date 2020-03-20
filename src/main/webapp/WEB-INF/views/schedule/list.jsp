
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
			<!-- /.panel-heading -->
			<button id='regBtn' type="button" class="btn btn-xs pull-right">Register
				New Schedule</button>
			<div class="container-fluid">

				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>스케쥴 ID</th>
							<th>영화관 ID</th>
							<th>영화 ID</th>
							<th>시작 시간</th>
							<th>종료 시간</th>
							<th>삭제버튼</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="schedule">
						<tr>
							<td><c:out value="${schedule.schedule_id}" /></td>
							<td><c:out value="${schedule.theator_id}" /></td>
							<td><c:out value="${schedule.movie_id }" /></td>
							<td><c:out value="${schedule.start_time}" /></td>
							<td><c:out value="${schedule.end_time}" /></td>
							<td><button type="submit"
									onclick="removeSubmit(${schedule.schedule_id})"
									class="btn btn-default">remove</button></td>
						</tr>
					</c:forEach>
				</table>

				<!-- 페이징 처리  -->
				<div class='pull-right'>
					<ul class="pagination">

						<c:if test="${pageMaker.prev }">
							<li class="paginate_button previous"><a
								href="${startPage -1 }">Previous</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }">
							<li class="paginate_button ${PageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num }">${num }</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
					</ul>
				</div>

				<form id='actionForm' action="/schedule/list" method='get'>
					<input type='hidden' name='pageNum'
						value='${pageMaker.cri.pageNum }'> <input type='hidden'
						name='amount' value='${pageMaker.cri.amount }'>
				</form>

			</div>
		</main>
	</div>

	<script type="text/javascript">
		$(document).ready(				
				function() {
					var result = '<c:out value="${result}"/>';

					checkModal(result);

					history.replaceState({}, null, null);

					function checkModal(result) {
						if (result === '' || history.state) {
							return;
						}

						if (parseInt(result) > 0) {
							$(".modal-body").html(
									"schedule" + parseInt(result)
											+ "번이 등록되었습니다.");
						}

						$("#myModal").modal("show");
					}
					
					
					
					var actionForm = $("#actionForm");
					$(".paginate_button a").on(
							"click",
							function(e) {
								e.preventDefault();

								console.log('click');

								actionForm.find("input[name='pageNum']").val(
										$(this).attr("href"));
								actionForm.submit();
							});

					$("#regBtn").on("click", function() {
						self.location = "/schedule/insert";
					});
				});
		
		<!-- remove button -->
		function removeSubmit(data){
			var actionForm = $("#actionForm");
			actionForm.attr("action", "/schedule/remove").attr("method","post");
			
			var sec = $('<sec:csrfInput/>');
			var schedule_id = $('<input name="schedule_id" type="hidden" value='+data+'>');
			
			console.log(data);
			actionForm.append(sec);
			actionForm.append(schedule_id);
			actionForm.submit();
		}
	</script>
</body>
</html>