<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.container{
color:#fff;


margin-top:5%

}
label{
justify-content:flex-start;
text-align:left;
font-size:1rem;
text-transform:uppercase;
}

form{
height:500px;
width:30%;
margin:auto;
padding:5px
}
input{
font-size:18px;
width:350px;
height:35px;
border-top:none;
border-left:none;
border-right:none;
border-bottom:2px solid #333;
background:transparent;
padding-left:10px;
color:#fff 
}
input:focus{
font-size:18px;
width:350px;
height:35px;
border-top:none;
border-left:none;
border-right:none;
border-bottom:3px solid #333;
background:transparent;
padding-left:10px;
color:#fff 
}
button{
margin-top:2%;
margin-left:15%;
height:2.5rem;
width:200px;
font-weight:bold	;
font-size:18px

}



</style>
</head>

<body bgcolor=black>
<%
Class.forName("com.mysql.cj.jdbc.Driver"); 
String url="jdbc:mysql://localhost:3306/FlightTicketBooking";
String Username="root";
String Password="Ankit@1998";
String query="Select * from security ";


 Connection con = DriverManager.getConnection(url,Username,Password); 
 
 Statement st=con.createStatement();

 ResultSet rs=st.executeQuery(query);
 rs.next();	


 
session.setAttribute("dbPass", rs.getString(3));




%>
<div>

<form action="ConfirmChangePassword.jsp">
<div class="container">
		<h1 >CHANGE PASSWORD..</h1><br>
		<br>
		<br>
	<label style="text-align: left !important;" for="username"><b>Email :</b></label><br><br>
	<input type="text" placeholder="Please enter your email" name="emailId" id = "emailId" required>
<br><br>
	<label for="password"><b> Old Password :</b></label><br><br>
	<input type="text" placeholder="Please enter Password" name="oldpassword" id="password" required>
		<br><br>
		
		<label for="password"><b>New Password :</b></label><br><br>
	<input type="text" placeholder="Please enter Password" name="newpassword" id="password" required>
		<br><br>
		
		<label for="password"><b>Confirm Password :</b></label><br><br>
	<input type="text" placeholder="Please enter Password" name="confirmpassword" id="password" required>
		<br><br>
		
		
	<button type="submit">Change password</button>
	
</div>



</form>




</div>









</body>
</html>