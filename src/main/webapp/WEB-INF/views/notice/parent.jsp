<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	div#container {
		width: 100%;
		min-height: 400px;
	}
	#container h1 {
		color: #000;
		margin-bottom: 50px;
	}
	#container h1 a{
		color: #FBCB00;
	}
	#container p {
		text-align: center;
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
	}
	#container a.btns:hover {
		background: #FBCB00;
		color: #fff;
	}
	#container div.notice {
		width: 700px;
		min-height: 200px;
		border: 1px solid #FBCB00;
		margin: 20px auto;
		padding: 20px;
	}
	#container p.content{
		text-align: left;
	}
	#container p.content span{
	    display: inline-block;
		font-weight: bold;
		margin-bottom: 20px;
	}
	#container p.content span.date{
		font-size: 18px;
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
	<div id="container">		
		<h1>
			<a href="${pageContext.request.contextPath}/info/infoChild?chNo=${chVo.chNo}">${chVo.chName}</a>의 알림장
		</h1>  
		<c:if test="${nList.size() == 0}">
			<div class="notice">
				<p class="content">
					<span class="coment">작성된 알림장이 없습니다.</span>
				</p>
			</div>
		</c:if>
		<c:forEach var="nVo" items="${nList}">
			<div class="notice">
				<p class="content">
					<span class="date"><fmt:formatDate value="${nVo.nDate}" pattern="yyyy년 MM월 dd일 E요일"/></span>
					<br>${nVo.nContent}
				</p>
			</div>
		</c:forEach>
		
		<div id="page_wrap">
			<ul id="pagination">
				<c:if test="${pageMaker.prev == true}">
					<li><a href="parent?page=1">&laquo;</a></li>
					<li><a href="parent?page=${pageMaker.startPage-1}">&lsaquo;</a></li>
				</c:if> 
				<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li ${idx == pageMaker.cri.page ? 'class=active' : ''}> <!-- pageMaker.cri.page : 현재 페이지 번호 -->
						<a href="parent?page=${idx}">${idx}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next == true}">
					<li><a href="parent?page=${pageMaker.endPage+1}">&rsaquo;</a></li>
					<li><a href="parent?page=${pageMaker.lastPage}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	$("#page_wrap").css("width", $("#pagination li").size() * 38); //ul 길이 및 가운데 정렬
</script>

<%@include file="../include/footer.jsp" %>