<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#container p.division{
		margin-top: 30px;
		line-height: 70px;
		font-size: 20px;
		font-weight: bold;
	}
	#container span{
		line-height: 30px;
	}
	#container a:hover {
		text-decoration: underline;
	}
	#container div.listBox{
		width: 300px;
		max-height: 230px;
	    margin: 0 auto;
	    padding: 10px;
		overflow: auto;
	}
</style>

<section>
	<div id="container">
		<h1>${cVo.cName}</h1>
		<c:if test="${Type == 2}">
			<p class="division">코드</p>
			<span>${cVo.cCode}</span>
		</c:if>
		<p class="division">교사 정보</p>
		<c:if test="${tList.size() == 0}">
			<p>현재 등록된 교사가 없습니다.</p>
		</c:if>
		<c:forEach var="tVo" items="${tList}">
			<c:if test="${tVo.tType == 1}">담임</c:if>
			<c:if test="${tVo.tType == 2}">부담임</c:if>
			<span>
				 | <a href="${pageContext.request.contextPath}/info/infoOther?mNo=${tVo.mVo.mNo}&kNo=${tVo.kVo.kNo}">
			 		${tVo.mVo.mName}(${tVo.tNickname})
			 	</a>
		 	</span> 
			<br>
		</c:forEach>
		<p class="division">원아 정보</p>
		<div class="listBox">
			<c:if test="${chList.size() == 0}">
				<p>현재 등록된 원아가 없습니다.</p>
			</c:if>
			<c:forEach var="chVo" items="${chList}">
				<span>
					<a href="${pageContext.request.contextPath}/info/infoChild?chNo=${chVo.chNo}">
						${chVo.chName}<fmt:formatDate value="${chVo.chRegdate}" pattern="(yyyy/MM/dd)"/>
					</a>
				</span>
				<br>			
			</c:forEach>
		</div>
	</div>
</section>

<!----- S C R I P T ----->
<script>

</script>

<%@include file="../include/footer.jsp" %>
