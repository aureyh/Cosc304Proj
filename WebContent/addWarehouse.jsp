<%@ page import="java.sql.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp"%>

<%
								
								String name = request.getParameter("name");
								String phoneNum = request.getParameter("phoneNum");
								String descr = request.getParameter("descr");
								String address = request.getParameter("address");
								String provinceOrState = request.getParameter("provinceOrState");
								String country = request.getParameter("country");
								String postalCode = request.getParameter("postalCode");
								String cID = request.getParameter("cID");
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
									postalCode = "no zip";
								if (cID == null)
									cID = "999";

								
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
									
									PreparedStatement autokey = con.prepareStatement("select Max(suID) from Supplier");
									ResultSet rs = autokey.executeQuery(); //fake auto key but works the same
									rs.next();

									String suID = "" + (rs.getInt(1)+1);
									if (suID.equals(""))
										suID = "" + 99;
									autokey.close();

									String sqlSup = String.format("insert into Product values(%s,'%s','%s', '%s');",suID,name,phoneNum,descr);

									String sqlAddr = String.format("insert into CustAddress values('%s','%s','%s','%s',%s,%s);",address,provinceOrState,country,postalCode,cID,suID);
									
									ps.executeUpdate(sqlSup);
									ps.executeUpdate(sqlAddr);
									
									ps.close();
								} catch (SQLException ex) {
									out.println(ex);
								}
								
								
							%>
							
							<jsp:forward page="Admin.jsp" />