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
		<h1>반 정보</h1>
		<p>이름 : ${cVo.cName}</p>
		<p>연령 : 세</p>
		<c:forEach var="tVo" items="${tList}">
			<p>
				<c:if test="${tVo.tType == 1}">담임</c:if>
				<c:if test="${tVo.tType == 2}">부담임</c:if>
				: <a href="${pageContext.request.contextPath}/info/infoOther?mNo=${tVo.mVo.mNo}&kNo=${tVo.kVo.kNo}">${tVo.mVo.mNickname} (${tVo.mVo.mName})</a>
			</p>
		</c:forEach>
	</div>
</section>

<!----- S C R I P T ----->
<script>

</script>

<%@include file="../include/footer.jsp" %>
