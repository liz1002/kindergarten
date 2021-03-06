<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style>
	#container {
		overflow: hidden;
		position: relative;
	}	
	#container h1#title {
		float: left;
	}
	
	#container p.btns {
		margin: 10px 0;
		float: right;
		font-family: 'Poor Story', cursive;
	}
	
	#container .btns button {
		margin: 0 5px;
	}
	
	#container table {
		width: 100%;
		clear: both;
		border-collapse: collapse;
		border-top: 3px solid #ddd;
		border-bottom: 3px solid #ddd;
		font-family: 'Poor Story', cursive;
	}
	
	#container table tr:first-child th {
		border-bottom: 3px solid #ddd;
	}
	
	#container table th, #container table td {
		padding: 20px 10px;
		border-bottom: 1px solid #ddd;
		font-size: 18px;
	}
	
	#container td a {
		font-size: 15px;
		text-decoration: underline;
	}
	
	#container td.name a {
		font-weight: bold;
		font-size: 20px;
		text-decoration: none;
	}
	
	#container td.addr {
		text-align: left;
		padding-left: 30px;
	}
	
	#container td.addr span {
		color: #999;
	}
	
	/* 체크박스 디자인 */
	#container input[type="checkbox"] { /* 실제 체크박스는 화면에서 숨김 */
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip: rect(0, 0, 0, 0);
		border: 0
	}

	#container input[type="checkbox"]+label {
		display: inline-block;
		position: relative;
		cursor: pointer;
		padding-left: 30px;
	}
	
	#container input[type="checkbox"]+label:before { /* 가짜 체크박스 */
		content: ' ';
	    width: 21px;
	    height: 21px;
	    border: 1px solid #FBCB00;
	    border-radius: 3px;
	    position: absolute;
	    left: 0;
	    top: 0;
	    margin-top: -15px;
	    opacity: .6;
	    transition: all .15s, border-color .0s;
	}
	
	#container #allCheck+label:before{ /* 전체 선택 가짜 체크박스 */
	    border-width: 2px;
	}
	
	#container input[type="checkbox"]:checked+label:before { /* 체크박스를 체크했을때 */
		width: 12px;
	    top: -5px;
	    left: 5px;
	    opacity: 1;
	    border-top-color: transparent;
	    border-left-color: transparent;
	    transform: rotate(45deg);
	}		
</style>

<section>
	<a href="${pageContext.request.contextPath}/kinder/manage?kNo=${kVo.kNo}" id="btnBack"></a>
	<div id="container">
		<h1 id="title">학부모 가입 신청 목록</h1>	
		<p class="btns">
			<button id="admit">가입 승인</button>
			<button id="refuse">가입 거부</button>
		</p>
		<c:if test="${Type == 1}">	
			<table>
				<tr>
					<th colspan="5">${kVo.kName}<fmt:formatDate value="${kVo.kDate}" pattern="(yyyy)"/></th>
				</tr>
				<tr>
					<th>
						<input type="checkbox" id="allCheck">
						<label for="allCheck"></label>
					</th>
					<th>이름</th>
					<th>연락처</th>
					<th>별명</th>	
					<th>반·자녀</th>		
				</tr>
			<c:if test="${paList.size() == 0}">
				<tr>
					<td colspan="5">가입 신청한 학부모가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="paVo" items="${paList}" varStatus="idx">
				<tr class="paList">
					<td>
						<input type="checkbox" class="check" id="${idx.index}"
								data-mNo="${paVo.mVo.mNo}" data-chNo="${paVo.chVo.chNo}" data-pNickname="${paVo.pNickname}">
															
						<label for="${idx.index}"></label>
					</td>
					<td>${paVo.mVo.mName}</td>
					<td>${paVo.mVo.mFirsttel}-${paVo.mVo.mMiddletel}-${paVo.mVo.mLasttel}</td>
					<td>${paVo.pNickname}</td>
					<td>${paVo.chVo.cVo.cName}·${paVo.chVo.chName}</td>
				</tr>
			</c:forEach>
			</table>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	/* 전체 선택 */
	$("#allCheck").change(function() {
		$(".check").prop("checked", $(this).prop("checked"));
	})

	/* 가입 승인 */
	$("#admit").click(function() {		
		var pList = new Array(); //pVo 객체를 저장할 배열
		
		$(".check:checked").each(function(i, obj) {
			var pVo = { 
					"mVo" : {
						"mNo" : $(obj).attr("data-mNo")
					},
					"chVo" : {
						"chNo" : $(obj).attr("data-chNo")
					},
					"pNickname" : $(obj).attr("data-pNickname")
			}//pVo 객체 생성
			
			pList.push(pVo); //리스트에 저장
		});
		
		//학부모 선택 안 했을 경우
		if(pList.length == 0){
			alert("가입 승인할 학부모를 선택하세요.");
			return false;
		}
		
		var res = confirm("가입을 승인 하시겠습니까?");
		if(!res){
			return false;
		}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/director/admitP/${kVo.kNo}",
			type: "post",
			data: JSON.stringify(pList),
			headers: {"Content-Type" : "application/json"},
			dataType: "json",
			success: function(res) {
				console.log(res);
				
				alert("가입이 승인되었습니다.");
				
				$("tr.paList").remove(); //기존 리스트 삭제
				getList(res);//리스트 새로 생성
			},
			error: function(err) {
				console.log(err);
			}
		}) //ajax(director/admit)
		
	})
	
	/* 가입 거절 */
	$("#refuse").click(function() {		
		var paList = new Array(); //paVo 객체를 저장할 배열
		
		$(".check:checked").each(function(i, obj) {
			var paVo = { 
					"mVo" : {
						"mNo" : $(obj).attr("data-mNo")
					},
					"chVo" : {
						"chNo" : $(obj).attr("data-chNo")
					}
			}//paVo 객체 생성
			
			paList.push(paVo); //리스트에 저장
		});
		
		//학부모 선택 안 했을 경우
		if(paList.length == 0){
			alert("가입 거부할 학부모를 선택하세요.");
			return false;
		}

		var res = confirm("가입을 거절 하시겠습니까?");
		if(!res){
			return false;	
		}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/director/refuseP/${kVo.kNo}",
			type: "post",
			data: JSON.stringify(paList),
			headers: {"Content-Type" : "application/json"},
			dataType: "json",
			success: function(res) {
				console.log(res);

				alert("가입이 거부되었습니다.");
				
				$("tr.paList").remove(); //기존 리스트 삭제
				getList(res);//리스트 새로 생성
			},
			error: function(err) {
				console.log(err);
			}
		}) //ajax(director/refuse)
	})

	function getList(list) {
		if(list.length == 0){ //신청 대기 학부모가 없을 경우
			var $tr = $("<tr>").html("<td colspan='5'>가입 신청한 학부모가 없습니다.</td>");
			$("table").append($tr);
			$("#allCheck").prop("checked", false);
		}else{ //있을 경우
			$(list).each(function(i, obj) {
				var $tr = $("<tr>").addClass("paList");
				
				//input td
				var $inputTd = $("<td>");
				var $input = $("<input>").addClass("check").attr("id", i).attr("type", "checkbox").attr("data-mNo", obj.mVo.mNo)
										.attr("data-chNo", obj.chVo.chNo).attr("data-pNickname", obj.pNickname);
				
				var $label = $("<label>").attr("for", i);
				$inputTd.append($input).append($label);
								
				//name td
				var $nameTd = $("<td>").text(obj.mVo.mName);
				
				//tel td
				var $telTd = $("<td>").text(obj.mVo.mFirsttel + "-" + obj.mVo.mMiddletel + "-" + obj.mVo.mLasttel);
			
				//nickname td
				var $nicknameTd = $("<td>").text(obj.pNickname);

				//chName td
				var $chNameTd = $("<td>").text(obj.chVo.cVo.cName + "·" + obj.chVo.chName);
				
				//테이블에 추가
				$tr.append($inputTd).append($nameTd).append($telTd).append($nicknameTd).append($chNameTd);
				$("table").append($tr);
			})//each
		}//else
	}
</script>

<%@include file="../include/footer.jsp" %>