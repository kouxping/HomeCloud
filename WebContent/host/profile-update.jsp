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
    String firstName=(String)request.getParameter("firstName");
	String lastName=(String)request.getParameter("lastName");
	
	ResultSet rs=con.getRs("SELECT * FROM owner WHERE ownerEmail='"+strEmail+"'");
	while (rs.next()){	
			int intT = 0;
			Data data = new Data();
			intT = data.insert("UPDATE owner SET firstName='"
					+ firstName +"', lastName ='"+ lastName + "'WHERE ownerEmail='"
					+ strEmail + "'");
			if (intT <= 0) {
				out.print("<script>alert('Owner account update failed.');document.location='account.jsp';</script>");
				return;
			} else {
				out.print("<script>alert('Owner account update succeeded.');document.location='account.jsp';</script>");
			}
		}
%>
