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
 
 body { padding-top: 50px; }
  
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


<form>


<div class="navbar-header">
<select class="form-control" id="categoryName" name="categoryName">
<option>All</option>

  
  

  
 <%  
 // Automatically Fill in catagories to the drop down
  try               
{
	getConnection();
	PreparedStatement ps = con.prepareStatement("SELECT DISTINCT tag FROM Product");
 	ResultSet rst = ps.executeQuery();
        while (rst.next()) 
		out.println(String.format("<option>%s</option>",rst.getString(1)));
        ps.close();
}
catch (SQLException ex)
{       out.println(ex);
}

%>
</select>
</div>


<div class="navbar-header"> 
 
      <input type="text" class="form-control" size="30" name="productName">
   </div> 
   <div class="nav-item">
   
   <% 
   //Send whatever is searched to the listprod.jsp
   
   String name = request.getParameter("productName");
   String category = request.getParameter("categoryName");
   
   boolean hasNameParam = name != null && !name.equals("");
   boolean hasCategoryParam = category != null && !category.equals("") && !category.equals("All");
   
   if(!hasNameParam)
	   name="";
   if(!hasCategoryParam)
	   category="All";
   
        out.print(String.format("<a class=\"btn btn-success\"  type=\"submit\" role=\"button\" href=\"listprod+.jsp?tag=%s&name=%s\" onclick=\"form.submit()\" >SEARCH</a>",category,name));
        
        %>  
        
       
        
        </div>

   
 

</form>


<ul class="nav navbar-nav navbar-right" id="myNavbar">

 <li><a href="listorder.jsp">ORDERS</a></li>
		<li class="nav-item"><a href="listprod+.jsp">ABOUT</a></li>
        <li class="nav-item"><a href="#signIn">SIGN IN</a></li>
        <li class="nav-item"><a href="#cart">CART</a></li>
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
        <img src="https://i.pinimg.com/736x/3c/7a/fc/3c7afc1b68c0f8cc367dd9d0f1f383de--anime-mermaid-anime-scenery.jpg" alt="Los Angeles" style="width:100%;">
      </div>

      <div class="item">
        <img src="http://magazine.viterbi.usc.edu/wp-content/uploads/BSP_054.jpg" alt="Chicago" style="width:100%;">
      </div>
    
      <div class="item">
        <img src="https://i.ytimg.com/vi/EXT6h3MDDKU/maxresdefault.jpg" alt="New york" style="width:100%;">
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


<div class="container-fluid text-center">
  <h2>Suggestions</h2>
  <br>
  <div class="row">
    <div class="col-sm-4">
      <span class="">
	  <img src="https://paramountseeds.com/wp-content/uploads/2014/07/long-cucumber.jpg" class="img-fluid" alt="Responsive image"></span>
      <h4>Cucumbers</h4>
      <p>They scare cats</p>
    </div>
    <div class="col-sm-4">
      <span class="">
	  <img src="https://paramountseeds.com/wp-content/uploads/2014/07/long-cucumber.jpg" class="img-fluid" alt="Responsive image">
	  </span>
      <h4>Cucumbers</h4>
      <p>They scare cats</p>
    </div>
    <div class="col-sm-4">
      <span class="">
	  <img src="https://upload.wikimedia.org/wikipedia/commons/d/de/FraiseFruitPhoto.jpg" class="img-fluid" alt="Responsive image">
	  </span>
      <h4>Staw Barries</h4>
      <p>They good</p>
    </div>
    </div>
    <br><br>
  <div class="row">
    <div class="col-sm-4">
      <span class="">
	  <img src="https://upload.wikimedia.org/wikipedia/commons/d/de/FraiseFruitPhoto.jpg" class="img-fluid" alt="Responsive image">
	  </span>
      <h4>Staw Barries</h4>
      <p>They good</p>
    </div>
    <div class="col-sm-4">
      <span class="">
	  <img src="https://paramountseeds.com/wp-content/uploads/2014/07/long-cucumber.jpg" class="img-fluid" alt="Responsive image">
	  </span>
      <h4>Cucumbers</h4>
      <p>They scare cats</p>
    </div>
    <div class="col-sm-4">
      <span class="">
	  <img src="https://upload.wikimedia.org/wikipedia/commons/d/de/FraiseFruitPhoto.jpg" class="img-fluid" alt="Responsive image">
	  </span>
      <h4>Staw Barries</h4>
      <p>They good</p>
    </div>
  </div>
</div>

</body>
</html>
