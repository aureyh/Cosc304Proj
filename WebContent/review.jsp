<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="jdbc.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%



String desc = request.getParameter("rev");
String stars = request.getParameter("stars");

String sqlupdate = "ALTER TABLE Review DROP COLUMN revId ALTER TABLE Review ADD revID INT IDENTITY(1,1) ";
String sql = " INSERT INTO Review VALUES (?,?)";

getConnection();
Statement stmt = con.createStatement();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,stars);
ps.setString(2,desc);
stmt.executeUpdate(sqlupdate);
		

session = request.getSession(false);
if (session == null || session.getAttribute("userEmail") == null) {

%>You are not logged in <br/>
<a href="createAccount.jsp">Please log in to leave a review</a>
<%
} else {
	 ps.executeUpdate();
}


		
		




%>
</body>
</html>