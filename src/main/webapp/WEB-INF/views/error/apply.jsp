<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<style>
	body{
		background: #F2F2F2;
	}
	#container h1{
		color: #C596D9;
	}
	#container p{
		line-height: 50px;
	}
	#container a{
		text-decoration: underline;
	}
</style>

<section>
	<div id="container">
		<h1>가입할 수 없습니다.</h1>
		<p>${errMsg}</p>
		<p><a href="${pageContext.request.contextPath}/teacher/apply?mNo=${mNo}">다시 시도</a></p>
	</div>
</section>

<%@include file="../include/footer.jsp" %>