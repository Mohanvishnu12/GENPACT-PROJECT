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
import com.timetracker.model.*;

@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		Long mobileNo = Long.parseLong(request.getParameter("mobile-no"));
		String type = request.getParameter("user-type");
		User user = new User();
		user.setName(name);
		user.setAddress(address);
		user.setMobileNumber(mobileNo);
		user.setType(type);
		user.setId(id);
		AdminDAO admin = new AdminDAO();
		try {
			if (admin.editUser(user)) {
				response.setContentType("text/html");
				response.getWriter().println("User Updated Successfully");
				request.getRequestDispatcher("AdminDashboard.jsp").include(request, response);
			} else {
				response.setContentType("text/html");
				response.getWriter().println("User Updated Failed");
				request.getRequestDispatcher("AdminDashboard.jsp").include(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
