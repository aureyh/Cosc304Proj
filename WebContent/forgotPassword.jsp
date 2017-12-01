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
	<h4>Please enter your email below to have a reset link sent to you.</h4>
	<form method="post" id=resetForm action="sendemail.jsp">
		<label><b>Email</b></label>
		<input type="text" placeholder="Enter Email" name="resetemail" id="resetemail" required>
		<button id="sendButton" type="submit">Sign In</button>
	</form>


</body>
<%
//Get database connection
getConnection();
con = DriverManager.getConnection(url, uid, pw);

String resetemail = request.getParameter("resetemail");
String sql = "select userEmail from Customer where userEmail =?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, resetemail);	
ResultSet rst = pstmt.executeQuery();


if(rst.next()){
	out.println("<p>Check your email inbox for a password reset link.</p>");
	response.sendRedirect("sendemail.jsp");
}

if(rst.next()){
	out.println("<p>We don't have that email on record. Please enter another email.</p>");
}
 con.close();
%>


</html>
