<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<section>
	<div id="form_wrap">
		<form action="modifyClass" method="post">	
			<fieldset>
				<legend>유치원 정보</legend>
				<p>
					<label><span class="necessary">*</span>유치원 코드</label>
					<input type="text" value="${kVo.kCode}" readonly="readonly">
					<button type="button" id="btnKCode">코드확인</button>
				</p>	
				<p>
					<label><span class="necessary">*</span>유치원 이름</label>
					<input type="text" readonly="readonly" value="${kVo.kName}">
				</p>
			</fieldset>
			
			<fieldset>
				<legend>반 정보</legend>
				<p>
					<label><span class="necessary">*</span>역할</label>
					<select name="tType" data-msg="역할을 선택하세요.">
						<option value="" selected="selected">선택</option>
						<option value="1">담임</option>
						<option value="2">부담임</option>
					</select>			
				</p>	
				<p id="subTeacher">
					<label><span class="necessary">*</span>반 코드</label>
					<input type="text" name="cCode" value="${cVo.cCode}">
					<button type="button" id="btnCCode">코드확인</button>
				</p>	
				<p>
					<label><span class="necessary">*</span>반 이름</label>
					<input type="text" name="cVo.cName" data-msg="반 이름을 입력하세요." value="${cVo.cName}">
				</p>		
			</fieldset>
			
			<p id="submit">
				<input type="submit" value="수정">
			</p>
			
			<input type="hidden" name="cVo.cNo" value="${cVo.cNo}">
			<input type="hidden" name="mVo.mNo" value="${tVo.mVo.mNo}">
		</form>
	</div>
	
</section>

<!----- S C R I P T ----->
<script>
	/* 역할 자동 선택 */
	$("option[value='${tVo.tType}']").attr("selected", "selected");
	checkType(${tVo.tType});	
	
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
						$("input[name='cVo.cName']").val(res.vo.cName);
						$("input[name='cVo.cNo']").val(res.vo.cNo);
					}
				},
				error: function(err) {
					console.log(err);
				}
			})
		}
	})
	
	/* 교사 역할 선택 시 */
	$("select[name='tType']").change(function() {
		checkType($(this).val());
	});
	
	
	/* 교사 역할에 따라 변경 */
	function checkType(type) {
		if(type == 2){ //부담임
			$("#subTeacher").css("display", "block");
			$("input[name='cVo.cName']").attr("readonly", "readonly").attr("placeholder", "반 코드로 추가");
			$("input[name='cCode']").attr("data-msg", "반 코드를 입력하세요.");
			$("input[name='cVo.cNo']").removeAttr("disabled");
		}else{ //담임
			$("#subTeacher").css("display", "none");
			$("input[name='cVo.cName']").removeAttr("readonly placeholder");
			$("input[name='cCode']").removeAttr("data-msg");
			$("input[name='cVo.cNo']").attr("disabled", "disabled");
		}
	}
	
	
	/* 가입 완료 시 공백 확인 */
	$("form").submit(function() {
		var res = check("input[data-msg], select[data-msg]");
		
		if(res == false){ //공백 있을 시
			return false;
		}
	})
</script>

<%@include file="../include/footer.jsp" %>