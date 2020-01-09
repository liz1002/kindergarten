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
		font-size: 20px;
		font-weight: bold;
	}
	#container a:hover {
		text-decoration: underline;
	}
	#container span{
		font-size: 18px;
	}
</style>

<section>
	<div id="container">
		<h1>반 정보</h1>
		<p>${cVo.cName}</p>
		<p>${cVo.cRegdate}</p>
		<c:if test="${Type == 2}">
			<p>코드 : ${cVo.cCode}</p>
		</c:if>
		<p>교사 정보</p>
		<c:if test="${tList.size() == 0}">
			<p>현재 등록된 교사가 없습니다.</p>
		</c:if>
		<c:forEach var="tVo" items="${tList}">
			<span>
				<c:if test="${tVo.tType == 1}">담임</c:if>
				<c:if test="${tVo.tType == 2}">부담임</c:if>
			</span>
			<br>
			<a href="${pageContext.request.contextPath}/info/infoOther?mNo=${tVo.mVo.mNo}&kNo=${tVo.kVo.kNo}">${tVo.mVo.mNickname} (${tVo.mVo.mName})</a>
			<br>
		</c:forEach>
		<p>원아 정보</p>
		<c:if test="${chList.size() == 0}">
			<p>현재 등록된 원아가 없습니다.</p>
		</c:if>
		<c:forEach var="chVo" items="${chList}">
			<span><a href="${pageContext.request.contextPath}/info/infoChild?chNo=${chVo.chNo}">${chVo.chName}</a></span><br>			
		</c:forEach>
	</div>
</section>

<!----- S C R I P T ----->
<script>

</script>

<%@include file="../include/footer.jsp" %>
