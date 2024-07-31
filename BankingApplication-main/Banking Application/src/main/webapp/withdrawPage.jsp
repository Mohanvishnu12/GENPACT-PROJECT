<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Banking Application - Withdraw Page</title>
<link rel="stylesheet" href="adminLogin.css">
</head>
<body>
<form action="CustomerWithdrawServlet" method="post">
<input type="number" placeholder="Enter the amount" name="amount" />
<input type="submit" value="Withdraw" >
</form>
</body>
</html>