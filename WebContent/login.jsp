<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<script type="text/javascript" src="bootstrap.min.js"></script>
<script type="text/javascript" src="jquery-3.3.1.min.js"></script>
</head>

<body>
	<jsp:include page="banner.jsp" />
	<div class="container" style="margin-top: 50px">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h1>Login</h1>
				<%
					if (request.getParameter("invalid") != null) {
				%>
				<div class="alert-danger">Invalid UserID or Password</div>
				<%
					}
				%>
				<form action="user.quiz">
					<table class="table table-striped table-hover">
						<tr>
							<td><label>Enter Email:</label></td>
							<td><input required type="email" name="email"></td>
						</tr>
						<tr>
							<td><label>Enter Password:</label></td>
							<td><input type="password" name="password"></td>
						</tr>
						<tr>
							<td><input type="submit" value="Login"
								class="btn btn-success"></td>
							<td><a href="register.jsp" class="btn btn-danger">Register</a>
								<a href="forgotpassword.jsp" class="btn btn-danger">Forgot
									Password</a></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>

</html>