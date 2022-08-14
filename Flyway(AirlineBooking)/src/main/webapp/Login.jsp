<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Application</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
body {font-family: Arial, Helvetica, sans-serif;
background-color:black

}
form {
width:60%;
margin-left:26%;
margin-top:2%;
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

button {
background-color: green;
color: white;
padding: 14px 20px;
margin: 8px 0;
border: none;
font-size:18px;

cursor: pointer;
width: 76%;
}

button:hover {
opacity: 0.8;
}


.container {

margin-left:20%;
margin-top:10%;
height:40%;
width:50%;
}
label{
justify-content:flex-start;
text-align:left;
font-size:1rem;
text-transform:uppercase;
color:#fff;
}
form{
}

</style>
</head>
<body ><h1 style="color:#fff;text-align:center;margin-top:5%;font-family:sans-serif;font-size:36px">AirPlane Ticket Booking</h1>

	<form action="LoginLogout.jsp"  >
	
		<div class="container">
		
	<label for="username"><b>Email</b></label><br><br>
	<input type="text" placeholder="Please enter your email" name="emailId" id = "emailId" required><br><br>

	<label for="password"><b>Password</b></label><br><br>
	<input type="password" placeholder="Please enter Password" name="password" id="password" required><br><br>
		
	<button type="submit">Login</button>
	
</div><br><br>
<span style="color:#fff;margin-left:20%">Admin : <a href="Changepassword.jsp" style="color: gray">Change Password</a></span>


	</form>
</body>
</html>
