<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#form_wrap h1{
		text-align: center;
		margin-bottom: 50px;
	}
	#form_wrap h3{
		margin-bottom: 20px;
		text-align: center;
	}
	fieldset {
		width: 50%;
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
	div#childList{
		text-align: center;
	}
	p#parentList{
	}
	#parentList span.parents{
		margin: 0 5px;
		padding: 2px;
		border: 1px dashed gray;
	}
	#parentList .parents button.btnRemove{
		margin: 2px;
		background: none;
		border: none;
	}
</style>

<section>
	<%@include file="../include/manageMenu.jsp" %>
	<div id="form_wrap">
		<h1>${cVo.cName}</h1>
		<h3>원아 관리</h3>
		<form action="registCh" method="post">	
			<fieldset>
				<legend>원아 정보</legend>
				<p>
					<label><span class="necessary">*</span>이름</label>
					<input type="text" name="chName" data-msg="이름을 입력하세요.">
				</p>	
				<p>
					<label><span class="necessary">*</span>생년월일</label>
					<input type="date" name="chRegdate" data-msg="생년월일을 선택하세요.">
				</p>
			</fieldset>
			
			<p>
				<input type="button" id="addChild" value="원아 추가">
			</p>
			
			<input type="hidden" name="kVo.kNo" value="${cVo.kNo}">
			<input type="hidden" name="cVo.cNo" value="${cVo.cNo}">
		</form>
		
		
		<h3>원아 목록</h3>
		<div id="childList">
			<c:forEach var="chVo" items="${chList}">
				<p>
					<a href="">X</a>
					<a href="${pageContext.request.contextPath}/info/infoChild?chNo=${chVo.chNo}">${chVo.chName}</a>
				</p>
			</c:forEach>
		</div>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	/* 유아 추가 시 현재 화면에서 등록 처리 후 리스트 갱신 */
	$("#addChild").click(function() {
		var data = {
					"chName" : $("input[name='chName']").val(),
					"chRegdate" : $("input[name='chRegdate']").val(), 
					"kVo" : {"kNo": $("input[name='kVo.kNo']").val()},
					"cVo" : {"cNo" :$("input[name='cVo.cNo']").val()}
					};
		
		$.ajax({
			url: "${pageContext.request.contextPath}/manage/registCh",
			type: "post",
			data: JSON.stringify(data),
			headers: {"Content-Type" : "application/json"},
			dataType:"json",
			success: function(res) {
				console.log(res);
				setList(res);
				$("input[name='chName']").val("");
				$("input[name='chRegdate']").val("");
			},
			error: function(err) {
				console.log(err);
			}
		})
	})	
	
	function setList(list) {
		//리스트 갱신
		$("#childList").empty();
		$(list).each(function(i, obj) {
			var $aName = $("<a>").attr("href", "${pageContext.request.contextPath}/info/infoChild?chNo=" + obj.chNo).text(obj.chName);
			var $aBtn = $("<a>").attr("href", "${pageContext.request.contextPath}/info/infoChild?chNo=" + obj.chNo).text("X")
			var $p = $("<p>").append($aBtn, " ", $aName);
			$("#childList").append($p);
		})
	}
</script>

<%@include file="../include/footer.jsp" %>