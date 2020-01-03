<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	div#container{
		width: 80%;
		overflow: hidden;
		margin: 0 auto;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	div.type_wrap{
		width: 300px;
		height: 300px;
		margin: 50px;
		padding: 20px;
		background: #8FDBFF;
		float: left;
		text-align: center;
		cursor: pointer;
	}
	div.type_wrap:hover{
		box-shadow: 1px 1px 3px gray;
	}
</style>

<section>
	<div id="container">
		<div class="type_wrap">
			<h3>회원 가입(14세 이상)</h3>
		</div>
		<div class="type_wrap">
			<h3>유치원 등록</h3>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>