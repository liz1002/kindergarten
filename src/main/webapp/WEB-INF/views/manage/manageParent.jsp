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
		<form action="registP" method="post">			
			<fieldset>
				<legend>유치원 정보</legend>
				<p>
					<label><span class="necessary">*</span>유치원 코드</label>
					<input type="text" name="kCode" data-msg="유치원 코드를 입력하세요.">
					<button type="button" id="btnKCode">코드확인</button>
				</p>
				<p>
					<label><span class="necessary">*</span>유치원 이름</label>
					<input type="text" name="kName" readonly="readonly" data-msg="유치원을 선택하세요." placeholder="유치원 코드로 추가">
				</p>				
				<p>
					<label><span class="necessary">*</span>반 코드</label>
					<input type="text" name="cCode" data-msg="반 코드를 입력하세요.">
					<button type="button" id="btnCCode">코드확인</button>
				</p>
				<p>
					<label><span class="necessary">*</span>반 이름</label>
					<input type="text" name="cName" data-msg="반 이름을 입력하세요." placeholder="반 코드로 추가">
				</p>	
			</fieldset>			
			<p>
				<input type="submit" value="등록">
			</p>
			
			<input type="hidden" name="kVo.kNo">
			<input type="hidden" name="cVo.cNo">
			<input type="hidden" name="mVo.mNo" value="${mNo}">
		</form>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	/* 유치원 코드 확인 */
	$("#btnKCode").click(function() {
		$("input[name='kName']").val("");
		
		var target = $("input[name='kCode']");
		 
		if(check(target) == false){
			return false;
		}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/manage/kCodeCheck",
			type: "get",
			data: {"kCode" : target.val()},
			headers: {"Content-Type" : "application/json"},
			dataType:"json",
			success: function(res) {
				console.log(res);
				if(res.msg == "no"){
					alert("존재하지 않는 유치원 코드입니다.");
				}else{
					alert("확인되었습니다. 유치원 이름을 확인하세요.");
					$("input[name='kName']").val(res.vo.kName);
					$("input[name='kVo.kNo']").val(res.vo.kNo);
				}
			},
			error: function(err) {
				console.log(err);
			}
		})
	})
	
	/* 반 코드 확인 */
	$("#btnCCode").click(function() {
		$("input[name='cName']").val("");
		
		var target = $("input[name='cCode']");
		 
		if(check(target) == false || check($("input[name='kCode']")) == false){
			return false;
		}else{
		
			$.ajax({
				url: "${pageContext.request.contextPath}/manage/cCodeCheck",
				type: "get",
				data: {"cCode" : target.val()},
				headers: {"Content-Type" : "application/json"},
				dataType:"json",
				success: function(res) {
					console.log(res);
					if(res.msg == "no"){
						alert("존재하지 않는 반 코드입니다.");
					}else{
						alert("확인되었습니다. 반 이름을 확인하세요.");
						$("input[name='cName']").val(res.vo.cName);
						$("input[name='cVo.cNo']").val(res.vo.cNo);
					}
				},
				error: function(err) {
					console.log(err);
				}
			})
			
		}
	})
	
	/* 가입 완료 시 공백 확인 */
	$("form").submit(function() {
		var res = check("input[data-msg], select[data-msg]");
		
		if(res == false){ //공백 있을 시
			return false;
		}
	})
</script>

<%@include file="../include/footer.jsp" %>