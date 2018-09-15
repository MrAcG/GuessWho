<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<script type="text/javascript" src="jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="banner.jsp" />
	<div class="container" style="margin-top: 50px">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h1>Change Password</h1>
				<form action="user.quiz">
					<table class="table table-striped table-hover">
						<tr>
							<td><label>Enter New Password:</label></td>
							<td><input required type="password" name="newpassword"></td>
						</tr>

						<tr>
							<td><input type="submit" value="Submit"
								class="btn btn-success"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

</body>
</html>