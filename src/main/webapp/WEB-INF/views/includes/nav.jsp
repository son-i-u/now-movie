<%@page session="true"%>
<% response.setContentType("text/html");
   request.setCharacterEncoding("utf-8");%> 

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	<a class="navbar-brand" href="/user/main">Now Movie</a>

	<!-- Navbar-->
	<ul class="navbar-nav ml-auto ml-md-0">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			id="userDropdown" href="#" role="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"><i
				class="fas fa-user fa-fw"></i></a>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="userDropdown">
				<!-- <a class="dropdown-item" href="#">Settings</a> -->
				<div class="dropdown-item"> <c:out
						value="${sessionScope.USER_ID } : ${sessionScope.AUTH_ROLE}" />
				</a> <a class="dropdown-item" href="/schedule/list"> <c:if
						test="${sessionScope.AUTH_ROLE  eq 'ROLE_MANAGER'}">
						<c:out value="admin page" />
					</c:if> <c:if test="${sessionScope.AUTH_ROLE eq 'ROLE_ADMIN'}">
						<c:out value="admin page" />
					</c:if>
				</a>
				<div class="dropdown-divider"></div>
				<form class="user" action="/nav" method='post'>
					<input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }" /> <a class="dropdown-item"
						href="/customLogin">Logout</a>
				</form>
				<div>
					<c:out value="${error}" />
				</div>
			</div></li>
	</ul>
</nav>
<div id="layoutSidenav">
	<div id="layoutSidenav_nav">
		<nav class="sb-sidenav accordion sb-sidenav-dark"
			id="sidenavAccordion">
			<div class="sb-sidenav-menu">
				<div class="nav">
					<div class="sb-sidenav-menu-heading">Core</div>
					<a class="nav-link" href="/user/main">
						<div class="sb-nav-link-icon">
							<i class="fas fa-tachometer-alt"></i>
						</div> Dashboard
					</a>
					<div class="sb-sidenav-menu-heading">Interface</div>
					<a class="nav-link collapsed" href="#" data-toggle="collapse"
						data-target="#collapseLayouts" aria-expanded="false"
						aria-controls="collapseLayouts"><div class="sb-nav-link-icon">
							<i class="fas fa-columns"></i>
						</div> Layouts
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div></a>
					<div class="collapse" id="collapseLayouts"
						aria-labelledby="headingOne" data-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav">
							<a class="nav-link" href="layout-static.html">Static
								Navigation</a><a class="nav-link" href="layout-sidenav-light.html">Light
								Sidenav</a>
						</nav>
					</div>
					<a class="nav-link collapsed" href="#" data-toggle="collapse"
						data-target="#collapsePages" aria-expanded="false"
						aria-controls="collapsePages"><div class="sb-nav-link-icon">
							<i class="fas fa-book-open"></i>
						</div> Pages
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div></a>
					<div class="collapse" id="collapsePages"
						aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav accordion"
							id="sidenavAccordionPages">
							<a class="nav-link collapsed" href="#" data-toggle="collapse"
								data-target="#pagesCollapseAuth" aria-expanded="false"
								aria-controls="pagesCollapseAuth">Authentication
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="pagesCollapseAuth"
								aria-labelledby="headingOne"
								data-parent="#sidenavAccordionPages">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="login.html">Login</a><a
										class="nav-link" href="register.html">Register</a><a
										class="nav-link" href="password.html">Forgot Password</a>
								</nav>
							</div>
							<a class="nav-link collapsed" href="#" data-toggle="collapse"
								data-target="#pagesCollapseError" aria-expanded="false"
								aria-controls="pagesCollapseError">Error
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="pagesCollapseError"
								aria-labelledby="headingOne"
								data-parent="#sidenavAccordionPages">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="401.html">401 Page</a><a
										class="nav-link" href="404.html">404 Page</a><a
										class="nav-link" href="500.html">500 Page</a>
								</nav>
							</div>
						</nav>
					</div>
					<div class="sb-sidenav-menu-heading">Addons</div>
					<a class="nav-link" href="charts.html"><div
							class="sb-nav-link-icon">
							<i class="fas fa-chart-area"></i>
						</div> Charts</a><a class="nav-link" href='table.html'><div
							class="sb-nav-link-icon">
							<i class="fas fa-table"></i>
						</div> Tables</a>
				</div>
			</div>
			<div class="sb-sidenav-footer">
				<div class="small">Logged in as:</div>
				Start Bootstrap
			</div>
		</nav>
	</div>