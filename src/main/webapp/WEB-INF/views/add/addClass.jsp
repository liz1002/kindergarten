<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#form_wrap fieldset{
		border: none;
		text-align: center;
	}
	#form_wrap fieldset input{
		width: 200px;
		height: 30px;
		padding: 5px 10px;
	}
</style>

<section>
	<div id="form_wrap">
		<form action="addClass" method="post">
			<h1>${kVo.kName}</h1>	
			<fieldset>
				<p><input type="text" name="cName" data-msg="반 이름을 입력하세요." placeholder="반 이름"></p>	
			</fieldset>
			
			<p id="submit">
				<input type="submit" value="추가">
			</p>
			
			<input type="hidden" name="kNo" value="${kVo.kNo}">
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
		if($(this).val() == 2){ //부담임
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
	});
	
	/* 가입 완료 시 공백 확인 */
	$("form").submit(function() {
		var res = check("input[data-msg]");
		
		if(res == false){ //공백 있을 시
			return false;
		}
	})
</script>

<%@include file="../include/footer.jsp" %>