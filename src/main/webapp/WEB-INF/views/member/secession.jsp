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
	#container #wrap h3{
		font-size: 30px;
		margin-bottom: 30px;
	}
	#container #wrap a{
		font-size: 20px;
		font-weight: bold;
	}
</style>

<section>
	<div id="container">
		<div id="wrap">
			<h3>성공적으로 탈퇴 하였습니다.</h3>
			<a href="${pageContext.request.contextPath}/member/joinIntro">새로 가입</a>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>
