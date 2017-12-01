<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="jdbc.jsp"%>
<%@ page import = "java.sql.*"%>

<%
//get UUID for email verification
final String uuid = UUID.randomUUID().toString().replace("-", "");

//get user email from account creation
String sentTo = request.getParameter("resetemail");

//Get database connection
getConnection();
con = DriverManager.getConnection(url, uid, pw);

//get customer row by email
String sql = "Select * from Customer where userEmail =?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, sentTo);	
ResultSet rst = pstmt.executeQuery();

//set uuid in db
String sql2 = "UPDATE Customer SET Uuid =? WHERE userEmail =?";
PreparedStatement pstmt2 = con.prepareStatement(sql2);
pstmt2.setString(1, uuid);
pstmt2.setString(2, sentTo);
pstmt2.executeUpdate();



//sender emaail
final String sentFrom = "infomiracleshelp@gmail.com";
final String sentPw = "infomiracles";
String d_port = "465";
//email subject
String sub = "Password Reset Request for infomiracles";
//email contents
String msg = "http://localhost:8080/304_lab7_bonus/resetPassword.jsp?";
msg += uuid;
msg += "\n";
msg += "Please click the link above to reset your password.";
		
String host = "localhost";

// Get system properties object
Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port", "465");    
          props.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465");

//Setup mail server
props.setProperty("smtp.gmail.com", host);

//Get the Session object.
Session mailSession = Session.getInstance(props,    
           new javax.mail.Authenticator() {    
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(sentFrom, sentPw);  
           }    
          }
); 

try {
    MimeMessage message = new MimeMessage(mailSession);    
    message.addRecipient(Message.RecipientType.TO,new InternetAddress(sentTo));    
    message.setSubject(sub);    
    message.setText(msg);    
    //send message  
    Transport.send(message);    
    System.out.println("message sent successfully");    
   } catch (MessagingException e) {throw new RuntimeException(e);}

      

  


//SOURCES
//https://stackoverflow.com/questions/7872650/how-to-send-email-using-gmail-smtp-server-from-jsp-page

%>

