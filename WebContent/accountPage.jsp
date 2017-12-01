<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="jdbc.jsp" %>
<%@ page import = "java.sql.*"%>

<html>
<head>
<body>
<%
//Get database connection
getConnection();

String sql = "select fName from customer where custEmail =?";
con = DriverManager.getConnection(url, uid, pw);
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, request.getParameter("email"));
ResultSet rst = pstmt.executeQuery();
while(rst.next()){
	//print out everything, use href, click each item to change except
}
%>




</body>
</head>
</html>