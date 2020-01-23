<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#form_wrap .tel input, #form_wrap .tel select{
		width: 110px;		
	}
</style>

<section>
	<a href="${pageContext.request.contextPath}/info/myInfo?mId=${mVo.mId}" id="btnBack"></a>
	<div id="form_wrap">
		<h1>회원 정보 수정</h1>
		<form action="modify" method="post">
			<fieldset>
				<p>
					<label><span class="necessary">*</span>타입</label>
					<select name="mType" disabled="disabled">
						<option value="">타입 선택</option>
						<option value="1">원장</option>
						<option value="2">교사</option>
						<option value="3">학부모</option>
					</select>
				</p>
				<p>
					<label><span class="necessary">*</span>아이디</label>
					<input type="text" name="mId" value="${mVo.mId}" readonly="readonly">
				</p>
				<p>
					<label><span class="necessary">*</span>성명</label>
					<input type="text" name="mName" value="${mVo.mName}" data-msg="이름을 입력하세요.">
				</p>
				<p>
					<label><span class="necessary">*</span>생년월일</label>
					<input type="date" name="mRegdate" value="<fmt:formatDate value="${mVo.mRegdate}" pattern="yyyy-MM-dd"/>"data-msg="생년월일을 선택하세요."><!-- selectbox로 만들기 -->
				</p>
				<p class="tel">
					<label><span class="necessary">*</span>연락처</label>
					<select name="mFirsttel" id="areacode">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					- <input type="tel" name="mMiddletel" value="${mVo.mMiddletel}" id="dialing" maxlength="4" size="4" data-msg="연락처를 입력하세요.">
					- <input type="tel" name="mLasttel" value="${mVo.mLasttel}" id="tel" maxlength="4" size="4" data-msg="연락처를 입력하세요.">
				</p>
				<p class="guid">
					<span class="necessary">*</span>은 필수 입력 사항입니다.
				</p>
			</fieldset>
			
			<input type="hidden" name="mNo" value="${mVo.mNo}">
			
			<p id="submit">
				<input type="submit" value="수정">
			</p>
			
			<input type="hidden" name="tType" value="0"> <!-- 교사 역할 -->
		</form>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	$("select option[value='${mVo.mType}']").attr("selected", "selected");
	$("select option[value='${mVo.mFirsttel}']").attr("selected", "selected");
	
	/* 수정 완료 시 공백 확인 */
	$("form").submit(function() {
		var res = check("input[data-msg], select[data-msg]");
		
		if(res == false){ //공백 있을 시
			return false;
		}
		
		if($("input[name='mPwd']").val() != $("input[name='mPwdCheck']").val()){ //비밀번호 불일치 시
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
	})
</script>

<%@include file="../include/footer.jsp" %>