<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#container > h1{
		margin-bottom: 30px;
	}
	#container > p{
		height: 100px;
	}
	#container a{
		
	}
	#container a:hover {
		text-decoration: underline;
	}
	#container h3{
		margin: 50px auto;
	}
</style>

<section>
	<%@include file="../include/manageMenu.jsp" %>	
	<div id="container">		
		<!-- 교사 -->
		<c:if test="${Type == 2}">
			<h1>반 관리</h1>
			<c:if test="${tList.size() == 0}">
				<p>유치원 등록 후 이용해주세요.</p>
				<a href="regist">유치원 등록 하기</a>
			</c:if>			
			<c:if test="${tList.size() != 0}">
				<c:forEach var="tVo" items="${tList}">
					<p>
						[<a href="${pageContext.request.contextPath}/info/infoKinder?kNo=${tVo.kVo.kNo}">${tVo.kVo.kName}</a>]
						<a href="${pageContext.request.contextPath}/info/infoClass?cNo=${tVo.cVo.cNo}">${tVo.cVo.cName}</a>
						<c:if test="${tVo.tType == 1}">(담임)</c:if>
						<c:if test="${tVo.tType == 2}">(부담임)</c:if>
					</p>
					<p>
						<a href="${pageContext.request.contextPath}/manage/registCh?cNo=${tVo.cVo.cNo}">원아 관리</a>
					</p>
				</c:forEach>
				<a href="regist">유치원 & 반 추가 하기</a>
			</c:if>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>

</script>

<%@include file="../include/footer.jsp" %>