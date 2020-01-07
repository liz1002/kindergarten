<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	div#container{
		width: 80%;
		overflow: hidden;
		margin: 0 auto;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	#container a{
		display: inline-block;
		width: 100%;
		height: 100%;
		font-size: 25px;
		font-weight: bold;
	}
</style>

<section>
	<div id="container">
		<div>
			<h3>성공적으로 가입하셨습니다.</h3>
			
			<a href="${pageContext.request.contextPath}/auth/login">로그인</a>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>
