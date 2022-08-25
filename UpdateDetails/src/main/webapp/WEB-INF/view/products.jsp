<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="aqua" >
<div style="margin-left:35%;margin-top:10%;">
<h1>ECommerce Products </h1><br>

<table style="border:solid black;text-align:center;width:500px">
	<tr style="border:solid black"><th>ID</th><th>NAME</th><th>PRICE</th><th>DATE</th></tr>
	<c:forEach var="p" items="${list }">
	
		<tr style="border:solid black">
			<td>${p.id }</td>
			<td>${p.name }</td>
			<td>${p.price }</td>
			<td>${p.dateAdded }</td>
		
		</tr>
	
	</c:forEach>
	
	

</table>
</div>
</body>
</html>