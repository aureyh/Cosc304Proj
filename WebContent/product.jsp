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
  max-width: 150%;
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
        <li class="nav-item"><a href="showcart.jsp">CART</a></li>
		</div>
</ul>


</div>
</div>


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
rst.next();
	
	out.print(String.format("<div class=\"row\"><div class=\"col-sm-4\"><img src=\"%s\" class=\"img-fluid\" alt=\"Responsive image\"></div>",rst.getString("image")));
	
	


	out.print(String.format("<div class=\"col-sm-4\"><br><br><br><h2>%s</h2><br><br><strong>Price :</strong> %s<br><br>",rst.getString("name"),"$"+rst.getBigDecimal("price")+".00"));
	
	out.print(String.format("<p>Description:</tr><br><tr>%s</p> ", rst.getString(3)));
	

	
	out.print("<a class=\"btn btn-success\" href=\"addcart.jsp?id=" + rst.getInt(1) + "&name=" +rst.getString(2)
	+ "&price=" + rst.getBigDecimal(4) + "\">Add to Cart</a><br>");
	
	out.print(String.format("<a href=\"%s\">Video Link</a>", rst.getString(5)));
out.print("</div></div>");





//This is where the reviews are printed
%>
<h3>Here's what People are saying about this product</h3>
<div class="container">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Stars</th>
								<th>Comments</th>
							</tr>
						</thead>
						<tbody>


<%
while(rst2.next()){
	
	out.println("<tr><td><h2><font color=\"#FBFF00\">");
	
	int stars = Integer.parseInt(rst2.getString(2)); 
	
	for(int i = 0; i<5;i++){
	if(i<stars)
		out.print("★");
	else
		out.print("☆");
	}
	out.print("</font></h2></td><td>" + rst2.getString(3) + "</td></tr>");
	}

out.print("</tbody></table></div>");

//everything here is used for writing the review and sending it.
out.print("<form method=\"post\" action=\"review.jsp\">");

session.setAttribute("prodID",id);
%>

<div class="well">
<table>
<tr><td>Star rating (1-5)</td><td><select name="stars">
  <option value=1>1</option>
  <option value=2>2</option>
  <option value=3>3</option>
  <option value=4>4</option>
  <option value=5>5</option>
</select>
<tr><td>Leave a Review</td><td><textarea name="rev" rows="10" cols="50"></textarea></td></tr>
<tr><td></td><td><input class="btn btn-success" type="submit" value="Submit"></td><td><input class="btn btn-danger" type="reset" value="Reset"></td></tr>
</table>
</form>
</div>
<%con.close(); %>
</body>
</html>