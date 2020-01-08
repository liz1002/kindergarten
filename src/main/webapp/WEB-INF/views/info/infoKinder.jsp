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
		line-height: 100px;
	}
	#container a{
		text-decoration: underline;
		background: #fff;
	}
</style>

<section>
	<div id="container">
		<h1>원아 정보</h1>
		<p>이름 : ${kVo.kName}</p>
		<p>연락처 : ${kVo.kTel}</p>
		<p>주소 : ${kVo.kAddress}</p>
	</div>
</section>

<!----- S C R I P T ----->
<script>

</script>

<%@include file="../include/footer.jsp" %>
