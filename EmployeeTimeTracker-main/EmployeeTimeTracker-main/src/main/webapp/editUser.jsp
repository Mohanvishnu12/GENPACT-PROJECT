<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ page
import="com.timetracker.dao.AdminDAO,java.sql.*"%>
<!DOCTYPE html>
<html>
  <style>
    body {
      width: 100%;
    }
    .container {
      display: flex;
      flex-direction: column;
      width: 40%;
      margin: auto;
    }
    form {
      display: flex;
      flex-direction: column;
      gap: 20px;
      background-color: rgb(81, 114, 214);
      padding: 20px;
      border-radius: 10px;
    }
    input,
    select {
      padding: 10px;
      outline: none;
      border: navy;
      font-size: 1.1rem;
      letter-spacing: 1px;
    }
    h1 {
      margin: 20px auto;
      color: #2b2d44;
      font-size: 3rem;
      letter-spacing: 2px;
      font-weight: 600;
      font-style: italic;
    }
    a {
      text-decoration: none;
      margin: 20px auto;
      display: inline-block;
      color: rgb(83, 55, 55);
      font-weight: 600;
      font-size: 1.5rem;
    }
    a:hover {
      transform: scale(1.2);
      transition: 0.3s;
      color: #1e1064;
    }
    h2 {
      text-align: center;
    }
  </style>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Edit User</title>
  </head>
  <body>
    <% if (request.getSession(false).getAttribute("user-type") != null) { if
    (!request.getSession(false).getAttribute("user-type").equals("admin"))
    response.sendRedirect("index.jsp"); } else {
    response.sendRedirect("index.jsp"); } %> <% AdminDAO admin = new AdminDAO();
    int id = Integer.parseInt(request.getParameter("id")); ResultSet rs =
    admin.getUser(id); while (rs.next()) { %>
    <div class="container">
      <h1>Banking Application</h1>
      <a href="AdminDashboard.jsp">Home</a>
      <h2>Edit Customer</h2>
      <form action="EditUserServlet" method="post">
        <input type="number" name="id" value="<%=rs.getString(1) %>" readonly />
        <input
          type="text"
          name="name"
          placeholder="Enter the Full Name"
          value="<%=rs.getString(2)%>"
        />
        <input
          type="text"
          name="address"
          placeholder="Enter the Address"
          value="<%=rs.getString(5)%>"
        />
        <input
          type="tel"
          pattern="[0-9]{10}"
          name="mobile-no"
          placeholder="Enter the Mobile Number"
          value="<%=rs.getString(6)%>"
          required
        />
        <select name="user-type">
          <% if (rs.getString(4).equals("employee")) { %>
          <option value="employee" selected>Employee</option>
          <option value="manager">Manager</option>
          <% } else { %>
          <option value="employee">Employee</option>
          <option value="manager" selected>Manager</option>
          <% } %>
        </select>
        <input type="submit" value="Update User" />
      </form>
    </div>
    <% } %>
  </body>
</html>
