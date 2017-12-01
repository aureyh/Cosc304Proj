<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title >INFORMIRACLES</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
  
  
  <style>
  .navbar-brand,
.navbar-nav li a {
    line-height: 100px;
    height: 100px;
    padding-top: 0;
}
  
  .img-fluid {
  max-width: 300%;
  height: auto;
  
}
 body { padding-top: 120px; }
  
  .navbar {
    margin-bottom: 0;
    background-color: #000000;
    z-index: 9999;
    border: 0;
    font-size: 12px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;
}

.navbar li a, .navbar .navbar-brand {
    color: #fff !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
    color: ##CD5F0F !important;
    background-color: #5D6D7E !important;
}

.navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
}

.navbar-default .navbar-nav .open .dropdown-menu>li>a, .navbar-default .navbar-nav .open .dropdown-menu {
    background-color: #000000;
    color:#ffffff;
  }
 

  
 </style> 
  
</head>
<body>


<%


getConnection();
String desc = request.getParameter("rev");
String stars = request.getParameter("stars");
int revID = 0;
Object o = session.getAttribute("prodID");
String pID = o.toString();


String sql = "SELECT MAX(revID) FROM Review";
Statement stmt = con.createStatement();
ResultSet rst = stmt.executeQuery(sql);

while(rst.next()){
	revID = rst.getInt(1);
}

String sql2 = "INSERT INTO Review VALUES (?,?,?,?,?,?)";
PreparedStatement ps2 = con.prepareStatement(sql2);
ps2.setInt(1,revID+1);
ps2.setString(2,stars);
ps2.setString(3,desc);
ps2.setString(4,"1");
ps2.setString(5,pID);
ps2.setString(6,"1111-11-11");
ps2.executeUpdate();

out.println("<h2> Thanks for the review!</h2>");
out.println("<a class=\"btn btn-success\" href=\"product.jsp?pID="+pID+"\" >" + "Back to product</a>");	

con.close();


%>
</body>
</html>