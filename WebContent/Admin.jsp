<%@ page import="java.sql.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>INFORMIRACLES</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.img-fluid {
	max-width: 50%;
	height: auto;
}

body {
	padding-top: 70px;
}

.navbar-brand, .navbar-nav li a {
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

.navbar-default .navbar-nav .open .dropdown-menu>li>a, .navbar-default .navbar-nav .open .dropdown-menu
	{
	background-color: #000000;
	color: #ffffff;
}
</style>

</head>
<body>



	<div class="navbar navbar-fixed-top">
		<div class="collapse navbar-collapse" id="navbarNav">

			<a class="navbar-brand" href="shop.jsp"><img
				src="https://i.imgur.com/sKH1glA.png"></a>




			<ul class="nav navbar-nav navbar-right" id="myNavbar">


				<li><a href="listprod+.jsp">SEARCH</a></li>
				<li><a href="listorder.jsp">ORDERS</a></li>
				<li class="nav-item"><a href="about.jsp">ABOUT</a></li>
				<%
					String email = (String) session.getAttribute("email");
					if (email == null) {
				%>
				<li class="nav-item"><a href="createAccount.jsp">SIGN IN |
						REGISTER</a></li>
				<%
					} else {
						String accName = email.substring(0, email.indexOf('@')).toUpperCase();
						out.print(String.format("<li class=\"nav-item\"><a href=\"accountPage.jsp\">%s</a></li>", accName));
						out.print("<li class=\"nav-item\"><a href=\"logout.jsp\">LOGOUT</a></li>");

					}
				%>
				<li class="nav-item"><a href="addCart.jsp">CART</a></li>
		</div>
		</ul>


	</div>
	</div>










	<!-- Creates the TABS -->
	<div class="container">
		<ul class="nav nav-pills" id="myTab">
			<li class="active"><a data-toggle="pill" href="#home">Statistics</a></li>
			<li><a data-toggle="pill" href="#menu11">Products</a></li>
			<li><a data-toggle="pill" href="#menu1">Customers</a></li>
			<li><a data-toggle="pill" href="#menu2">Orders</a></li>
			<li><a data-toggle="pill" href="#menu22">Suppliers</a></li>
			<li><a data-toggle="pill" href="#menu3">Add/Update/Remove</a></li>
		</ul>


		<!-- Statistic Page -->
		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<h3>Statistics</h3>

				<p>Graph goes here</p>

				<img src="https://i.imgflip.com/uf259.png">


			</div>


			<!-- Products view page -->
			<div id="menu11" class="tab-pane fade">
				<h3>Customers</h3>

				<div class="container">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Description</th>
								<th>Price</th>
								<th>Video source</th>
								<th>Inventory</th>
								<th>Image source</th>
								<th>Tag</th>
							</tr>
						</thead>
						<tbody>

							<%
								//Reads Customer information from database

								try {
									getConnection();
									String sql = "Select * from Product";
									PreparedStatement ps = con.prepareStatement(sql);
									ResultSet rs = ps.executeQuery();

									while (rs.next()) {
										out.print(String.format(
												"<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>",
												rs.getInt("pID"), rs.getString("name"), rs.getString("description"),
												"" + rs.getBigDecimal("price"), rs.getString("videoLink"), "" + rs.getInt("inventory"),
												rs.getString("image"), rs.getString("tag")));
									}

									ps.close();

								} catch (SQLException ex) {
									out.println(ex);
								}
							%>





						</tbody>
					</table>
				</div>





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

								try {
									getConnection();
									String sql = "Select * from Customer";
									PreparedStatement ps = con.prepareStatement(sql);
									ResultSet rs = ps.executeQuery();

									while (rs.next()) {
										out.print(String.format(
												"<tr><td>%d</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>",
												rs.getInt("cID"), rs.getString("firstname"), rs.getString("lastname"),
												"" + rs.getDate("birthdate"), rs.getString("useremail"), rs.getString("Uuid"),
												rs.getString("accType")));
									}

									ps.close();

								} catch (SQLException ex) {
									out.println(ex);
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

								try {
									getConnection();
									String sql = "Select * from Orders";
									PreparedStatement ps = con.prepareStatement(sql);
									ResultSet rs = ps.executeQuery();

									while (rs.next()) {
										out.print(String.format("<tr><td>%d</td><td>%d</td><td>%s</td><td>%s</td><td>%s</td></tr>",
												rs.getInt("oID"), rs.getInt("cID"), "$" + rs.getBigDecimal("totalPrice"),
												rs.getDate("orderDate"), rs.getDate("shipDate")));
									}

									ps.close();

								} catch (SQLException ex) {
									out.println(ex);
								}
							%>

						</tbody>
					</table>
				</div>


			</div>


			<!-- Suppliers sub page -->
			<div id="menu22" class="tab-pane fade">

				<div class="container">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Supplier Id</th>
								<th>Name</th>
								<th>Phone Number</th>
								<th>Description</th>
								<th>Address</th>
								<th>Province/State</th>
								<th>Country</th>
								<th>Postal Code</th>

							</tr>
						</thead>
						<tbody>

							<%
								//Reads Supplier information from database

								try {
									getConnection();
									String sql = "Select * from Supplier, CustAddress where Supplier.suID=CustAddress.suID";
									PreparedStatement ps = con.prepareStatement(sql);
									ResultSet rs = ps.executeQuery();

									while (rs.next()) {
										out.print(String.format(
												"<tr><td>%d</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>",
												rs.getInt("suID"), rs.getString("name"), rs.getString("phoneNum"), rs.getString("descr"),
												rs.getString("address"), rs.getString("provinceOrState"), rs.getString("country"),
												rs.getString("postalCode")));
									}

									ps.close();

								} catch (SQLException ex) {
									out.println(ex);
								}
							%>

						</tbody>
					</table>
				</div>


			</div>




			<!-- ADD/UPDATE/REMOVE sub page -->
			<div id="menu3" class="tab-pane fade">
				<h3>Add/Update/Remove</h3>


				<!-- Tabs for Add prod, Add warehouse, update prod -->
				<div class="container">

					<ul class="nav nav-pills">
						<li class="active"><a data-toggle="pill" href="#prod1">Add
								Product</a></li>

						<li><a data-toggle="pill" href="#prod2">Update Product</a></li>
						<li><a data-toggle="pill" href="#prod3">Add Warehouse</a></li>

						<li><a data-toggle="pill" href="#prod4">Update Warehouse</a></li>
					</ul>


					<!-- ADD PRODUCT TAB -->
					<div class="tab-content">
						<div id="prod1" class="tab-pane fade in active">
							<h3>Add Product</h3>

							<!-- ADD PRODUCT FORM -->
							<form class="form-horizontal" action="AddItem.jsp"
								onsubmit="setTimeout(function () { window.location.reload(); }, 10)">
								<div class="well">
									<div class="form-group">
										<label class="control-label col-sm-2" for="name">Product
											Name</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="name" name="name">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="description">Product
											Description</label>
										<div class="col-sm-10">
											<textarea class="form-control" rows="3" id="description"
												name="description"></textarea>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-sm-2" for="price">Price</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="price"
												name="price">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="videoLink">Video
											Link</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="videoLink"
												name="videoLink">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="inventory">Amount
											in Stock</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="inventory"
												name="inventory">
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-sm-2" for="image">Image
											Link</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="image"
												name="image">
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-sm-2" for="tag">Tag</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="tag" name="tag">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-success" value="send">Save
											Product</button>
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
										<label class="control-label col-sm-2" for="pID">Product
											Id</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pID" name="pID">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-success">Retrieve
												Product info</button>
										</div>
									</div>
								</div>
							</form>

							<%
								//get values for the given pID
								String prodID = request.getParameter("pID");
								String prodName = "";
								String prodTag = "";
								String prodPrice = "";
								String stock = "";
								String picLink = "";
								String vidLink = "";
								String descrip = "";
								if (prodID != null) {
									String sqlProdInfo = "select * from Product where pID='" + prodID + "'";
									try {
										getConnection();
										PreparedStatement ps = con.prepareStatement(sqlProdInfo);
										ResultSet rs = ps.executeQuery();
										rs.next();

										prodName = rs.getString("name");
										prodTag = rs.getString("tag");
										prodPrice = "" + rs.getBigDecimal("price");
										stock = "" + rs.getInt("inventory");
										picLink = rs.getString("image");
										vidLink = rs.getString("videoLink");
										descrip = rs.getString("description");
										//Test see if all values are not null
										//	out.print(String.format("%s %s %s %s %s %s %s",prodName,prodTag,prodPrice,stock,picLink,vidLink,descrip));

									} catch (SQLException ex) {
										out.print(ex);
									}
								}
							%>


							<!-- UPDATE Product FORM NOT WORKING-->
							<form class="form-horizontal" method="GET"
								action="updateProduct.jsp">
								<div class="well">
									<div class="form-group">
										<label class="control-label col-sm-2" for="pID">Product
											ID</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pID" name="pID"
												value="<%out.print(prodID);%>">
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-sm-2" for="name">Product
											Name</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="name" name="name"
												value="<%out.print(prodName);%>">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="description">Product
											Description</label>
										<div class="col-sm-10">
											<textarea class="form-control" rows="3" id="description"
												name="description">
												<%
													out.print(descrip);
												%>
											</textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="price">Price</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="price"
												name="price" value="<%out.print(prodPrice);%>">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="videoLink">Video
											Link</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="videoLink"
												name="videoLink" value="<%out.print(vidLink);%>">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="inventory">Amount
											in Stock</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="inventory"
												name="inventory" value="<%out.print(stock);%>">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="image">Image
											Link</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="image"
												name="image" value="<%out.print(picLink);%>">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="tag">Tag</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="tag" name="tag"
												value="<%out.print(prodTag);%>">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-success" value="send">Save
											Product</button>
									</div>
								</div>



							</form>

							<%
								String name = request.getParameter("name");
								String description = request.getParameter("description");
								String price = request.getParameter("price");
								String videoLink = request.getParameter("videoLink");
								String inventory = request.getParameter("inventory");
								String image = request.getParameter("image");
								String tag = request.getParameter("tag");

								if (name == null)
									name = "nothing";
								if (tag == null)
									tag = "nothing";
								if (price == null)
									price = "99.99";
								if (inventory == null)
									inventory = "99";
								if (image == null)
									image = "no pic link";
								if (videoLink == null)
									videoLink = "no vid link";
								if (description == null)
									description = "no description";

								/* //making sure everything we got it all from the form
								out.println(String.format("<p> %s is in  </p>", tag));
								out.println(String.format("<p> %s is in  </p>", price));
								out.println(String.format("<p> %s is in  </p>", inventory));
								out.println(String.format("<p> %s is in  </p>", pLink));
								out.println(String.format("<p> %s is in  </p>", vLink));
								out.println(String.format("<p> %s is in  </p>", desc));
								*/
								try {
									getConnection();

									String sqlUpdate = String.format(
											"update Product set name='%s',description='%s',price=%s,videoLink='%s',inventory=%s,image='%s',tag='%s' where pID=%s ",
											name, description, price, videoLink, inventory, image, tag, prodID);
									PreparedStatement ps = con.prepareStatement(sqlUpdate);
									ps.executeUpdate();
									ps.close();
								} catch (SQLException ex) {
									out.println(ex);
								}
							%>








						</div>

						<!-- ADD warehouse TAB -->
						<div id="prod3" class="tab-pane fade">
							<h3>Add Warehouse</h3>

							<!-- ADD warehouse FORM -->
							<form class="form-horizontal" action="addWarehouse.jsp"
								onsubmit="setTimeout(function () { window.location.reload(); }, 10)">

								<h4>General Information</h4>
								<div class="well">
									<div class="form-group">
										<label class="control-label col-sm-2" for="name">Supplier
											Name</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="name" name="name">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="phoneNum">Supplier
											Phone Number</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="phoneNum"
												name="phoneNum">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="descr">Supplier
											Description</label>
										<div class="col-sm-10">
											<textarea class="form-control" rows="3" id="descr"
												name="descr"></textarea>
										</div>
									</div>
								</div>

								<h4>Location information</h4>
								<div class="well">
									<div class="form-group">
										<label class="control-label col-sm-2" for="address">Address</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="address"
												name="address">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="provinceOrState">Province/State</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="provinceOrState"
												name="provinceOrState">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="country">Country</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="country"
												name="country">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="postalCode">Postal
											Code</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="postalCode"
												name="postalCode">
										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-success">Save
											Warehouse</button>
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
										<label class="control-label col-sm-2" for="suID">Supplier
											Id</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="suID" name="suID">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-success">Retrieve
												Warehouse info</button>
										</div>
									</div>
								</div>
							</form>

							<%
								
																//get values for the given pID
																String supID = request.getParameter("suID");
																String supName = "";
																String supPhoneNum = "";
																String supDescr = "";
																String supAddr = "";
																String supProv = "";
																String supCountry = "";
																String supPostalCode = "";
																String custID = "";
								
																if (supID.equals("") || supID == null)
																	out.print("sup ID is broken");
								
																String sqlSupInfo = "select * from Supplier,CustAddress where Supplier.suID=CustAddress.suID AND Supplier.suID='"
																		+ supID + "'";
																try {
																	getConnection();
																	PreparedStatement ps = con.prepareStatement(sqlSupInfo);
																	ResultSet rs = ps.executeQuery();
																	rs.next();
								
																	supName = rs.getString("name");
																	supPhoneNum = rs.getString("phoneNum");
																	supDescr = rs.getString("descr");
																	supAddr = rs.getString("address");
																	supProv = rs.getString("provinceOrState");
																	supCountry = rs.getString("country");
																	supPostalCode = rs.getString("postalCode");
																	custID = "" + -1;
																	//Test see if all values are not null
																	/*
																	out.print(String.format("<p>%s %s %s %s %s %s %s %s</p>", supName, supPhoneNum, supDescr, supAddr, supProv,
																			supCountry, supPostalCode, custID));
								*/
																} catch (SQLException ex) {
																	out.print(ex);
																}
															
							%>

	
							<form class="form-horizontal" action="updateWarehouse.jsp">

								<h4>General Information</h4>
								<div class="well">
								<div class="form-group">
										<label class="control-label col-sm-2" for="supID">Supplier
											ID</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="supID"
												name="supID" value=<%out.print(supID); %>>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="name">Supplier
											Name</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="name" name="name" value=<%out.print(supName); %>>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="phoneNum">Supplier
											Phone Number</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="phoneNum"
												name="phoneNum" value=<%out.print(supPhoneNum); %>>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="descr">Supplier
											Description</label>
										<div class="col-sm-10">
											<textarea class="form-control" rows="3" id="descr"
												name="descr">value=<%out.print(supDescr); %></textarea>
										</div>
									</div>
								</div>

								<h4>Location information</h4>
								<div class="well">
									<div class="form-group">
										<label class="control-label col-sm-2" for="address">Address</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="address"
												name="address" value=<%out.print(supAddr); %>>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="provinceOrState">Province/State</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="provinceOrState"
												name="provinceOrState" value=<%out.print(supProv); %>>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="country">Country</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="country"
												name="country" value=<%out.print(supCountry); %>>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="postalCode">Postal
											Code</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="postalCode"
												name="postalCode" value=<%out.print(supPostalCode); %>>
										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-success">Save
											Warehouse</button>
									</div>
								</div>
							</form>

						</div>

						<!-- close menu tabs -->
					</div>
				</div>





			</div>
		</div>
	</div>

</body>
</html>
