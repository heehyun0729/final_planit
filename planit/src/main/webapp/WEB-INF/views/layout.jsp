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
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plan/planner.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plan/planList.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plan/planDetail.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plan/jquery.qtip.css'/>">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/plan/fullcalendar.css'/>">
<script type="text/javascript" src = "<c:url value = '/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/map.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/detail.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/jquery.qtip.min.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/moment.min.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/fullcalendar.min.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/locale-all.js'/>"></script>

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