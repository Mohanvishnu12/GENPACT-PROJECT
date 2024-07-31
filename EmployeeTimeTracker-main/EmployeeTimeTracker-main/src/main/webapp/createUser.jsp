<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <style>
        body{
            width: 100%;
        }
        .container{
            display: flex;
            flex-direction: column;
            width: 40%;
            margin: auto;
        }
        form{
            display: flex;
            flex-direction: column;
            gap: 20px;
            background-color: rgb(81, 114, 214);
            padding: 20px;
            border-radius: 10px;
        }
        input,select{
            padding: 10px;
            outline: none;
            border: navy;
            font-size: 1.1rem;
            letter-spacing: 1px;
        }
     
    </style>
    
<head>
<meta charset="ISO-8859-1">
<title>Employee Time Tracker - Create User</title>
</head>
<body>
<div class="container">
    <h1>User Creation Page</h1>
<form action="createEmployeeServlet" method="post">
<input type="text" name="name">
<input type="password" name="password">
<input type="text" name="address">
<input type="tel" pattern="[0-9]{10}" name="mobile-no">
<select name="user-type">
<option value="employee">Employee</option>
<option value="manager">Manager</option>
</select>
<input type="submit" value="Create">
</form>
</div>
</body>
</html>