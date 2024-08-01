<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Time Tracker - Admin Login</title>
<link rel="stylesheet" href="adminLogin.css">


</head>
<body>
	<div class="container">
		<form action="AdminLoginServlet" method="post">
			<h1>Admin Login</h1>

			<div class="input-box">
				<input type="text" name="username" required /> <label>Username</label>
				<img src="./assest/admin.svg" alt="">
			</div>
			<div class="input-box">
				<input type="password" name="password" required /> <label>password</label>
				<img src="./assest/pws.svg" alt="">
			</div>
			<input type="submit" value="Login" class="login" />
		</form>
	</div>
</body>
</html>