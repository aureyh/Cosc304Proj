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
    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
You are not logged in<br/>
<a href="createAccount.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("email")%>
<%
out.println("Thank you for registering, you will be redirected to login in 3 seconds.<meta http-equiv=\"refresh\" content=\"3;url=http://localhost:8080/304_lab7_bonus/shop.html\" />");
%>
<%
    }
%>
</body>
</html>
