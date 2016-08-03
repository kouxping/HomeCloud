<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.homecloud.db.Data"%>
<%@ page import="java.sql.*"%>
<%
String rentID=(String)session.getAttribute("rentID");
String strEmail=(String)session.getAttribute("email");
Data data=new Data();
if(rentID!=null){
        int intT=data.delete("DELETE FROM rent WHERE rentID='"+ rentID +"'");
        if(intT>0){
                out.print("<script>alert('The rent posting was deleted successfully.');document.location='rent-listing.jsp';</script>");
        }else{
                out.print("<script>alert('Failed to Connect to Database.');document.location='rent-edit.jsp';</script>");
        }
}else{
    out.print("<script>alert('Please Log In again.');document.location='rent-login.html';</script>");
}
%>