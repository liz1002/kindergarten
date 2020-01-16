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
		background: #FFDBE3;
		overflow: hidden;
	}
	ul{
		list-style: none;
	}
	a{
		text-decoration: none;
		color: #000;
	}
	
	/* 폼 화면 */
	div#form_wrap{
		width: 700px;
		padding: 50px;
		margin: 0 auto;
	}
	#form_wrap fieldset {
		width: 60%;
		margin: 50px auto;
		padding: 20px 50px;
		background: #fff;
	}
	#form_wrap legend{
		padding: 0px 10px;
		font-weight: bold;
	}
	#form_wrap label {
		display: inline-block;
		width: 40%;
		float: left;
	}
	#form_wrap p{
		overflow: hidden;
		line-height: 50px;
	}
	#form_wrap span.necessary{
		margin-right: 5px; 
		color: #f00;
		vertical-align: middle;
	}
	#form_wrap input, #form_wrap select{
		padding: 3px;
	}
	#form_wrap span#coment{
		font-size: 12px;
		color: gray;
		text-align: left;
	}
	#form_wrap p.guid{
		line-height: 12px;
	    margin-top: 20px;
		font-size: 12px;
		color: gray;
		text-align: right;
	}
	#form_wrap p#submit{
		text-align: center;
	}
	#submit input{
		background: #E8B582;
		color: #FFF;
		cursor: pointer;
	}
	
	/* 일반 화면 */
	
	div#container{
		width: 800px;
		min-height: 400px; 
		padding: 50px;
		margin: 0 auto;
		text-align: center;
	}
	#container h1{
		margin: 0 auto 20px;
		line-height: 70px;
		text-shadow: 1px 1px 2px gray;
		letter-spacing: 5px;
		color: #8FDBFF; 
	}
	/* #container > p{
		line-height: 100px;
		font-weight: bold;
		font-size: 18px;
	} */
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
	header div h1{
		text-align: center;
		vertical-align: middle;
		line-height: 200px;
	}
	div#wrap{
		height: 100px;
		background: #A782E8;
		text-align: center;
	}
	#wrap a{
		display: inline-block;
		padding: 0px 20px;
		color: #fff;
		font-size: 20px;
		line-height: 100px;
	}
	#wrap a.active{
		background: #8FDBFF;
	}
	#wrap a span{
		font-weight: bold;
	}
	#wrap img{
		width: 70px;
		vertical-align: middle;
	}
</style>
</head>
<body>
	<header>
		<div id="wrap">
			<a href="${pageContext.request.contextPath}">
				<img src="${pageContext.request.contextPath}/resources/images/stitch (2).png">
			</a>
			<c:if test="${Auth != null}">				
				<c:if test="${Type == 1}">
					<!-- 원장 -->
					<a href="${pageContext.request.contextPath}/main/mainDirector">유치원</a>
					<a href="${pageContext.request.contextPath}/manage/manageDirector">관리</a>
				</c:if>
				<c:if test="${Type == 2}">
					<!-- 교사 -->
					<a href="${pageContext.request.contextPath}">게시판</a>
					<a href="${pageContext.request.contextPath}">알림장</a>
					<a href="${pageContext.request.contextPath}">앨범</a>
					<a href="${pageContext.request.contextPath}">일정표</a>
					<a href="${pageContext.request.contextPath}">투약의뢰서</a>
					<a href="${pageContext.request.contextPath}/manage/manageTeacher">관리</a>
				</c:if>
				<c:if test="${Type == 3}">
					<!-- 학부모 -->
					<a href="${pageContext.request.contextPath}">게시판</a>
					<a href="${pageContext.request.contextPath}">알림장</a>
					<a href="${pageContext.request.contextPath}">앨범</a>
					<a href="${pageContext.request.contextPath}">일정표</a>
					<a href="${pageContext.request.contextPath}">투약의뢰서</a>
					<a href="${pageContext.request.contextPath}/manage/manageParent">관리</a>
				</c:if>
				<a href="${pageContext.request.contextPath}/info/myInfo?mId=${Auth}"><span>${Nick}</span>님</a>
				<a href="${pageContext.request.contextPath}/auth/logout">로그아웃</a>
			</c:if>
			<c:if test="${Auth == null}">
				<a href="${pageContext.request.contextPath}/auth/login">로그인</a>
				<a href="${pageContext.request.contextPath}/member/joinIntro">회원가입</a>
			</c:if>
		</div>
	</header>

	<!----- S C R I P T ----->	
	<script>
		/* 선택한 a태그 배경 주기(갱신 때메 안 통하는 중) */
		$("#wrap a").click(function() {
			$("#wrap a").removeClass("active");
			$(this).addClass("active");
		})
	</script>
	