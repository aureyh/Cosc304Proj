<%@ page import="java.sql.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp"%>

<%
								String pname = request.getParameter("pname");
								String tag = request.getParameter("tag");
								String price = request.getParameter("price");
								String inventory = request.getParameter("inventory");
								String pLink = request.getParameter("pLink");
								String vLink = request.getParameter("vLink");
								String desc = request.getParameter("desc");

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
									Statement ps = con.createStatement();
									PreparedStatement autokey = con.prepareStatement("select Max(pID) from Product");
									ResultSet rs = autokey.executeQuery();
									rs.next();

									String pID = "" + (rs.getInt(1)+1);
									if (pID.equals(""))
										pID = "" + 99;
									autokey.close();

									String sql = String.format("insert into Product values(%s,'%s','%s', %s, '%s',%s,'%s','%s');", pID, pname,
											desc, price, vLink, inventory, pLink, tag);

									ps.executeUpdate(sql);
									ps.close();
								} catch (SQLException ex) {
									out.println(ex);
								}
								
								
							%>
							
							<jsp:forward page="Admin.jsp" />