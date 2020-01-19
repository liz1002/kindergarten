<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<!-- manageDirector -->

<style>
	#container{
		overflow: hidden;
	}
	#container p#addKinder{
		width: 150px;
		margin-bottom: 50px;
		float: right;
		background: #FF9CB3;
		line-height: 50px;
		font-weight: bold;
		font-size: 18px;
	}
	#addKinder a{
		display: inline-block;
		width: 100%;
		height: 100%
	}
	#container a:hover {
		text-decoration: underline;
	}
	#container table{
		width: 100%;
		clear: both;
		border-collapse: collapse;
		border-top: 3px solid #8FDBFF;
		border-bottom: 3px solid #8FDBFF;
	}
	#container table th, #container table td{
		padding: 20px 10px;
		border-bottom: 1px solid #8FDBFF;
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
	}
	#container td.addr span{
		color: #666;
	}
</style>

<section>	
	<div id="container">
		<p id="addKinder"><a href="${pageContext.request.contextPath}/add/addKinder?mNo=${mNo}">유치원 추가</a></p>
			<c:if test="${Type == 1}">	
				<table>
					<tr>
						<th>유치원</th>
						<th>주소</th>
						<th>연락처</th>
						<th>별명</th>
						<th>수정·관리·삭제</th>
					</tr>
				<c:if test="${dList.size() == 0}">
					<tr>
						<td colspan="5">등록된 유치원이 없습니다. 유치원 등록 후 이용해주세요.</td>
					</tr>
				</c:if>
				<c:forEach var="dVo" items="${dList}">
					<tr>
						<td class="name">
							<a href="${pageContext.request.contextPath}/manage/manageKinder?kNo=${dVo.kVo.kNo}">
								${dVo.kVo.kName}<br><fmt:formatDate value="${dVo.kVo.kDate}" pattern="(yyyy)"/>			
							</a>
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
							<span class="btnManage"><a href="${pageContext.request.contextPath}/modify/modifyKinder?kNo=${dVo.kVo.kNo}">관리</a></span>
							<span class="btnRemove"><a href="${pageContext.request.contextPath}/modify/modifyKinder?kNo=${dVo.kVo.kNo}">삭제</a></span>
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