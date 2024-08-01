<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style>
body {
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-top: 10%;
}

form {
	display: flex;
	flex-direction: column;
	justify-content: center;
	gap: 20px;
	height: 45vh;
	background: rgb(165, 67, 83);
	padding: 20px;
	border-radius: 10px;
	width: 25%;
}

h1 {
	text-align: center;
	color: #000000;
}

.input-box {
	position: relative;
}

.input-box input {
	padding: 10px;
	width: 95%;
	background: transparent;
	outline: none;
	border-bottom: 2px solid snow;
	border-left: none;
	border-right: none;
	border-top: none;
	color: white;
	font-size: 1.1rem;
}

.input-box input::placeholder {
	color: white;
	font-size: 1.1rem;
}

input {
	padding: 10px;
	cursor: pointer;
	font-size: large;
	letter-spacing: 1px;
	font-weight: 400;
}

span {
	position: absolute;
	width: 0%;
	height: 3px;
	background: rgb(247, 134, 134);
	left: 0;
	bottom: 0;
	transition: 0.3s;
}

.input-box input:focus ~ span, .input-box input:valid ~ span {
	width: 100%;
	right: 0;
}

.login {
	border-radius: 20px;
	border: none;
	outline: none;
	cursor: pointer;
}

.login:hover {
	background: rgb(64, 243, 64);
	color: #ffffff;
}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Employee Time Tracker - Employee Login</title>

</head>
<body>
	<h1>Employee Login</h1>
	<form action="EmployeeLoginServlet" method="post">
		<input type="text" name="username" placeholder="Username"> <input
			type="password" name="password" placeholder="Password"> <input
			type="submit" value="login">
	</form>
</body>
</html>