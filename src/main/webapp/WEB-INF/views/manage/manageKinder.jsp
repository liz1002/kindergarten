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
		<form action="registK" method="post">	
			<fieldset>
				<legend>유치원 정보</legend>
				<p>
					<label><span class="necessary">*</span>유치원 이름</label>
					<input type="text" name="kVo.kName" data-msg="이름을 입력하세요.">
				</p>
				<p>
					<label><span class="necessary">*</span>유치원 연락처</label>
					<input type="text" name="kVo.kTel"><!-- select + text로 변경 -->
				</p>
				<p>
					<label><span class="necessary">&numsp;</span>주소</label>
					<input type="text" name="kVo.kAddress">
				</p>
				<p class="guid">
					<span class="necessary">*</span>은 필수 입력 사항입니다.
				</p>
			</fieldset>
			
			<p>
				<input type="submit" value="등록 완료">
			</p>
			
			<input type="hidden" name="mVo.mNo" value="${mNo}">
		</form>
	</div>
</section>

<!----- S C R I P T ----->
<script>		
	/* 등록 완료 시 공백 확인 */
	$("form").submit(function() {
		var res = check("input[data-msg]");
		
		if(res == false){ //공백 있을 시
			return false;
		}
	})
</script>

<%@include file="../include/footer.jsp" %>