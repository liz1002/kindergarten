<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<style>
	
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
			</fieldset>			
			<p id="submit">
				<input type="submit" value="등록">
			</p>
			
			<input type="hidden" name="kVo.kNo">
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
	
	/* 가입 완료 시 공백 확인 */
	$("form").submit(function() {
		var res = check("input[data-msg], select[data-msg]");
		
		if(res == false){ //공백 있을 시
			return false;
		}
	})
</script>

<%@include file="../include/footer.jsp" %>