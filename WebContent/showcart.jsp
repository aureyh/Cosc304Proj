<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>

<HTML>
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

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="shop.jsp">INFOMIRACLES</a>
    </div>
<div class ="navbar-header">
  <form class="form-inline">
    <div class="input-group">
      <input type="email" class="form-control" size="50"  required>
      <div class="input-group-btn">
        <a href="listprod.jsp" class="btn btn-success" role="button" >SEARCH</a>
      </div>
    </div>
  </form>
  </div>

	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="listorder.jsp">SHOW ORDERS</a></li>
		<li><a href="about.jsp">ABOUT</a></li>
        <li><a href="login.jsp">SIGN IN</a></li>
        <li><a href="#cart">CART</a></li>
		
      </ul>
    </div>
  </div>
</nav>


<script>
function update(newid, newqty)
{
	window.location="showcart.jsp?update="+newid+"&newqty="+newqty;
}
</script>
<FORM name="form1">

<%
//<%@ include file="header.jsp"
// Get the current list of products
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");
ArrayList<Object> product = new ArrayList<Object>();
String id = request.getParameter("delete");
String update = request.getParameter("update");
String newqty = request.getParameter("newqty");

// check if shopping cart is empty
if (productList == null)
{	out.println("<H1>Your shopping cart is empty!</H1>");
	productList = new HashMap<String, ArrayList<Object>>();
}
else
{
	NumberFormat currFormat = NumberFormat.getCurrencyInstance();
	
	// if id not null, then user is trying to remove that item from the shopping cart
	if(id != null && (!id.equals(""))) {
		if(productList.containsKey(id)) {
			productList.remove(id);
		}
	}
	
	// if update isn't null, the user is trying to update the quantity
	if(update != null && (!update.equals(""))) {
		if (productList.containsKey(update)) { // find item in shopping cart
			product = (ArrayList<Object>) productList.get(update);
			product.set(3, (new Integer(newqty))); // change quantity to new quantity
		}
		else {
			productList.put(id,product);
		}
	}

	// print out HTML to print out the shopping cart
	out.println("<H1>Your Shopping Cart</H1>");
	out.print("<TABLE><TR><TH>Product Id</TH><TH>Product Name</TH><TH>Quantity</TH>");
	out.println("<TH>Price</TH><TH>Subtotal</TH><TH></TH><TH></TH></TR>");

	int count = 0;
	double total =0;
	// iterate through all items in the shopping cart
	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
	while (iterator.hasNext()) {
		count++;
		Map.Entry<String, ArrayList<Object>> entry = (Map.Entry<String, ArrayList<Object>>)(iterator.next());
		product = (ArrayList<Object>) entry.getValue();
		// read in values for that product ID
		out.print("<TR><TD>"+product.get(0)+"</TD>");
		out.print("<TD>"+product.get(1)+"</TD>");

		out.print("<TD ALIGN=CENTER><INPUT TYPE=\"text\" name=\"newqty"+count+"\" size=\"3\" value=\""
			+product.get(3)+"\"></TD>");
		double pr = Double.parseDouble( (String) product.get(2));
		int qty = ( (Integer)product.get(3)).intValue();
		
		// print out values for that product from shopping cart
		out.print("<TD ALIGN=RIGHT>"+currFormat.format(pr)+"</TD>");
		out.print("<TD ALIGN=RIGHT>"+currFormat.format(pr*qty)+"</TD>");
		// allow the customer to delete items from their shopping cart by clicking here
		out.println("<TD>&nbsp;&nbsp;&nbsp;&nbsp;<A HREF=\"showcart.jsp?delete="
			+product.get(0)+"\">Remove Item from Cart</A></TD>");
		// allow customer to change quantities for a product in their shopping cart
		out.println("<TD>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE=BUTTON OnClick=\"update("
			+product.get(0)+", document.form1.newqty"+count+".value)\" VALUE=\"Update Quantity\">");
		out.println("</TR>");
		// keep a running total for all items ordered
		total = total +pr*qty;
	}
	// print out order total
	out.println("<TR><TD COLSPAN=4 ALIGN=RIGHT><B>Order Total</B></TD>"
			+"<TD ALIGN=RIGHT>"+currFormat.format(total)+"</TD></TR>");
	out.println("</TABLE>");
	//give user option to check out
	out.println("<H2><A HREF=\"checkout.jsp\">Check Out</A></H2>");
}
// set the shopping cart
session.setAttribute("productList", productList);
// give the customer the option to add more items to their shopping cart
%>
<H2><A HREF="listprod+.jsp">Continue Shopping</A></H2>
</FORM>
</BODY>
</HTML> 



