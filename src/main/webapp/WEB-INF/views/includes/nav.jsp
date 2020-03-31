<%@page session="true"%>
<%
	response.setContentType("text/html");
	request.setCharacterEncoding("utf-8");
%>

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	<a class="navbar-brand" href="/movie/recommend">Now Movie</a>

	<!-- Navbar-->
	<ul class="navbar-nav ml-auto ml-md-0">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			id="userDropdown" href="#" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"><i
				class="fas fa-user fa-fw"></i></a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="userDropdown">
				<!-- <a class="dropdown-item" href="#">Settings</a> -->
				<div class="dropdown-item">
					<c:out value="${sessionScope.USER_ID } : ${sessionScope.AUTH_ROLE}" />
				</div>
				<a class="dropdown-item" href="/movie/evaluate"> evalaute </a>

				<div class="dropdown-item">
					<form role="logout" class="user" action="/logout" method='post'>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token }" /> <a class="dropdown-item"
							href="/customLogin">Logout</a>
						<sec:csrfInput />
					</form>
				</div>


				<a class="dropdown-item" href="/schedule/list"> <c:if
						test="${sessionScope.AUTH_ROLE  eq 'ROLE_MANAGER'}">
						<c:out value="admin page" />
					</c:if> <c:if test="${sessionScope.AUTH_ROLE eq 'ROLE_ADMIN'}">
						<c:out value="admin page" />
					</c:if>
				</a>

				<div>
					<c:out value="${error}" />
				</div>
			</div></li>
	</ul>
</nav>

<style>

</style>
