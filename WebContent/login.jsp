<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="jdbc.jsp" %>
<%@ page import = "java.sql.*"%>

<%
    String email = request.getParameter("loginemail");    
    String pass = request.getParameter("loginpass");
    //String email = "aandrews@amail.com";
    //String pass = "pass1";
    out.println(email);
    out.println(pass);
    
    //connect to db
    con = DriverManager.getConnection(url, uid, pw);
    String sql = "select * from customer where userEmail=? and password=?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1, email);
    pstmt.setString(2, pass);
    ResultSet rst = pstmt.executeQuery();
    
    if (rst.next()) {
        session.setAttribute("email", email);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("loginSuccess.jsp");
    } else {
        out.println("Invalid password <a href='createAccount.jsp'>try again</a>");
    }
%>