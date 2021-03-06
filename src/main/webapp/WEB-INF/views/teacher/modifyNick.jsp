<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<section>
	<a href="${pageContext.request.contextPath}/teacher/manage" id="btnBack"></a>
	<div id="form_wrap">
		<form action="modifyNick" method="post">	
			<fieldset>
				<legend>별명 수정</legend>
				<p>
					<label><span class="necessary">*</span>별명</label>
					<input type="text" name="tNickname" value="${tVo.tNickname}" data-msg="별명을 입력하세요." placeholder="최대 10글자" maxlength="10"><br>
					<span id="coment">[예시] 기역반 담임, 니은반 부담임 등</span>
				</p>
				<p class="guid">
					<span class="necessary">*</span>은 필수 입력 사항입니다.
				</p>
			</fieldset>

			<input type="hidden" name="tNo" value="${tVo.tNo}">
			
			<p id="submit">
				<input type="submit" value="수정">
			</p>
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