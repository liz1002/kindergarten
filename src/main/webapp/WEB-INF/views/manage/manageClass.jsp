<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<!-- manage Kinder -->

<style>
	#container{
		overflow: hidden;
	}
	#container h1#title{
		color: #E8B582;
		font-size: 30px;
	}
	#container p#code{
		font-weight: bold;
		color: #E8B582; 
	}
	#container a#btnModify{
		float: right;
	}
	#container div.wrap{
		margin: 50px auto;
		text-align: center;
		overflow: hidden;
	}
	#container .wrap h1{
		display: inline-block; 
		width: 300px;
		height: 100px;
		margin: 10px;
		line-height: 100px;
	}
	#container a{
		color: #8FDBFF;
		text-shadow: 1px 1px 2px gray;
		letter-spacing: 5px;
	}
	#container a:hover {
		text-decoration: underline;
	}
	
</style>

<section>
	<div id="container">
		<h1 id="title">${cVo.cName}</h1>
		<p id="code">반 코드 : ${cVo.cCode}</p>
		<a href="${pageContext.request.contextPath}/modify/modifyClass?cNo=${cVo.cNo}&tType=${tVo.tType}" id="btnModify">반 정보 수정</a>
		<div class="wrap">
			<h1>
				<a href="${pageContext.request.contextPath}/add/addFamily?cNo=${cVo.cNo}">가족 관리</a>
			</h1>
			<h1>
				<a href="${pageContext.request.contextPath}/add/addChildren?cNo=${cVo.cNo}">원아 관리</a>
			</h1>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>