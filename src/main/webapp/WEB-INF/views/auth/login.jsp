<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@include file="../include/header.jsp" %>
<style>
	body{
		background: #F2F2F2;
	}
	#form_wrap h1{
		color: #C596D9;
	}
	#form_wrap fieldset{
		text-align: center;
	}
	#form_wrap label{
		color: #BE8EBF;
	} 
	#form_wrap #failMsg{
		min-height: 20px;
		color: #D91E1E;
		font-size: 14px;
	}
	#form_wrap #btnOverlap{
		color: #BE8EBF;
		border: 1px solid #BE8EBF;
	}
	#form_wrap #btnOverlap:hover{
		color: #fff;
		background: #BE8EBF;
	}
	#form_wrap input{
	    width: 380px;
	}
	#form_wrap select{
	    width: 400px;
	}
	#form_wrap #tel input, #form_wrap #tel select{
		width: 110px;		
	}
	#form_wrap #submit input{
	    width: 400px;
		background: #EDC4F2;
		border: 1px solid #BE8EBF;
		box-shadow: 2px 2px 3px #C596D9;
		color: #fff;
	}
	#form_wrap #submit input:hover{
		background: #EDC4F2;
	}
	#form_wrap span.error{
		margin-left: 140px;
		color: #D91E1E;
		font-size: 14px;
		display: none;
	}
	div#function{
		width: 700px;
		margin: 20px auto 100px;
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
	<div id="form_wrap">
		<h1>로그인</h1>
		<form action="loginPost" method="post">
			<fieldset>
				<p>
					<input type="text" name="mId" data-msg="아이디를 입력하세요." placeholder="아이디">
				</p>
				<p>
					<input type="password" name="mPwd" data-msg="비밀번호를 입력하세요." placeholder="비밀번호">
				</p>
			</fieldset>
			
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

	<!----- S C R I P T ----->
	<script>
		/* 가입 완료 시 공백 확인 */
		$("form").submit(function() {
			var res = check("input[data-msg]");
			
			if(res == false){ //공백 있을 시
				return false;
			}
		})
	</script>
</body> 
</html>