<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유치원 커뮤니티 &amp; 알림장</title>

<!-- All style -->
<style>
	*{
		margin: 0;
		padding: 0;
	}
	section{
		width: 1200px;
		margin: 0 auto;
		padding: 50px 0;
		background: #FFDBE3;
	}
	ul{
		list-style: none;
	}
	a{
		text-decoration: none;
		color: #000;
	}
</style>

<!-- script -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/formCheck.js"></script>

<style>
	header{
		width: 1200px;
		margin: 0 auto;
		background: #FF9CB3;
	}
	header div{
		width: 100%;
		height: 200px;
	}
	header div h1{
		text-align: center;
		vertical-align: middle;
		line-height: 200px;
	}
	div#wrap{
		background: #A782E8;
	}
	#wrap a{
		display: inline-block;
		padding: 5px 20px;
		height: 20px;
		color: #fff;
		text-align: center;
	}
	#wrap a span{
		text-decoration: underline;
		font-size: 17px;
	}
</style>

</head>
<body>
	<header>
		<div>
			<h1>
				H E A D E R
			</h1>
		</div>
		<div id="wrap">
			<c:if test="${Auth == null}">
				<a href="${pageContext.request.contextPath}/auth/login">로그인</a>
			</c:if>
			<c:if test="${Auth != null}">
				<a href="${pageContext.request.contextPath}/auth/logout">로그아웃</a>
			</c:if>
			<a href="${pageContext.request.contextPath}/member/joinIntro">회원가입</a>
			<c:if test="${Auth != null}">
				<a href="${pageContext.request.contextPath}/info/regist"><span>${Nick}</span>님</a>
			</c:if>
		</div>
	</header>
	