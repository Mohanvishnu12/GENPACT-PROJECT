<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.timetracker.dao.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Time Tracker - Add Task</title>
<link rel="stylesheet" href="addTask.css">
</head>
<body>
	<form action="AddTaskServlet" method="post">
		<input type="text" name="task" placeholder="Task"> <input
			type="text" name="desc" placeholder="Description"> <input
			type="date" name="date" placeholder="Date"> <input
			type="time" name="start"> <input type="time" name="end">
		<select name="manager_id">
			<option></option>
			<%
			HttpSession s = request.getSession(false);
			int id = Integer.parseInt((String) s.getAttribute("user"));
			UserDAO user = new UserDAO();
			ResultSet rs = user.getManagers(id);
			try {
				while (rs.next()) {
			%>
			<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
			<%
			}
			} finally {
			if (rs != null)
			rs.close();
			}
			%>
		</select> <select name="status">
			<option value="approved">Approved</option>
			<option value="disapproved">Disapproved</option>
			<option value="pending">Pending</option>
			<option value="rejected">Rejected</option>
			<option value="self-approval">Self-Approved</option>
		</select> <input type="submit" value="add">
	</form>
</body>
</html>