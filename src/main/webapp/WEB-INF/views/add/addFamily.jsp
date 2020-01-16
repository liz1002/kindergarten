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
	#area_wrap div#parentList{
		height: 200px;
		text-align: center;
		clear: right;
		padding: 10px 50px;
		overflow: auto;
	}
	#area_wrap p.showParentBtn{
		text-align: left;
		margin: 10px 0px;
		cursor: pointer;
	}
	#area_wrap p.showParentBtn:hover{
		font-weight: bold;
	}
	#area_wrap p.selShowParentBtn{ /* 선택된 원아 이름  */
		font-weight: bold;
		background: #fff;
	}
	#area_wrap div.showParent{
		width: 300px;
		text-align: left;
	}
	.showParent input, .showParent label{
		margin-left: 10px;
		cursor: pointer;
	}
</style>

<section>
	<h1 id="title">${cVo.cName}</h1>
	<div id="form_wrap">	
		<h1>가족 추가</h1>
		<form>		
			<fieldset>
				<legend>가족 등록</legend>		
				<p>
					<label><span class="necessary">*</span>원아</label>
					<select id="selChild" data-msg="원아를 선택하세요.">
						<option value="">원아 선택</option>
						<c:forEach var="chVo" items="${chList}">
							<option value="${chVo.chNo}">${chVo.chName}<fmt:formatDate value="${chVo.chRegdate}" pattern="(yyyy/MM/dd)"/></option>
						</c:forEach>
					</select>
				</p>
				<p>
					<label><span class="necessary">*</span>학부모</label>
					<select id="selParent" data-msg="학부모를 선택하세요.">
						<option value="">학부모 선택</option>
						<c:forEach var="pVo" items="${pList}">
							<option value="${pVo.mVo.mNo}">${pVo.mVo.mNickname}</option>
						</c:forEach>
					</select>
				</p>
			</fieldset>
			<p id="submit">
				<input type="button" id="addFamily" value="가족 등록">
			</p>
			
			<input type="hidden" name="chNo">
			<input type="hidden" name="kNo" value="${cVo.kNo}">
		</form>
	</div>
	<div id="area_wrap">
		<h1>가족 목록</h1>
		<div id="parentList">
			<c:forEach var="chVo" items="${chList}">
				<p class="showParentBtn" data-chNo="${chVo.chNo}">
					${chVo.chName}
					<fmt:formatDate value="${chVo.chRegdate}" pattern="(yyyy/MM/dd)"/>
				</p>
				<div class="showParent"></div>
			</c:forEach>
		</div>
		<button id="btnRemove">삭제</button>
	</div>
</section>
				
				
<!----- S C R I P T ----->				
<script>
	/* form 원아 선택 */
	$("#selChild").change(function() {
		if($(this).val() == ""){
			$(".pList").remove();
			return false;
		}
		
		var data = {"chNo" : $(this).val(), 
					"kVo" : {"kNo" : $("input[name='kNo']").val()}};
		
		$.ajax({
			url: "${pageContext.request.contextPath}/add/getNotParent",
			type: "post",
			data: JSON.stringify(data),
			headers: {"Content-Type" : "application/json"},
			dataType:"json",
			success: function(res) {
				console.log(res);
				
				$(".pList").remove();
				$(res).each(function(i, obj) {
					var $option = $("<option>").val(obj.pVo.pNo).text(obj.pVo.mVo.mName + "(" + obj.pVo.mVo.mNickname + ")").addClass("pList");
					$("#selParent").append($option);
				})
			},
			error: function(err) {
				console.log(err);
			}
		})
	})
	
	/* list 원아 선택 */
	$(".showParentBtn").click(function() {
		var target = $(this);
		
		$(".showParentBtn").removeClass("selShowParentBtn"); //모든 원아에게서 클래스 삭제
		target.addClass("selShowParentBtn"); //선택한 원아에게만 클래스 추가
		
		//이미 선택된 원아면(selShowParentBtn 클래스가 있으면) 부모리스트 펼치기 / 없으면 닫기
		if(($(this).attr("class")).indexOf("selShowParentBtn") > 0){
			$("input[name='chNo']").val(target.attr("data-chNo")); //선택한 원아 번호 저장
			$(".showParent").empty(); //모든 부모 리스트 닫기
			
			$.ajax({
				url: "${pageContext.request.contextPath}/add/getParent",
				type: "post",
				data: JSON.stringify({"chNo" : target.attr("data-chNo")}),
				headers: {"Content-Type" : "application/json"},
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					if($(res).size() == 0){
						var $p = $("<p>").text("등록된 학부모가 없습니다.");
						target.next().append($p);
					}
					
					$(res).each(function(i, obj) {
						var $input = $("<input>").attr("type", "checkbox").attr("id", i).addClass("pNo").val(obj.pVo.pNo);
						var $label = $("<label>").attr("for", i).text(obj.pVo.mVo.mName + "(" + obj.pVo.mVo.mNickname + ")");
						var $p = $("<p>").append($input).append($label);
						target.next().append($p);
					})
				},
				error: function(err) {
					console.log(err);
				}
			})		
		} else{
			target.next().empty(); //선택한 원아의 부모 리스트 닫기
			$("input[name='chNo']").val(""); //선택한 원아 번호 삭제
		}
	})
	
	/* 가족 등록 */
	$("#addFamily").click(function() {
		//공백 확인
		var res = check("select[data-msg]");
		
		if(res == false){ //공백 있을 시
			return false;
		}
		
		var data = {"pVo" : {"pNo" : $("#selParent").val()}, 
					"chVo" : {"chNo" : $("#selChild").val()}};
		
		$.ajax({
			url: "${pageContext.request.contextPath}/add/addFamily",
			type: "post",
			data: JSON.stringify(data),
			headers: {"Content-Type" : "application/json"},
			success: function(res) {
				console.log(res);
				
				//form reset 
				$("select").val("").prop("selected", true);
				$(".pList").remove();
				
			},
			error: function(err) {
				console.log(err);
			}
		})
	})
	
	/* 선택한 가족 삭제 */
	$("#btnRemove").click(function() {
		var pNoList = new Array();
		
		$(".pNo:checked").each(function(i, obj) {
			pNoList[i] = $(obj).val();
		})
		
		var chNo = $("input[name='chNo']").val();
		
		$.ajax({
			url: "${pageContext.request.contextPath}/manage/removeFamily/" + chNo,
			type: "post",
			data: JSON.stringify(pNoList),
			headers: {"Content-Type" : "application/json"},
			success: function(res) {
				console.log(res);
				
				//현재 선택된 원아 재클릭
				$(".selShowParentBtn").click(); 
			},
			error: function(err) {
				console.log(err);
			}
		})
	})
</script>	

<%@include file="../include/footer.jsp" %>