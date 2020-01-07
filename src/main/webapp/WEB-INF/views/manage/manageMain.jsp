<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	div#container{
		width: 100%;
		min-height: 400px; 
		text-align: center;
	}
	#container > p{
		height: 100px;
	}
	#container a{
		
	}
	#container a:hover {
		text-decoration: underline;
	}
	div.kinder_wrap{
		width: 500px;
		margin: 20px auto;
		padding: 20px 0;
		background: #FF9CB3;
		border: 2px outset #FF9CB3; 
		box-shadow: 1px 1px 1px gray;
		cursor: pointer;
	}
	div.kinder_wrap:hover{		
		border: 2px inset #FF9CB3;
		box-shadow: -1px -1px 1px gray;
	}
	.kinder_wrap h3{
		line-height: 50px;
	}
	.kinder_wrap p{
		line-height: 50px;
	}
</style>

<section>
	<div id="container">
		<!-- 원장 -->
		<c:if test="${Type == 1}">
			<p>${Nick} 님의 정보</p>
			
			<c:forEach var="kinder" items="${kList}">
				<div class="kinder_wrap" data-kNo="${kinder.kNo}">
					<h3>${kinder.kName}</h3> 
					<p>코드 : ${kinder.kCode}</p>
					<p>연락처 : ${kinder.kTel}</p>
					<p>주소 : ${kinder.kAddress}</p>
				</div>
			</c:forEach>
			
			<a href="regist">유치원 추가 하기</a>
		</c:if>
		
		<!-- 교사 -->
		<c:if test="${Type == 2}">
			<p>${Nick} 님의 정보</p>
			
			<c:if test="${list.size() == 0}">
				<p>유치원 등록 후 이용해주세요.</p>
				<a href="regist">유치원 등록 하기</a>
			</c:if>
			
			<c:forEach var="map" items="${list}">
				<p>[${map.kVo.kName}] ${map.cVo.cName}
					<c:if test="${map.tVo.tType == 1}">
						(담임)
					</c:if>
					<c:if test="${map.tVo.tType == 2}">
						(부담임)
					</c:if>
				</p>
			</c:forEach>
			
			<c:if test="${list.size() != 0}">
				<a href="regist">유치원 추가 하기</a>
			</c:if>
		</c:if>
		
		<!-- 학부모 -->
		<c:if test="${Type == 3}">
			<p>${Nick} 님의 정보</p>
			
			<c:if test="${list.size() == 0}">
				<p>유치원 등록 후 이용해주세요.</p>
				<a href="regist">유치원 등록 하기</a>
			</c:if>
			
			<c:forEach var="map" items="${list}">
				<p>
					<a href="#유치원정보">[${map.kVo.kName}]</a>
					<a href="#반정보"> ${map.cVo.cName}</a>
					<!-- 자녀 이름 -->
				</p>
			</c:forEach>
			
			<c:if test="${list.size() != 0}">
				<a href="regist">유치원 추가 하기</a>
			</c:if>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	$(".kinder_wrap").click(function() {
		location.href="registD?kNo=" + $(this).attr("data-kNo");
	})
</script>

<%@include file="../include/footer.jsp" %>