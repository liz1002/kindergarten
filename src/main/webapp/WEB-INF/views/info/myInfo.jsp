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
		<h1>내 정보</h1>
		<!-- 접속자가 본인이면 -->
		<c:if test="${mVo.mId == Auth}">
			<p>이름 : ${mVo.mName}</p>
			<p>아이디 : ${mVo.mId}</p>
			<p>별명 : ${mVo.mNickname}</p>
			<p>연락처 : ${mVo.mTel}</p>
			<p>생년월일 : <fmt:formatDate value="${mVo.mRegdate}" pattern="yyyy년 MM월 dd일"/></p>
		</c:if>
		
		<p><a href="#">개인정보 수정</a></p>
	</div>
</section>

<!----- S C R I P T ----->
<script>

</script>

<%@include file="../include/footer.jsp" %>