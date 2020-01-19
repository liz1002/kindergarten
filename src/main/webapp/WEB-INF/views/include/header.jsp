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
		min-height: 500px;
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
		padding: 5px 10px;
		border: 1px solid #FBCB00;
		background: #fff;
		color: #E3A60B;
		font-weight: bold;
		font-size: 15px;
		outline: none;
		box-shadow: 2px 2px 3px #E3A60B;
		cursor: pointer;
	}
	#submit input:hover{
		background: #FBCB00;
		box-shadow: 2px 2px 3px #777;
		color: #fff;
	}
	
	/* 일반 화면 */
	
	div#container{
		width: 800px;
		min-height: 500px;
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
		border-bottom: 5px solid #FBCB00;
		overflow: hidden;
	}
	header div h1{
		text-align: center;
		vertical-align: middle;
		line-height: 200px;
	}
	div#wrap{
		height: 100px;
		text-align: center;
		float: right;
	}
	header a{
		display: inline-block;
		padding: 0px 20px;
		font-size: 20px;
		line-height: 100px;
	}
	header a#btnHome{
		float: left;
	}
	header img{
		width: 200px;
		vertical-align: middle;
	}
	#wrap a.active{
		background: #8FDBFF;
	}
	#wrap a span{
		font-weight: bold;
	}
</style>
</head>
<body>
	<header>
		<a href="${pageContext.request.contextPath}" id="btnHome">
			<img src="${pageContext.request.contextPath}/resources/images/logo.png">
		</a>
		<div id="wrap">				
			<c:if test="${Auth != null}">				
				<c:if test="${Type == 1}">
					<!-- 원장 -->
					<a href="${pageContext.request.contextPath}/main/mainDirector" data-pick="kinder">유치원</a>
					<a href="${pageContext.request.contextPath}/manage/manageDirector" data-pick="manage">관리</a>
				</c:if>
				<c:if test="${Type == 2}">
					<!-- 교사 -->
					<a href="${pageContext.request.contextPath}" data-pick="board">게시판</a>
					<a href="${pageContext.request.contextPath}" data-pick="notice">알림장</a>
					<a href="${pageContext.request.contextPath}" data-pick="album">앨범</a>
					<a href="${pageContext.request.contextPath}" data-pick="schedule">일정표</a>
					<a href="${pageContext.request.contextPath}" data-pick="dosage">투약의뢰서</a>
					<a href="${pageContext.request.contextPath}/manage/manageTeacher" data-pick="manage">관리</a>
				</c:if>
				<c:if test="${Type == 3}">
					<!-- 학부모 -->
					<a href="${pageContext.request.contextPath}" data-pick="board">게시판</a>
					<a href="${pageContext.request.contextPath}" data-pick="notice">알림장</a>
					<a href="${pageContext.request.contextPath}" data-pick="album">앨범</a>
					<a href="${pageContext.request.contextPath}" data-pick="schedule">일정표</a>
					<a href="${pageContext.request.contextPath}" data-pick="dosage">투약의뢰서</a>
					<a href="${pageContext.request.contextPath}/manage/manageParent" data-pick="manage">관리</a>
				</c:if>
				<a href="${pageContext.request.contextPath}/info/myInfo?mId=${Auth}" data-pick="mypage"><span>${Name}</span>님</a>
				<a href="${pageContext.request.contextPath}/auth/logout" data-pick="logout">로그아웃</a>
			</c:if>
			<c:if test="${Auth == null}">
				<a href="${pageContext.request.contextPath}/auth/login" data-pick="login">로그인</a>
				<a href="${pageContext.request.contextPath}/member/join" data-pick="join">회원가입</a>
			</c:if>
		</div>
	</header>

	<!----- S C R I P T ----->	
	<script>	
		/* var pick = "${Pick}";
		$("a[data-pick='mypage']").addClass("active");
		
		//선택한 a태그 배경 주기(갱신 때메 안 통하는 중)
		$("#wrap a").click(function() {
			var pick = $(this).attr("data-pick");
			
			$.ajax({
				url: "${pageContext.request.contextPath}/" + pick,
				type: "get",
				headers: {"Content-Type" : "application/json"},
				success: function(res) {
					console.log(res);
				},
				error: function(err) {
					console.log(err);
				}
			})
		}) */
	</script>
	