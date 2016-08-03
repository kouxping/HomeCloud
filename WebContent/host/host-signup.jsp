<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.homecloud.db.Data"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String strEmail=(String)request.getParameter("email");
	String strPassword=(String)request.getParameter("password");	
	if (strPassword.equals("") || strEmail.equals("")) {
		out.print("<script>alert('Please fill out the form completely.');document.location='host-login.html';</script>");
		return;
	} else {
		if(!(strEmail.matches("[a-zA-Z0-9\\.]+@[a-zA-Z0-9\\-\\_\\.]+\\.[a-zA-Z0-9]{3}"))){
            out.print("<script>alert('Please create your account using correct email format');document.location='host-login.html';</script>");
            return;
    	}
		int intT = 0;
		Data data = new Data();
		intT = data.getRowCount("owner WHERE ownerEmail='" + strEmail + "'");
		if (intT > 0) {
			out.print("<script>alert('Sorry, this email already exists. Please try with another one.');document.location='host-login.html';</script>");
			return;
		} else {
			intT = data.insert("INSERT INTO owner(ownerEmail, password) VALUES('"
					+ strEmail + "','"
					+ strPassword + "')");
			if (intT <= 0) {
				out.print("<script>alert('Home Owner account registration failed.');document.location='host-login.html';</script>");
				return;
			} else {
				out.print("<script>alert('Your owner account has been created successfully!');document.location='host-login.html';</script>");
			}
		}
	}
%>
