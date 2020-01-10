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
	<div id="container">		
		<!-- 교사 -->
		<c:if test="${Type == 3}">
			<h1>반 관리</h1>
			<c:if test="${pList.size() == 0}">
				<p>유치원 등록 후 이용해주세요.</p>
				<a href="regist">유치원 등록 하기</a>
			</c:if>			
			<c:if test="${pList.size() != 0}">
				<c:forEach var="chVo" items="${pList}">
					<div>
						<p>
							[<a href="${pageContext.request.contextPath}/info/infoKinder?kNo=${pVo.chVo.kVo.kNo}">${pVo.chVo.kVo.kName}</a>]
							<a href="${pageContext.request.contextPath}/info/infoClass?cNo=${pVo.chVo.DcVo.cNo}">${pVo.chVo.cVo.cName}</a>
						</p>
					</div>
				</c:forEach>
				<a href="regist">유치원 & 반 추가 하기</a>
			</c:if>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	alert('ddd')
</script>

<%@include file="../include/footer.jsp" %>