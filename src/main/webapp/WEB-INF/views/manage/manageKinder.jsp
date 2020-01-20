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
	#container .wrap p.btnManage{
		width: 100px;
		height: 30px;
		border: 2px solid #A782E8;
		border-radius: 10px;
		line-height: 30px;
		margin: 10px auto;
	}
	#container .wrap p.btnManage:hover{
		background: #A782E8;
	}
	#container .wrap p.btnManage a{
		display: inherit;
	}
	#container .wrap p.btnManage a:hover{
		color: #fff;
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
		-ms-overflow-style: none;
	}
	.wrap div.listBox p{
	}
	#container a:hover {
		text-decoration: underline;
	}	
	.listBox::-webkit-scrollbar{
		width: 20px;
		background-color: none;
	}
	.listBox::-webkit-scrollbar-thumb{
		border-radius: 10px;
		border: 5px #fff solid;
		background-color: #C596D9;
	}
</style>

<section>
	<div id="container">
		<h1>${kVo.kName}<fmt:formatDate value="${kVo.kDate}" pattern="(yyyy)"/></h1>
		<a href="${pageContext.request.contextPath}/modify/modifyKinder?kNo=${kVo.kNo}" id="btnModify">유치원 정보 수정</a>		
		<div id="info">
			<p><span> | 주소</span> ${kVo.kFirstaddr} ${kVo.kLastaddr} (${kVo.kZipcode})</p>
			<p><span> | 연락처</span> ${kVo.kAreacode}-${kVo.kDialing}-${kVo.kTel}</p>
		</div>
		<div class="wrap">
			<p class="division">교사 리스트<span>${tList.size()}명</span></p>
			<div class="listBox">
				<c:if test="${tList.size() == 0}">
					<p class="coment">등록된 교사가 없습니다.</p>
				</c:if>
				<c:forEach var="tVo" items="${tList}">
					<p>
						<a href="${pageContext.request.contextPath}/info/infoOther?mNo=${tVo.mVo.mNo}&kNo=${tVo.kVo.kNo}"> 
							${tVo.mVo.mName}
						</a>
					</p>
				</c:forEach>
			</div>
			<p class="btnManage"><a href="${pageContext.request.contextPath}/add/addClass?kNo=${kVo.kNo}">교사 관리</a></p>
		</div>
		<div class="wrap">
			<p class="division">반 리스트<span>${cList.size()}개</span></p>
			<div class="listBox">
				<c:if test="${cList.size() == 0}">
					<p class="coment">등록된 반이 없습니다.</p>
				</c:if>
				<c:forEach var="cVo" items="${cList}">
					<p>
						<input type="checkbox">
						<a href="${pageContext.request.contextPath}/info/infoClass?cNo=${cVo.cNo}">${cVo.cName}</a>
					</p>
				</c:forEach>
			</div>
			<p class="btnManage"><a href="${pageContext.request.contextPath}/add/addClass?kNo=${kVo.kNo}">반 추가</a></p>
		</div>
		<div class="wrap">
			<p class="division">학부모 리스트<span>${pList.size()}명</span></p>
			<div class="listBox">
				<c:if test="${pList.size() == 0}">
					<p class="coment">등록된 학부모가 없습니다.</p>
				</c:if>
				<c:forEach var="pVo" items="${pList}">
					<p>
						<a href="${pageContext.request.contextPath}/info/infoOther?mNo=${pVo.mVo.mNo}&kNo=${kVo.kNo}">
							${pVo.mVo.mName}
						</a>
					</p>
				</c:forEach>
			</div>
			<p class="btnManage"><a href="${pageContext.request.contextPath}/add/addClass?kNo=${kVo.kNo}">학부모 관리</a></p>
		</div>
		<div class="wrap">
			<p class="division">원아 리스트<span>${chList.size()}명</span></p>
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
			<%-- <p class="btnManage"><a href="${pageContext.request.contextPath}/add/addChildren?cNo=${cVo.cNo}">원아 관리</a></p> --%>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>