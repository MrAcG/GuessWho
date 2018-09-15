
<%@page import="lti.quiz.bean.RegisterBean"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dashboard</title>
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<script type="text/javascript" src="jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="bootstrap.min.js"></script>
</head>
<%
	RegisterBean user = (RegisterBean) session.getAttribute("USER");
%>
<body>
	<jsp:include page="banner.jsp" />
	<div class="container">
		<h1>My DashBoard</h1>
		<h2>
			Email ID:
			<%=user.getEmail()%></h2>
		<img alt="" src="<%=user.getProfile()%>" height="200" width="300">
		<hr>
		<h2>Invoke the Inner hero</h2>
		<a href="quiz.quiz" class="btn btn-info">Take the Quiz</a>
	</div>

</body>
</html>