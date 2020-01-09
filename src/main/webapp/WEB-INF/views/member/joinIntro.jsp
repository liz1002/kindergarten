<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	div#container{
		overflow: hidden;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	div.type_wrap{
		width: 250px;
		height: 250px;
		margin: 20px;
		padding: 20px;
		background: #8FDBFF;
		float: left;
		text-align: center;
		cursor: pointer;
	}
	div.type_wrap:hover{
		box-shadow: 1px 1px 3px gray;
	}
	.type_wrap a{
		display: inline-block;
		width: 100%;
		height: 100%;
		font-size: 25px;
		font-weight: bold;
	}
</style>

<section>
	<div id="container">
		<div class="type_wrap">
			<a href="joinParent">학부모로 가입</a>
		</div>
		<div class="type_wrap">
			<a href="joinTeacher">교사로 가입</a>
		</div>
		<div class="type_wrap">
			<a href="joinDirector">원장으로 가입 (유치원 등록)</a>
		</div>
	</div>
</section>

<%@include file="../include/footer.jsp" %>
