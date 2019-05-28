<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="UTF-8">
<title>Plan it!</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plan/map.css'/>">
<script type="text/javascript" src = "<c:url value = '/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/map.js'/>"></script>

</head>
<body>
<div id = "wrap">
	<div id = "header">
		<tiles:insertAttribute name = "header"/>
	</div>
	<div id = "content">
		<tiles:insertAttribute name = "content"/>
	</div>
	<div id = "footer">
		<tiles:insertAttribute name = "footer"/>
	</div>
</div>



</body>
</html>