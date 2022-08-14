<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor=black>
<%
String Name=(String)session.getAttribute("Passenger");


String date =(String)session.getAttribute("Date");
String to = (String)session.getAttribute("End");


String from = (String)session.getAttribute("Start");
String NumberOfPeople=(String)session.getAttribute("people");
int Amount=(int)session.getAttribute("total");
String ModeOfPayment="Online Transaction";




%>
<h1 style="font-family: cursive;font-size:36px;Text-align:center;color:white">AIRPLANE TICKET BOOKING</h1>
<div style="text-align:center;color:white">
<h1 style="color:red">**Confirmation page**</h1>
<h2>Name : <%=Name %></h2>
<h2>From : <%=from %></h2>
<h2>To : <%=to %></h2>
<h2>Number of passengers : <%=NumberOfPeople %></h2>
<h2>Amount payable : <%=Amount %></h2>
<h2>Mode of Payment : Online Transaction </h2>
<h2 >Transaction Details : Transaction waiting.. </h2>
<form action="GenerateTicket.jsp">
<h2>Please enter 1 to confirm :<input type="text"></h2>
<button style="background-color:green;color:white;font-size:1rem;font-weight:bold;border-radius:10px;height:2rem;width:200px;cursor:pointer" type="submit">Confirm</button>
</form>
</div>
</body>
</html>