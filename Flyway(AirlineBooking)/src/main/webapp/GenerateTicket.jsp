<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
<link rel="stylesheet" type="text/css" href="ticket.css">
<body>
<%
try{
String passenger=(String)session.getAttribute("Passenger");

String Mobile=(String)session.getAttribute("Mobile");
 
String FlightId=(String)session.getAttribute("Id");


Class.forName("com.mysql.cj.jdbc.Driver"); 
String url="jdbc:mysql://localhost:3306/FlightTicketBooking";
String Username="root";
String Password="Ankit@1998";

 Connection con = DriverManager.getConnection(url,Username,Password); 
 PreparedStatement st = con.prepareStatement("Select StartedAt,EndAt,Airlines,fare,Name,MobileNumber,Date from Tickets as tic join personal_details as det on tic.PID=det.PID where id=?");
 
 st.setString(1, FlightId);
 ResultSet rs = st.executeQuery();
 rs.next();


 
 ResultSetMetaData rsmd = rs.getMetaData(); 
 int columnsNumber = rsmd.getColumnCount();

 

 String StartedAt=rs.getString(1);
 String EndAt=rs.getString(2);
 String Airlines=rs.getString(3);
 String fare=rs.getString(4);
 String Name=rs.getString(5);
 String MobileNumber=rs.getString(6);
 String Date=rs.getString(7);
 
%>
<!-- INSPO:  https://www.behance.net/gallery/69583099/Mobile-Flights-App-Concept -->
<main class="ticket-system">
   <div class="top">
   <h1 class="title">Your ticket is generated successfully !!</h1>

   </div>
   <div style="background-color:cadetblue" class="receipts-wrapper">
      <div class="receipts">
         <div class="receipt" ><span style="font-size:24px;font-weight:bold;">Flight :</span>
         <span style="font-size:20px;font-weight:bolder;font-family:cursive;color:red"> <%=Airlines %></span>
            <div class="route">
               <h2><%=StartedAt %></h2>
               <svg class="plane-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 510 510">
                  <path fill="#3f32e5" d="M497.25 357v-51l-204-127.5V38.25C293.25 17.85 275.4 0 255 0s-38.25 17.85-38.25 38.25V178.5L12.75 306v51l204-63.75V433.5l-51 38.25V510L255 484.5l89.25 25.5v-38.25l-51-38.25V293.25l204 63.75z"/>
               </svg>
               <h2><%=EndAt %></h2>
            </div>
            <div class="details">
               <div class="item">
                  <span>Passenger</span>
                  <h4 style="width:90px"><%=passenger %></h4>
               </div>
               <div class="item">
                  <span style="width:100px">Flight No.</span>
                  <h4>US<%=(int)((Math.random())*10000 ) %></h4>
               </div>
               <div class="item">
                  <span>Departure</span>
                  <h4><%=Date %></h4>
               </div>
             
               <div class="item">
                  <span>Mobile No:</span>
                  <h4><%=Mobile %></h4>
               </div>
                  <div class="item">
                  <span>Luggage</span>
                  <h4>Hand Luggage</h4>
               </div>
               <div class="item">
                  <span>Seat</span>
                  <h4><%=(int)((Math.random())*1000 )%>P</h4>
               </div>
            </div>
         </div>
         <div class="receipt qr-code">
           <img alt="image" style="height:40px;widht:50px" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Flat_tick_icon.svg/1200px-Flat_tick_icon.svg.png">
            <div class="description">
               <h2>Transaction Completed !</h2>
               <p>Ticket Generated !!</p>
            </div>
         </div>
      </div>
   </div>
</main>
<% }
catch(Exception e){
	 System.out.println(e.getMessage());
} %>
</body>
</html>