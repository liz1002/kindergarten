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
		<p>이름 : ${mVo.mName}</p>
		<p>별명 : ${mVo.mNickname}</p>
		<p>연락처 : ${mVo.mTel}</p>
		<p>나중에 해당 유치원+해당 부모의 모든 자녀 보이기</p>
		
		<!-- 접속자가 본인이면 -->
		<c:if test="${mVo.mId == Auth}">
			<p>생년월일 : ${mVo.mRegdate}</p>
			<p>생년월일 : ${mVo.mRegdate}</p>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>

</script>

<%@include file="../include/footer.jsp" %>