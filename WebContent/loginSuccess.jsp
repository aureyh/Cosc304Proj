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
  max-width: 50%;
  height: auto;
  
}
 body { padding-top: 90px; }
  
  .navbar-brand,
.navbar-nav li a {
    line-height: 80px;
    height: 80px;
    padding-top: 0;
}
  
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


<li><a href="listprod+.jsp">SEARCH</a></li>
 <li><a href="listorder.jsp">ORDERS</a></li>
		<li class="nav-item"><a href="about.jsp">ABOUT</a></li>
		<%
                String email= (String) session.getAttribute("email");                     
                if (email == null) {
        %>
        <li class="nav-item"><a href="createAccount.jsp">SIGN IN | REGISTER</a></li>
        <%
                }
                else{
                	String accName = email.substring(0, email.indexOf('@')).toUpperCase();
                	  out.print(String.format("<li class=\"nav-item\"><a href=\"accountPage.jsp\">%s</a></li>",accName));	
                  out.print("<li class=\"nav-item\"><a href=\"logout.jsp\">LOGOUT</a></li>");
                  
                  
               
                }
                %>
        <li class="nav-item"><a href="addCart.jsp">CART</a></li>
		</div>
</ul>


</div>
</div>
<%
    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
You are not logged in<br/>
<a href="createAccount.jsp">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("email")%>
<%
out.println("Thank you for logging in, redirecting to main page in 3 seconds.<meta http-equiv=\"refresh\" content=\"3;url=http://localhost:8080/304_lab7_bonus/shop.jsp\" />");
%>
<%
    }
%>
</body>
</html>
