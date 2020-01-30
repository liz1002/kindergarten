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
	#container div.board{
		width: 800px;
		min-height: 200px;
		margin: 20px auto;
		padding: 20px;
		position: relative;
	}
	#container div.board:hover{
		border-width: 3px;
		cursor: pointer;
	}
	#container span.nick{
		float: left;
	}
	#container span.date{
		float: right;
	}
	#container p.title{
		font-size: 25px;
		font-weight: bold;
		clear: both;
		padding-bottom: 20px;
		border-bottom: 5px solid #FBCB00;
	}
	#container p.title span{
	    display: inline-block;
	    padding: 2px 5px;
	    font-size: 14px;
	    background: #FBCB00;
	    border-radius: 10px;
	    color: #fff;
   		vertical-align: middle;
	}
	#container p.mine{
		border-color: #FBCB00;
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
	<a href="${pageContext.request.contextPath}/board/main?cNo=${bVo.cVo.cNo}" id="btnBack"></a>
	<div id="container">		
		<h1>${bVo.cVo.cName} 게시판</h1>
		<div class="board">
			<p class="title ${bVo.mVo.mId == Auth ? 'mine' : ''} ${bVo.bNotice == 1 ? 'notice' : ''}">${bVo.bTitle}
				<c:if test="${bVo.bNotice == 1}"><span>공지</span></c:if>
			</p>
			<p class="info">
				<span class="nick">
					<a href="${pageContext.request.contextPath}/info/infoOther?mNo=${bVo.mVo.mNo}&kNo=${bVo.cVo.kVo.kNo}">${bVo.bNickname}</a>
				</span>
				<span class="date">${bVo.bDate}</span>
			</p>
			<p class="content">${bVo.bContent}</p>
			<c:if test="${bVo.mVo.mId == Auth}">
				<p class="btns">
					<a href="${pageContext.request.contextPath}/board/modify?bNo=${bVo.bNo}" class="modify">수정</a>
					 | <a href="${pageContext.request.contextPath}/board/remove?bNo=${bVo.bNo}" class="delete">삭제</a>
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