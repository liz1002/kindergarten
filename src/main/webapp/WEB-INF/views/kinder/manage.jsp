<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<!-- manage Kinder -->

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
	<a href="${pageContext.request.contextPath}/director/manage" id="btnBack"></a>
	<div id="container">
		<h1>${kVo.kName}<fmt:formatDate value="${kVo.kDate}" pattern="(yyyy)"/></h1>				
		<div id="info">
			<p><span> | 주소</span> ${kVo.kFirstaddr} ${kVo.kLastaddr}</p>
			<p><span> | 연락처</span> ${kVo.kAreacode}-${kVo.kDialing}-${kVo.kTel}</p>
		</div>
		<div class="wrap">
			<p class="division">반 리스트<span>${cList.size()}개</span></p>
			<div class="listBox cList">
				<c:if test="${cList.size() == 0}">
					<p class="coment">등록된 반이 없습니다.</p>
				</c:if>
				<c:forEach var="cVo" items="${cList}" varStatus="idx">
					<p>
						<input type="checkbox" id="c${idx.index}" class="checkC" data-cNo="${cVo.cNo}">
						<label for="c${idx.index}"></label>
						<a href="${pageContext.request.contextPath}/info/infoClass?cNo=${cVo.cNo}">${cVo.cName}</a>
					</p>
				</c:forEach>
			</div>
			<p class="btnManage">
				<a href="${pageContext.request.contextPath}/class/add?kNo=${kVo.kNo}">반 추가</a>
				<a id="btnRemoveC">반 삭제</a>
			</p>
		</div>
		<div class="wrap">
			<p class="division">교사 리스트<span>${tList.size()}명</span></p>
			<div class="listBox tList">
				<c:if test="${tList.size() == 0}">
					<p class="coment">등록된 교사가 없습니다.</p>
				</c:if>
				<c:forEach var="tVo" items="${tList}" varStatus="idx">
					<p>
						<input type="checkbox" id="t${idx.index}" class="checkT" data-tNo="${tVo.tNo}">
						<label for="t${idx.index}"></label>
						<a href="${pageContext.request.contextPath}/info/infoOther?mNo=${tVo.mVo.mNo}&kNo=${tVo.kVo.kNo}"> 
							${tVo.mVo.mName}
						</a>
					</p>
				</c:forEach>
			</div>
			<p class="btnManage">
				<a href="${pageContext.request.contextPath}/director/applyTList?kNo=${kVo.kNo}">교사 추가</a>
				<a id="btnRemoveT">교사 삭제</a>
			</p>
		</div>
		<div class="wrap">
			<p class="division">학부모 리스트<span>${pList.size()}명</span></p>
			<div class="listBox pList">
				<c:if test="${pList.size() == 0}">
					<p class="coment">등록된 학부모가 없습니다.</p>
				</c:if>
				<c:forEach var="pVo" items="${pList}" varStatus="idx">
					<p>
						<input type="checkbox" id="p${idx.index}" class="checkP" data-pNo="${pVo.pNo}">
						<label for="p${idx.index}"></label>
						<a href="${pageContext.request.contextPath}/info/infoOther?mNo=${pVo.mVo.mNo}&kNo=${kVo.kNo}">
							${pVo.mVo.mName}
						</a>
					</p>
				</c:forEach>
			</div>
			<p class="btnManage">
				<a href="${pageContext.request.contextPath}/director/applyPList?kNo=${kVo.kNo}">학부모 추가</a>
				<a id="btnRemoveP">학부모 삭제</a>
			</p>
		</div>
		<div class="wrap">
			<p class="division">원아 리스트<span>${chList.size()}명</span></p>
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
				<a id="btnRemoveCh">원아 삭제</a>
			</p>
		</div>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	/* 반 삭제 */
	$("#btnRemoveC").click(function() {
		var res = confirm("정말 삭제 하시겠습니까? 삭제 시 현재 목록에서 사라지며 해당 반의 커뮤니티에 접근이 불가능하게 됩니다."); /* 교사나 학부모한테 리스트에는 나타나고 클릭하면 삭제된 반이라고 안내 */
		if(!res){
			return false;	
		}
		
		var cNoList = new Array(); //cNo를 저장할 배열
		
		$(".checkC:checked").each(function(i, obj) {
			cNoList.push($(obj).attr("data-cNo")); //리스트에 반 번호 저장
		});
		
		//반 선택 안 했을 경우
		if(cNoList.length == 0){
			alert("삭제할 반을 선택하세요.");
			return false;
		}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/class/remove/${kVo.kNo}",
			type: "post",
			data: JSON.stringify(cNoList),
			headers: {"Content-Type" : "application/json"},
			dataType: "json",
			success: function(res) {
				console.log(res);
				
				alert("반이 삭제 되었습니다.");
				
				$(".cList").empty(); //기존 리스트 삭제
				
				if(res.length == 0){ //리스트가 없을 경우
					var $p = $("<p>").text("등록된 반이 없습니다.");
					$(".cList").append($p);
				}else{ //있을 경우
					$(res).each(function(i, obj) {
						var $p = $("<p>");
						var $input = $("<input>").addClass("checkC").attr("id", "c"+i).attr("type", "checkbox").attr("data-cNo", obj.cNo);
						var $label = $("<label>").attr("for", "c"+i);
						var $a = $("<a>").attr("href", "${pageContext.request.contextPath}/info/infoClass?cNo=" + obj.cNo).text(obj.cName);
						
						$p.append($input).append($label).append($a);
						$(".cList").append($p);
					})//each
				}//else
			},
			error: function(err) {
				console.log(err);
			}
		}) //ajax(class/remove)
	}) //반 삭제
	
	/* 교사 삭제 */
	$("#btnRemoveT").click(function() {
		var res = confirm("정말 삭제 하시겠습니까? 삭제 시 현재 유치원에 등록된 해당 교사의 모든 정보가 삭제됩니다.");
		if(!res){
			return false;	
		}
		
		var tNoList = new Array(); //tNo를 저장할 배열
		
		$(".checkT:checked").each(function(i, obj) {
			tNoList.push($(obj).attr("data-tNo")); //리스트에 교사 번호 저장
		});
		
		//교사 선택 안 했을 경우
		if(tNoList.length == 0){
			alert("삭제할 교사를 선택하세요.");
			return false;
		}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/teacher/remove/${kVo.kNo}",
			type: "post",
			data: JSON.stringify(tNoList),
			headers: {"Content-Type" : "application/json"},
			dataType: "json",
			success: function(res) {
				console.log(res);
				
				alert("교사가 삭제 되었습니다.");
				
				$(".tList").empty(); //기존 리스트 삭제
				
				if(res.length == 0){ //리스트가 없을 경우
					var $p = $("<p>").text("등록된 교사가 없습니다.");
					$(".tList").append($p);
				}else{ //있을 경우
					$(res).each(function(i, obj) {
						var $p = $("<p>");								
						var $input = $("<input>").addClass("checkT").attr("id", "p"+i).attr("type", "checkbox").attr("data-tNo", obj.tNo);
						var $label = $("<label>").attr("for", "p"+i);
						var $a = $("<a>").attr("href", "${pageContext.request.contextPath}/info/infoOther?mNo=" + obj.mVo.mNo).text(obj.mVo.mName);
						
						$p.append($input).append($label).append($a);
						$(".tList").append($p);
					})//each
				}//else
			},
			error: function(err) {
				console.log(err);
			}
		}) //ajax(teacher/remove)
	}) //교사 삭제
</script>

<%@include file="../include/footer.jsp" %>