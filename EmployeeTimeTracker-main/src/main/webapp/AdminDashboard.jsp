<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.timetracker.dao.AdminDAO,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Time Tracker - Admin Dashboard</title>
<link rel="stylesheet" href="admin.css">

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
	<h1>Admin Dashboard</h1>
	<form action="LogoutServlet" method="post">
		<input type="submit" value="Logout">
	</form>
	<a href="createUser.jsp">Create user</a>
	<div>
		<h2>Users</h2>
		<table border="1" class="user-table">
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Role (type)</th>
				<th>Address</th>
				<th>Mobile Number</th>
			</tr>
			<%
			AdminDAO admin = new AdminDAO();
			ResultSet rs = admin.getUsers();
			while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><a href="editUser.jsp?id=<%=rs.getString(1)%>">Edit</a></td>
				<td><a href="DeleteUserServlet?id=<%=rs.getString(1) %>">Delete</a></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>