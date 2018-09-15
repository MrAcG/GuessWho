<%@page import="lti.quiz.bean.OptionBean"%>
<%@page import="lti.quiz.bean.QuizBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quiz</title>
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<script type="text/javascript" src="jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="banner.jsp" />
	<div class="container" style="margin-top: 50px">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<%
					QuizBean quiz = (QuizBean) request.getAttribute("QUESTION");
				%>
				<form action="quiz.quiz">
					<h4><%=quiz.getQuestion()%></h4>
					<%
						for (OptionBean option : quiz.getOptions()) {
					%>
					<input type="radio" name="choice"
						value="<%=option.getPattern()%>"><%=option.getOption()%><br>
					<%
						}
					%>
					<div>
						<input type="submit" value="Submit Answer" class="btn btn-info">
					</div>
				</form>
				<%@ include file="footer.html"%>
			</div>
		</div>
	</div>
</body>
</html>