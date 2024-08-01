package com.timetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.timetracker.dao.AdminDAO;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		AdminDAO admin = new AdminDAO();
		try {
			if (admin.verifyAdminUser(username, password)) {
				System.out.println("Login Success");
				HttpSession session = request.getSession();
				session.setAttribute("user-type", "admin");
				session.setAttribute("user", username);
				request.getRequestDispatcher("AdminDashboard.jsp").include(request, response);
			}
			else {
				System.out.println("Login Failed");
				response.setContentType("text/html");
				response.getWriter().println("Login Failed Miserably!");
				request.getRequestDispatcher("adminLogin.jsp").include(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
