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


getConnection();
String desc = request.getParameter("rev");
String stars = request.getParameter("stars");
int revID = 1;
String pID = request.getParameter("id");

String sql = "SELECT MAX(revID) FROM Review";
Statement stmt = con.createStatement();
ResultSet rst = stmt.executeQuery(sql);

while(rst.next()){
	revID = rst.getInt(1);
}

String sql2 = "INSERT INTO Review VALUES (?,?,?,?,?,?)";
PreparedStatement ps2 = con.prepareStatement(sql2);
ps2.setInt(1,revID);
ps2.setString(2,stars);
ps2.setString(3,desc);
ps2.setString(4,"1");
ps2.setString(5,pID);
ps2.setString(6,"1111-11-11");

out.println("<a href=\"product.jsp?="+pID+"\">" + "Back to product</a>");	

con.close();


%>
</body>
</html>