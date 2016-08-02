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
	
	ResultSet rs=con.getRs("SELECT * FROM tenant WHERE email='"+strEmail+"'");
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
			intT = data.insert("UPDATE tenant SET password='"
					+ newPassword +"'WHERE email='"
					+ strEmail + "'");
			if (intT <= 0) {
				out.print("<script>alert('Tenant account update failed.');document.location='account.jsp';</script>");
				return;
			} else {
				out.print("<script>alert('Tenant account update succeeded.');document.location='account.jsp';</script>");
			}
		}
	}
%>
