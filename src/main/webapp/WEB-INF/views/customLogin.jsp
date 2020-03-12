<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/htm14/loose.dtd">
<html http-equiv="Content-type" content="text/html; charset=UTF-8">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Custom Login Page</h1>
	<h2><c:out value="${error }"/></h2>
	<h2><c:out value="${logout }"/></h2>
	
	<form method='post' action="/login">
		<div>
			<input type='text' name='username' value='user'>
		</div>
		
		<div>
			<input type='password' name='password' value='pw'>
		</div>
		
		<div>
			<input type='submit' >
		</div>
		
			<input type='hidden' name="${_csrf.parameterName }" value="${_csrf.token }">
		
	</form>

</body>
</html>