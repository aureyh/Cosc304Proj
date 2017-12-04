<%@ page import="java.sql.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp"%>

<%
								String suID = request.getParameter("suID");
								String name = request.getParameter("name");
								String phoneNum = request.getParameter("phoneNum");
								String descr = request.getParameter("descr");
								String address = request.getParameter("address");
								String provinceOrState = request.getParameter("provinceOrState");
								String country = request.getParameter("country");
								String postalCode = request.getParameter("postalCode");
								String cID = null;
								//Then suID again for the address


								if (name == null)
									name = "no name";
								if (phoneNum == null)
									phoneNum = "555-555-555";
								if (descr == null)
									descr = "no description";
								if (address == null)
									address = "no address";
								if (provinceOrState == null)
									provinceOrState = "no prov or state";
								if (country == null)
									country = "no country";
								if (postalCode == null)
									postalCode = "no postalCode";
								if (cID == null)
									cID = "-1";//Special cID for admins

								
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
									
									String sqlSup = String.format("update Supplier set name='%s',phoneNum='%s',descr='%s' where suID=%s",name,phoneNum,descr,suID);
									String sqlAddr = String.format("update CustAddress set address='%s',proviceOrState='%s',country='%s',postalCode='%s' where Supplier.suID=%s",address,provinceOrState,country,postalCode,suID);
									
											
									PreparedStatement ps = con.prepareStatement(sqlSup);
									PreparedStatement ps2 = con.prepareStatement(sqlAddr);		
											ps.executeUpdate();
											ps2.executeUpdate();
											
											
									
									ps.close();
								} catch (SQLException ex) {
									out.println(ex);
								}
								
								
							%>
							<!--   <jsp:forward page="Admin.jsp" />  -->