<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Time Tracker - Create User</title>
<link rel="stylesheet" href="createUser.css">

</head>
<body>
	<div class="container">
		<h1>User Creation Page</h1>
		<form action="createEmployeeServlet" method="post">
			<input type="text" name="name" placeholder="Name" required> <input
				type="password" name="password" placeholder="Password" required>
			<input type="text" name="address" placeholder="Address" required>
			<input type="tel" pattern="[0-9]{10}" name="mobile-no"
				placeholder="phone number" required> <select
				name="user-type">
				<option value="employee">Employee</option>
				<option value="manager">Manager</option>
			</select> <input type="submit" value="Create" class="btn">
		</form>
	</div>
</body>
</html>