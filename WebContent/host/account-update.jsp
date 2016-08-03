<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.homecloud.db.Data"%>
<%@ page import="com.homecloud.db.Conn"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	Conn con=new Conn();
	String strEmail=(String)session.getAttribute("email");
    String oldPassword=(String)request.getParameter("oldPassword");
	String newPassword=(String)request.getParameter("newPassword");
	
	ResultSet rs=con.getRs("SELECT * FROM owner WHERE ownerEmail='"+strEmail+"'");
	while (rs.next()){
		String validPassword = rs.getString("password");		
		if (oldPassword.equals("") || newPassword.equals("")) {
			out.print("<script>alert('Please fill out the form completely.');document.location='account.jsp';</script>");
			return;
		} else if (!oldPassword.equals(validPassword)) {
			out.print("<script>alert('Wrong password. Please try again!');document.location='account.jsp';</script>");
			return;
		} else {
			int intT = 0;
			Data data = new Data();
			intT = data.insert("UPDATE owner SET password='"
					+ newPassword +"'WHERE ownerEmail='"
					+ strEmail + "'");
			if (intT <= 0) {
				out.print("<script>alert('Owner account update failed.');document.location='account.jsp';</script>");
				return;
			} else {
				out.print("<script>alert('Owner account update succeeded.');document.location='account.jsp';</script>");
			}
		}
	}
%>
