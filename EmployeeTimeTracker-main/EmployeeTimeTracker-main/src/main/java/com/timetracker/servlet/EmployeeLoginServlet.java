package com.timetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.timetracker.dao.*;

@WebServlet("/EmployeeLoginServlet")
public class EmployeeLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserDAO emp = new UserDAO();
		try {
			int emp_id = emp.loginCustomer(username, password);
			if ( emp_id != -1) {
				if (emp.checkManager(emp_id)) {
					System.out.println("Login Success");
					HttpSession session = request.getSession();
					session.setAttribute("user-type", "manager");
					session.setAttribute("user", ""+emp_id);
					request.getRequestDispatcher("ManagerDashboard.jsp").include(request, response);
				}
				else {
					System.out.println("Login Success");
					HttpSession session = request.getSession();
					session.setAttribute("user-type", "employee");
					session.setAttribute("user", ""+emp_id);
					request.getRequestDispatcher("EmployeeDashboard.jsp").include(request, response);
				}
			}
			else {
				System.out.println("Login Failed");
				response.setContentType("text/html");
				response.getWriter().println("Customer Login Failed Miserably!");
				request.getRequestDispatcher("CustomerLogin.jsp").include(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
