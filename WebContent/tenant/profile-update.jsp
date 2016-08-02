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
	
	ResultSet rs=con.getRs("SELECT * FROM tenant WHERE email='"+strEmail+"'");
	while (rs.next()){	
			int intT = 0;
			Data data = new Data();
			intT = data.insert("UPDATE tenant SET firstName='"
					+ firstName +", lastName ='"+ lastName + "'WHERE email='"
					+ strEmail + "'");
			if (intT <= 0) {
				out.print("<script>alert('Tenant account update failed.');document.location='account.jsp';</script>");
				return;
			} else {
				out.print("<script>alert('Tenant account update succeeded.');document.location='account.jsp';</script>");
			}
		}
%>
