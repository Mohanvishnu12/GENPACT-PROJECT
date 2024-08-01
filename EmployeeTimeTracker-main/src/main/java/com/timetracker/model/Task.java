package com.timetracker.model;

import java.util.Date;

public class Task {
	int empId;
	String date;
	String start;
	String end;
	int no_of_hours;
	String taskName;
	String description;
	int managerId;
	String status;

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getStart() {
		return start;
	}

	public String getEnd() {
		return end;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public int getNo_of_hours() {
		return no_of_hours;
	}

	public void setNo_of_hours(int no_of_hours) {
		this.no_of_hours = no_of_hours;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getManagerId() {
		return managerId;
	}

	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
