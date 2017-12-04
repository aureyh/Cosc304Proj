<%@ page import="java.sql.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp"%>

<%
	String pID = request.getParameter("pID");
	String pname = request.getParameter("name");
	String desc = request.getParameter("description");
	String price = request.getParameter("price");
	String vLink = request.getParameter("videoLink");
	String inventory = request.getParameter("inventory");
	String pLink = request.getParameter("image");

	String tag = request.getParameter("tag");

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
		

		String sql = String.format("update Product set name='%s',description='%s',price= %s,videoLink= '%s',inventory=%s,image='%s',tag='%s' where pID=%s;",
				pname, desc, price, vLink, inventory, pLink, tag,pID);
				PreparedStatement ps = con.prepareStatement(sql);
				
				ps.executeUpdate();
				
				
		
		ps.close();
	} catch (SQLException ex) {
		out.println(ex);
	}
%>

