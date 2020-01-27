<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	div#container{
		overflow: hidden;
	}
	#container a#btnModify{
		float: right;
		text-decoration: underline;
	}
	#container div#info{
		margin: 100px auto 50px;
		font-size: 18px;
		clear: both;
		text-align: left;
	}
	#info span{
		font-weight: bold;
		color: #F78300;
		margin-right: 10px;
	}
	#container div.wrap{
		width: 400px;
		margin: 50px;
		float: left;
		text-align: center;
	}
	#container .wrap p.division{
		color: #A782E8;
		font-size: 18px;
		font-weight: bold;
		text-align: left;
		margin-left: 20px;
	}
	#container .wrap p.division span{
		float: right;
		margin-right: 20px;
	}
	#container .wrap p.btnManage a{
		display: inline-block;
		width: 100px;
		height: 30px;
		border: 2px solid #A782E8;
		border-radius: 10px;
		color: #A782E8;
		line-height: 30px;
		margin: 10px auto;
	}
	#container .wrap p.btnManage a:hover{
		color: #fff;
		background: #A782E8;
		text-decoration: none;
	}
	#container .wrap p{
		line-height: 50px;
	}
	#container .wrap div.listBox{
		width: 380px;
		height: 230px;
	    margin: 0 auto 30px;
	    padding: 10px;
		overflow: auto;
		border-top: 2px solid #A782E8;
		text-align: left;
		-ms-overflow-style: none;
	}
	.wrap div.listBox p{
		margin-left: 20px; 
	}
	#container a:hover {
		text-decoration: underline;
	}
	
	/* 스크롤 디자인 */	
	.listBox::-webkit-scrollbar{
		width: 20px;
		background-color: none;
	}
	.listBox::-webkit-scrollbar-thumb{
		border-radius: 10px;
		border: 5px #fff solid;
		background-color: #C596D9;
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
	    width: 17px;
	    height: 17px;
	    border: 1px solid #A782E8;
	    border-radius: 3px;
	    position: absolute;
	    left: 0;
	    top: 0;
	    margin-top: -15px;
	    opacity: .6;
	    transition: all .15s, border-color .0s;
	}
	
	#container input[type="checkbox"]:checked+label:before { /* 체크박스를 체크했을때 */
		width: 10px;
	    top: -5px;
	    left: 5px;
	    opacity: 1;
	    border-top-color: transparent;
	    border-left-color: transparent;
	    transform: rotate(45deg);
	}	
</style>

<section>
	<a href="${pageContext.request.contextPath}/teacher/manage" id="btnBack"></a>
	<div id="container">
		<h1>${cVo.cName}</h1>				
		<div id="info">
			<p class="division"><span>교사 목록 (${tList.size()}명)</span></p>
			<c:if test="${tList.size() == 0}">
				<p class="coment">등록된 교사가 없습니다.</p>
			</c:if>
			<c:forEach var="tVo" items="${tList}" varStatus="idx">
				<p>
					<span> | ${tVo.tType == 1 ? '담임' : '부담임'}</span>
					<a href="${pageContext.request.contextPath}/info/infoOther?mNo=${tVo.mVo.mNo}&kNo=${cVo.kVo.kNo}">${tVo.mVo.mName}</a>
				</p>
			</c:forEach>
		</div>
		<div class="wrap">
			<p class="division">학부모 목록<span>${pList.size()}명</span></p>
			<div class="listBox pList">
				<c:if test="${pList.size() == 0}">
					<p class="coment">등록된 학부모가 없습니다.</p>
				</c:if>
				<c:forEach var="pVo" items="${pList}" varStatus="idx">
					<p>
						<input type="checkbox" id="p${idx.index}" class="checkP" data-mNo="${pVo.mVo.mNo}">
						<label for="p${idx.index}"></label>
						<a href="${pageContext.request.contextPath}/info/infoOther?mNo=${pVo.mVo.mNo}&kNo=${cVo.kVo.kNo}">
							${pVo.mVo.mName}
						</a>
					</p>
				</c:forEach>
			</div>
			<p class="btnManage">
				<a href="${pageContext.request.contextPath}/teacher/applyPList?cNo=${cVo.cNo}">학부모 추가</a>
				<a id="btnRemoveP">학부모 삭제</a>
			</p>
		</div>
		<div class="wrap">
			<p class="division">원아 목록<span>${chList.size()}명</span></p>
			<div class="listBox chList">
				<c:if test="${chList.size() == 0}">
					<p class="coment">등록된 원아가 없습니다.</p>
				</c:if>
				<c:forEach var="chVo" items="${chList}" varStatus="idx">
					<p>
						<input type="checkbox" id="ch${idx.index}" class="checkCh" data-chNo="${chVo.chNo}">
						<label for="ch${idx.index}"></label>
						<a href="${pageContext.request.contextPath}/info/infoChild?chNo=${chVo.chNo}">${chVo.chName}(${chVo.cVo.cName})</a>
					</p>
				</c:forEach>
			</div>
			<p class="btnManage">
				<a href="${pageContext.request.contextPath}/children/add?cNo=${cVo.cNo}">원아 추가</a>
				<a id="btnRemoveCh">원아 삭제</a>
			</p>
		</div>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	/* 학부모 삭제 */
	$("#btnRemoveP").click(function() {		
		var mNoList = new Array(); //mNo를 저장할 배열
		
		$(".checkP:checked").each(function(i, obj) {
			mNoList.push($(obj).attr("data-mNo")); //리스트에 학부모 번호 저장
		});
		
		//학부모 선택 안 했을 경우
		if(mNoList.length == 0){
			alert("삭제할 학부모를 선택하세요.");
			return false;
		}
		
		var res = confirm("정말 삭제 하시겠습니까? 삭제 시 현재 유치원에 등록된 해당 학부모의 모든 정보가 삭제됩니다.");
		if(!res){
			return false;	
		}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/parent/removeT/${cVo.cNo}",
			type: "post",
			data: JSON.stringify(mNoList),
			headers: {"Content-Type" : "application/json"},
			dataType: "json",
			success: function(res) {
				console.log(res);
				
				alert("학부모가 삭제 되었습니다.");
				
				$(".pList").empty(); //기존 리스트 삭제
				
				if(res.length == 0){ //리스트가 없을 경우
					var $p = $("<p>").text("등록된 학부모가 없습니다.");
					$(".pList").append($p);
				}else{ //있을 경우
					$(res).each(function(i, obj) {
						var $p = $("<p>");								
						var $input = $("<input>").addClass("checkP").attr("id", "p"+i).attr("type", "checkbox").attr("data-mNo", obj.mVo.mNo);
						var $label = $("<label>").attr("for", "p"+i);
						var $a = $("<a>").attr("href", "${pageContext.request.contextPath}/info/infoOther?mNo=" + obj.mVo.mNo + "&kNo=${kVo.kNo}").text(obj.mVo.mName);
						
						$p.append($input).append($label).append($a);
						$(".pList").append($p);
					})//each
				}//else
			},
			error: function(err) {
				console.log(err);
			}
		}) //ajax(parent/remove)
	}) //학부모 삭제
	
	/* 원아 삭제 */
	$("#btnRemoveCh").click(function() {		
		var chNoList = new Array(); //chNo를 저장할 배열
		
		$(".checkCh:checked").each(function(i, obj) {
			chNoList.push($(obj).attr("data-chNo")); //리스트에 원아 번호 저장
		});
		
		//원아 선택 안 했을 경우
		if(chNoList.length == 0){
			alert("삭제할 원아를 선택하세요.");
			return false;
		}
		
		var res = confirm("정말 삭제 하시겠습니까? 삭제 시 해당 원아에게 등록된 모든 학부모의 정보가 함께 삭제됩니다.");
		if(!res){
			return false;	
		}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/children/removeT/${cVo.cNo}",
			type: "post",
			data: JSON.stringify(chNoList),
			headers: {"Content-Type" : "application/json"},
			dataType: "json",
			success: function(res) {
				console.log(res);
				
				alert("원아가 삭제 되었습니다.");
				
				$(".chList").empty(); //기존 리스트 삭제
				
				if(res.length == 0){ //리스트가 없을 경우
					var $p = $("<p>").text("등록된 원아가 없습니다.");
					$(".chList").append($p);
				}else{ //있을 경우
					$(res).each(function(i, obj) {
						var $p = $("<p>");								
						var $input = $("<input>").addClass("checkCh").attr("id", "ch"+i).attr("type", "checkbox").attr("data-chNo", obj.chNo);
						var $label = $("<label>").attr("for", "ch"+i);
						var $a = $("<a>").attr("href", "${pageContext.request.contextPath}/info/infoChild?chNo=" + obj.chNo).text(obj.chName + "(" + obj.cVo.cName + ")");
						$p.append($input).append($label).append($a);
						$(".chList").append($p);
					})//each
				}//else
			},
			error: function(err) {
				console.log(err);
			}
		}) //ajax(children/remove)
	}) //원아 삭제
</script>

<%@include file="../include/footer.jsp" %>