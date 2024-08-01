<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.timetracker.dao.*,java.sql.*"%>
<!DOCTYPE html>
<html>
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
	<div>
		<h2>Users</h2>
		<table border="1">
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