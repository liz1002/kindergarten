<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<!-- manage Kinder -->

<style>
	#container h1#title{
		color: #E8B582;
		font-size: 30px;
	}
	#container div.wrap{
		margin: 50px auto;
	}
	#container .wrap p{
		line-height: 50px;
	}
	#container a{
	}
	#container a:hover {
		text-decoration: underline;
	}
	
</style>

<section>
	<div id="container">
		<h1 id="title">${kVo.kName}</h1>
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
					<a href="${pageContext.request.contextPath}/info/infoClass?cNo=${pVo.chVo.cVo.cNo}">[${pVo.chVo.cVo.cName}]</a> 
					<a href="${pageContext.request.contextPath}/info/infoOther?mNo=${pVo.mVo.mNo}&kNo=${pVo.chVo.kVo.kNo}">${pVo.mVo.mNickname}</a>
				</p>
			</c:forEach>
		</div>
		<hr>
		<div class="wrap">
			<h1>반 리스트</h1>
			<c:if test="${cList.size() == 0}">
				<p class="coment">등록된 반이 없습니다.</p>
			</c:if>
			<c:forEach var="cVo" items="${cList}">
				<p>
					<a href="${pageContext.request.contextPath}/info/infoClass?cNo=${cVo.cNo}">${cVo.cName}</a>
				</p>
			</c:forEach>
		</div>
		<hr>
		<div class="wrap">
			<h1>원아 리스트</h1>
			<c:if test="${chList.size() == 0}">
				<p class="coment">등록된 원아가 없습니다.</p>
			</c:if>
			<c:forEach var="chVo" items="${chList}">
				<p>
					<a href="${pageContext.request.contextPath}/info/infoChild?chNo=${chVo.chNo}">${chVo.chName}</a>
				</p>
			</c:forEach>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>