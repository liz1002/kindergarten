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
		<form action="joinD" method="post">	
			<fieldset>
				<legend>회원 정보</legend>
				<p>
					<label><span class="necessary">*</span>타입</label>
					<select name="mType">
						<option value="1" selected="selected">원장</option>
					</select>
				</p>
				<p>
					<label><span class="necessary">*</span>아이디</label>
					<input type="text" name="mId" data-msg="아이디를 입력하세요.">
					<button type="button" id="btnOverlap">중복확인</button>
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
					<input type="text" name="mName" data-msg="이름을 입력하세요.">
				</p>
				<p>
					<label><span class="necessary">*</span>생년월일</label>
					<input type="date" name="mRegdate" data-msg="생년월일을 선택하세요."><!-- selectbox로 만들기 -->
				</p>
				<p>
					<label><span class="necessary">&numsp;</span>연락처</label>
					<input type="tel" name="mTel"><!-- select + text로 변경 -->
				</p>
				<p>
					<label><span class="necessary">*</span>별명</label>
					<input type="text" name="mNickname" data-msg="별명을 입력하세요.">
					<span id="coment"> [예시] 무지개 원장, 은하수유치원 원장 등</span><!-- 컨트롤러에서 유치원+원장으로 자동 생성하고 폼에서 없애기 -->
				</p>
				<p class="guid">
					<span class="necessary">*</span>은 필수 입력 사항입니다.
				</p>
			</fieldset>
			
			<fieldset>
				<legend>유치원 정보</legend>
				<p>
					<label><span class="necessary">*</span>유치원 이름</label>
					<input type="text" name="kName" data-msg="이름을 입력하세요.">
				</p>
				<p>
					<label><span class="necessary">*</span>유치원 연락처</label>
					<input type="text" name="kTel"><!-- select + text로 변경 -->
				</p>
				<p>
					<label><span class="necessary">&numsp;</span>주소</label>
					<input type="text" name="kAddress">
				</p>
				<p class="guid">
					<span class="necessary">*</span>은 필수 입력 사항입니다.
				</p>
			</fieldset>
			
			<p>
				<input type="submit" value="등록 완료">
			</p>
			
			<!-- <input type="hidden" name="tType" value="0"> 교사 역할 -->
		</form>
	</div>
</section>

<!----- S C R I P T ----->
<script>	
	var checkRes = false; //중복 확인 여부
	
	/* 중복 확인 */
	$("#btnOverlap").click(function() {
		var target = $("input[name='mId']");

		if(check(target) == false){
			return false;
		}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/member/overlap",
			type: "get",
			data: {"mId" : target.val()},
			headers: {"Content-Type" : "application/json"},
			dataType:"text",
			success: function(res) {
				console.log(res);
				if(res == "false"){
					checkRes = false;
					alert("사용할 수 없는 아이디입니다.");
				}else{
					checkRes = true;
					alert("사용 가능한 아이디입니다.");
				}
			},
			error: function(err) {
				console.log(err);
			}
		})
	})
	
	/* 아이디 변경 시 중복 확인 여부 초기화 */
	$("input[name='mId']").change(function() {
		checkRes = false;
	})
	
	/* 가입 완료 시 공백 확인 */
	$("form").submit(function() {
		var res = check("input[data-msg], select[data-msg]");
		
		if(res == false){ //공백 있을 시
			return false;
		}
		
		if(checkRes == false){ //아이디 중복 확인 안 했을 시
			alert("아이디 중복 확인을 해주세요.");
			return false;
		}
		
		if($("input[name='mPwd']").val() != $("input[name='mPwdCheck']").val()){ //비밀번호 불일치 시
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
	})
</script>

<%@include file="../include/footer.jsp" %>