<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
<style type="text/css">
	*{
		padding: 0px;
		margin: 0px;
	}
	
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>
<div>
<header>
</header>
<section>
	<article>
		<div>
			<div>
				번호<br>
				${getAdInfo.ad_num }
				신청자 ID<br>
				${getAdInfo.mem_id }
			</div>
			<div>
				
			</div>
		</div>
		<div>
			<div>
			</div>
			<div>
			</div>
		</div>
	</article>
</section>
<footer>
</footer>
</div>