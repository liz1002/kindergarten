<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<!-- manageDirector -->

<style>
	#container p#addKinder{
		width: 400px;
		margin: 0 auto 50px;
		background: #FF9CB3;
		line-height: 50px;
		font-weight: bold;
		font-size: 18px;
	}
	#addKinder a{
		display: inline-block;
		width: 100%;
		height: 100%
	}
	#container a:hover {
		text-decoration: underline;
	}
	#container div#item_wrap{
		width: 400px;
		height: 70px;
		margin: 20px auto;
		background: #8FDBFF; 
	}
	#item_wrap h3{
		line-height: 70px;
	}
</style>

<section>	
	<div id="container">
		<p id="addKinder"><a href="${pageContext.request.contextPath}/add/addKinder">유치원 추가 하기</a></p>
			<c:if test="${Type == 1}">	
				<c:forEach var="dVo" items="${dList}">
				<div id="item_wrap">
					<h3>
						<a href="${pageContext.request.contextPath}/manage/manageKinder?kNo=${dVo.kVo.kNo}">${dVo.kVo.kName}</a>
					</h3>
				</div> 
			</c:forEach>
		</c:if>
	</div>
</section>

<%@include file="../include/footer.jsp" %>