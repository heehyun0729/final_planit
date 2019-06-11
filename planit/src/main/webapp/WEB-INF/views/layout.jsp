<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reservation/rsvnList.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reservation/rsvnDetail.css'/>">
<script type="text/javascript" src = "<c:url value = '/resources/js/jquery-3.4.0.min.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/jquery-ui.min.js'/>"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/map.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/detail.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/jquery.qtip.min.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/moment.min.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/fullcalendar.min.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/plan/locale-all.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/reservation/list.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/reservation/detail.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/reservation/pay.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/accom/PlacePicker.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/accom/insert.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/ad/ad.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/qna/insert.js'/>"></script>
<script type="text/javascript" src = "<c:url value = '/resources/js/qna/update.js'/>"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
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