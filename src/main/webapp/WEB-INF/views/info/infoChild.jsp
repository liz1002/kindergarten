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
</style>

<section>
	<div id="container">
		<h1>${chVo.chName}</h1>
		<p class="division">생년월일</p>
		<span><fmt:formatDate value="${chVo.chRegdate}" pattern="yyyy년 MM월 dd일"/></span>
		<p class="division">소속</p>
		<span> 
			<a href="${pageContext.request.contextPath}/info/infoClass?cNo=${chVo.cVo.cNo}">${chVo.cVo.cName}</a>
		</span>
	</div>
</section>

<!----- S C R I P T ----->
<script>

</script>

<%@include file="../include/footer.jsp" %>
