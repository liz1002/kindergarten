<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<!-- manageDirector -->

<style>
	#container{
		overflow: hidden;
	}
	#container h1#title{
		float: left;
	}
	#container p#addKinder{
		width: 100px;
		margin-bottom: 50px;
		float: right;
		line-height: 50px;
	}
	#addKinder a{
		display: inline-block;
		width: 100%;
		height: 100%;
		background: #fff;
		color: #FBCB00;
		font-size: 15px;
		font-weight: bold;
		border: 1px solid #FBCB00;
		outline: none;
	}
	#container a:hover {
		background: #FBCB00;
		color: #fff;
	}
	#container table{
		width: 100%;
		clear: both;
		border-collapse: collapse;
		border-top: 3px solid #ddd;
		border-bottom: 3px solid #ddd;
	}
	#container table th, #container table td{
		padding: 20px 10px;
		border-bottom: 1px solid #ddd;
		font-size: 15px;
	}
	#container td a{
		font-size: 13px;
		text-decoration: underline;
	}
	#container td.name a{
		font-weight: bold;
		font-size: 16px;
		text-decoration: none;
	}
	#container td.addr{
		text-align: left;
		padding-left: 30px;
	}
	#container td.addr span{
		color: #999;
	}
</style>

<section>	
	<div id="container">
		<h1 id="title">유치원 목록</h1>
		<p id="addKinder"><a href="${pageContext.request.contextPath}/add/addKinder?mNo=${mNo}">유치원 추가</a></p>
			<c:if test="${Type == 1}">	
				<table>
					<tr>
						<th>유치원</th>
						<th>등록연도</th>
						<th>주소</th>
						<th>연락처</th>
						<th>별명</th>
						<th>수정·관리·삭제</th>
					</tr>
				<c:if test="${dList.size() == 0}">
					<tr>
						<td colspan="6">등록된 유치원이 없습니다. 유치원 등록 후 이용해주세요.</td>
					</tr>
				</c:if>
				<c:forEach var="dVo" items="${dList}">
					<tr>
						<td class="name">
							<a href="#"> <!-- 게시판 이동 -->
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
							${dVo.dNickname}<br>
							<a href="${pageContext.request.contextPath}/modify/modifyNick?dNo=${dVo.dNo}">수정</a>
						</td>
						<td>
							<span class="btnModify"><a href="${pageContext.request.contextPath}/modify/modifyKinder?kNo=${dVo.kVo.kNo}">수정</a></span>
							<span class="btnManage"><a href="${pageContext.request.contextPath}/manage/manageKinder?kNo=${dVo.kVo.kNo}">관리</a></span>
							<span class="btnRemove"><a href="${pageContext.request.contextPath}/manage/removeKinder?kNo=${dVo.kVo.kNo}&mNo=${mNo}">삭제</a></span>
						</td>
					</tr>
				</c:forEach>
				</table>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	$(".btnModify").click(function() {
		
	})
</script>

<%@include file="../include/footer.jsp" %>