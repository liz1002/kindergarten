<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<style>
	div#container{
		width: 100%;
		min-height: 400px; 
		text-align: center;
	}
	#container div.wrap{
		margin: 50px auto;
	}
	.wrap h1{
		margin-bottom: 20px; 
	}
	.wrap p{
		line-height: 50px;
	}
	p.coment{
		height: 200px;
		line-height: 200px;
	}
	#container a{
	}
	#container a:hover {
		text-decoration: underline;
	}
	
</style>

<section>
	<div id="container">
		<div class="wrap">
			<h1>교사 리스트</h1>
			<c:if test="${tList.size() == 0}">
				<p class="coment">등록된 교사가 없습니다.</p>
			</c:if>
			<c:forEach var="tVo" items="${tList}">
				<p>
					<a href="${pageContext.request.contextPath}/info/infoClass?cNo=${tVo.cVo.cNo}">[${tVo.cVo.cName}]</a>
					<a href="${pageContext.request.contextPath}/info/infoOther?mNo=${tVo.mVo.mNo}&kNo=${tVo.kVo.kNo}"> ${tVo.mVo.mNickname}
						<c:if test="${tVo.tType == 1}">(담임)</c:if>
						<c:if test="${tVo.tType == 2}">(부담임)</c:if>
					</a>
				</p>
			</c:forEach>
		</div>
		<hr>
		<div class="wrap">
			<h1>부모 리스트</h1>
			<c:if test="${pList.size() == 0}">
				<p class="coment">등록된 부모가 없습니다.</p>
			</c:if>
			<c:forEach var="pVo" items="${pList}">
				<p>
					<a href="${pageContext.request.contextPath}/info/infoClass?cNo=${pVo.cVo.cNo}">[${pVo.cVo.cName}]</a> 
					<a href="${pageContext.request.contextPath}/info/infoOther?mNo=${pVo.mVo.mNo}&kNo=${pVo.kVo.kNo}">${pVo.mVo.mNickname}</a>
				</p>
			</c:forEach>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>