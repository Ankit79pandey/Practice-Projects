<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="lightgreen">
<div style="margin-top:10%;margin-left:35%;color:gray">
<h1 >Products Details Page</h1><br>
<c:set var="product" value="${obj }"></c:set>
<h2>Name: ${product.name } </h2><br>
<h2>Price: ${product.price }</h2> <br>
<h2>Date: ${product.dateAdded }</h2> <br>
</div>
</body>
</html>