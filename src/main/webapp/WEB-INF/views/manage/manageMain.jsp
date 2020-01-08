<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	div#container{
		width: 100%;
		min-height: 400px; 
		text-align: center;
	}
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
	div.kinder_wrap{
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
	}
	.kinder_wrap h3{
		line-height: 50px;
	}
	.kinder_wrap p{
		line-height: 50px;
	}
</style>

<section>
	<div id="container">
		<!-- 원장 -->
		<c:if test="${Type == 1}">
			<h1>유치원 관리</h1>	
			<c:forEach var="dVo" items="${dList}">
				<div class="kinder_wrap" data-kNo="${dVo.kVo.kNo}">
					<h3>${dVo.kVo.kName}</h3> 
					<p>코드 : ${dVo.kVo.kCode}</p>
					<p>연락처 : ${dVo.kVo.kTel}</p>
					<p>주소 : ${dVo.kVo.kAddress}</p>
				</div>
			</c:forEach>
			
			<a href="regist">유치원 추가 하기</a>
		</c:if>
		
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
	$(".kinder_wrap").click(function() {
		location.href="registD?kNo=" + $(this).attr("data-kNo");
	})
</script>

<%@include file="../include/footer.jsp" %>