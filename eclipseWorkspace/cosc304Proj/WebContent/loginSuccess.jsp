<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="jdbc.jsp" %>
<%@ page import = "java.sql.*"%>

<%
    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
You are not logged in<br/>
<a href="createAccount.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("email")%>
<a href='logout.jsp'>Log out</a>
<%
    }
%>