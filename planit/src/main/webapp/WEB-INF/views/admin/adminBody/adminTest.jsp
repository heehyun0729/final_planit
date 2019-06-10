<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
	$(document).ready(function(){
		$("#carouselExampleIndicators").carousel({
			ride: true;
		});
	});	
</script>
<div class="container">
	<div class="row">
		<div class="col d-flex justify-content-start align-items-center text-center">
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
			  	<c:forEach var="i" items="${getTodayAd }" varStatus="status">
				    <c:choose>
					    <c:when test="${status.first }">
					    	<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
					    </c:when>
					    <c:otherwise>
					    	<li data-target="#carouselExampleIndicators" data-slide-to="${status.index }"></li>
					    </c:otherwise>
				    </c:choose>
			    </c:forEach>
			  </ol>
			  <div class="carousel-inner">
			  	<c:forEach var="vo" items="${imageList }" varStatus="status">
				    <c:choose>
					    <c:when test="${status.first }">
					    	<div class="carousel-item active" data-interval="1000">
					     		<img src="<c:url value='/resources/adImage/${vo.adImg_saveImg }'/>" width="1000" height="400" class="d-block w-100" alt="광고 이미지">
					    	</div>
					    </c:when>
					    <c:otherwise>
						    <div class="carousel-item" data-interval="1000">
					     		<img src="<c:url value='/resources/adImage/${vo.adImg_saveImg }'/>" width="1000" height="400" class="d-block w-100" alt="광고 이미지">
					    	</div>
					    </c:otherwise>
				    </c:choose>
			    </c:forEach>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
		</div>
	</div>	
</div>