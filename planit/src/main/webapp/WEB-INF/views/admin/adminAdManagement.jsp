<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	*{
		padding: 0px;
		margin: 0px;
	}
</style>
<link rel="stylesheet" href="<c:url value='/resources/css/jQueryUi/jquery-ui.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.4.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
	)};
</script>
<div>
<header>
</header>
<section>
	<article>
		<div>
			<table>
				<tr>
					<th>번호</th><th>신청자</th><th>회사명</th><th>신청일</th><th>결제금액</th>
				</tr>
				<c:forEach var="vo" items="${getRequestedAdList }">
					<tr>
						<td></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</article>
</section>
<footer>
</footer>
</div>