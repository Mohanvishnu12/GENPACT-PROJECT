<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Employee Time Tracker</title>
    <link rel="stylesheet" href="style.css" />
  </head>
  <body>
    <%
	if (request.getSession(false).getAttribute("user-type") != null) {
		if (request.getSession(false).getAttribute("user-type").equals("admin")) {
			response.sendRedirect("AdminDashboard.jsp");
		}
		if (request.getSession(false).getAttribute("user-type").equals("employee")) {
			response.sendRedirect("EmployeeDashboard.jsp");
		}
		if (request.getSession(false).getAttribute("user-type").equals("manager")) {
			response.sendRedirect("ManagerDashboard.jsp");
		}
	}
	%>
    <div class="container">
      <h1>Employee Time Tracker</h1>
      <div class="btn">
        <div class="login">
          <a href="adminLogin.jsp">Admin Login</a>
          <img src="./assest//admin.svg" alt="" />
        </div>
        <div class="login">
          <a href="employeeLogin.jsp">Employee Login</a>
          <img src="./assest/user.svg" alt="" />
        </div>
      </div>
    </div>
  </body>
</html>
