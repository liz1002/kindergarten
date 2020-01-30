<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#container{
		overflow: hidden;
	}
	#container h1#title{
		float: left;
	}
	#container p.btns{
		margin: 0 10px 50px;
		float: right;
		line-height: 50px;
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
		border-top: 3px solid #ddd;
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
		<h1 id="title">유치원 목록</h1>
		<p class="btns"><a href="${pageContext.request.contextPath}/kinder/add?mNo=${mNo}">유치원 추가</a></p>
		<c:if test="${Type == 1}">	
			<table>
				<tr>
					<th>대표설정</th>
					<th>유치원</th>
					<th>등록연도</th>
					<th>주소</th>
					<th>연락처</th>
					<th>별명</th>
					<th>수정·관리·삭제</th>
				</tr>
			<c:if test="${dList.size() == 0}">
				<tr>
					<td colspan="7">등록된 유치원이 없습니다. 유치원 등록 후 이용해주세요.</td>
				</tr>
			</c:if>
			<c:forEach var="dVo" items="${dList}" varStatus="idx">
				<tr>
					<td>
						<input type="checkbox" class="check" id="${idx.index}" value="${dVo.dNo}" ${dVo.dMain == 1 ? 'checked=checked' : ''}>
						<label for="${idx.index}"></label>
					</td>		
					<td class="name">
						<a href="${pageContext.request.contextPath}/board/mainK?dNo=${dVo.dNo}&kNo=${dVo.kVo.kNo}"> <!-- 게시판 이동 -->
							${dVo.kVo.kName}	
						</a>
					</td>
					<td>
						<fmt:formatDate value="${dVo.kVo.kDate}" pattern="yyyy"/>
					</td>
					<td class="addr">
						<span>${dVo.kVo.kZipcode}</span><br>
						${dVo.kVo.kFirstaddr}<br>
						${dVo.kVo.kLastaddr}
					</td>
					<td>${dVo.kVo.kAreacode}-${dVo.kVo.kDialing}-${dVo.kVo.kTel}</td>
					<td>
						<br>${dVo.dNickname}<br>
						<a href="${pageContext.request.contextPath}/director/modifyNick?dNo=${dVo.dNo}">수정</a>
					</td>
					<td>
						<span class="btnModify"><a href="${pageContext.request.contextPath}/kinder/modify?kNo=${dVo.kVo.kNo}">수정</a></span>
						<span class="btnManage"><a href="${pageContext.request.contextPath}/kinder/manage?kNo=${dVo.kVo.kNo}">관리</a></span>
						<span class="btnRemove"><a href="${pageContext.request.contextPath}/kinder/remove?kNo=${dVo.kVo.kNo}&mNo=${mNo}">삭제</a></span>
					</td>
				</tr>
			</c:forEach>
			</table>
			<p id="coment">유치원 이름 선택 시 해당 유치원의 게시판으로 이동합니다.</p>
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
		
		var dVo = {"dNo" : $(this).val(),
					"mVo" : {"mNo" : "${mNo}"}};
		
		$.ajax({
			url: "${pageContext.request.contextPath}/director/main",
			type: "post",
			data: JSON.stringify(dVo),
			headers: {"Content-Type" : "application/json"},
			success: function(res) {
				console.log(res);
				
				alert("대표 유치원이 변경되었습니다.");
				
				//리스트 갱신
				location.href="${pageContext.request.contextPath}/director/manage";
			},
			error: function(err) {
				console.log(err);
			}
		}) //ajax(teacher/main)
	})

	/* 유치원 삭제 */
	$(".btnRemove").click(function() {
		var res = confirm("정말 삭제하시겠습니까?\n삭제 시 해당 유치원과 관련된 모든 정보가 삭제되고, 가입한 교사와 학부모는 자동으로 유치원에서 탈퇴 처리되며 복구가 불가능 합니다.");
		if(!res){
			return false;	
		}
	})
</script>

<%@include file="../include/footer.jsp" %>