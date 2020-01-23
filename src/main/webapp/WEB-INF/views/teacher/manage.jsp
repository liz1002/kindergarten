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
	/* 삭제된 유치원 or 반에 대한 스타일 */
	#container table tr.unused{
		background: #eee;
	}	
	#container p#coment{
		margin-top: 50px;
		color: #999;
	}
</style>

<section>	
	<div id="container">
		<h1 id="title">가입 유치원 목록</h1>	
		<p class="btns"><a href="${pageContext.request.contextPath}/teacher/apply?mNo=${mNo}">유치원 가입</a></p>
		<p class="btns"><a href="${pageContext.request.contextPath}/teacher/applyList?mNo=${mNo}">가입 신청 목록</a></p>
		<c:if test="${Type == 2}">	
			<table>
				<tr>
					<th>유치원</th>
					<th>등록연도</th>
					<th>주소</th>
					<th>연락처</th>
					<th>반·역할</th>
					<th>별명</th>
					<th>탈퇴</th>					
				</tr>
			<c:if test="${tList.size() == 0}">
				<tr>
					<td colspan="7">가입한 유치원이 없습니다. 유치원 가입 후 이용해주세요.</td>
				</tr>
			</c:if>
			<c:forEach var="tVo" items="${tList}">
				<tr ${tVo.kVo.kUse == 1 ? 'class=unused' : ''}>
					<td class="name">
						<a href="${pageContext.request.contextPath}/board/main?cNo=${tVo.cVo.cNo}"> <!-- 게시판 이동 -->
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
						${tVo.tNickname}<br>
						<a href="${pageContext.request.contextPath}/teacher/modifyNick?tNo=${tVo.tNo}">수정</a>
					</td>
					<td>
						<span class="btnSecession"><a href="${pageContext.request.contextPath}/teacher/secession?tNo=${tVo.tNo}">탈퇴</a></span>
					</td>
				</tr>
			</c:forEach>
			</table>
			<p id="coment">삭제된 유치원 또는 반은 목록에서만 조회 가능하며,<br>탈퇴한 유치원은 조회할 수 없습니다.</p>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	$(".btnSecession").click(function() {
		var res = confirm("정말 탈퇴하시겠습니까?\n탈퇴 후 해당 유치원의 모든 정보 및 게시글을 열람하실 수 없으며,\n재가입 시 유치원의 승인이 필요합니다.");
		if(!res){
			return false;	
		}
	})
</script>

<%@include file="../include/footer.jsp" %>