<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ include file="jdbc.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>


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
        <li class="nav-item"><a href="addCart.jsp">CART</a></li>
		</div>
</ul>


</div>

<%
/**
*TODO:ALTER FOR NEW DDL
*
*/




// Get customer id
String custId = request.getParameter("customerId");
// Get password
String password = request.getParameter("password");
// Get shopping cart
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");
                
try 
{	
	if (custId == null || custId.equals(""))
		out.println("<h1>Invalid customer id.  Go back to the previous page and try again.</h1>");
	else if (productList == null)
		out.println("<h1>Your shopping cart is empty!</h1>");
	else
	{	
		// Check if customer id is a number
		int num=-1;
		try
		{
			num = Integer.parseInt(custId);
		} 
		catch(Exception e)
		{
			out.println("<h1>Invalid customer id.  Go back to the previous page and try again.</h1>");
			return;
		}		
        
		// Get database connection
        getConnection();
		
        String sql = "SELECT cID, firstName, lastName, password FROM Customer WHERE cID = ?";	
				      
   		con = DriverManager.getConnection(url, uid, pw);
   		PreparedStatement pstmt = con.prepareStatement(sql);
   		pstmt.setString(1, custId);
   		ResultSet rst = pstmt.executeQuery();
   		int orderId=0;
   		String custName = "";

   		if (!rst.next())
   		{
   			out.println("<h1>Invalid customer id.  Go back to the previous page and try again.</h1>");
   		}
   		else
   		{	
   			custName = rst.getString(2);
			String dbpassword = rst.getString(4);
				    		
			// make sure the password on the database is the same as the one the user entered
			if (!dbpassword.equals(password)) 
			{
				out.println("<h1>The password you entered was not correct.  Please go back and try again.</h1>"); 
				return;
			}
		
			//getting the current orderId number
			int maxOrderID = 1;
			Statement stmt = con.createStatement();
			ResultSet rst0 = stmt.executeQuery("SELECT MAX(oID) FROM Orders");
			while(rst0.next()){
				maxOrderID = rst0.getInt(1);
			}
		
			orderId = maxOrderID + 1;
   			// Enter order information into database
   			sql = "INSERT INTO Orders (oID, totalPrice, cID) VALUES (?, 0, ?);";

   			// Retrieve auto-generated key for orderId
   			pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
   			pstmt.setInt(1, orderId);
   			pstmt.setString(2,custId);
   			pstmt.executeUpdate();
   			//ResultSet keys = pstmt.getGeneratedKeys();
   			//keys.next();
   			//orderId = keys.getInt(1);

   			out.println("<h1>Your Order Summary</h1>");
   			
   			
   			%>
         	  	<div class="container">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Product Id</th>
								<th>Product Name</th>
								<th>Quantity</th>
								<th align=RIGHT>Price</th>
								<th align=RIGHT>Sub-total</th>
							</tr>
						</thead>
						<tbody>

         	  	
         	  <%	
         	  	
         	  	
           	double subtotal =0;
			double taxes=0;
			double total=0;
           	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
           	NumberFormat currFormat = NumberFormat.getCurrencyInstance();
						
           	while (iterator.hasNext())
           	{ 
           		Map.Entry<String, ArrayList<Object>> entry = iterator.next();
                   ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
   				String productId = (String) product.get(0);
                   out.print("<tr><td>"+productId+"</td>");
                   out.print("<td>"+product.get(1)+"</td>");
   				out.print("<td align=\"center\">"+product.get(3)+"</td>");
                   String price = (String) product.get(2);
                   double pr = Double.parseDouble(price);
                   int qty = ( (Integer)product.get(3)).intValue();
   				out.print("<td >"+currFormat.format(pr)+"</td>");
                  	out.print("<td>"+currFormat.format(pr*qty)+"</td></tr>");
                   out.println("</tr>");
                   subtotal = subtotal +pr*qty;

   				sql = "INSERT INTO ItemInOrder VALUES(?,?,?,?)";
   				pstmt = con.prepareStatement(sql);
   				pstmt.setInt(1, Integer.parseInt(productId));
   				pstmt.setInt(2, orderId);
   				pstmt.setInt(3,qty);
   				pstmt.setDouble(4,pr);
   				pstmt.executeUpdate();				
           	}
           	
           	taxes = subtotal*.12;
           	total = subtotal+taxes;
          	out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Subtotal</b></td>"
                  	+"<td aling=\"right\">"+currFormat.format(subtotal)+"</td></tr>");
          	
           	out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Total</b></td>"
                          	+"<td aling=\"right\">"+currFormat.format(total)+"</td></tr>");
           %>
           </tbody></table></div>
           
           <% 

   			// Update order total
   			sql = "UPDATE Orders SET totalPrice=? WHERE oID=?";
   			pstmt = con.prepareStatement(sql);
   			pstmt.setDouble(1, total);
   			pstmt.setInt(2, orderId);			
   			pstmt.executeUpdate();						

   			out.println("<h1>Thank you for your purchase " + custName);
   					out.println("<h1>Your order will be shipped soon...");
   			out.println("<h2>Your order reference number is: "+orderId+"</h2>");
   			

   			// Clear session variables (cart)
   			session.setAttribute("productList", null);    
   		}
   	}
}
catch (SQLException ex)
{ 	out.println(ex);
}
finally
{
	try
	{
		if (con != null)
			con.close();
	}
	catch (SQLException ex)
	{       out.println(ex);
	}
}  
%>                       				

<h2><a class="btn btn-primary" href="shop.jsp">Back to Main Page</a></h2>

</body>
</html>
