<%@page import="lti.quiz.bean.RegisterBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<script type="text/javascript" src="bootstrap.min.js"></script>
<script type="text/javascript" src="jquery-3.3.1.min.js"></script>
</head>
<%
	RegisterBean user = (RegisterBean) session.getAttribute("USER");
%>
<body>
	<nav class="navbar navbar-default .navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Guess Who</a>
		</div>
		<ul class="nav navbar-nav  navbar-right">

			<li><a href="home.jsp">Home</a></li>
			<%
				if (session.getAttribute("USER") != null) {
			%>

			<li><a>Welcome <%=user.getEmail()%></a></li>
			<li><a href="user.quiz?logout=yes">Logout</a></li>
			<%
				} else {
			%>
			<li><a href="login.jsp">Login</a></li>
			<%
				}
			%>
		</ul>
	</div>
	</nav>
</body>
</html>