<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %>

<style>
	#container p#title{
		margin-top: 50px;
		font-size: 30px;
		letter-spacing: 10px;
	}
	#container p{
		text-align: center;
		line-height: 100px;
		font-size: 20px;
		font-weight: bold;
	}
	#container p a{
		text-decoration: underline;
	}
</style>

<section>
	<div id="container">
		<p id="title">KIDS DIARY</p>
		<c:if test="${Auth == null}">
			<p>로그인 후 이용해주세요.<p>
			<p><a href="${pageContext.request.contextPath}/auth/login">로그인</a>
		</c:if>
	</div>
</section>

<%@include file="include/footer.jsp" %>