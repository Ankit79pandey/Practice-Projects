<%@page import="java.sql.ResultSet"%>
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
</head>
<body>
<%
String email=request.getParameter("emailId");
String password=request.getParameter("password");

Class.forName("com.mysql.cj.jdbc.Driver"); 
String url="jdbc:mysql://localhost:3306/FlightTicketBooking";
String Username="root";
String Password="Ankit@1998";
String query="Select * from security ";


 Connection con = DriverManager.getConnection(url,Username,Password); 
 
 Statement st=con.createStatement();

 ResultSet rs=st.executeQuery(query);
 rs.next();	

 System.out.println(rs.getString(2)); 
 
 
session.setAttribute("password", password);



try{
	boolean isLoggedin=false;
if(email.equalsIgnoreCase(rs.getString(2))){
	if(password.equalsIgnoreCase(rs.getString(3))){
		isLoggedin=true;
		response.sendRedirect("index.html");
	}
	else{
		RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
		rd.include(request, response);
		out.println("<center><span style='color:red;margin-top:50px;font-weight:bolder'>Invalid password !!</span></center>");
	}
	
	
	
}
else{
	RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
	rd.include(request, response);
	out.println("<center><span style='color:red'>Invalid Email !!</span></center>");

	
} }

catch(Exception e){
	 System.out.println(e.getMessage());
}

%>
</body>
</html>