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


<%
//Get database connection
getConnection();
con = DriverManager.getConnection(url, uid, pw);

String uuid = request.getParameter("uuid");
String newPass = request.getParameter("pass");
String newPassConfirm = request.getParameter("confirmPass");

System.out.println(newPass);
System.out.println(newPassConfirm);

if(newPass.equals(newPassConfirm)){
	String sql2 = "UPDATE Customer SET password = ? WHERE uuid =?";
	PreparedStatement pstmt2 = con.prepareStatement(sql2);
	pstmt2.setString(1, newPass);
	pstmt2.setString(2, uuid);
	pstmt2.executeUpdate();
	out.println("Password successfully changed.");
}

else{
	out.println("Passwords don't match please click your email link again.");
}
con.close();
%>

</body>
</html>
