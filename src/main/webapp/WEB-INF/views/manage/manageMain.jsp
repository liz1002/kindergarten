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
	/* div.kinder_wrap{
		width: 500px;
		margin: 20px auto;
		padding: 20px 0;
		background: #FF9CB3;
		border: 2px outset #FF9CB3; 
		box-shadow: 1px 1px 1px gray;
		cursor: pointer;
	}
	div.kinder_wrap:hover{		
		border: 2px inset #FF9CB3;
		box-shadow: -1px -1px 1px gray;
	} */
	#container h3{
		margin: 50px auto;
	}
</style>

<section>
	<div id="container">
		<!-- 원장 -->
		<c:if test="${Type == 1}">
			<h1>유치원 관리</h1>	
			<c:forEach var="dVo" items="${dList}">
				<h3>
					<a href="${pageContext.request.contextPath}/info/infoKinder?kNo=${dVo.kVo.kNo}">${dVo.kVo.kName}</a>
				</h3> 
			</c:forEach>
			
			<a href="regist">유치원 추가 하기</a>
		</c:if>
		
		<!-- 교사 -->
		<c:if test="${Type == 2}">
			<h1>메인 관리 창</h1>
			<c:if test="${tList.size() == 0}">
				<p>유치원 등록 후 이용해주세요.</p>
				<a href="regist">유치원 등록 하기</a>
			</c:if>	
		</c:if>
		
		<!-- 학부모 -->
		<c:if test="${Type == 3}">
			<h1>자녀 관리</h1>
			<c:if test="${fList.size() == 0}">
				<p>유치원 등록 후 이용해주세요.</p>
				<a href="regist">유치원 등록 하기</a>
			</c:if>
			<c:if test="${fList.size() != 0}">
				<c:forEach var="fVo" items="${fList}">
					<p>
						<a href="${pageContext.request.contextPath}/info/infoKinder?kNo=${fVo.pVo.kVo.kNo}">[${fVo.pVo.kVo.kName}]</a>
						<a href="${pageContext.request.contextPath}/info/infoClass?cNo=${fVo.pVo.cVo.cNo}"> ${fVo.pVo.cVo.cName}</a>
						<a href="#원아정보"> ${fVo.chVo.chName}</a>
					</p>
				</c:forEach>
				<a href="regist">유치원 추가 하기</a>
			</c:if>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>

</script>

<%@include file="../include/footer.jsp" %>