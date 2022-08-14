<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body bgcolor=black>

<% 
String ss=request.getParameter("id");

session	.setAttribute("Id", ss);
String NumberOfPeople=(String)session.getAttribute("people");


	 try{

    Class.forName("com.mysql.cj.jdbc.Driver"); 
   String url="jdbc:mysql://localhost:3306/FlightTicketBooking";
   String Username="root";
   String Password="Ankit@1998";

    Connection con = DriverManager.getConnection(url,Username,Password); 
    PreparedStatement st = con.prepareStatement("Select fare from tickets where id=?");
    
    st.setString(1, ss);
    ResultSet rs = st.executeQuery();
    rs.next();
    
    
    ResultSetMetaData rsmd = rs.getMetaData(); 
    int columnsNumber = rsmd.getColumnCount();
 
    
  
    int paisa=Integer.parseInt(rs.getString(1));
    int people=Integer.parseInt(NumberOfPeople);
    int total=0;
  for(int i=1;i<=people;i++){
	  total+=paisa;
  }
  session.setAttribute("total",total);

%>
<div class="container">
      <div class="main-content">
        <p class="text">AirPlane Ticket Booking</p>
      </div>
  
      <div class="centre-content">
        <h1 class="price"><%=total%><span>/-</span></h1>
        <p class="course">
           Details :	
        </p>
      </div>
  
      <div class="last-content">
      	
      
  
    
        
      </div>
  <form action="Confirmation.jsp">
      <div class="card-details">
        <p>Pay using Credit or Debit card</p>
  
        <div class="card-number">
          <label> Card Number </label>
          <input
            type="text"
            class="card-number-field"
            placeholder="###-###-###"/>
        </div>
        <br />
        <div class="date-number">
          <label> Expiry Date </label>
          <input type="text" class="date-number-field" 
                 placeholder="DD-MM-YY" />
        </div>
  
        <div class="cvv-number">
          <label> CVV number </label>
          <input type="text" class="cvv-number-field" 
                 placeholder="xxx" />
        </div>
        <div class="nameholder-number">
          <label> Card Holder name </label>
          <input type="hidden" name="id" value=<%=ss%>  />
          <input
            type="text"
            class="card-name-field"
            placeholder="Enter your Name"/>
        </div>
        <button type="submit" 
                class="submit-now-btn"  >
          submit
        </button>
        
      </div>
      </form>
    </div>
    <% }
	 catch(Exception e){
		 System.out.println(e.getMessage());
	 } %>

</body>
</html>