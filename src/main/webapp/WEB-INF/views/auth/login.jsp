<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	body{
		background: #F2F2F2;  
	}
	div#logo{
		width: 1200px;
		margin: 150px auto 20px;
		text-align: center;
	}
	#logo img{
		width: 500px;
	}
	div#form_wrap{
		width: 1200px; 
		margin: 0 auto;
	}
	#form_wrap #failMsg{
		min-height: 20px;
		color: #D91E1E;
		font-size: 14px;
	}
	#form_wrap p{
	    text-align: center;
	}
	#form_wrap input{
	    width: 380px;
	    height: 50px;
	    margin: 10px;
	    padding-left: 20px;
	    font-size: 15px;
	}
	input::placeholder{
	    color: #C596D9;
	}
	#form_wrap #submit input{
	    width: 400px;
	    height: 50px;
		padding: 5px 10px;
		border: 1px solid #C596D9;
		background: #EDC4F2;
		color: #fff;
		font-weight: bold;
		font-size: 15px;
		outline: none;
		box-shadow: 2px 2px 3px #C596D9;
		cursor: pointer;
	}
	 #form_wrap #submit input:hover{
		background: #C596D9;
		box-shadow: 2px 2px 3px #777;
		color: #fff;
	}
	div#function{
		width: 1200px;
		margin: 20px auto;
		text-align: center;
	}
	#function hr{
		width: 400px;
		margin: 10px auto;
	}
	#function p{
		height: 20px;
	}
	#function a{
		margin: 0 5px;
		color: #999;
		text-decoration: none;
		line-height: 20px;
	}
	#function img{
		width: 20px;
		height: 20px;
		line-height: 20px;
	}
</style>
</head>
<body>
	<div id="logo">
		<a href="${pageContext.request.contextPath}" id="btnHome">
			<img src="${pageContext.request.contextPath}/resources/images/logo.png">
		</a>
	</div>
	<div id="form_wrap">
		<form action="loginPost" method="post">
				<p>
					<input type="text" name="mId" data-msg="아이디를 입력하세요." placeholder="아이디">
				</p>
				<p>
					<input type="password" name="mPwd" data-msg="비밀번호를 입력하세요." placeholder="비밀번호">
				</p>
			
			<p id="submit">
				<input type="submit" value="로그인">
			</p>
		</form>
		<p id="failMsg">
			<c:if test="${fail == 'fail'}">
				아이디 또는 비밀번호가 올바르지 않습니다.
			</c:if>
		</p>
	</div>
	<div id="function">
		<hr>
		<p>
			<a href="${pageContext.request.contextPath}/member/join">
				<img src="${pageContext.request.contextPath}/resources/images/join.png">
				회원가입
			</a>
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/images/find.png">
				아이디찾기
			</a>
			<a href="">
				<img src="${pageContext.request.contextPath}/resources/images/lock.png">
				비밀번호찾기
			</a>
		</p>
	</div>
</body> 
</html>