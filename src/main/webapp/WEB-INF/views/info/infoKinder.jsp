<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#container > p{
		line-height: 100px;
		font-weight: bold;
		font-size: 18px;
	}
	#container a:hover {
		text-decoration: underline;
	}
	#container hr{
		margin: 20px auto;
	}
</style>

<section>
	<div id="container">
		<h1>${kVo.kName}</h1>
		<p>연락처</p>
		<span>${kVo.kTel}</span>
		<p>주소</p>
		<span>${kVo.kAddress}</span>
		<p>코드</p>
		<span>${kVo.kCode}</span>
	</div>
</section>

<!----- S C R I P T ----->
<script>

</script>

<%@include file="../include/footer.jsp" %>
