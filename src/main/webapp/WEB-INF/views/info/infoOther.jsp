<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	div#container{
		width: 100%;
		min-height: 400px; 
		text-align: center;
	}
	#container > p{
		line-height: 100px;
	}
	#container a{
		text-decoration: underline;
		background: #fff;
	}
</style>

<section>
	<div id="container">
		<h1>${mVo.mNickname}님의 정보</h1>
		<p>이름 : ${mVo.mName}</p>
		<p>연락처 : ${mVo.mTel}</p>
		
		<!-- mType에 따라 -->
		
		<!-- 교사 -->
		<c:if test="${mVo.mType == 2}">
			<c:forEach var="tVo" items="${tList}"> 
				<p>담당 학급 : <a href="${pageContext.request.contextPath}/info/infoClass?cNo=${tVo.cVo.cNo}">${tVo.cVo.cName}</a></p>
				<p>역할 :
					<c:if test="${tVo.tType == 1}">담임</c:if>
					<c:if test="${tVo.tType == 2}">부담임</c:if>
				</p>
			</c:forEach>
		</c:if>	
		
		<!-- 학부모 -->	
		<c:if test="${mVo.mType == 3}">
			<p>해당 유치원의 자녀 리스트</p>
			<p>
				[<a href="${pageContext.request.contextPath}">반</a>]
				<a href="${pageContext.request.contextPath}">이름</a>
			</p> <!-- 각각 반, 원아 정보로 이동 -->
		</c:if>
		
		<!-- 접속자가 본인이면 -->
		<c:if test="${mVo.mId == Auth}">
			<p>생년월일 : <fmt:formatDate value="${mVo.mRegdate}" pattern="yyyy년 MM월 dd일"/></p>
			<p>비밀번호 : ${mVo.mPwd}</p>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>

</script>

<%@include file="../include/footer.jsp" %>