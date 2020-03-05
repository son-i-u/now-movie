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

	<h1>logout page</h1>
	
	<form action="/customLogout" method='post'>
	<input type="hidden" name="${_csrf.parameterName } value="${_csrf.token }"/></form>
	<button>로그아웃</button>
</body>
</html>