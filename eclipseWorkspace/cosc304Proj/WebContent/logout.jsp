<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="jdbc.jsp" %>
<%@ page import = "java.sql.*"%>

<%
session.setAttribute("email", null);
session.invalidate();
response.sendRedirect("shop.html");
%>