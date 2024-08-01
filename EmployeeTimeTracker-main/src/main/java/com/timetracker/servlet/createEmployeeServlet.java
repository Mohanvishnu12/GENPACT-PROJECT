package com.timetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.timetracker.dao.*;
import com.timetracker.model.User;

@WebServlet("/createEmployeeServlet")
public class createEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String pwd = request.getParameter("password");
		String address = request.getParameter("address");
		Long mobileNo = Long.parseLong(request.getParameter("mobile-no"));
		String type = request.getParameter("user-type");
		User user = new User();
		user.setName(name);
		user.setPassword(pwd);
		user.setAddress(address);
		user.setMobileNumber(mobileNo);
		user.setType(type);
		AdminDAO admin = new AdminDAO();
		try {
			if (admin.createUser(user)) {
				request.getRequestDispatcher("AdminDashboard.jsp").include(request, response);
			}
			else {
				request.getRequestDispatcher("Error.jsp").include(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
