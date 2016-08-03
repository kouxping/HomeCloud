<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.homecloud.db.Data"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String strEmail = (String) session.getAttribute("email");
	String price = request.getParameter("price");
	String type = request.getParameter("type");
	String bedrooms = request.getParameter("bedrooms");
	String bathrooms = request.getParameter("bathrooms");
	String street1 = request.getParameter("street1");
	String street2 = request.getParameter("street2");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String zipcode = request.getParameter("zipcode");
	String description = request.getParameter("description");
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();

	/**
	 int intT = 0;
	 Data data = new Data();
	 intT = data.insert("update job SET jobTitle='" + jobTitle
	 + "',companyName='" + companyName + "',companyWebsite='" + companyWebsite
	 + "',location='" + location + "',jobDescription='" + jobDescription
	 + "',desiredSkills='" + desiredSkills + "',industry='" + industry
	 + "',employmentType='" + employmentType + "',employmentLevel='"
	 + employmentLevel + "',jobFunction='"
	 + jobFunction + "',education='" + education
	 + "',recEmail='" + strEmail + "'");
	 **/

	int intT = 0;
	Data data = new Data();
	intT = data
			.insert("insert into rent(ownerEmail,price,type,bedrooms,bathrooms,street1,street2,city,state,zipcode,description,date) values('"
					+ strEmail
					+ "','"
					+ price
					+ "','"
					+ type
					+ "','"
					+ bedrooms
					+ "','"
					+ bathrooms
					+ "','"
					+ street1
					+ "','"
					+ street2
					+ "','"
					+ city
					+ "','"
					+ state
					+ "','"
					+ zipcode
					+ "','"
					+ description
					+ "','"
					+ dateFormat.format(date)
				    + "')");
	if (intT <= 0) {
		out.print("<script>alert('Failed to Connect to Database.');document.location='rent-listing.jsp';</script>");
		return;
	} else {
		out.print("<script>alert('The rent was added successfully.');document.location='rent-listing.jsp';</script>");
	}
%>
