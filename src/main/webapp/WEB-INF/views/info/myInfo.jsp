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
	#container a:hover {
		text-decoration: underline;
	}
</style>

<section>
	<div id="container">
		<h1>내 정보</h1>
		<!-- 접속자가 본인이면 -->
		<c:if test="${mVo.mId == Auth}">
			<p>이름</p>
			<span>${mVo.mName}</span>
			<p>아이디</p>
			<span>${mVo.mId}</span>
			<p>별명</p>
			<span>${mVo.mNickname}</span>
			<p>연락처</p>
			<span>${mVo.mTel}</span>
			<p>생년월일</p>
			<span><fmt:formatDate value="${mVo.mRegdate}" pattern="yyyy년 MM월 dd일"/></span>
			<p>
				<a href="#">개인정보 수정</a><br>
				<a href="${pageContext.request.contextPath}/member/secession?mNo=${mVo.mNo}">회원 탈퇴</a>
			</p>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>

</script>

<%@include file="../include/footer.jsp" %>