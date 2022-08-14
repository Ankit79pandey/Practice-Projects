<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Available Flights</title>
</head>
<body bgcolor=gray>
<%

	String date =(String)session.getAttribute("Date");
    String to = (String)session.getAttribute("End");
    

    String from = (String)session.getAttribute("Start");
    

    try {

 

        Class.forName("com.mysql.cj.jdbc.Driver"); 
       String url="jdbc:mysql://localhost:3306/FlightTicketBooking";
       String Username="root";
       String Password="Ankit@1998";

        Connection con = DriverManager.getConnection(url,Username,Password); 
        
       

        PreparedStatement st = con.prepareStatement("select id,StartedAt,EndAt,Date,fare,Airlines from tickets where Date=? And EndAt=? And StartedAt=? ");
        st.setString(1, date);
        st.setString(2, to);
        st.setString(3, from);
       
   

        ResultSet rs = st.executeQuery();
       
        ResultSetMetaData rsmd = rs.getMetaData(); 
        int columnsNumber = rsmd.getColumnCount();
     
        out.print("<center ><h1 >**All Available Flights**</h1></center>");
       
        
        while (rs.next()) {
        	
        	out.print("<table bgcolor=cadetblue  width=70%  align=center border=1 cellspacing=0 cellpadding=10>");
        	
        	out.print("<tr>");
        	out.print("<th>"+rsmd.getColumnName(2)+"</th>");
        	out.print("<th>"+rsmd.getColumnName(3)+"</th>");
        	out.print("<th>"+rsmd.getColumnName(4)+"</th>");
        	out.print("<th>"+rsmd.getColumnName(5)+"</th>");
        	out.print("<th>Airlines_Name</th>");
        	out.print("<th>Book</th>");
        	
        	out.print("</tr>");
        	out.print("<br>");
        	out.print("<tr>");
        	
        	
        	
        	
        	out.print("<td>"+rs.getString(2)+"</td>");
        	out.print("<td>"+rs.getString(3)+"</td>");
        	out.print("<td>"+rs.getString(4)+"</td>");
        	out.print("<td>"+rs.getString(5)+"</td>");
        	out.print("<td>"+rs.getString(6)+"</td>");
        	
        	out.print("<td ><a href=\"ticketbooking.jsp?id="+rs.getString(1)+"	\">Book Now</a></td>");
        	out.print("</tr>");
        	out.print("<table>");
        }
   
   

%>



<% }
    catch (Exception ex) {

    	  
    	   System.out.println(ex.getMessage());

    	    } %>
</body>
</html>