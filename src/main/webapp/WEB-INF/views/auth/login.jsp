<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	fieldset {
		width: 70%;
		margin: 50px auto;
		padding: 20px 50px;
		background: #F2F3F5;
	}
	legend{
		padding: 0px 10px;
		font-weight: bold;
	}
	form p{
		overflow: hidden;
		line-height: 50px;
	}
	label {
		display: inline-block;
		width: 20%;
		float: left;
	}
	span.necessary{
		margin-right: 5px; 
		color: #f00;
		vertical-align: middle;
	}
	input{
		padding: 3px;
	}
	span#coment{
		font-size: 12px;
		color: gray;
		margin-left: 15px;
	}
	p.guid{
		line-height: 12px;
	    margin-top: 20px;
		font-size: 12px;
		color: gray;
		text-align: right;
	}
</style>

<section>
	<div id="form_wrap">
		<form action="loginPost" method="post">			
			<fieldset>
				<legend>로그인</legend>
				<p>
					<label>아이디</label>
					<input type="text" name="mId" data-msg="아이디를 입력하세요.">
				</p>
				<p>
					<label>비밀번호</label>
					<input type="password" name="mPwd" data-msg="비밀번호를 입력하세요.">
				</p>
			</fieldset>
			<p>
				<input type="submit" value="로그인">
			</p>
		</form>
	</div>
</section>

<!----- S C R I P T ----->
<script>	
	/* 로그인 시 공백 확인 */
	$("form").submit(function() {
		var res = check("input[data-msg], select[data-msg]");
		
		if(res == false){ //공백 있을 시
			return false;
		}
	})
</script>

<%@include file="../include/footer.jsp" %>