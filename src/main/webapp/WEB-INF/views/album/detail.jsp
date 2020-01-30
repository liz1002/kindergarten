<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	div#container {
		width: 100%;
		min-height: 400px;
	}
	#container h1{
		margin-bottom: 50px;
	}
	#container p{
		text-align: left;
		overflow: hidden;
		font-size: 18px;
		margin-bottom: 30px;
  		padding: 0 20px;
	}
	#container a.btns{
		display: inline-block;
		padding: 2px 10px;
		background: #fff;
		color: #FBCB00;
		font-size: 17px;
		font-weight: bold;
		border: 1px solid #FBCB00;
		outline: none;
		float: right; 
		margin-right: 230px;
	}
	#container a.btns:hover{
		background: #FBCB00;
		color: #fff;
	}
	#container div.album{
		width: 800px;
		min-height: 200px;
		margin: 20px auto;
		padding: 20px;
		position: relative;
	}
	#container div.album:hover{
		border-width: 3px;
		cursor: pointer;
	}
	#container p.btns{
		position: absolute;
		right: 10px;
		bottom: 0px;
		font-weight: normal;
		font-size: 16px;
		margin: 0;
	}
	#container p.btns a:hover {
		font-weight: bold;
		text-decoration: underline;
	}
</style>

<section>
	<a href="${pageContext.request.contextPath}/album/main?cNo=0" id="btnBack"></a>
	<div id="container">		
		<h1>${aVo.tVo.cVo.cName} 앨범</h1>
		<div class="album">
			<p class="info">
				<!-- 원아 정보 -->
			</p>
			<p class="file"><img src="${pageContext.request.contextPath}/album/displayOriginFile?filename=${aVo.aFile}"></p>
			<p class="coment">${aVo.aComent}</p>
			
			<c:if test="${aVo.tVo.mVo.mId == Auth}">
				<p class="btns">
					<a href="${pageContext.request.contextPath}/album/modify?bNo=${bVo.bNo}" class="modify">수정</a>
					 | <a href="${pageContext.request.contextPath}/album/remove?bNo=${bVo.bNo}" class="delete">삭제</a>
				</p>
			</c:if>
		</div>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	/* 게시글 삭제  */
	$(".delete").click(function() {
		var res = confirm("정말 삭제 하시겠습니까?");
		if(!res){
			return false;	
		}
	})
</script>


<%@include file="../include/footer.jsp" %>