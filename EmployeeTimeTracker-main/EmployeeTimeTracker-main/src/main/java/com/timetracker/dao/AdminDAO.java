package com.timetracker.dao;

import java.sql.*;
import com.timetracker.model.*;

public class AdminDAO {
	Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeetimetrackerapp", "root", "root");
		} catch (Exception e) {
			System.out.println(e);
		}
		return conn;
	}

	public boolean verifyAdminUser(String username, String pwd) throws SQLException {
		Connection c = null;
		try {
			c = getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String q = "SELECT * FROM Admin WHERE username=? and password=?;";
		PreparedStatement ps = c.prepareStatement(q);
		ps.setString(1, username);
		ps.setString(2, pwd);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return true;
		} else {
			return false;
		}
	}

	public boolean createUser(User u) throws SQLException {
		Connection c1 = null;
		try {
			c1 = getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String insertQuery = "INSERT INTO User (name, password, type, address, mobile_number) VALUES (?, ?, ?, ?, ?);";
		PreparedStatement ps = c1.prepareStatement(insertQuery);
		ps.setString(1, u.getName());
		ps.setString(2, u.getPassword());
		ps.setString(3, u.getType());
		ps.setString(4, u.getAddress());
		ps.setLong(5, u.getMobileNumber());
		int result = ps.executeUpdate();
		return (result > 0) ? true : false;
	}

	public ResultSet getUsers() throws SQLException {
		Connection c = null;
		try {
			c = getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String q = "SELECT id, name, type, address, mobile_number FROM User;";
		Statement st = c.createStatement();
		ResultSet rs = st.executeQuery(q);
		return rs;
	}

	public ResultSet getUser(int id) throws SQLException {
		Connection c = null;
		try {
			c = getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String q = "SELECT * FROM User where id=?";
		PreparedStatement st = c.prepareStatement(q);
		st.setInt(1, id);
		ResultSet rs = st.executeQuery();
		return rs;
	}

	public boolean deleteUser(int id) throws SQLException {
		Connection c = null;
		try {
			c = getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String q = "DELETE FROM User WHERE id=?";
		PreparedStatement st = c.prepareStatement(q);
		st.setInt(1, id);
		int result = st.executeUpdate();
		return (result > 0) ? true : false;
	}

	public boolean editUser(User u) throws SQLException {
		Connection c1 = null;
		try {
			c1 = getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String insertQuery = "UPDATE User SET name=?, type=?, address=?, mobile_number=? where id=?;";
		PreparedStatement ps = c1.prepareStatement(insertQuery);
		ps.setString(1, u.getName());
		ps.setString(2, u.getType());
		ps.setString(3, u.getAddress());
		ps.setLong(4, u.getMobileNumber());
		ps.setInt(5, u.getId());
		int result = ps.executeUpdate();
		return (result > 0) ? true : false;
	}
}
