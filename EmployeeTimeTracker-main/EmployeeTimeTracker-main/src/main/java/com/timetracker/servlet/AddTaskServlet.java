package com.timetracker.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.timetracker.dao.UserDAO;
import com.timetracker.model.Task;
import java.time.Duration;
import java.time.LocalTime;
import java.util.*;

@WebServlet("/AddTaskServlet")
public class AddTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String taskName = request.getParameter("task");
		String desc = request.getParameter("desc");
		String date = request.getParameter("date");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		int mgrId = Integer.parseInt(request.getParameter("manager_id"));
		String status = request.getParameter("status");
		HttpSession session = request.getSession(false);
		int empId = Integer.parseInt((String) session.getAttribute("user"));
		Task t = new Task();
		t.setEmpId(empId);
		t.setTaskName(taskName);
		t.setDescription(desc);
		t.setDate(date);
		t.setStart(start);
		t.setEnd(end);
		Duration d = Duration.between(LocalTime.parse(t.getStart()), LocalTime.parse(t.getEnd()));
		t.setNo_of_hours(d.toHoursPart());
		t.setManagerId(mgrId);
		t.setStatus(status);
		UserDAO user = new UserDAO();
		try {
			if (user.createTask(t)) {
				response.setContentType("text/html");
				response.getWriter().println("Task Added Successfully");
				request.getRequestDispatcher("index.jsp").include(request, response);
			} else {
				response.setContentType("text/html");
				response.getWriter().println("Task Creation Failed");
				request.getRequestDispatcher("index.jsp").include(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
