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
		position: relative;
		overflow: hidden;
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
	    margin-left: 130px;
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
		margin-right: 150px;
		margin-left: 10px;
	}
	#container a.btns:hover{
		background: #FBCB00;
		color: #fff;
		text-decoration: none;
	}
	#album_wrap{
		width: 960px;
		margin: 50px auto;
		overflow: hidden;
	}
	#album_wrap #albumNo p{
		line-height: 100px;
		text-align: center;
	}
	#container div.album{
		width: 250px;
		height: 250px;
		border: 1px solid #FBCB00;
		margin: 10px;
		padding: 20px;
		position: relative;
		float: left;
	}
	#container div.album:hover{
		box-shadow: 2px 2px 5px #ccc;
		cursor: pointer;
	}
	#container p.coment{
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
		position: absolute;
		bottom: 0px;
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
	<a href="${pageContext.request.contextPath}/album/mainD" id="btnBack"></a>
</c:if>
	<div id="container">		
		<h1>
			<small>${cVo.kVo.kName}<fmt:formatDate value="${cVo.kVo.kDate}" pattern="(yyyy)"/></small>
			<br>${cVo.cName} 앨범
		</h1>	
		<p>
			<span id="pageInfo">전체 ${pageMaker.totalCount} | 페이지 <b>${pageMaker.cri.page}</b>/${pageMaker.lastPage}</span>
			<c:if test="${Type == 2}">
				<a href="${pageContext.request.contextPath}/album/regist?cNo=${cVo.cNo}&tNo=${tNo}" class="btns firstBtn">앨범 추가</a>
				<a href="${pageContext.request.contextPath}/teacher/manage" class="btns">유치원 목록</a>
			</c:if>
			<c:if test="${Type == 3}">
				<a href="${pageContext.request.contextPath}/parent/manage" class="btns firstBtn">유치원 목록</a>
			</c:if>
		</p>
		<div id="album_wrap">		
			<c:if test="${aList.size() == 0}">
				<div id="albumNo">
					<p>등록된 앨범이 없습니다.</p>
				</div>
			</c:if>
			<c:forEach var="aVo" items="${aList}">
				<div class="album" data-aNo="${aVo.aNo}">
					<img src="${pageContext.request.contextPath}/album/displayThumbFile?filename=${aVo.aFile}">
				</div>
			</c:forEach>
		</div>
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
	$(".album").click(function() {
		var aNo = $(this).attr("data-aNo");
		location.href="${pageContext.request.contextPath}/album/detail/?aNo=" + aNo;
	})
	
	/* 게시글 삭제  */
	$(".delete").click(function() {
		var res = confirm("정말 삭제 하시겠습니까?");
		if(!res){
			return false;	
		}
	})	
	 
	$("#page_wrap").css("width", $("#pagination li").size() * 38)
	var left = ($("#container").width() - $("#page_wrap").width())/2;
	$("#page_wrap").css("left", left); //ul 길이 및 가운데 정렬
	
</script>


<%@include file="../include/footer.jsp" %>