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
		width: 500px;
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
		width: 500px;
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
	}
	
	#area_wrap div.showParent{
		width: 300px;
		margin-left: 20px;
		text-align: left;
	}
</style>

<section>
	<div id="form_wrap">	
		<form>		
			<fieldset>
				<legend>가족 등록</legend>		
				<p>
					<label><span class="necessary">*</span>원아</label>
					<select id="selChild" data-msg="원아를 선택하세요.">
						<option value="">원아 선택</option>
						<c:forEach var="chVo" items="${chList}">
							<option value="${chVo.chNo}">${chVo.chName}(<fmt:formatDate value="${chVo.chRegdate}" pattern="(yyyy/MM/dd)"/>)</option>
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
					<input type="hidden" name="kNo" value="${cVo.kNo}">
				</p>
			</fieldset>
			<p id="submit">
				<input type="button" id="addFamily" value="가족 등록">
			</p>
		</form>
	</div>
	<div id="area_wrap">
		<div id="parentList">
			<c:forEach var="chVo" items="${chList}">
				<p class="showParentBtn" data-chNo="${chVo.chNo}">
					${chVo.chName}
					<fmt:formatDate value="${chVo.chRegdate}" pattern="(yyyy/MM/dd)"/>
				</p>
				<div class="showParent"></div>
			</c:forEach>
			<input type="hidden" name="chNo">
		</div>
		<button id="btnRemove">삭제</button>
	</div>
</section>
				
				
<!----- S C R I P T ----->				
<script>
	/* form 유아 선택 */
	$("#selChild").change(function() {
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
	
	/* list 유아 선택 */
	$(".showParentBtn").click(function() {
		
		var target = $(this);
		$("input[name='chNo']").val(target.attr("data-chNo"));
		
		$.ajax({
			url: "${pageContext.request.contextPath}/add/getParent",
			type: "post",
			data: JSON.stringify({"chNo" : target.attr("data-chNo")}),
			headers: {"Content-Type" : "application/json"},
			dataType:"json",
			success: function(res) {
				console.log(res);
				
				$(".showParent").empty();
				
				$(res).each(function(i, obj) {
					var $input = $("<input>").attr("type", "checkbox").attr("id", i).addClass("pNo").val(obj.pVo.pNo);
					var $label = $("<label>").attr("for", i).text(obj.pVo.mVo.mName + "(" + obj.pVo.mVo.mNickname + ")");
					var $p = $("<p>").append($input, $label);
					target.next().append($p);
				})
			},
			error: function(err) {
				console.log(err);
			}
		})				
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
			dataType:"json",
			success: function(res) {
				console.log(res);
				
				//form reset
				$("#selParent").val("");
				$("#selChild").val("");
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
			url: "${pageContext.request.contextPath}/manage/removeFamily/"+chNo,
			type: "post",
			traditional : true,
			data: JSON.stringify(pNoList),
			headers: {"Content-Type" : "application/json"},
			dataType:"json",
			success: function(res) {
				console.log(res);
			},
			error: function(err) {
				console.log(err);
			}
		})
	})
</script>	

<%@include file="../include/footer.jsp" %>