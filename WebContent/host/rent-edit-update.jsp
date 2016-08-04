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
	String rentID = (String)session.getAttribute("rentID");
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
	int intT = 0;
	Data data = new Data();
	intT = data.insert("UPDATE rent SET price='" + price
			+ "',type='" + type + "',date='" + date
			+ "',bedrooms='" + bedrooms + "',street1='" + street1
			+ "',street2='" + street2 + "',city='" + city
			+ "',state='" + state + "',zipcode='"
			+ zipcode + "',description='" + description
			+ "'WHERE rentID='" + rentID + "'");

	if (intT <= 0) {
		out.print("<script>alert('Failed to connect to the database.');document.location='rent-listing.jsp';</script>");
		return;
	} else {
		out.print("<script>alert('The rent was updated successfully.');document.location='rent-listing.jsp';</script>");
	}
%>
