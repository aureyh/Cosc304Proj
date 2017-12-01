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


<div class="row">
				


<%

/**
*This file lists the information about a product
*when the hyperlink is clicked from the listprod page.
*/

String id = request.getParameter("pID");

		


String sql = "SELECT * FROM Product WHERE pID = ?";
String sql2 = "SELECT * FROM Review WHERE pID = ?";

getConnection();
PreparedStatement ps = con.prepareStatement(sql);
PreparedStatement ps2 = con.prepareStatement(sql2);


//checks if the id we got from listprod is null
if(id != null){
ps.setString(1,id);
ps2.setString(1,id);
}

ResultSet rst = ps.executeQuery();
ResultSet rst2 = ps2.executeQuery();


//This prints the add cart, as well as the product information
while(rst.next()){
	String imgsrc=rst.getString("image");
	out.print("<div class=\"col col-sm-4\" ALIGN=CENTER>");
	
	out.print(String.format("<td><td><img src=\"%s\" class=\"img-fluid\" alt=\"Responsive image\"></td>",imgsrc));
	
	out.print("</div>");
	out.print("<div class=\"col col-sm-4\">");
	
	out.print("<table>");
	out.print(String.format("<tr><td><a class=\"btn btn-success\" href=\"addcart.jsp?id=%d\"&name=%s&price=%s\">Add to Cart</a></td></tr>",rst.getInt(1),rst.getString(2),""+rst.getBigDecimal(4)));
	
	
	
	out.print(String.format("<tr><td>%d</td></tr><tr><td>%s</td></tr><tr><td>Price : $%s.99</td></tr><tr><td>%s</td></tr><tr><td><a href=%s class=\"btn btn-link\">Video</a></td></tr>",rst.getInt(1),rst.getString(2),""+rst.getBigDecimal(4),rst.getString(3),rst.getString(5),rst.getString(7)));
	
	out.print("</table>");
	out.print("</div>");
	out.print("</div>");
}

session.setAttribute("prodID",id);

//This is where the reviews are printed
%>

</div>

<form action=review.jsp>
<div class="container">
					<table class="table table-striped">
						
						<tbody>



<tr><td>Rank This Product</td><td><select name="stars">
  <option value=1>1</option>
  <option value=2>2</option>
  <option value=3>3</option>
  <option value=4>4</option>
  <option value=5>5</option>
</select>
<tr><td>Leave a Review</td><td><textarea name="rev" rows="10" cols="50"></textarea></td></tr>
<tr><td><input type="submit" value="Submit"></td><td><input type="reset" value="Reset"></td></tr>
</tbody></table></div>
</form>

<h2>Reviews</h2>

<div class="container">
<table class="table table-striped">
<tbody>
<%
while(rst2.next()){
	out.print("<tr><td>Stars: </td><td>Comments: </td></tr>");
	out.println("<tr><td>" + rst2.getString(2) + "</td><td>" + rst2.getString(3) + "</td></tr>");
	}

out.print("</table>");




con.close();
%>

</tbody></table></div>

</BODY>
</HTML> 




