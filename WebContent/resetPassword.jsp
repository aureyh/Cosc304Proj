<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>
<%@ page import="java.util.regex.*" %>
<%@ page import="java.util.ArrayList.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>

<h3>Please enter your new information below.</h3>
<%
//Get database connection
getConnection();
con = DriverManager.getConnection(url, uid, pw);

String uuid = request.getQueryString().toString();
System.out.println(uuid);


//get customer row by email
String sql = "Select * from Customer where Uuid =?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, uuid);	
ResultSet rst = pstmt.executeQuery();


if(rst.next()){
	out.println("<form method=\"post\" id=resetForm action=\"updatePass.jsp\"><label><b>Password</b></label><input type=\"password\" placeholder=\"Enter New Password\" name=\"pass\" id=\"pass\"required><label><b>Confirm New Password</b></label><input type=\"password\" placeholder=\"Confirm New Password\" name=\"confirmPass\" id=\"confirmPass\"required><button id=\"sendButton\" type=\"submit\"></button></form>");
}
else{
	response.sendRedirect("shop.html");
}


con.close();
%>

</body>
</html>
