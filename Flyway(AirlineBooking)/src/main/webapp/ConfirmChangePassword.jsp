<%@page import="java.sql.ResultSetMetaData"%>

<%@page import="java.sql.PreparedStatement"%>
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
String EmailId=request.getParameter("emailId");
String newpassword=request.getParameter("newpassword");
String confirmpassword=request.getParameter("confirmpassword");
String oldpassword=request.getParameter("oldpassword");

String dbpass=(String)session.getAttribute("dbPass");


System.out.println(oldpassword);


System.out.println(dbpass);

Class.forName("com.mysql.cj.jdbc.Driver"); 
String url="jdbc:mysql://localhost:3306/FlightTicketBooking";
String Username="root";
String Password="Ankit@1998";



 Connection con = DriverManager.getConnection(url,Username,Password); 
 PreparedStatement st = con.prepareStatement(" Update security set password=? where password=?");
 
 st.setString(1, confirmpassword);
 st.setString(2,oldpassword);


try{
	
if(oldpassword.equals((String)session.getAttribute("dbPass"))){
	
	if(newpassword.equals(request.getParameter("confirmpassword"))){
	
		int updateQuery = st.executeUpdate();
		if(updateQuery!=0){

			response.sendRedirect("PasswordChanged.jsp");}

			 else{
			response.sendRedirect("error.jsp");
			}

	 
	}
	else{
		RequestDispatcher rd=request.getRequestDispatcher("Changepassword.jsp");
		rd.include(request, response);
		out.println("<center><span style='color:red;margin-top:50px;font-weight:bolder'>New password and confirm password doesnot match !!</span></center>");

	}
}
else{
	RequestDispatcher rd=request.getRequestDispatcher("Changepassword.jsp");
	rd.include(request, response);
	out.println("<center><span style='color:red;margin-top:50px;font-weight:bolder'>old password incorrect !!</span></center>");

	
}}
catch(Exception e){
	System.out.println(e.getMessage());
}

%>
</body>
</html>