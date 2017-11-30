<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp" %>

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
  .img-fluid {
  max-width: 50%;
  height: auto;
  
}
 body { padding-top: 50px; }
  
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
    background-color: #5D6D7E !important;
}

.navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
}

.navbar-default .navbar-nav .open .dropdown-menu>li>a, .navbar-default .navbar-nav .open .dropdown-menu {
    background-color: #60606F;
    color:#ffffff;
  }
 

  
 </style> 
  
</head>
<body>



<div class="navbar navbar-fixed-top">
<div class="collapse navbar-collapse" id="navbarNav">

<a class="navbar-brand" href="shop.jsp">INFORMIRACLES  Admin Account</a>



<ul class="nav navbar-nav navbar-right" id="myNavbar">

 <li><a href="listOrders">ORDERS</a></li>
		<li class="nav-item"><a href="#about">ABOUT</a></li>
        <li class="nav-item"><a href="#signIn">SIGN IN</a></li>
        <li class="nav-item"><a href="#cart">CART</a></li>
		
</ul>

</div>
</div>










 <!-- Creates the TABS -->
<div class="container">
  <ul class="nav nav-pills" id="myTab">
    <li class="active"><a data-toggle="pill" href="#home">Statistics</a></li>
    <li><a data-toggle="pill" href="#menu1">Customers</a></li>
    <li><a data-toggle="pill" href="#menu2">Orders</a></li>
    <li><a data-toggle="pill" href="#menu3">Products</a></li>
  </ul>
  
  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>Statistics</h3>
      
      <p>Graph goes here</p>
      
      <img src="https://i.imgflip.com/uf259.png">
      
      
    </div>
    
    
    
    <!-- Customer information sub page -->
    <div id="menu1" class="tab-pane fade">
      <h3>Customers</h3>
      
      <div class="container">          
  <table class="table table-striped">
    <thead>
      <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Birth Date</th>
        <th>Email</th>
        <th>Email ID</th>
        <th>Account Type</th>
      </tr>
    </thead>
    <tbody>
      
      <%
      //Reads Customer information from database
      
      
      
      
      try{
    	  getConnection();
    	  String sql = "Select * from Customer";
    	  PreparedStatement ps = con.prepareStatement(sql);
    	  ResultSet rs = ps.executeQuery();
    	  
    	  
    	 
    	
    	  
    	  while(rs.next()){
    		  out.print(String.format("<tr><td>%d</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>",rs.getInt("cID"),rs.getString("firstname"),rs.getString("lastname"),""+rs.getDate("birthdate"),rs.getString("useremail"),rs.getString("Uuid"),rs.getString("accType")));
    	  }
    	  
    	  
    	ps.close();
    	  
      }catch (SQLException ex)
      {       out.println(ex);
      }
      
      
       
      
     

     %>
      
      
      
      
            
    </tbody>
  </table>
</div>
      
      
      
      
      
    </div>
    
    
    <!-- Orders sub page -->
    <div id="menu2" class="tab-pane fade">
      
        <div class="container">          
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Order Id</th>
        <th>Customer Id</th>
        <th>Total</th>
        <th>Order Date</th>
        <th>Shipping Date</th>
        </tr>
    </thead>
    <tbody>
      
       <%
      //Reads Customer information from database
      
      
      
      
      try{
    	  getConnection();
    	  String sql = "Select * from Orders";
    	  PreparedStatement ps = con.prepareStatement(sql);
    	  ResultSet rs = ps.executeQuery();
    	  
    	  
    	 
    	
    	  
    	  while(rs.next()){
    		  out.print(String.format("<tr><td>%d</td><td>%d</td><td>%s</td><td>%s</td><td>%s</td></tr>",rs.getInt("oID"),rs.getInt("cID"),"$"+rs.getBigDecimal("totalPrice"),rs.getDate("orderDate"),rs.getDate("shipDate")));
    	  }
    	  
    	  
    	ps.close();
    	  
      }catch (SQLException ex)
      {       out.println(ex);
      }
      
      
       
      
     

     %>
      
      </tbody>
  </table>
</div>
      
      
    </div>
    
    
    <!-- Products sub page -->
    <div id="menu3" class="tab-pane fade">
      <h3>Products</h3>
      
      
      <!-- Tabs for Add prod, Add warehouse, update prod -->
      <div class="container">
  
  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#prod1">Add Product</a></li>
    <li><a data-toggle="pill" href="#prod2">Update Product</a></li>
    <li><a data-toggle="pill" href="#prod3">Add Warehouse</a></li>
    <li><a data-toggle="pill" href="#prod4">Update Warehouse</a></li>
  </ul>
  
  
<!-- ADD PRODUCT TAB -->
  <div class="tab-content">
    <div id="prod1" class="tab-pane fade in active">
      <h3>Add Product</h3>
      
        <!-- ADD PRODUCT FORM -->
 	<form class="form-horizontal">
 	<div class="well">
  <div class="form-group">
    <label class="control-label col-sm-2" for="pname">Product Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="pname">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="cat">Category</label>
    <div class="col-sm-10"> 
      <input type="text" class="form-control" id="cat">
    </div>
  </div>
  <div class="form-group">     
    <label class="control-label col-sm-2" for="price">Price</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="price">      
    </div>
  </div>
  <div class="form-group">     
    <label class="control-label col-sm-2" for="desc">Package Desc</label>
      <div class="col-sm-10">
        <textarea class="form-control" rows="3" id="desc"></textarea>      
    </div>
  </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-success">Save Product</button>
    </div>
  </div>
  
</form>
 	
 	
 	
    </div>
    
    <!-- UPDATE Product TAB -->
    <div id="prod2" class="tab-pane fade">
      <h3>Update Product</h3>
      
      <!-- Pre Form to Fill in old information -->
<form class="form-horizontal">
<div class="well">
<div class="form-group">
    <label class="control-label col-sm-2" for="pid">Product Id</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="pid">
    </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-success">Retrieve Product info</button>
    </div>
  </div>
  </div>
  </form>
      
      <!-- UPDATE Product FORM -->
	<form class="form-horizontal">
 	<div class="well">
  <div class="form-group">
    <label class="control-label col-sm-2" for="pname">Product Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="pname">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="cat">Category</label>
    <div class="col-sm-10"> 
      <input type="text" class="form-control" id="cat">
    </div>
  </div>
  <div class="form-group">     
    <label class="control-label col-sm-2" for="price">Price</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="price">      
    </div>
  </div>
  <div class="form-group">     
    <label class="control-label col-sm-2" for="desc">Package Desc</label>
      <div class="col-sm-10">
        <textarea class="form-control" rows="3" id="desc"></textarea>      
    </div>
  </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-success">Save Product</button>
    </div>
  </div>
  
  </form>
 
    </div>
    
    <!-- ADD warehouse TAB -->
    <div id="prod3" class="tab-pane fade">
      <h3>Add Warehouse</h3>
 
 <!-- ADD warehouse FORM -->
<form class="form-horizontal">

<h4>General Information</h4>
<div class="well">
  <div class="form-group">
    <label class="control-label col-sm-2" for="sname">Supplier Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="sname">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="sphone">Supplier Phone Number</label>
    <div class="col-sm-10"> 
      <input type="text" class="form-control" id="sphone">
    </div>
  </div>
  <div class="form-group">     
    <label class="control-label col-sm-2" for="desc">Supplier Description</label>
      <div class="col-sm-10">
        <textarea class="form-control" rows="3" id="desc"></textarea>      
    </div>
  </div>
  </div>
  
  <h4>Location information</h4>
<div class="well">
  <div class="form-group">
    <label class="control-label col-sm-2" for="adress">Address</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="address">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="provstate">Province/State</label>
    <div class="col-sm-10"> 
      <input type="text" class="form-control" id="provstate">
    </div>
  </div>
  <div class="form-group">     
    <label class="control-label col-sm-2" for="country">Country</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="country">      
    </div>
  </div> 
   <div class="form-group">     
    <label class="control-label col-sm-2" for="zip">Postal Code</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="zip">      
    </div>
  </div>
  </div>
     
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-success">Save Warehouse</button>
    </div>
  </div>
</form>

    </div>
    
    <!-- UPDATE warehouse TAB -->
    <div id="prod4" class="tab-pane fade">
      <h3>Update Warehouse</h3>
      
     
<!-- Pre Form to Fill in old information -->
<form class="form-horizontal">
<div class="well">
<div class="form-group">
    <label class="control-label col-sm-2" for="sid">Supplier Id</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="sid">
    </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-success">Retrieve Warehouse info</button>
    </div>
  </div>
  </div>
  </form>

 <!-- UPDATE Warehouse FORM -->
<form class="form-horizontal">

<h4>General Information</h4>
<div class="well">
  <div class="form-group">
    <label class="control-label col-sm-2" for="sname">Supplier Name</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="sname">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="sphone">Supplier Phone Number</label>
    <div class="col-sm-10"> 
      <input type="text" class="form-control" id="sphone">
    </div>
  </div>
  <div class="form-group">     
    <label class="control-label col-sm-2" for="desc">Supplier Description</label>
      <div class="col-sm-10">
        <textarea class="form-control" rows="3" id="desc"></textarea>      
    </div>
  </div>
  </div>
  
  <h4>Location information</h4>
<div class="well">
  <div class="form-group">
    <label class="control-label col-sm-2" for="adress">Address</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="address">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="provstate">Province/State</label>
    <div class="col-sm-10"> 
      <input type="text" class="form-control" id="provstate">
    </div>
  </div>
  <div class="form-group">     
    <label class="control-label col-sm-2" for="country">Country</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="country">      
    </div>
  </div> 
   <div class="form-group">     
    <label class="control-label col-sm-2" for="zip">Postal Code</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="zip">      
    </div>
  </div>
  </div>
     
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-success">Save Warehouse</button>
    </div>
  </div>
</form>
</div>
    
      <!-- close menu tabs -->
  </div>
</div>
  



</body>
</html>
