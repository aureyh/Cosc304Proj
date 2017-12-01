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
								
												String sqlProdInfo = "select * from Product where pID='"+prodID+"'";
												try{
													getConnection();
													PreparedStatement ps = con.prepareStatement(sqlProdInfo);
													ResultSet rs = ps.executeQuery();
													rs.next();
													
													prodName = rs.getString("name");
													prodTag = rs.getString("tag");
													prodPrice = ""+rs.getBigDecimal("price");
													stock = ""+rs.getInt("inventory");
													picLink = rs.getString("image");
													vidLink = rs.getString("videoLink");
													descrip = rs.getString("description");
													//Test see if all values are not null
												//	out.print(String.format("%s %s %s %s %s %s %s",prodName,prodTag,prodPrice,stock,picLink,vidLink,descrip));
													
												}catch(SQLException ex){
													out.print(ex);
												}
												
							%>


							<!-- UPDATE Product FORM -->
							<form class="form-horizontal">
								<div class="well">
									<div class="form-group">
										<label class="control-label col-sm-2" for="pname" >Product
											Name</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pname"
												name="pname" value="<%out.print(prodName); %>">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="tag">Tag</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="tag" name="tag" value="<%out.print(prodTag); %>">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="price">Price</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="price"
												name="price" value="<%out.print(prodPrice); %>">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="inventory">Amount
											in Stock</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="inventory"
												name="inventory" value="<%out.print(stock); %>">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="pLink">Image
											Link</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="pLink"
												name="pLink" value="<%out.print(picLink); %>">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="vLink">Video
											Link</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="vLink"
												name="vLink" value="<%out.print(vidLink); %>">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-2" for="description">Product
											Description</label>
										<div class="col-sm-10">
											<textarea class="form-control" rows="3" id="description" name="description"><%out.print(descrip); %></textarea>
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
								String pname = request.getParameter("pname");
								String tag = request.getParameter("tag");
								String price = request.getParameter("price");
								String inventory = request.getParameter("inventory");
								String pLink = request.getParameter("pLink");
								String vLink = request.getParameter("vLink");
								String desc = request.getParameter("description");

								if (pname == null)
									pname = "nothing";
								if (tag == null)
									pname = "nothing";
								if (price == null)
									price = "99.99";
								if (inventory == null)
									inventory = "99";
								if (pLink == null)
									pLink = "no pic link";
								if (vLink == null)
									vLink = "no vid link";
								if (desc == null)
									desc = "no description";

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
									


									String sqlUpdate = String.format("update Product set pID=%s,pname='%s',description='%s',price=%s,videoLink='%s',inventory=%s,image='%s',tag='%s' where pID=%s ",
											pname, desc, price, vLink, inventory, pLink, tag,prodID);
									PreparedStatement ps = con.prepareStatement(sqlUpdate);
									ps.executeUpdate();
									ps.close();
								} catch (SQLException ex) {
									out.println(ex);
								}
							%>



</div>