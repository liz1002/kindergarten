<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<!-- addKinder -->

<section>
	<div id="form_wrap">
		<form action="addKinder" method="post">	
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
			
			<p id="submit">
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