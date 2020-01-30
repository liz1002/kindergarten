<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	section .btnList{
		display: inline-block;
		width: 140px;
		position: absolute;
		top: 10px;
		left: 10px;
		color: #FBCB00;
		font-size: 25px;
		font-weight: bold;
	}
	section .btnList:hover{
		text-shadow: 1px 1px 1px #ccc;
	}
	div#container {
		width: 100%;
	}
	#container h1{
		margin-bottom: 50px;
	}
	#container p{
		text-align: left;
		overflow: hidden;
		font-size: 18px;
		margin-bottom: 20px;
	}
	#container p #pageInfo{
		font-size: 15px;
	    margin-left: 180px;
	}
	#pageInfo b{
		color: #FBCB00;
	}
	#container a:hover{
		font-weight: bold;
		text-decoration: underline;
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
	}
	#container a.firstBtn{
		margin-right: 180px;
		margin-left: 10px;
	}
	#container a.btns:hover{
		background: #FBCB00;
		color: #fff;
		text-decoration: none;
	}
	#container div.board{
		width: 800px;
		height: 160px;
		border-top: 1px solid #FBCB00;
		border-bottom: 1px solid #FBCB00;
		margin: 20px auto;
		padding: 20px;
		position: relative;
	}
	#container div.board:hover{
		box-shadow: 2px 2px 5px #ccc;
		cursor: pointer;
	}
	#container div.mine{
		border-color: #FBCB00;
	}
	#container div.mine span.nick a{
		color: #FBCB00;
	}
	#container span.nick{
		font-size: 20px;
		font-weight: bold;
		float: left;
	}
	#container span.date{
		float: right;
	}
	#container p.title{
		clear: both;
	}
	#container p.title span{
	    display: inline-block;
	    padding: 2px 5px;
	    font-size: 12px;
	    background: #FBCB00;
	    border-radius: 10px;
	    color: #fff;
   		vertical-align: middle;
	}
	#container p.content{
		height: 30px;
		text-overflow: ellipsis;
	    white-space: nowrap;
		font-size: 16px;
	}
	#container p.btns{
		position: absolute;
		right: 10px;
		bottom: 10px;
		font-weight: normal;
		font-size: 16px;
		margin-bottom: 0px;
	}
	#container p.btns a{
		margin-top: 10px;
	}
	
	/* 페이징 */
	#container div#page_wrap{
		margin: 0 auto;
	}
	#container #page_wrap ul#pagination{
		width: 100%;
	}
	#container #page_wrap #pagination li{
		float: left;
		width: 30px;
		height: 30px;
		border: 1px solid #FBCB00;
		margin: 3px;
		line-height: 30px;
	}
	#container #page_wrap #pagination li.active{
		background: #FBCB00;
	}
	#container #page_wrap #pagination li a{
		display: inherit;
		color: #666;
	}
	#container #page_wrap #pagination li.active a{
		color: #fff;
		font-weight: bold;
	}
</style>

<section>
<c:if test="${Type == 1}">
	<a href="${pageContext.request.contextPath}/board/mainD" id="btnBack"></a>
</c:if>
	<div id="container">		
		<h1>
			<small>${cVo.kVo.kName}<fmt:formatDate value="${cVo.kVo.kDate}" pattern="(yyyy)"/></small>
			<br>${cVo.cName} 게시판
		</h1>		
		<p>
			<span id="pageInfo">전체 ${pageMaker.totalCount} | 페이지 <b>${pageMaker.cri.page}</b>/${pageMaker.lastPage}</span>
			<a href="${pageContext.request.contextPath}/board/regist?cNo=${cVo.cNo}&mNo=${mNo}" class="btns firstBtn">글쓰기</a>
			<c:if test="${Type == 2}">
				<a href="${pageContext.request.contextPath}/teacher/manage" class="btns">유치원 목록</a>
			</c:if>
			<c:if test="${Type == 3}">
				<a href="${pageContext.request.contextPath}/parent/manage" class="btns">유치원 목록</a>
			</c:if>
		</p>
		<c:if test="${bList.size() == 0}">
			<div class="board">
				<p class="info">등록된 게시글이 없습니다.</p>
			</div>
		</c:if>
		<c:forEach var="bVo" items="${bList}">
			<div class="board ${bVo.mVo.mId == Auth ? 'mine' : ''} ${bVo.bNotice == 1 ? 'notice' : ''}" data-bNo="${bVo.bNo}">
				<p class="info">
					<span class="nick">
						<a href="${pageContext.request.contextPath}/info/infoOther?mNo=${bVo.mVo.mNo}&kNo=${bVo.cVo.kVo.kNo}">${bVo.bNickname}</a>
					</span>
					<span class="date">${bVo.bDate}</span>
				</p>
				<p class="title">${bVo.bTitle}
					<c:if test="${bVo.bNotice == 1}"><span>공지</span></c:if>
				</p>
				<p class="content">${bVo.bContent}</p>
				<c:if test="${bVo.mVo.mId == Auth}">
					<p class="btns">
						<a href="${pageContext.request.contextPath}/board/modify?bNo=${bVo.bNo}" class="modify">수정</a>
						 | <a href="${pageContext.request.contextPath}/board/remove?bNo=${bVo.bNo}" class="delete">삭제</a>
					</p>
				</c:if>
			</div>
		</c:forEach>
		
		<div id="page_wrap">
			<ul id="pagination">
				<c:if test="${pageMaker.prev == true}">
					<li><a href="main?cNo=${cVo.cNo}&page=1">&laquo;</a></li>
					<li><a href="main?cNo=${cVo.cNo}&page=${pageMaker.startPage-1}">&lsaquo;</a></li>
				</c:if> 
				<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<c:if test="${idx != 0}">
						<li ${idx == pageMaker.cri.page ? 'class=active' : ''}> <!-- pageMaker.cri.page : 현재 페이지 번호 -->
							<a href="main?cNo=${cVo.cNo}&page=${idx}">${idx}</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${pageMaker.next == true}">
					<li><a href="main?cNo=${cVo.cNo}&page=${pageMaker.endPage+1}">&rsaquo;</a></li>
					<li><a href="main?cNo=${cVo.cNo}&page=${pageMaker.lastPage}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	/* 게시글 상세 보기 */
	$(".board").click(function() {
		var bNo = $(this).attr("data-bNo");
		location.href="${pageContext.request.contextPath}/board/detail/?bNo=" + bNo;
	})
	
	/* 게시글 삭제  */
	$(".delete").click(function() {
		var res = confirm("정말 삭제 하시겠습니까?");
		if(!res){
			return false;	
		}
	})	
	 
	$("#page_wrap").css("width", $("#pagination li").size() * 38); //ul 길이 및 가운데 정렬
</script>


<%@include file="../include/footer.jsp" %>