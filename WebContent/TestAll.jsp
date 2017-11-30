<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>INFORMIRACLES</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  .img-fluid {
  max-width: 25%;
  height: auto;
}
 
  body {padding-top: 50px;}
  
  .navbar {
    margin-bottom: 0;
    background-color: #60606C;
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
    background-color: #fff !important;
}

.navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
}


  
 </style> 
  
</head>
<body>

<h1>PRINT EVERYTHING</h1>
<table>

<%
//CUSTOMER TABLE

  try               
{
	getConnection();
	PreparedStatement ps = con.prepareStatement("SELECT * from Customer");
 	ResultSet rst = ps.executeQuery();
 	
 	
        while (rst.next()) 
		out.println(String.format("<tr><td>%d</td></tr>",rst.getInt(1)));
        ps.close();
}
catch (SQLException ex)
{       out.println(ex);
}
%>



</table>



</body>
</html>
