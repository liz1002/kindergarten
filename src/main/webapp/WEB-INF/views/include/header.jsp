<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- All style -->
<style>
	*{
		margin: 0;
		padding: 0;
	}
	section{
		width: 1200px;
		margin: 0 auto;
		padding: 50px 0;
		background: #FFDBE3;
	}
	ul{
		list-style: none;
	}
	a{
		text-decoration: none;
		color: #000;
	}
</style>

<!-- script -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/formCheck.js"></script>

<style>
	header{
		width: 1200px;
		margin: 0 auto;
		background: #FF9CB3;
	}
	header div{
		width: 100%;
		height: 200px;
	}
	header div h1{
		text-align: center;
		vertical-align: middle;
		line-height: 200px;
	}
</style>

</head>
<body>
	<header>
		<div>
			<h1>
				H E A D E R
			</h1>
		</div>
	</header>