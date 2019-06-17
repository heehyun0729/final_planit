<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
	$("#showMsgPopup").click(function(e) {
		e.preventDefault();
	});
});
function ppp(mem_id){
	var popUrl = "<c:url value='/msgSendForm?id=" + mem_id + "'/>";
	var popOption = "width=800, height=400, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl,"쪽지보내기",popOption);
}
</script>
<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
    <div class="overlay bg-parallax" style = "background: url(../resources/images/map.jpg)" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
    <div class="container">
        <div class="page-cover text-center">
            <h2 class="page-cover-tittle">계획짜기</h2>
            <ol class="breadcrumb">
                <li><a href="<c:url value = '/'/>">홈</a></li>
                <li class="active">계획짜기</li>
            </ol>
        </div>
    </div>
</section>
<!--================Breadcrumb Area =================-->
<section class="about_history_area section_gap">
    <div class="container">
        <div class="page-cover text-center">
           <h2 class="title title_color"><span style = "color:#ff5252;">Plan it!</span>과 함께 여행을 즐겨보세요.</h2>
           <a href="<c:url value = '/plan/planner'/>" class="button_hover theme_btn" style = "margin: 30px 0 50px 0;">플래너 시작</a>
        </div>
        <hr>
    </div>
</section>

<section class="latest_blog_area section_gap">
    <div class="container">
        <div class="section_title">
        	<div class = "row">
        		<div class = "col-lg-7">
        			<h2>다른 여행자들의 플래너</h2>
        		</div>
        		<div class = "col-lg-5">
        			<form method="post" action="<c:url value = '/plan/list'/>">
						<input type = "hidden" value = "${pageNum }" name = "pageNum">
						<div class = "row">
							<div class = "col-sm-2">
								<select name = "field" class = "nice-select">
									<option value = "country"
										<c:if test = "${field == 'country' }">selected = "selected"</c:if>
									>국가</option>
									<option value = "city"
										<c:if test = "${field == 'city' }">selected = "selected"</c:if>
									>도시</option>
									<option value = "plan_title"
										<c:if test = "${field == 'plan_title' }">selected = "selected"</c:if>
									>제목</option>
									<option value = "mem_id"
										<c:if test = "${field == 'mem_id' }">selected = "selected"</c:if>
									>작성자</option>
								</select>
							</div>
							<div class = "col-sm-7">
								<input type = "text" name = "keyword" value = "${keyword }" class = "form-control">
							</div>
							<div class = "col-sm-2" style = "padding: 0px;">
								<input type = "submit" value = "검색" class = "genric-btn primary circle border">
							</div>
						</div>
					</form>
        		</div>
        	</div>
        </div>
        <c:if test="${empty list }">
			<div class="row text-center">조회된 결과가 없습니다.</div>
		</c:if>
		<c:forEach var = "vo" items="${list }">
			<div class = "row mb_30 text-center">
				<div class="col-lg-3 col-md-6">
					<div class="single-recent-blog-post">
						<div class="thumb">
							<a href = "<c:url value = '/plan/detail?pageNum=${pageNum }&field=${field }&keyword=${keyword }&plan_num=${vo.plan_num }'/>"><img src = "${vo.plan_img }" style = "height: 300px;"></a>
						</div>
						<div class = "details align-items-center">
							<a href = "<c:url value = '/plan/detail?pageNum=${pageNum }&field=${field }&keyword=${keyword }&plan_num=${vo.plan_num }'/>"><h4 class="sec_h4">${vo.plan_title }</h4></a>
							<img src = "<c:url value = '${vo.img_saveImg }'/>" class="img-circle avatar">
					
							<div class="nav navbar-nav menu_nav ml-auto">
									<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${vo.mem_id }</a>
									<ul class="dropdown-menu">
										<li class="nav-item"><a href = "<c:url value = '/member/mypage/${vo.mem_id}'/>" target = "_blank">프로필 보기</a></li>
										<li class="nav-item"><a href = "#" onclick="javascript:ppp('${vo.mem_id}')" id = "showMsgPopup">쪽지 보내기</a></li>
									</ul>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	 <nav class="blog-pagination justify-content-center d-flex">
           <ul class="pagination">
               <li class="page-item">
               	<c:if test="${startPage > 1 }">
					<a class="page-link" aria-label="이전" href = "<c:url value = '/plan/list?pageNum=${startPage - 1 }&field=${field }&keyword=${keyword }'/>">
						<span aria-hidden="true">
                           <span class="lnr lnr-chevron-left"></span>
                       </span>
					</a>
				</c:if>
               </li>
               <c:forEach var = "i" begin = "${startPage }" end = "${endPage }">
					<c:choose>
						<c:when test="${i == pageNum }">
							<li class="page-item active"><a class="page-link" href = "<c:url value = '/plan/list?pageNum=${i }&field=${field }&keyword=${keyword }'/>">${i }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href = "<c:url value = '/plan/list?pageNum=${i }&field=${field }&keyword=${keyword }'/>">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
               <li class="page-item">
               		<c:if test="${endPage < pageCnt }">
						<a class="page-link" aria-label="다음" href = "<c:url value = '/plan/list?pageNum=${endPage + 1 }&field=${field }&keyword=${keyword }'/>">
							<span aria-hidden="true">
	                           <span class="lnr lnr-chevron-right"></span>
	                       </span>
						</a>
					</c:if>
               </li>
           </ul>
       </nav>
    </div>
</section>