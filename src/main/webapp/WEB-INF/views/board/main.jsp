<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
div#container {
	width: 100%;
	min-height: 400px;
}

#container h1 {
	text-align: center;
	line-height: 200px;
}

#container p {
	text-align: center;
}
div.cListView{
	text-align: center;
}
.cListView span{	
	line-height: 50px;
}
#container a:hover {
	text-decoration: underline;
}
</style>

<section>
	<div id="container">
		<!-- <h1>게시판으로 이동할 유치원을 선택하세요.</h1> -->
		<h1>${cVo.cName} 게시판</h1>
	</div>
</section>

<%@include file="../include/footer.jsp" %>