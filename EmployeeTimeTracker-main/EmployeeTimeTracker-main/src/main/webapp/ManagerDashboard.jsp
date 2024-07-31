<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.timetracker.dao.*,java.sql.*"%>
<!DOCTYPE html>
<html>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Outfit:wght@100..900&display=swap');


*{
    margin: 0;
    border: 0;
    box-sizing: border-box;
	font-family: "Outfit", sans-serif;

}
body{
	background: wheat;
    text-align: center;
    margin: 50px auto;
    animation: fadein 2s;
    transition: 1s ;
}
h1{
    margin: 20px 0;
    color: #2b2d44;
    font-size: 3rem;
    letter-spacing: 2px;
    font-weight:600;
    font-style: italic;
}
a{
    text-decoration: none;
    margin: 20px 0;
    display: inline-block;
    color: rgb(83, 55, 55);
    font-weight: 600;
    font-size: 1.5rem;
}
a:hover{
    transform: scale(1.2);
    transition: 0.3s ;
    color: #1e1064;
}
input{
    padding: 10px 40px;
    font-size: large;
    border-radius: 20px;
    font-family: inherit;
    letter-spacing: 2px;
    color: #007bff;
    margin: 20px 0;
    cursor: pointer;
}
input:hover{
    background: rgb(153, 255, 153);
    color: rgb(255, 255, 255);
}

h2{
    margin: 10px 0;
    color: #1e1064;
    font-size: 1.5rem;
    letter-spacing: 2px;
}

.table-container {
    max-width:80%; 
    margin-top: 20px;
    margin: auto;
	overflow-x: auto;
}

.user-table {
    width: 80%;
    border-collapse: collapse;
}

.user-table th, .user-table td {
    padding: 10px;
    text-align: left;
    border: 1px solid #ddd;
    height: 10vh;
}

.user-table th {
    background-color: #fc8c4c;
    color: white;

}

.user-table tr:nth-child(even) {
    background-color: #f2f2f2;
}

.user-table tr:hover {
    background-color: #ddd;
}

.user-table td a {
    display: inline-block;
    padding: 4px 8px;
    text-decoration: none;
    color: #f1885e;
	font-size: 1rem;
}

.user-table td a:hover {
    background-color: #fa9961e3;
    color: white;
}
@keyframes fadein{
    0%{
        opacity: 0;
    }
    100%{
        opacity: 1;
    }
}

	</style>
<head>
<meta charset="ISO-8859-1">
<title>Employee Time Tracker - Manager Dashboard</title>
</head>
<body>
	<%
	if (request.getSession(false).getAttribute("user-type") != null) {
		if (!request.getSession(false).getAttribute("user-type").equals("admin"))
			response.sendRedirect("index.jsp");
	} else {
		response.sendRedirect("index.jsp");
	}
	%>
	<h1>Manager Dashboard</h1>
	<form action="LogoutServlet" method="post">
		<input type="submit" value="Logout">
	</form>
	<a href="addTask.jsp">Add Task</a>
	<div class="table-container">
		<h2>Users</h2>
		<table border="1" class="user-table">
			<tr>
				<th>ID</th>
				<th>Employee ID</th>
				<th>Date</th>
				<th>Start</th>
				<th>End</th>
				<th>Number of Hours</th>
				<th>Task Name</th>
				<th>Task Description</th>
				<th>Manager</th>
				<th>Status</th>
			</tr>
			<%
			HttpSession s = request.getSession(false);
			int id = Integer.parseInt((String) s.getAttribute("user"));
			UserDAO user = new UserDAO();
			ResultSet rs = user.getTasks(id);
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getInt(1)%></td>
				<td><%=rs.getInt(2)%></td>
				<td><%=rs.getDate(3)%></td>
				<td><%=rs.getTime(4)%></td>
				<td><%=rs.getTime(5)%></td>
				<td><%=rs.getInt(6)%></td>
				<td><%=rs.getString(7)%></td>
				<td><%=rs.getString(8)%></td>
				<td><%=rs.getInt(9)%></td>
				<td><%=rs.getString(10)%></td>
				<td><a href="editUser.jsp?id=<%=rs.getString(1)%>">Edit</a></td>
				<td><a href="DeleteUserServlet?id=<%=rs.getString(1)%>">Delete</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>