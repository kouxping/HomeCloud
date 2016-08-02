package com.homecloud.db;

import java.sql.*;

public class Conn {
	private static Connection con;
	private Statement stmt;
	private ResultSet rs;
	private static final String drivername = "com.mysql.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/homecloud?user=root&password=0000";


	public static synchronized Connection getCon() throws Exception {
		try {
			Class.forName(drivername);
			con = DriverManager.getConnection(url);
			return con;
		} catch (SQLException e) {
			System.err.println(e.getMessage());
			throw e;
		}
	}


	public Statement getStmtread() {
		try {
			con = getCon();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			return stmt;
		} catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		return null;
	}


	public ResultSet getRs(String sql) {
		try {
			stmt = getStmtread();
			rs = stmt.executeQuery(sql);
			return rs;
		} catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		return null;
	}


	public Statement getStmt() {
		try {
			con = getCon();
			stmt = con.createStatement();
			return stmt;
		} catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		return null;
	}


	public synchronized void close() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		try {
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
		try {
			if (con != null) {
				con.close();
				con = null;
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	}
}