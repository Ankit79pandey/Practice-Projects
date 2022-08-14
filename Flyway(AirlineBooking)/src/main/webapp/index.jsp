
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
 


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

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
form {
width:60%;
margin-left:38%;
margin-top:2%;
}


.button {
background-color: lightgreen;
color: black;
padding-left: 15px;
margin: 8px 0;
border: none;
font-size:18px;
font-weight:bold;
cursor: pointer;
width: 61%%;
}

.button:hover {
opacity: 0.8;
}


</style>
</head>
<body bgcolor=black>
 
     
<%
String StartedAt=request.getParameter("Start");
String EndAt=request.getParameter("End");
String Date=request.getParameter("Date");
String Number=request.getParameter("people");

session.setAttribute("Start",StartedAt);
session.setAttribute("End",EndAt);
session.setAttribute("Date",Date);
session.setAttribute("people",Number);

%>



<div style="color:white" class="row">




<br><br>

<h1 style="text-align:center">PERSONAL DETAILS :</h1><br><br>
<form action="PersonalDetails.jsp">
<label>Name: <br></label> <input type="text" name="name"> <br><br>
<label>Age : <br></label><input type="text" name="Age"> <br><br>
<label>Address :<br></label> <input type="text" name="Address"><br><br>
<label>Mobile No. :<br></label> <input type="text" name="Mobile"><br><br>
<label>Passport No. :<br></label> <input type="text" name="Passport"><br><br>
<input name="StartingAt" type="hidden" value=StartedAt/>
<input name="EndingAt" type="hidden" value=EndAt/>
<input name="Date" type="hidden" value=Date/>
<input class="button" type="submit" name="Show Flights">
</form>
</div>

</body>
</html>