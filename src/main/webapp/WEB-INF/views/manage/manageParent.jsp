<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#container > h1{
		margin-bottom: 30px;
	}
	#container > p{
		height: 100px;
	}
	#container a{
		
	}
	#container a:hover {
		text-decoration: underline;
	}
	#container div.item_wrap{
		width: 360px;
		height: 70px;
		margin: 20px auto;
		padding: 0 20px;
		background: #8FDBFF;
		overflow: hidden;
	}
	.item_wrap h3{
		width: 80%;
		line-height: 70px;
		float: left;
	}
	.item_wrap a.btnRemove{
		line-height: 70px;
	}
</style>

<section>	
	<div id="container">		
		<!-- 교사 -->
		<c:if test="${Type == 3}">
			<h1>가입 유치원 목록</h1>
			<c:if test="${pList.size() == 0}">
				<p>유치원 등록 후 이용해주세요.</p>
				<a href="regist">유치원 등록 하기</a>
			</c:if>			
			<c:if test="${pList.size() != 0}">
				<c:forEach var="pVo" items="${pList}">
					<div class="item_wrap">
						<h3>
							<a href="${pageContext.request.contextPath}/info/infoKinder?kNo=${pVo.kVo.kNo}">
								${pVo.kVo.kName}<fmt:formatDate value="${pVo.kVo.kRegdate}" pattern="(yyyy)"/>
							</a>
						</h3>
						<a href="#" class="btnRemove">탈퇴</a>
					</div>
				</c:forEach>
				<a href="${pageContext.request.contextPath}/add/addParent">유치원 추가 하기</a>
			</c:if>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	$(".btnRemove").click(function() {
		var res = confirm("정말 탈퇴하시겠습니까?\n탈퇴 후 해당 유치원의 모든 정보 및 게시글을 열람하실 수 없으며,\n재가입 시 유치원의 승인이 필요합니다.");
		if(res == false){
			return false;	
		}
	})
</script>

<%@include file="../include/footer.jsp" %>