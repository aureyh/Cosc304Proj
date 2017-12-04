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
 body { padding-top: 70px; }
  
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




<div class="container">
	
   
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
	<h2>Top Selling</h2>
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="https://i.ytimg.com/vi/Z0lnzuc6Fzw/maxresdefault.jpg" alt="Los Angeles" style="width:100%;">
      </div>

      <div class="item">
        <img src="https://media3.s-nbcnews.com/j/streams/2013/september/130906/8c8881134-shamwowguy.nbcnews-fp-1200-800.jpg" alt="Chicago" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="https://gadgetflowcdn.com/wp-content/uploads/2017/03/Fidget-Spinner-Tri-Spinning-Stress-Reducer-02.jpg" alt="New york" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<%
try{
	getConnection();
	PreparedStatement ps = con.prepareStatement("select * from Product");
	ResultSet rs = ps.executeQuery();
	


%>



<div class="container-fluid text-center">
  <h2>Suggestions</h2>
  <br>
  <%
  int row= 0;
  while(rs.next()&&row<6){
	  
	  if(row==0||row==3)
  out.print("<div class=\"row\">");
	  
		  
	  
	  
	  String img = rs.getString("image");
	  out.print(String.format("<div class=\"col-sm-4\"> <span>  <a href=\"product.jsp?pID=%d\"><img src=\"%s\" class=\"img-fluid\" alt=\"Responsive image\"></a></span> <h4>Cucumbers</h4> <p>They scare cats</p></div>",rs.getInt(1),img));
  		
	  if(row==2||row==5)
	  	out.print("</div>");
		  
	  row++;
  }
  %>


<%
con.close();
}catch(SQLException ex)
{
	out.print(ex);
} %>
  </div>
</body>
</html>
