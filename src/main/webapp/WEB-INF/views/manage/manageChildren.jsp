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
				<legend>원아 정보</legend>
				<p>
					<label><span class="necessary">*</span>이름</label>
					<input type="text" name="chName" data-msg="이름을 입력하세요.">
				</p>	
				<p>
					<label><span class="necessary">*</span>생년월일</label>
					<input type="date" name="chRegdate" data-msg="생년월일을 선택하세요.">
				</p>	
			</fieldset>
			
			<p>
				<input type="submit" value="원아 등록"> <!-- 클릭 시 바로 DB에 추가 후 아래 리스트 갱신 -->
			</p>
			
			<input type="hidden" name="kNo" value="유치원 번호">
			<input type="hidden" name="cNo" value="반 번호">
		</form>
		
		<div id="childList">
			<ul>
				<li>원아이름 | 생년월일</li>
			</ul>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>