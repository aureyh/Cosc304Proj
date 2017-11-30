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
String email = request.getParameter("email");    
String pass = request.getParameter("pass");
String fName = request.getParameter("fName");
String lName = request.getParameter("lName");
String postalCode = request.getParameter("postalCode");
String city = request.getParameter("city");
String address = request.getParameter("address");
String province = request.getParameter("province");
String phoneNumber = request.getParameter("phoneNumber");

//Get database connection
getConnection();
            		
//String sql = "INSERT INTO Customer(cID, firstName, lastName, birthdate, phoneNum, userEmail, password, Uuid, accType) VALUES(fName, lName, null, phoneNumber, email, pass, null, normal)";	
		      String sql = "";
	con = DriverManager.getConnection(url, uid, pw);
	PreparedStatement pstmt = con.prepareStatement(sql);
	int i = pstmt.executeUpdate();

//ResultSet rst;
if (i > 0) {
    //session.setAttribute("userid", user);
    out.println("<p>Thank you for registering, you will be redirected to login in 5 seconds.</p><meta http-equiv=\"refresh\" content=\"5;url=http://localhost:8080/304_lab7_bonus/shop.html\" />");
   // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
} 

else {
	 out.println("<p>There was an error, you will be redirected to the home page in 5 seconds.</p><meta http-equiv=\"refresh\" content=\"5;url=http://localhost:8080/304_lab7_bonus/shop.html\" />");
}
con.close();
%>

</body>	
</html>
