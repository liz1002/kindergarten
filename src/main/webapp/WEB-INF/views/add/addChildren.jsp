<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<style>
	section h1#title{
		color: #E8B582;
		font-size: 30px;
		margin-top: 50px;
		text-align: center; 
		text-shadow: 1px 1px 2px gray;
		letter-spacing: 5px;
	}
	section #form_wrap{
		width: 600px;
		margin: 0px;
		padding: 50px;
		float: left;
	}
	#form_wrap h1, #area_wrap h1{
		margin-bottom: 30px;
	}
	#form_wrap fieldset{
		margin: 70px auto;
	}
	section #area_wrap{
		width: 400px;
		height: 100%;
		padding: 50px;
		float: left;
	}
	#area_wrap button#btnRemove{
		display: block;
		padding: 3px;
		margin: 0 auto;
		background: #E8B582;
		color: #FFF;
	}
	#area_wrap div#childList{
		height: 200px;
		text-align: center;
		clear: right;
		padding: 10px 50px;
		overflow: auto;
	}
	#area_wrap #childList p{
		text-align: left;
		margin: 10px 0px;
	}
	#area_wrap #childList p input{
		cursor: pointer;
	}
	#area_wrap #childList p label{
		margin-left: 10px;
		cursor: pointer;
	}
	#area_wrap #childList p a.detail:hover{
		text-decoration: underline;
	}
</style>

<section>
	<h1 id="title">${cVo.cName}</h1>
	<div id="form_wrap">
		<h1>원아 추가</h1>
		<form>	
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
			
			<p id="submit">
				<input type="button" id="addChild" value="추가">
			</p>
			
			<input type="hidden" name="kVo.kNo" value="${cVo.kNo}">
			<input type="hidden" name="cVo.cNo" value="${cVo.cNo}">
		</form>
	</div>
	<div id="area_wrap">
		<h1>원아 목록</h1>
		<div id="childList">
			<c:forEach var="chVo" items="${chList}" varStatus="idx">
				<p>
					<input type="checkbox" class="chNo" id="${idx.index}" value="${chVo.chNo}">
					<label for="${idx.index}">
						${chVo.chName}
						<fmt:formatDate value="${chVo.chRegdate}" pattern="(yyyy/MM/dd)"/>
					</label>
					<a href="${pageContext.request.contextPath}/info/infoChild?chNo=${chVo.chNo}" class="detail">상세</a>
				</p>
			</c:forEach>
		</div>
		<button id="btnRemove">삭제</button>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	/* 유아 추가 시 현재 화면에서 등록 처리 후 리스트 갱신 */
	$("#addChild").click(function() {
	
		//공백 확인
		var res = check("input[data-msg]");
		
		if(res == false){ //공백 있을 시
			return false;
		}
		
		var data = {
					"chName" : $("input[name='chName']").val(),
					"chRegdate" : $("input[name='chRegdate']").val(), 
					"kVo" : {"kNo" : $("input[name='kVo.kNo']").val()},
					"cVo" : {"cNo" : $("input[name='cVo.cNo']").val()}
					};
		
		$.ajax({
			url: "${pageContext.request.contextPath}/add/addChildren",
			type: "post",
			data: JSON.stringify(data),
			headers: {"Content-Type" : "application/json"},
			dataType:"json",
			success: function(res) {
				console.log(res);
				setList(res);

				 $("form").each(function() {  
			            this.reset();  
		         }); 
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
			var date = new Date(obj.chRegdate);
			var format = " (" + date.getFullYear() + "/" 
					+ ("00" + (date.getMonth() + 1)).slice(-2) + "/" 
					+ ("00" + date.getDate()).slice(-2) +")";
			
			var $input = $("<input>").attr("type", "checkbox").addClass("chNo").attr("id", i).val(obj.chNo);
			var $label = $("<label>").attr("for", i).text(obj.chName + format);
			var $p = $("<p>").append($input).append($label);
			$("#childList").append($p);
		})
	}
	
	/* 원아 삭제 */
	$("#btnRemove").click(function() {
		var chNoList = new Array();
		
		$(".chNo:checked").each(function(i, obj) {
			chNoList[i] = $(obj).val();
		})
		
		var cNo = $("input[name='cVo.cNo']").val();
		
		$.ajax({
			url: "${pageContext.request.contextPath}/manage/removeChildren/" + cNo,
			type: "post",
			data: JSON.stringify(chNoList),
			headers: {"Content-Type" : "application/json"},
			dataType:"json",
			success: function(res) {
				console.log(res);
				setList(res);
			},
			error: function(err) {
				console.log(err);
			}
		})
	})
</script>

<%@include file="../include/footer.jsp" %>