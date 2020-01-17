<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<!-- manage Kinder -->

<style>
	div#container{
		overflow: hidden;
	}
	#container h1#title{
		color: #E8B582;
		font-size: 30px;
	}
	#container a#btnModify{
		float: right;
	}
	#container p.division{
		margin-top: 30px;
		line-height: 70px;
		font-size: 20px;
		font-weight: bold;
		clear: both;
	}
	#container span{
		line-height: 30px;
	}
	#container div.wrap{
		margin: 50px auto;
	}
	#container .wrap p{
		line-height: 50px;
	}
	#container .wrap div.listBox{
		width: 300px;
		max-height: 230px;
	    margin: 0 auto;
	    padding: 10px;
		overflow: auto;
	}
	#container a:hover {
		text-decoration: underline;
	}
</style>

<section>
	<div id="container">
		<h1 id="title">${kVo.kName}<fmt:formatDate value="${kVo.kRegdate}" pattern="(yyyy)"/></h1>
		<a href="${pageContext.request.contextPath}/modify/modifyKinder?kNo=${kVo.kNo}" id="btnModify">유치원 정보 수정</a>
		<p class="division">유치원 코드</p>
		<span>${kVo.kCode}</span>
		<p class="division">연락처</p>
		<span>${kVo.kTel}</span>
		<p class="division">주소</p>
		<span>${kVo.kAddress}</span>
		<div class="wrap">
			<p class="division">교사 리스트</p>
			<div class="listBox">
				<c:if test="${tList.size() == 0}">
					<p class="coment">등록된 교사가 없습니다.</p>
				</c:if>
				<c:forEach var="tVo" items="${tList}">
					<p>
						<a href="${pageContext.request.contextPath}/info/infoOther?mNo=${tVo.mVo.mNo}&kNo=${tVo.kVo.kNo}"> 
							${tVo.mVo.mName}(${tVo.mVo.mNickname})
						</a>
					</p>
				</c:forEach>
			</div>
		</div>
		<div class="wrap">
			<p class="division">반 리스트</p>
			<div class="listBox">
				<c:if test="${cList.size() == 0}">
					<p class="coment">등록된 반이 없습니다.</p>
				</c:if>
				<c:forEach var="cVo" items="${cList}">
					<p>
						<a href="${pageContext.request.contextPath}/info/infoClass?cNo=${cVo.cNo}">${cVo.cName}</a>
					</p>
				</c:forEach>
			</div>
		</div>
		<div class="wrap">
			<p class="division">학부모 리스트</p>
			<div class="listBox">
				<c:if test="${pList.size() == 0}">
					<p class="coment">등록된 학부모가 없습니다.</p>
				</c:if>
				<c:forEach var="pVo" items="${pList}">
					<p>
						<a href="${pageContext.request.contextPath}/info/infoOther?mNo=${pVo.mVo.mNo}&kNo=${kVo.kNo}">
							${pVo.mVo.mName}(${pVo.mVo.mNickname})
						</a>
					</p>
				</c:forEach>
			</div>
		</div>
		<div class="wrap">
			<p class="division">원아 리스트</p>
			<div class="listBox">
				<c:if test="${chList.size() == 0}">
					<p class="coment">등록된 원아가 없습니다.</p>
				</c:if>
				<c:forEach var="chVo" items="${chList}">
					<p>
						<a href="${pageContext.request.contextPath}/info/infoChild?chNo=${chVo.chNo}">${chVo.chName}</a>
					</p>
				</c:forEach>
			</div>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>