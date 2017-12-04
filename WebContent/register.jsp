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
con = DriverManager.getConnection(url, uid, pw);
//sql statements
String sql = "INSERT INTO Customer VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";	
String sql2 = "SELECT MAX(cID) AS max FROM Customer";    		
String sql3 = "SELECT userEmail FROM Customer WHERE userEmail=?";
String sql4 = "INSERT INTO custAddress VALUES(?, ?, ?, ?, ?, ?)";

//get next pk to use
Statement stmt = con.createStatement();
ResultSet rst2 = stmt.executeQuery(sql2);
rst2.next();
int maxCid = rst2.getInt("max");	
maxCid++;

//check if email is taken
PreparedStatement pstmt2 = con.prepareStatement(sql3);
pstmt2.setString(1, email);	
ResultSet rst3 = pstmt2.executeQuery();

if(rst3.next()){
	out.println("<p>The email you chose was taken, you will be redirected to the create account screen in 5 seconds.</p><meta http-equiv=\"refresh\" content=\"5;url=http://localhost:8080/304_lab7_bonus/createAccount.jsp\" />");
}	
else{
	//insert the new customer
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, String.valueOf(maxCid));	
	pstmt.setString(2, fName);	
	pstmt.setString(3, lName);	
	pstmt.setString(4, null);	
	pstmt.setString(5, phoneNumber);	
	pstmt.setString(6, email);	
	pstmt.setString(7, pass);	
	pstmt.setString(8, null);	
	pstmt.setString(9, "Normal");	
	
	PreparedStatement pstmt3 = con.prepareStatement(sql4);
	pstmt3.setString(1, address);	
	pstmt3.setString(2, province);
	pstmt3.setString(3, "Canada");
	pstmt3.setString(4, postalCode);
	pstmt3.setString(5, String.valueOf(maxCid));
	pstmt3.setString(6, "-1");
	
	int i = pstmt.executeUpdate();
	int j = pstmt3.executeUpdate();

	//if no errors great! else redirect;
	if (i > 0 && j > 0) {
 	   //session.setAttribute("userid", user);
 	   out.println("<p>Thank you for registering, you will be redirected to login in 5 seconds.</p><meta http-equiv=\"refresh\" content=\"5;url=http://localhost:8080/304_lab7_bonus/shop.jsp\" />");
	   // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
	} 

	else {
		 out.println("<p>There was an error, you will be redirected to the home page in 5 seconds.</p><meta http-equiv=\"refresh\" content=\"5;url=http://localhost:8080/304_lab7_bonus/shop.jsp\" />");
	}
}
con.close();
%>

</body>	
</html>
