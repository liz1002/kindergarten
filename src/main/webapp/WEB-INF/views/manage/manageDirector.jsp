<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<style>
	div#container{
		width: 100%;
		min-height: 400px; 
		text-align: center;
	}
	#container p{
		margin: 20px;
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
		<h1>교사 리스트</h1>
		<c:if test="${tList.size() == 0}">
			<p class="coment">등록된 교사가 없습니다.</p>
		</c:if>
		<c:forEach var="teacher" items="${tList}">
			<p>
				<a href="#">[${teacher.cVo.cName}]</a>
				<a href="#"> ${teacher.mVo.mNickname}
					<c:if test="${teacher.tType == 1}">(담임)</c:if>
					<c:if test="${teacher.tType == 2}">(부담임)</c:if>
				</a>
			</p>
		</c:forEach>
		
		<h1>부모 리스트</h1>
		<c:if test="${pList.size() == 0}">
			<p class="coment">등록된 부모가 없습니다.</p>
		</c:if>
		<c:forEach var="parent" items="${pList}">
			<p>
				<a href="#">[${parent.cVo.cName}]</a> 
				<a href="${pageContext.request.contextPath}/info/infoParent?mNo=${parent.mVo.mNo}">${parent.mVo.mNickname}</a>
			</p>
		</c:forEach>
	</div>
</section>

<%@include file="../include/footer.jsp" %>