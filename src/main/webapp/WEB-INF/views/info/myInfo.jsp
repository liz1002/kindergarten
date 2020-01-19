<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#container a:hover {
		text-decoration: underline;
	}
	#container div#info{
		width: 700px;
		margin: 50px auto;
		font-size: 18px;
		clear: both;
		text-align: left;
	}
	#info p{
		line-height: 50px;
	}
	#info span{
		font-weight: bold;
		color: #F78300;
		margin-right: 10px;
	}
</style>

<section>
	<div id="container">
		<h1>내 정보</h1>
		<!-- 접속자가 본인이면 -->
		<c:if test="${mVo.mId == Auth}">
			<div id="info">
				<p><span> | 이름</span> ${mVo.mName}</p>
				<p><span> | 아이디 </span>${mVo.mId}</p>
				<p><span> | 연락처</span> ${mVo.mFirsttel}-${mVo.mMiddletel}-${mVo.mLasttel}</p>
				<p><span> | 생년월일</span> <fmt:formatDate value="${mVo.mRegdate}" pattern="yyyy년 MM월 dd일"/></p>
				<p>
					<a href="#">개인정보 수정</a><br>
					<a href="${pageContext.request.contextPath}/member/secession?mNo=${mVo.mNo}">회원 탈퇴</a>
				</p>
			</div>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>

</script>

<%@include file="../include/footer.jsp" %>