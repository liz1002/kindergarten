<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#container p#addKinder{
		width: 400px;
		margin: 0 auto 50px;
		background: #FF9CB3;
		line-height: 50px;
		font-weight: bold;
		font-size: 18px;
	}
	#addKinder a{
		display: inline-block;
		width: 100%;
		height: 100%
	}
	#container a:hover {
		text-decoration: underline;
	}
	#container div#item_wrap{
		width: 400px;
		height: 70px;
		margin: 20px auto;
		background: #8FDBFF; 
	}
	#item_wrap h3{
		line-height: 70px;
	}
</style>

<section>	
	<div id="container">	
		<p id="addKinder"><a href="${pageContext.request.contextPath}/add/addClass">유치원 & 반 추가 하기</a></p>
		<c:if test="${Type == 2}">
			<c:if test="${tList.size() == 0}">
				<p>유치원 등록 후 이용해주세요.</p>
				<a href="regist">유치원 등록 하기</a>
			</c:if>			
			<c:if test="${tList.size() != 0}">
				<c:forEach var="tVo" items="${tList}">
					<div id="item_wrap">
						<h3>
							<a href="${pageContext.request.contextPath}/manage/manageClass?cNo=${tVo.cVo.cNo}">
								[${tVo.kVo.kName}] ${tVo.cVo.cName}
								<c:if test="${tVo.tType == 1}">(담임)</c:if>
								<c:if test="${tVo.tType == 2}">(부담임)</c:if>
							</a>
						</h3>
						<%-- <h3>
							[<a href="${pageContext.request.contextPath}/info/infoKinder?kNo=${tVo.kVo.kNo}">${tVo.kVo.kName}</a>]
							<a href="${pageContext.request.contextPath}/info/infoClass?cNo=${tVo.cVo.cNo}">${tVo.cVo.cName}</a>
							<c:if test="${tVo.tType == 1}">(담임)</c:if>
							<c:if test="${tVo.tType == 2}">(부담임)</c:if>
						</h3>
						<p>
							<a href="${pageContext.request.contextPath}/manage/registCh?cNo=${tVo.cVo.cNo}">원아 관리</a>
						</p> --%>
					</div>
				</c:forEach>
			</c:if>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>

</script>

<%@include file="../include/footer.jsp" %>