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
	}
</style>

<section>
	<a href="${pageContext.request.contextPath}/kinder/manage?kNo=${kVo.kNo}" id="btnBack"></a>
	<div id="form_wrap">
		<form action="add" method="post">
			<h1>${kVo.kName}</h1>	
			<fieldset>
				<p><input type="text" name="cName" data-msg="반 이름을 입력하세요." placeholder="반 이름"></p>	
			</fieldset>
			
			<input type="hidden" name="kVo.kNo" value="${kVo.kNo}">
			
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