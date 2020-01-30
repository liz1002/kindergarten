<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#container{
		overflow: hidden;
	}
	#container p.tabs{
		float: left;
		line-height: 50px;
		font-family: 'Poor Story', cursive;
	}
	#container .tabs a{
		display: inline-block;
		padding: 4px 12px;
		background: #fff;
		color: #FBCB00;
		font-size: 20px;
		font-weight: bold;
		border: 1px solid #FBCB00;
		outline: none;
	}
	#container p#active a{
		background: #FBCB00;
		color: #fff;
	}
	#container p.btns{
		float: right;
		margin-top: 10px;
		line-height: 30px;
		font-family: 'Poor Story', cursive;
	}
	#container .btns a{
		display: inline-block;
		padding: 2px 10px;
		background: #fff;
		color: #FBCB00;
		font-size: 17px;
		font-weight: bold;
		border: 1px solid #FBCB00;
		outline: none;
	}
	#container .btns a:hover {
		background: #FBCB00;
		color: #fff;
	}
	#container table{
		width: 100%;
		clear: both;
		border-collapse: collapse;
		border-top: 3px solid #FBCB00;
		border-bottom: 3px solid #ddd;
		font-family: 'Poor Story', cursive;
	}
	#container table th, #container table td{
		padding: 20px 10px;
		border-bottom: 1px solid #ddd;
		font-size: 18px;
	}
	#container td a{
		font-size: 15px;
		text-decoration: underline;
	}
	#container td.name a{
		font-weight: bold;
		font-size: 20px;
		text-decoration: none;
	}
	#container td.addr{
		text-align: left;
		padding-left: 30px;
	}
	#container td.addr span{
		color: #999;
	}
	
	/* 삭제된 유치원 or 반에 대한 스타일 */
	#container table tr.unused{
		background: #eee;
	}	
	#container p#coment{
		margin-top: 50px;
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
	<div id="container">
		<p class="tabs" id="active"><a href="${pageContext.request.contextPath}/teacher/manage">유치원 목록</a></p>
		<p class="tabs"><a href="${pageContext.request.contextPath}/teacher/applyList?mNo=${mNo}">신청 목록</a></p>
		<p class="btns"><a href="${pageContext.request.contextPath}/teacher/apply?mNo=${mNo}">유치원 가입</a></p>
		
		<c:if test="${Type == 2}">	
			<table>
				<tr>
					<th>대표설정</th>
					<th>유치원</th>
					<th>등록연도</th>
					<th>주소</th>
					<th>연락처</th>
					<th>반·역할</th>
					<th>별명</th>
					<th>수정·관리</th>
					<th>탈퇴</th>					
				</tr>
			<c:if test="${tList.size() == 0}">
				<tr>
					<td colspan="9">가입한 유치원이 없습니다. 유치원 가입 후 이용해주세요.</td>
				</tr>
			</c:if>
			<c:forEach var="tVo" items="${tList}" varStatus="idx">
				<tr ${tVo.kVo.kUse == 1 || tVo.cVo.cUse == 1? 'class=unused' : ''}>
					<td>
						<input type="checkbox" class="check" id="${idx.index}" value="${tVo.tNo}" ${tVo.tMain == 1 ? 'checked=checked' : ''}>
						<label for="${idx.index}"></label>
					</td>					
					<td class="name">
						<a href="${pageContext.request.contextPath}/board/main?mNo=${mNo}&cNo=${tVo.cVo.cNo}"> <!-- 게시판 이동 -->
							${tVo.kVo.kName}	
						</a>
					</td>
					<td>
						<fmt:formatDate value="${tVo.kVo.kDate}" pattern="yyyy"/>
					</td>
					<td class="addr">
						<span>${tVo.kVo.kZipcode}</span><br>
						${tVo.kVo.kFirstaddr}<br>
						${tVo.kVo.kLastaddr}
					</td>
					<td>${tVo.kVo.kAreacode}-${tVo.kVo.kDialing}-${tVo.kVo.kTel}</td>
					<td>
						${tVo.cVo.cName}·<c:if test="${tVo.tType == 1}">담임</c:if><c:if test="${tVo.tType == 2}">부담임</c:if>
					</td>
					<td>
						<br>${tVo.tNickname}<br>
						<a href="${pageContext.request.contextPath}/teacher/modifyNick?tNo=${tVo.tNo}">수정</a>
					</td>
					<td>
						<span class="btnManage"><a href="${pageContext.request.contextPath}/class/modify?cNo=${tVo.cVo.cNo}">수정</a></span>
						<span class="btnManage"><a href="${pageContext.request.contextPath}/class/manage?cNo=${tVo.cVo.cNo}">관리</a></span>
					</td>
					<td>
						<span class="btnSecession"><a href="${pageContext.request.contextPath}/teacher/secession?tNo=${tVo.tNo}">탈퇴</a></span>
					</td>
				</tr>
			</c:forEach>
			</table>
			<p id="coment">유치원 이름 선택 시 해당 유치원의 게시판으로 이동합니다.<br>탈퇴한 유치원은 조회할 수 없습니다.</p>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	/* 대표 유치원 선택 */
	$(".check").change(function() {
		if($(this).prop("checked") == false){ //이미 선택된 체크박스 선택 시
			$(this).prop("checked", true); //다시 선택
			return false;
		}
		
		$(".check").not(this).prop("checked", false); //선택한 체크박스 외엔 체크 해제
		
		var tVo = {"tNo" : $(this).val(),
					"mVo" : {"mNo" : "${mNo}"}};
		
		$.ajax({
			url: "${pageContext.request.contextPath}/teacher/main",
			type: "post",
			data: JSON.stringify(tVo),
			headers: {"Content-Type" : "application/json"},
			success: function(res) {
				console.log(res);
				
				alert("대표 유치원이 변경되었습니다.");
				
				//리스트 갱신
				location.href="${pageContext.request.contextPath}/teacher/manage";				
			},
			error: function(err) {
				console.log(err);
			}
		}) //ajax(teacher/main)
	})

	/* 유치원 탈퇴 */
	$(".btnSecession").click(function() {
		var res = confirm("정말 탈퇴하시겠습니까?\n탈퇴 후 해당 유치원의 모든 정보 및 게시글을 열람하실 수 없으며,\n재가입 시 유치원의 승인이 필요합니다.");
		if(!res){
			return false;	
		}
	})
</script>

<%@include file="../include/footer.jsp" %>