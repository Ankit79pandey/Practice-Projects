<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
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
</head>
<body>

<%

try{
String Name=request.getParameter("name");
String Age=request.getParameter("Age");
String Address=request.getParameter("Address");
String MobileNumber=request.getParameter("Mobile");
String PassportNo=request.getParameter("Passport");

session.setAttribute("Passenger", Name);
session.setAttribute("Mobile", MobileNumber);
String Start=request.getParameter("StartingAt");


String url="jdbc:mysql://localhost:3306/FlightTicketBooking" ; 
String user="root"; 
String password="Ankit@1998";
String query="insert into Personal_details(Name,Age,Address,MobileNumber,PassportNo) values('" +  Name
+ "','" + Age + "','" + Address + "','" + MobileNumber +"','"+PassportNo+ "')";

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection(url,user,password);


PreparedStatement pstatement = conn.prepareStatement(query);
 
int updateQuery = pstatement.executeUpdate();

if(updateQuery!=0){

response.sendRedirect("Tickets.jsp");}

 else{
response.sendRedirect("error.jsp");
}}
catch(Exception e){
	System.out.println(e.getMessage());
}
%>

</body>
</html>