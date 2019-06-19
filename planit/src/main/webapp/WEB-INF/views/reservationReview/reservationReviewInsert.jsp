<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<div>
	<div class="container">
		<div class="row mt-5">
			<div class="col d-flex justify-content-start align-items-center text-center mt-5">
					<form method="post" action="${pageContext.request.contextPath }/reservationReview/reservationReviewInsert" >
							예약번호<input type="hidden" name="rsvn_num" value="${param.rsvn_num}"> <br>
							 아이디<input type="text" readonly="readonly" name="mem_id" value="${sessionScope.mem_id }"><br>
							 제목<input type="text" name="resReview_title"><br>
							 내용<textarea rows="5" cols="50" name="resReview_content" id="summernote"></textarea><br>
							<div id="resReview_star">
								별점<input type="radio" name="resReview_star" id="star5" value="5" checked="checked"/><label id="full" for="star5"></label>
								<input type="radio" name="resReview_star" id="star4" value="4"><label id="full" for="star4"></label>
								<input type="radio" name="resReview_star" id="star3" value="3"><label id="full" for="star3"></label>
								<input type="radio" name="resReview_star" id="star2" value="2"><label id="full" for="star2"></label>
								<input type="radio" name="resReview_star" id="star1" value="1"><label id="full" for="star1"></label>
										
									
								</div>
								<input type="submit" value="등록">
								<input type="button" value="취소">
					</form>
						<script>
						 $("#summernote").summernote({
							 height: 300,
							 minHeight: null,
						      maxHeight: null
						});
						</script>
			</div>
		</div>
	</div>
</div>