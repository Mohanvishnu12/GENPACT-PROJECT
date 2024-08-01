<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.timetracker.dao.AdminDAO,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User</title>
<link rel="stylesheet" href="edit.css">

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
	<%
	AdminDAO admin = new AdminDAO();
	int id = Integer.parseInt(request.getParameter("id"));
	ResultSet rs = admin.getUser(id);
	while (rs.next()) {
	%>
	<div class="container">
		<h2>Edit Customer</h2>
		<a href="AdminDashboard.jsp">Home</a>

		<form action="EditUserServlet" method="post">
			<input type="number" name="id" value="<%=rs.getString(1) %>" readonly />
			<input type="text" name="name" placeholder="Enter the Full Name"
				value="<%=rs.getString(2)%>" /> <input type="text"
				name="address" placeholder="Enter the Address"
				value="<%=rs.getString(5)%>" /> <input type="tel"
				pattern="[0-9]{10}" name="mobile-no"
				placeholder="Enter the Mobile Number" value="<%=rs.getString(6)%>"
				required /> <select name="user-type">
				<% if (rs.getString(4).equals("employee")) { %>
				<option value="employee" selected>Employee</option>
				<option value="manager">Manager</option>
				<% } else { %>
				<option value="employee">Employee</option>
				<option value="manager" selected>Manager</option>
				<% } %>
			</select> <input type="submit" value="Update User" class="update" />
		</form>
	</div>
	<%
	}
	%>
</body>
</html>