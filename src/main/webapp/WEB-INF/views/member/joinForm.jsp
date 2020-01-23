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
	#form_wrap .tel input, #form_wrap .tel select{
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

<section>
	<div id="form_wrap">
		<h1>회원가입</h1>
		<form action="join" method="post">		
			<fieldset>
				<p>
					<label><span class="necessary">*</span>타입</label>
					<select name="mType" data-msg="타입을 선택하세요.">
						<option value="" selected="selected">타입 선택</option>
						<option value="1">원장</option>
						<option value="2">교사</option>
						<option value="3">학부모</option>
					</select>
				</p>
				<p>
					<label><span class="necessary">*</span>아이디</label>
					<input type="text" name="mId" data-msg="아이디를 입력하세요." placeholder="영어 소문자 및 숫자 6~12자리">
					<button type="button" id="btnOverlap">중복확인</button><br>
					<span class="error">아이디 형식이 올바르지 않습니다.</span>
				</p>
				<p>
					<label><span class="necessary">*</span>비밀번호</label>
					<input type="password" name="mPwd" data-msg="비밀번호를 입력하세요." placeholder="영어 대소문자 및 숫자 8~20자리">
					<span class="error">비밀번호 형식이 올바르지 않습니다.</span>
				</p>
				<p>
					<label><span class="necessary">*</span>비밀번호 확인</label>
					<input type="password" name="mPwdCheck" data-msg="비밀번호 확인을 입력하세요.">
				</p>
				<p>
					<label><span class="necessary">*</span>성명</label>
					<input type="text" name="mName" data-msg="이름을 입력하세요." placeholder="한글 2~5자리">
					<span class="error">이름 형식이 올바르지 않습니다.</span>
				</p>
				<p>
					<label><span class="necessary">*</span>생년월일</label>
					<input type="date" name="mRegdate" data-msg="생년월일을 선택하세요."><!-- selectbox로 만들기 -->
				</p>
				<p class="tel">
					<label><span class="necessary">*</span>연락처</label>
					<select name="mFirsttel" id="areacode">
						<option value="010" selected="selected">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					- <input type="tel" name="mMiddletel" id="dialing" maxlength="4" size="4" data-msg="연락처를 입력하세요." placeholder="숫자 3~4자리">
					- <input type="tel" name="mLasttel" id="tel" maxlength="4" size="4" data-msg="연락처를 입력하세요." placeholder="숫자 4자리">
					<br><span class="error">연락처 형식이 올바르지 않습니다.</span>
				</p>
				<p class="guid">
					<span class="necessary">*</span>은 필수 입력 사항입니다.
				</p>
			</fieldset>
			
			<p id="submit">
				<input type="submit" value="가입">
			</p>
		</form>
	</div>
	<div id="function">
		<hr>
		<p>
			<a href="${pageContext.request.contextPath}/auth/login">
				<img src="${pageContext.request.contextPath}/resources/images/join.png">
				로그인
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
</section>

<!----- S C R I P T ----->
<script>	

	/* 형식 확인 */
	var regRes = true;
	
	//아이디
	$("input[name='mId']").change(function() {		
		var idReg = /^[a-z|0-9]{6,12}$/;
		regRes = idReg.test($(this).val());
		if(!regRes){
			$(this).next().next().next().css("display", "inline");
		}else{
			$(this).next().next().next().css("display", "none");
		}
	})

	//비밀번호
	$("input[name='mPwd']").change(function() {		
		var pwdReg = /^[a-z|0-9]{8,20}$/i;
		regRes = pwdReg.test($("input[name='mPwd']").val());
		if(!regRes){
			$(this).next().css("display", "inline");
		}else{
			$(this).next().css("display", "none");
		}
	})

	//이름
	$("input[name='mName']").change(function() {		
		var nameReg = /^[가-힣]{2,5}$/;
		regRes = nameReg.test($("input[name='mName']").val());
		if(!regRes){
			$(this).next().css("display", "inline");
		}else{
			$(this).next().css("display", "none");
		}
	})


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
					$("input[name='mId']").val("").focus();
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
	
	/* 가입 완료 시 확인 */
	$("form").submit(function() {
		var res = check("input[data-msg], select[data-msg]");

		//공백 확인
		if(res == false){ //공백 있을 시
			return false;
		}
		
		if(!checkRes){ //아이디 중복 확인 안 했을 시
			alert("아이디 중복 확인을 해주세요.");
			return false;
		}
		
		if($("input[name='mPwd']").val() != $("input[name='mPwdCheck']").val()){ //비밀번호 불일치 시
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}

		if(regRes == false){ //형식 틀릴 시
			alert("올바르지 않은 형식입니다.");
			return false;
		}
	
	})
</script>

<%@include file="../include/footer.jsp" %>