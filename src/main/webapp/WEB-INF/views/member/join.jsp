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
</style>

<section>
	<div id="form_wrap">
		<form action="login" method="post">			
			<fieldset>
				<legend>회원 정보</legend>
				<p>
					<label><span class="necessary">*</span>아이디</label>
					<input type="text" name="mId" data-msg="아이디를 입력하세요.">
					<button type="button">중복확인</button>
				</p>
				<p>
					<label><span class="necessary">*</span>비밀번호</label>
					<input type="password" name="mPwd" data-msg="비밀번호를 입력하세요.">
				</p>
				<p>
					<label><span class="necessary">*</span>비밀번호 확인</label>
					<input type="password" name="mPwdCheck" data-msg="비밀번호 확인을 입력하세요.">
				</p>
				<p>
					<label><span class="necessary">*</span>성명</label>
					<input type="text" name="" data-msg="">
				</p>
				<p>
					<label><span class="necessary">*</span>생년월일</label>
					<input type="date" name="mRegdate" data-msg="생년월일을 선택하세요."><!-- selectbox로 만들기 -->
				</p>
				<p>
					<label><span class="necessary">&nbsp;&nbsp;</span>연락처</label>
					<input type="tel" name="" data-msg=""><!-- select + text로 변경 -->
				</p>
				<p>
					<label><span class="necessary">*</span>별명</label>
					<input type="text" name="mNickname" data-msg="별명을 입력하세요.">
					<button type="button">별명 자동 생성</button><!-- 클릭 시 선택한 반+원아 이름 -->
				</p>
				<p>
					<label><span class="necessary">*</span>타입</label>
					<select name="mType" data-msg="타입을 선택하세요.">
						<option value="">타입 선택</option>
						<option value="1">원장</option>
						<option value="2">교사</option>
						<option value="3">학부모</option>
					</select>
					
					
					<!-- 타입 교사 선택 시 추가  / disabled 변경-->
					<select name="tType" disabled="disabled">
						<option value="">역할 선택</option>
						<option value="1">담임</option>
						<option value="2">부담임</option>
					</select>
				</p>
			</fieldset>
			
			<!-- 타입 원장 선택 시 추가 -->
			<fieldset>
				<legend>유치원 정보</legend>
				<p>
					<label><span class="necessary">*</span>유치원 이름</label>
					<input type="text" name="kName" data-msg="이름을 입력하세요.">
				</p>
				<p>
					<label><span class="necessary">*</span>연락처</label>
					<input type="text" name="kTel" data-msg="연락처를 입력하세요."><!-- select + text로 변경 -->
				</p>
				<p>
					<label><span class="necessary">*</span>주소</label>
					<input type="text" name="kAddress" data-msg="주소를 입력하세요.">
				</p>
				
			</fieldset>
			
			<fieldset>
				<legend>자녀 정보</legend>
				<p>
					<label><span class="necessary">*</span>유치원</label>
					<input type="text" name="kNo" data-msg="유치원을 선택하세요.">
					<button type="button">검색</button>
				</p>
				<p>
					<label><span class="necessary">*</span>반</label>
					<select name="cNo" data-msg="반을 선택하세요.">
					</select>
				</p>
				<p>
					<label><span class="necessary">*</span>자녀 이름</label>
					<input type="text" name="chName" data-msg="이름을 입력하세요.">
				</p>
				<p>
					<label><span class="necessary">*</span>자녀 생년월일</label>
					<input type="date" name="chRegdate" data-msg="생년월일을 선택하세요."><!-- selectbox로 만들기 -->
				</p>
			</fieldset>
		</form>
	</div>
</section>

<%@include file="../include/footer.jsp" %>