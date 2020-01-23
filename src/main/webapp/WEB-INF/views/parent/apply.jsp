<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	input#kName{
		width: 295px;
	}
	#form_wrap .list_box{
		width: 400px;
		max-height: 200px;
		padding-bottom: 30px;
		margin: 0 auto;
	 	text-align: left;
	 	overflow: auto;
	}
	#form_wrap ul.list{
		margin-left: 20px;
	}
	#form_wrap ul.list li{
	 	line-height: 30px;
	 	list-style: circle inside;
	 	cursor: pointer;
	}
	#form_wrap ul.list li:hover{
		text-decoration: underline;
	}
	#form_wrap .list_box p{
		font-weight: bold;
		color: #FBCB00;
	 	text-align: left;
	 	text-indent: 20px;
	 	margin: 0;
	}
</style>

<section>
	<a href="${pageContext.request.contextPath}/parent/manage" id="btnBack"></a>
	<div id="form_wrap">	
		<h1>가입 신청</h1>
		<form action="apply" method="post">		
			<fieldset>
				<legend>유치원 선택</legend>		
				<p>
					<label><span class="necessary">*</span>유치원</label>
					<input type="text" id="kName" placeholder="유치원 이름">
					<button type="button" id="btnSearch">검색</button>
				</p>
				<p>
					<label><span class="necessary"></span></label>
					<input type="text" name="kName" placeholder="유치원을 검색해주세요." data-msg="유치원을 선택하세요." readonly="readonly" maxlength="20">
				</p>
				<div id="kList_box" class="list_box">
					<p id="kComent"></p>
					<ul id="kList" class="list"></ul>
				</div>				
			</fieldset>
			<fieldset>
				<legend>반 선택</legend>
				<p>
					<label><span class="necessary">*</span>반</label>
					<input type="text" name="cName" id="cName" placeholder="반을 선택해주세요." data-msg="반을 선택하세요." readonly="readonly">
					<br><span id="coment">클릭 시 재선택</span>
				</p>
				<div id="cList_box" class="list_box">
					<p id="cComent"></p>
					<ul id="cList" class="list"></ul>
				</div>	
			</fieldset>
			<fieldset>
				<legend>자녀 선택</legend>
				<p>
					<label><span class="necessary">*</span>자녀</label>
					<input type="text" name="chName" id="chName" placeholder="자녀를 선택해주세요." data-msg="자녀를 선택하세요." readonly="readonly">		
				</p>
				<div id="chList_box" class="list_box">
					<p id="chComent"></p>
					<ul id="chList" class="list"></ul>
				</div>
			</fieldset>
			<fieldset>	
				<legend>내 정보</legend>
				<p>
					<label><span class="necessary">*</span>별명</label>
					<input type="text" name="pNickname" data-msg="별명을 입력하세요." placeholder="최대 10글자" maxlength="10">
					<br><span id="coment">[예시] 엘사 맘, 안나 아빠 등</span>
				</p>

				<p class="guid">
					<span class="necessary">*</span>은 필수 입력 사항입니다.
				</p>
			</fieldset>
			
			<input type="hidden" name="mVo.mNo" value="${mNo}">
			<input type="hidden" name="chVo.chNo">
			
			<p id="submit">
				<input type="submit" value="추가">
			</p>
		</form>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	var kNo = 0;
	var cNo = 0;

   /* 유치원 검색 */
   $("#btnSearch").click(function() {
		var kName = $("#kName").val();
		
		if(kName == ""){
			alert("검색하실 유치원 이름을 입력하세요.");
			return false;
		}
		
		//유치원 리스트 생성
		$.ajax({
			url: "${pageContext.request.contextPath}/parent/selectKinder/" + kName,
			type: "get",
			headers: {"Content-Type" : "application/json"},
			dataType:"json",
			success: function(res) {
				console.log(res);
				
				$("#kList").empty();
				
				if(res.length == 0){
					$("#kComent").text("검색된 유치원이 없습니다.");
				}else{
					$("#kComent").text("가입하실 유치원을 선택하세요.");
					
					$(res).each(function(i, obj) {
						var date = new Date(obj.kDate);
						var $li = $("<li>").text("[" + date.getFullYear() + "] " + obj.kName + "(" + obj.kFirstaddr + ")").attr("data-kNo", obj.kNo);
						$("#kList").append($li);
					})
				}
			},
			error: function(err) {
				console.log(err);
			}
		})
	})
	
	/* 유치원 선택 시 */
	$(document).on("click", "#kList li", function() {
		kNo = $(this).attr("data-kNo");
			
		$("input[name='kName']").val($(this).text());
		$("input[name='cName']").val("");
		$("#kName").val("");
		$("#kComent").text("");
		$("#kList").empty();  
		
		//반 리스트 생성
		$.ajax({
			url: "${pageContext.request.contextPath}/parent/selectClass/" + kNo,
			type: "get",
			headers: {"Content-Type" : "application/json"},
			dataType:"json",
			success: function(res) {
				console.log(res);
				
				$("#cList").empty();
				
				if(res.length == 0){
					$("#cComent").text("등록된 반이 없습니다.");
				}else{
					$("#cComent").text("가입하실 반을 선택하세요.");
					
					$(res).each(function(i, obj) {
						var $li = $("<li>").text(obj.cName).attr("data-cNo", obj.cNo);
						$("#cList").append($li);
					})
				}
			},
			error: function(err) {
				console.log(err);
			}
		})
	})
	
	/* 반 선택 시 */
	$(document).on("click", "#cList li", function() {
		cNo = $(this).attr("data-cNo");
		$("input[name='cName']").val($(this).text());
		$("input[name='chName']").val("");
		$("#cComent").text("");
		$("#cList").empty(); 
		
		//자녀 리스트 생성
		$.ajax({
			url: "${pageContext.request.contextPath}/parent/selectChildren/" + cNo,
			type: "get",
			headers: {"Content-Type" : "application/json"},
			dataType:"json",
			success: function(res) {
				console.log(res);
				
				$("#chList").empty();
				
				if(res.length == 0){
					$("#chComent").text("등록된 원아가 없습니다.");
				}else{
					$("#chComent").text("자녀를 선택하세요.");
					
					$(res).each(function(i, obj) {
						var date = new Date(obj.chRegdate);
						var dateStr = " (" + date.getFullYear() + "/" 
										+ ("00" + (date.getMonth() + 1)).slice(-2) + "/" 
										+ ("00" + date.getDate()).slice(-2) +")";
						var $li = $("<li>").text(obj.chName + dateStr).attr("data-chNo", obj.chNo);
						$("#chList").append($li);
					})
				}
			},
			error: function(err) {
				console.log(err);
			}
		})		
	})
	 
	/* 반 재선택 시 */
	$("#cName").click(function() {
		
		if($(this).val() == ""){ //반을 선택한 적 없는 경우
			return false;
		}
		
		//반 리스트 다시 생성
		$.ajax({
			url: "${pageContext.request.contextPath}/parent/selectClass/" + kNo,
			type: "get",
			headers: {"Content-Type" : "application/json"},
			dataType:"json",
			success: function(res) {
				console.log(res);
				
				$("#cList").empty();
				
				if(res.length == 0){
					$("#cComent").text("등록된 반이 없습니다.");
				}else{
					$("#cComent").text("가입하실 반을 선택하세요.");
					
					$(res).each(function(i, obj) {
						var $li = $("<li>").text(obj.cName).attr("data-cNo", obj.cNo);
						$("#cList").append($li);
					})
				}
			},
			error: function(err) {
				console.log(err);
			}
		})
	})
	
	/* 자녀 선택 시 */
	$(document).on("click", "#chList li", function() {
		var chNo = $(this).attr("data-chNo");
		$("input[name='chName']").val($(this).text());
		$("input[name='chVo.chNo']").val(chNo);
		$("#chComent").text("");
		$("#chList").empty();	
	})
	
	/* 자녀 재선택 시 */
	$("#chName").click(function() {
		
		if($(this).val() == ""){ //자녀를 선택한 적 없는 경우
			return false;
		}
		
		//자녀 리스트 다시 생성
		$.ajax({
			url: "${pageContext.request.contextPath}/parent/selectChildren/" + cNo,
			type: "get",
			headers: {"Content-Type" : "application/json"},
			dataType:"json",
			success: function(res) {
				console.log(res);
				
				$("#chList").empty();
				
				if(res.length == 0){
					$("#chComent").text("등록된 원아가 없습니다.");
				}else{
					$("#chComent").text("자녀를 선택하세요.");
					
					$(res).each(function(i, obj) {
						var date = new Date(obj.chRegdate);
						var dateStr = " (" + date.getFullYear() + "/" 
										+ ("00" + (date.getMonth() + 1)).slice(-2) + "/" 
										+ ("00" + date.getDate()).slice(-2) +")";
						var $li = $("<li>").text(obj.chName + dateStr).attr("data-chNo", obj.chNo);
						$("#chList").append($li);
					})
				}
			},
			error: function(err) {
				console.log(err);
			}
		})	
	})
	  
	/* 등록 완료 시 공백 확인 */
	$("form").submit(function() {
		var res = check("input[data-msg], select[data-msg]");
		
		if(res == false){ //공백 있을 시
			return false;
		}
		
		if(regRes == false){ //형식 틀릴 시
			alert("올바르지 않은 형식입니다.");
			return false;
		}
	})
</script>
    
<%@include file="../include/footer.jsp" %>