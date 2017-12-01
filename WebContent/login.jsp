<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="jdbc.jsp" %>
<%@ page import = "java.sql.*"%>

<%
    String email = request.getParameter("email");    
    String pass = request.getParameter("pass");
    
    //connect to db
    con = DriverManager.getConnection(url, uid, pw);
    Statement st = con.createStatement();
    ResultSet rst;
    rst = st.executeQuery("select * from customers where userEmail=email and pass=password");
    if (rst.next()) {
        session.setAttribute("email", email);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("loginSuccess.jsp");
    } else {
        out.println("Invalid password <a href='createAccount.jsp'>try again</a>");
    }
%>