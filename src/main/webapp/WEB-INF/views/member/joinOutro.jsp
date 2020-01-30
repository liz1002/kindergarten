<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#container h1{
		margin-bottom: 100px;
	}
	#container p a{
		display: inline-block;
		padding: 2px 10px;
		background: #fff;
		color: #FBCB00;
		font-size: 20px;
		font-weight: bold;
		border: 1px solid #FBCB00;
		outline: none;
	}
	#container p a:hover {
		background: #FBCB00;
		color: #fff;
	}
</style>

<section>
	<div id="container">
		<h1>성공적으로 가입하셨습니다.</h1>
		<p><a href="${pageContext.request.contextPath}/auth/login">로그인</a></p>
	</div>
</section>

<%@include file="../include/footer.jsp" %>
