<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
				<div class="row">
					<div class="col-sm-12">
						<c:choose>
							<c:when test="${profilemap.PROFILE_OPEN==1 }">
								<c:choose>
									<c:when test="${!mem_tf }">비공개 프로필입니다.</c:when>
									<c:otherwise>
										<pre>${profilemap.PROFILE_COMM }</pre>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${profilemap.PROFILE_OPEN==2 }">
								<c:choose>
									<c:when test="${!mem_tf && profilemap.FOLLOW_GRADE==1 }">서로 팔로우 되어 있는 사람만 볼 수 있는 프로필입니다.</c:when>
									<c:otherwise>
										<pre>${profilemap.PROFILE_COMM }</pre>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${profilemap.PROFILE_OPEN==3 }">
								<c:choose>
									<c:when test="${!mem_tf && profilemap.FOLLOW_GRADE==2 }">팔로우 해야 볼 수 있는 프로필입니다.</c:when>
									<c:otherwise>
										<pre>${profilemap.PROFILE_COMM }</pre>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<pre>${profilemap.PROFILE_COMM }</pre>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
