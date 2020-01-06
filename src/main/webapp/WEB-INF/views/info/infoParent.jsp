<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<style>
	div#form_wrap{
		width: 70%;
		margin: 20px auto;
	}
	fieldset {
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
		font-size: 13px;
		color: gray;
		margin-left: 15px;
	}
</style>

<section>
	<div id="form_wrap">
		<form action="joinUser" method="post">			
			<fieldset>
				<legend>유치원 정보</legend>
				<p>
					<label><span class="necessary">*</span>유치원 코드</label>
					<input type="text" name="kCode" data-msg="유치원 코드를 입력하세요.">
				</p>				
				<p>
					<label><span class="necessary">*</span>반 코드</label>
					<input type="text" name="cCode" data-msg="반 코드를 입력하세요.">
				</p>
			</fieldset>
			
			<fieldset>
				<legend>자녀 정보</legend>
				<p>
					<label><span class="necessary">*</span>자녀 선택</label>
					<select name="chNo" data-msg="자녀를 선택하세요.">
					
					</select>
				</p>
			</fieldset>
			
			<p>
				<input type="submit" value="등록 완료">
			</p>
		</form>
	</div>
</section>

<%@include file="../include/footer.jsp" %>