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
		<h1 id="title">${cVo.cName}</h1>
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
			<p>
				<a href="${pageContext.request.contextPath}/manage/manageFamily?cNo=${cVo.cNo}">학부모 관리</a>
			</p>
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
			<p>
				<a href="${pageContext.request.contextPath}/add/addChildren?cNo=${cVo.cNo}">원아 관리</a>
			</p>	
			</p> 	
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>