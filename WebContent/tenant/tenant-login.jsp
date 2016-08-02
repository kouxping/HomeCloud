<%@ page contentType="text/html; charset=utf-8"%>
<jsp:useBean id="data" class="com.homecloud.db.Data" scope="page" />
<html>
<head>
<title>login</title>
</head>
<body>
<%
	String strEmail=(String)request.getParameter("user-email");
	String strPassword=(String)request.getParameter("user-pw");
	if (strPassword.equals("") || strEmail.equals("")) {
		out.print("<script>alert('Please fill out the form completely.');document.location='tenant-login.html';</script>");
		return;
	} else {
		int intT=0;
		intT=data.getRowCount("tenant WHERE email='"+strEmail+"' AND password='"+strPassword+"'");
		if(intT>0){
		    session.setAttribute("email",strEmail);
		    response.sendRedirect("rent-listing.jsp");
		}else{
		        out.print("<script>alert('Incorrect Email or Password.Please try again.');document.location='tenant-login.html';</script>");
		        return;
		}
	}
%>
</body>
</html>
