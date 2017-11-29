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

String sql = " INSERT INTO Review (stars, comments) VALUES (?,?)";

getConnection();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,stars);
ps.setString(2,desc);
		
		
		

 ps.executeUpdate();


%>
</body>
</html>