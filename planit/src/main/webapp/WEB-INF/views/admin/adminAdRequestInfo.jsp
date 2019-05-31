<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<style type="text/css">
	*{
		padding: 0px;
		margin: 0px;
	}
	.box{
		position: absolute;
		background: #fff;
		left: 1300px;
		top: 300px;
		width: 200px;
		height: 50px;
		box-shadow: 0 3px 6px 0px rgba(0,0,0,0.16), 3px 1px 6px 0px rgba(0,0,0,0.23);
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.back{
		background: url("<c:url value='/resources/adminImages/graphs.jpg'/>") no-repeat center center;
		width: 100%;
		height: 300px;
		border: 2px solid black;
	}
</style>
<link rel="stylesheet" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
</head>
<body>
<div>
<header>
</header>
<section>
	<article class="back">
		<div class="box"><span><a href="<c:url value='/adminAdRequestForm'/>">광고신청하기</a></span></div>
	</article>
</section>
<footer>
	
</footer>
</div>
</body>