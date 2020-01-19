<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#container p.division{
		margin-top: 30px;
		line-height: 70px;
		font-size: 20px;
		font-weight: bold;
	}
	#container span{
		line-height: 30px;
	}
	#container a:hover {
		text-decoration: underline;
	}
</style>

<section>
	<div id="container">
		<h1>${mVo.mName}님의 정보</h1>
		<p class="division">연락처</p>
		 <span>${mVo.mFirsttel}-${mVo.mMiddletel}-${mVo.mLasttel}</span>
		
		<!-- 접속자가 본인이면 -->
		<c:if test="${mVo.mId == Auth}">
			<p>생년월일 : <fmt:formatDate value="${mVo.mRegdate}" pattern="yyyy년 MM월 dd일"/></p>
			<p>비밀번호 : ${mVo.mPwd}</p>
		</c:if>
		
		<!-- mType에 따라 -->
		
		<!-- 교사 -->
		<c:if test="${mVo.mType == 2}">
			<p class="division">소속</p>
			<c:forEach var="tVo" items="${tList}"> 
				<p>
					<a href="${pageContext.request.contextPath}/info/infoClass?cNo=${tVo.cVo.cNo}">${tVo.cVo.cName}</a> | 
					<c:if test="${tVo.tType == 1}">담임</c:if>
					<c:if test="${tVo.tType == 2}">부담임</c:if>
				</p>
			</c:forEach>
		</c:if>	
		
		<!-- 학부모 -->	
		<c:if test="${mVo.mType == 3}">
			<p class="division">해당 유치원의 자녀 리스트</p>
			<c:if test="${pList.size() == 0}">
				<p>등록된 자녀가 없습니다.</p>
			</c:if>
			<div id="chList">
				<c:forEach var="pVo" items="${pList}"> 
					<span>
						<a href="${pageContext.request.contextPath}/info/infoClass?cNo=${pVo.chVo.cVo.cNo}">${pVo.chVo.cVo.cName}</a> | 
						<a href="${pageContext.request.contextPath}/info/infoChild?chNo=${pVo.chVo.chNo}">${pVo.chVo.chName}
						</a>
					</span>
					<br>
				</c:forEach>
			</div>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>

</script>

<%@include file="../include/footer.jsp" %>