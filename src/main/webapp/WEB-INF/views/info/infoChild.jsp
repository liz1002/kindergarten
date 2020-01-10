<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#container > p{
		line-height: 100px;
	}
	#container a:hover {
		text-decoration: underline;
	}
</style>

<section>
	<div id="container">
		<h1>${chVo.chName}</h1>
		<p>생년월일</p>
		<span><fmt:formatDate value="${chVo.chRegdate}" pattern="yyyy년 MM월 dd일"/> </span>
		<p>
			<a href="${pageContext.request.contextPath}/info/infoKinder?kNo=${chVo.kVo.kNo}">${chVo.kVo.kName}</a> | 
			<a href="${pageContext.request.contextPath}/info/infoClass?cNo=${chVo.cVo.cNo}">${chVo.cVo.cName}</a>	
		</p>
	</div>
</section>

<!----- S C R I P T ----->
<script>

</script>

<%@include file="../include/footer.jsp" %>
