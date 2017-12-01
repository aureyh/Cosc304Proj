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

<!DOCTYPE html>
<html lang="en">
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
  max-width: 50%;
  height: auto;
  
}
 body { padding-top: 80px; }
  
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



<div class="navbar navbar-fixed-top">
<div class="collapse navbar-collapse" id="navbarNav">

<a class="navbar-brand" href="shop.jsp"><img src="https://i.imgur.com/sKH1glA.png"></a>






<ul class="nav navbar-nav navbar-right" id="myNavbar">

 <li><a href="listOrders">ORDERS</a></li>
		<li class="nav-item"><a href="#about">ABOUT</a></li>
        <li class="nav-item"><a href="Admin.jsp">SIGN IN</a></li>
        <li class="nav-item"><a href="#cart">CART</a></li>
		</div>
</ul>


</div>
</div>


<div class="well">
<h1>Enter the following to complete the transaction:</h1><br>

<form method="get" action="order.jsp">
<table>
<tr><th>Customer ID:</th><td><input type="text" name="customerId" size="20"></td></tr>
<tr><th>Password:</th><td><input type="password" name="password" size="20"></td></tr>
<tr><th>Name on Card: </th><td><input type="text" name="cardName" size="20"></td></tr>
<tr><th>Card Number:</th><td><input type="text" name="cardNum" size="20"></td></tr>
<tr><th>Expire Date:</th><td><input type="text" name="expireDate" size="4"></td></tr>
<tr><th>CCV:</th><td><input type="text" name="ccv" size="3"></td></tr>
<tr><td><input type="submit" value="Submit" class="btn btn-success"></td><td><input type="reset" value="Reset" class="btn btn-danger"></td></tr>
</table>
</form>

</div>


</BODY>
</HTML> 



