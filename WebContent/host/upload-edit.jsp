<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.homecloud.db.Data"%>
<%@ page import="java.io.*" %>

<%
	String saveFile = new String();
    String getFile = new String();
    String fileName = new String();
	String contentType = request.getContentType();
	//String strEmail=(String)session.getAttribute("email");
	
	if((contentType != null) && (contentType.indexOf("multipart/form-data") >=0 )){
		
		DataInputStream in = new DataInputStream(request.getInputStream());
		
		int formDataLength = request.getContentLength();
		byte dataBytes[] = new byte[formDataLength];
		int byteRead = 0;
		int totalBytesRead = 0;
		
		while(totalBytesRead < formDataLength){
			byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
			totalBytesRead += byteRead;		
		}
		
		String file = new String(dataBytes, "CP1256");
		
		fileName = file.substring(file.indexOf("filename=\"") + 10);
		fileName = fileName.substring(0, fileName.indexOf("\n"));
		fileName = fileName.substring(fileName.lastIndexOf("\\") + 1, fileName.indexOf("\""));
		
		int lastIndex = contentType.lastIndexOf("=");
		String boundary = contentType.substring(lastIndex + 1, contentType.length());
		
		int pos;
		
		pos = file.indexOf("filename=\"");
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		
		int boundaryLocation = file.indexOf(boundary, pos) - 4;
		
		int startPos = ((file.substring(0, pos)).getBytes("CP1256")).length;
		int endPos = ((file.substring(0, boundaryLocation)).getBytes("CP1256")).length;
		
		//saveFile = "/Users/kouxping/Documents/" + strEmail + ".pdf";
		saveFile = "/Users/kouxping/www/" + fileName;
		
		File ff = new File(saveFile);
		
		try{
			FileOutputStream fileOut = new FileOutputStream(ff);
			fileOut.write(dataBytes, startPos, (endPos - startPos));
			fileOut.flush();
		
			out.println("<script type=\"text/javascript\">");
		    out.println("alert('Upload Successfully');");
		    out.println("</script>");
		    
		    fileOut.close();
		
		} catch (Exception e){
			out.println(e);
		}
	}
	
	String strEmail = (String) session.getAttribute("email");
	String rentID = (String)session.getAttribute("rentID");
	getFile = "http://localhost/" + fileName;
	
	int intT = 0;
	Data data = new Data();
	intT = data.insert("UPDATE rent SET image='" + getFile
			+ "'WHERE rentID='" + rentID + "'");
	if (intT <= 0) {
		out.print("<script>alert('Failed to connect to the database.');document.location='rent-edit.jsp';</script>");
		return;
	} else {
		out.print("<script>alert('The photo was updated successfully.');document.location='rent-edit.jsp';</script>");
	}
%> 