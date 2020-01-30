<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	div#container {
		width: 100%;
	}
	#container h1 {
		text-align: center;
	}
	#container p {
		text-align: center;
		overflow: hidden;
	}
	#container #coment{
		font-size: 18px;
		margin: 50px auto;
		clear: both;
	}
	#container .chName {
		font-size: 20px;
		line-height: 40px; 
	}
	#container .chName a{
		font-weight: bold; 
	}
	#container .chName a:hover {
		color: #FBCB00;
	}
</style>

<section>
	<div id="container">		
		<h1>${tVo.cVo.cName} 알림장</h1>
		<p id="coment">알림장을 확인할 원아를 선택하세요.</p> 
		<div class="chList">
			<c:forEach var="chVo" items="${chList}">
				<p class="chName">
					<a href="${pageContext.request.contextPath}/notice/teacher?tNo=${tVo.tNo}&chNo=${chVo.chNo}">
						${chVo.chName}<fmt:formatDate value="${chVo.chRegdate}" pattern="(yyyy/MM/dd)"/>
					</a>
				</p>
			</c:forEach>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>