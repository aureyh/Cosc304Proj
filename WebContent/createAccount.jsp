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
</div></nav>
		
	<form method="post" action="login.jsp" id=loginForm>
		<div class="loginContainer">
			<h3>Sign in to your account</h3>
			 <label><b>Email</b></label>
 	 	     <input type="text" placeholder="Enter Email" name="loginemail" id="loginemail" required>	
 		     <label><b>Password</b></label>
 		     <input type="password" placeholder="Enter Password" name="loginpass" id="loginpass" required>    
 		     <button id="loginButton">Sign In</button>
 		     <a href="forgotPassword.jsp">Forgot password?</a>
		</div>
	</form>
	
	<form method="post" id="signupForm" action="register.jsp">
		<div class="signupContainer">
			<h3>Enter details below to sign up!</h3>
			<h4>Make sure to double check your information before submitting.</h4>
			<label><b>Email</b></label>
 	     	<input type="email" placeholder="Enter Email" name="email" id="email" required>
 	     	
 	     	<label><b>Confirm Email</b></label>
 	     	<input type="email" placeholder="Confirm Email" name="confirmEmail" id="confirmEmail" required>
		
 	    	<label><b>Password</b></label>
 	    	<input type="password" placeholder="Enter Password" name="pass" id="pass"required>
 	    	
 	    	<label><b>Confirm Password</b></label>
 	    	<input type="password" placeholder="Confirm Password" name="confirmPass" id="confirmPass"required>
 	     
 	 	    <label><b>First Name</b></label>
 	 	    <input type="text" placeholder="First Name" name="fName" id="fName"required>
	
 		    <label><b>Last Name</b></label>
 	    	<input type="text" placeholder="Last Name" name="lName" id="lName"required>
 	     
 	     	<label><b>Phone Number</b></label>
 	     	<input type="tel" placeholder="ex: 555 555-5555" name="phoneNumber" id="phoneNumber"required>
	
	 	    <label><b>Address</b></label>
 		    <input type="text" placeholder="ex: 12-1234 99 St" name="address" id="address"required>
 	     
 	    	<label><b>City</b></label>
 	     	<input type="text" placeholder="City" name="city" id="city"required>
	
 	     	<label><b>Province</b></label>
            <select name="province">
                <option value="ab">Alberta</option>
                <option value="bc">British Colmbia</option>
                <option value="nb">New Brunswick</option>
                <option value="nl">Newfoundland and Labrador</option>
                <option value="ns">Nova Scotia</option>
                <option value="nwt">Northwest Territories</option>
                <option value="nu">Nunavut</option>
                <option value="on">Ontario</option>
                <option value="pei">Prince Edward Island</option>
                <option value="qc">Quebec</option>
                <option value="sk">Saskatchewan</option>
                <option value="yt">Yukon</option>
            </select>
 		     
		 <label><b>Postal Code</b></label>
 	     <input type="text" placeholder="ex: A1A 1A1" name="postalCode" required>
 	     
 	     <button id="signUp">Sign Up!</button>
	</div>
</form>

<p id="errorBox"></p>



</body>
<style>
</style>
<script type="text/javascript">

let form = document.getElementById('signupForm');
let form2 = document.getElementById('loginForm');

form.addEventListener('submit', function(e) {
	  e.preventDefault()
	  form2.submit();
	  //console.log(loginpass + " " + loginemail)
	  if(isValid())
		  form.submit();
})

function isValid(){
	var email = document.getElementById("email");
	var confirmEmail = document.getElementById("confirmEmail");
	var pass = document.getElementById("pass");
	var confirmPass = document.getElementById("confirmPass");
	var errorBox =  document.getElementById("errorBox");
	var noErrors = true;
	
	console.log(email.value);
	console.log(confirmEmail.value);
	errorBox.innerHTML = " ";
	
	if(email.value !== confirmEmail.value){
		errorBox.innerHTML += "Emails don't match"
		noErrors = false;
	}

	if(pass.value !== confirmPass.value){
		errorBox.innerHTML += "Passwords don't match";
		noErrors = false;
	}	
	
	return noErrors;
} 




</script>


</html>







<!-- sources
http://www.javaknowledge.info/login-and-registration-example-in-jsp-with-session/
https://stackoverflow.com/questions/46155/how-to-validate-email-address-in-javascript
https://stackoverflow.com/questions/16699007/regular-expression-to-match-standard-10-digit-phone-number
https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
https://howtodoinjava.com/regex/java-regex-validate-canadian-postal-zip-codes/

-->
