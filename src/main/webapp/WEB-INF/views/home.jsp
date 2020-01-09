<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %>

<style>
	div#container{
		width: 100%;
		min-height: 400px; 
	}
	#container h1{
		text-align: center;
		line-height: 200px;
	}
	#container p{
		text-align: center;
	}
	#container p a{
		
	}
</style>

<section>
	<div id="container">
		<h1>KINDERGARTEN HOME</h1>
		<c:if test="${Auth == null}">
			<h1>로그인 후 이용해주세요.</h1>
			<p><a href="${pageContext.request.contextPath}/auth/login">로그인</a>
		</c:if>
	</div>
</section>

<%@include file="include/footer.jsp" %>