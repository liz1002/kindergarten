<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#form_wrap fieldset{
		text-align: center;
	}
	#form_wrap fieldset input{
		width: 200px;
		height: 30px;
		padding: 5px 10px;
</style>

<section>
	<a href="${pageContext.request.contextPath}/class/manage?cNo=${cVo.cNo}" id="btnBack"></a>
	<div id="form_wrap">
		<form action="add" method="post">
			<h1>${cVo.cName}</h1>	
			<fieldset>
				<p>
					<input type="text" name="chName" data-msg="이름을 입력하세요." placeholder="이름">
				</p>	
				<p>
					<input type="date" name="chRegdate" data-msg="생년월일을 선택하세요." placeholder="생년월일">
				</p>
			</fieldset>
			
			<input type="hidden" name="kVo.kNo" value="${cVo.kVo.kNo}">
			<input type="hidden" name="cVo.cNo" value="${cVo.cNo}">
			
			<p id="submit">
				<input type="submit" value="추가">
			</p>
		</form>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	/* 가입 완료 시 공백 확인 */
	$("form").submit(function() {
		var res = check("input[data-msg]");
		
		if(res == false){ //공백 있을 시
			return false;
		}
	})
</script>

<%@include file="../include/footer.jsp" %>