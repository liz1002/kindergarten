<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>키즈 다이어리</title>

<!-- All style -->
<style>
	@import url('https://fonts.googleapis.com/css?family=Cute+Font|Gaegu|Jua|Poor+Story&display=swap');
	@font-face { font-family: 'CookieRunOTF-Bold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/CookieRunOTF-Bold00.woff') format('woff'); font-weight: normal; font-style: normal; }
	
	/* 
		font-family: 'Jua', sans-serif; 동글동글한 굵은 글씨
		font-family: 'Gaegu', cursive; 손편지(약간 삐뚤)
		font-family: 'Cute Font', cursive; 노트필기
		font-family: 'Poor Story', cursive; 중간 고딕 스타일 
		font-family: 'CookieRunOTF-Bold', sans-serif; 굵은 고딕체
	*/
	
	*{
		margin: 0;
		padding: 0;
	}
	section{
		width: 1200px;
		margin: 0 auto;
		overflow: hidden;
		position: relative;
	}
	section a#btnBack{
		display: inline-block;
		width: 70px;
		height: 70px;
		background: url("${pageContext.request.contextPath}/resources/images/yy.png") center no-repeat;
		position: absolute;
		top: -10px;
		left: 10px;
	    z-index: 100;
	}
	ul{
		list-style: none;
	}
	a{
		text-decoration: none;
		color: #000;
	}
	::-webkit-scrollbar{
		width: 12px;
		background-color: none;
	}
	::-webkit-scrollbar-thumb{
		border-radius: 5px;
		background-color: #FBCB00;
	}
	
	/* 폼 화면 */
	div#form_wrap{
		width: 1100px;
		margin: 0 auto;
		text-align: center;
	}
	#form_wrap h1{
		margin: 0 auto 50px;
		line-height: 70px;
		text-shadow: 1px 1px 2px #999;
		letter-spacing: 5px;
		color: #FBCB00; 
		font-size: 40px;
		font-family: 'CookieRunOTF-Bold', sans-serif;
	}
	#form_wrap fieldset{
		width: 60%;
		margin: 20px auto;
		padding: 0 50px;
		border: none;
		text-align: left;
	}
	#form_wrap legend{
		padding: 10px;
		font-weight: bold;
	}
	#form_wrap label{
		display: inline-block;
		width: 20%;
		float: left;
		text-align: left;
		line-height: 50px;
	}
	#form_wrap p{
		overflow: hidden;
		line-height: 50px;
		margin: 20px 0; 
	}
	#form_wrap span.necessary{
		margin-right: 5px; 
		color: #f00;
		vertical-align: middle;
	}
	#form_wrap input, #form_wrap select, #form_wrap textarea{
		width: 380px;
	    height: 50px;
	    padding: 0 0 0 20px;
	    font-size: 15px;
		outline-color: #FBCB00;
		font-size: 15px;
	}
	#form_wrap select{
	    width: 400px;
	}
	#form_wrap textarea{
		width: 600px;
		height: 200px; 
	}
	#form_wrap button{
		width: 80px;
		height: 50px;
		font-size: 15px;
		outline: none;
		border: 1px solid #FBCB00;
		color: #FBCB00;
		background: #fff;
	}
	#form_wrap button:hover{
		color: #fff;
		background: #FBCB00;
	}
	#form_wrap span#coment{
		font-size: 12px;
		color: gray;
		text-align: left;
		margin-left: 140px;
	}
	#form_wrap p.guid{
	    margin-top: 20px;
		font-size: 12px;
		color: gray;
		text-align: right;
	}
	#form_wrap p#submit{
		text-align: center;
	}
	#form_wrap #submit input{
		padding: 5px 10px;
		margin: 10px;
		border: 1px solid #FBCB00;
		background: #fff;
		color: #FBCB00;
		font-weight: bold;
		font-size: 18px;
		font-family: 'Poor Story', cursive;
		letter-spacing: 10px;
		box-shadow: 2px 2px 3px #E3A60B;
		outline: none;
		cursor: pointer;
	}
	#form_wrap #submit input:hover{
		box-shadow: 2px 2px 3px #777;
		color: #fff;
		background: RGBA(251, 203, 0, 0.8);
	}
	
	/* 일반 화면 */	
	div#container{
		width: 1000px;
		/* min-height: 500px; */ /* 01/21 10:38수정 */
		padding: 50px;
		margin: 0 auto;
		text-align: center;
	}
	#container h1{
		margin: 0 auto 20px;
		line-height: 70px;
		text-shadow: 1px 1px 2px #999;
		letter-spacing: 5px;
		color: #FBCB00; 
		font-size: 40px;
		font-family: 'CookieRunOTF-Bold', sans-serif;
	}
	#container button{
		padding: 16px 10px;
		background: #fff;
		font-size: 17px;
		font-weight: bold;
		font-family: 'Poor Story', cursive;
		color: #FBCB00;
		background: #fff;
		border: 1px solid #FBCB00;
		outline: none;
		cursor: pointer;
	}
	#container button:hover{
		color: #fff;
		background: #FBCB00;
	}
</style>

<!-- script -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/formCheck.js"></script>

<style>
	header{
		width: 1200px;
		margin: 0 auto 50px;
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
		padding: 0px 20px;
		font-size: 20px;
		line-height: 100px;
		font-family: 'Jua', sans-serif;
	}
	header a#btnHome{
		float: left;
	}
	header img{
		width: 200px;
		vertical-align: middle;
	}
	#wrap a.active{
		color: #DC0203;
		font-weight: bold;
	}
	#wrap a span{
		color: #FBCB00;
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
					<a href="${pageContext.request.contextPath}/board/mainD" data-pick="board">게시판</a>
					<a href="${pageContext.request.contextPath}/album/mainD" data-pick="album">앨범</a>
					<a href="${pageContext.request.contextPath}/director/manage" data-pick="manage">유치원 관리</a>
					<a href="${pageContext.request.contextPath}/info/myInfo?mId=${Auth}" data-pick="mypage">
						<span>${Name}</span>원장님
					</a>
				</c:if>
				<c:if test="${Type == 2}">
					<!-- 교사 -->
					<a href="${pageContext.request.contextPath}/board/main?cNo=0" data-pick="board">게시판</a>
					<a href="${pageContext.request.contextPath}/notice/main" data-pick="notice">알림장</a>
					<a href="${pageContext.request.contextPath}/album/main?cNo=0" data-pick="album">앨범</a>
					<a href="${pageContext.request.contextPath}" data-pick="schedule">일정표</a>
					<a href="${pageContext.request.contextPath}" data-pick="dosage">투약의뢰서</a>
					<a href="${pageContext.request.contextPath}/teacher/manage" data-pick="manage">유치원 관리</a>
					<a href="${pageContext.request.contextPath}/info/myInfo?mId=${Auth}" data-pick="mypage">
						<span>${Name}</span><b>선생님</b>
					</a>
				</c:if>
				<c:if test="${Type == 3}">
					<!-- 학부모 -->
					<a href="${pageContext.request.contextPath}/board/main?cNo=0" data-pick="board">게시판</a>
					<a href="${pageContext.request.contextPath}/notice/parent" data-pick="notice">알림장</a>
					<a href="${pageContext.request.contextPath}/album/main?cNo=0" data-pick="album">앨범</a>
					<a href="${pageContext.request.contextPath}" data-pick="schedule">일정표</a>
					<a href="${pageContext.request.contextPath}" data-pick="dosage">투약의뢰서</a>
					<a href="${pageContext.request.contextPath}/parent/manage" data-pick="manage">유치원 관리</a>
					<a href="${pageContext.request.contextPath}/info/myInfo?mId=${Auth}" data-pick="mypage">
						<span>${Name}</span><b>학부모님</b>
					</a>
				</c:if>
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
		$("a[data-pick='${Pick}']").addClass("active"); //선택된 a태그에 class 추가
		
		//선택한 a태그의 pick 값을 session에 저장
		$("#wrap a").click(function(e) {
			e.preventDefault(); //이동 막기
			
			var href = $(this).attr("href");
			var pick = $(this).attr("data-pick");
			
			$.ajax({
				url: "${pageContext.request.contextPath}/" + pick,
				type: "get",
				headers: {"Content-Type" : "application/json"},
				success: function(res) {
					console.log(res);
					location.href=href;
				},
				error: function(err) {
					console.log(err);
				}
			})
		})
	</script>
	