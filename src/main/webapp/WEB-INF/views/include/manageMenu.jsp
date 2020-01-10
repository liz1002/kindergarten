<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
	#menu_wrap{
		width: 100%;
	}
	#menu_wrap ul{
		width: 100%;
		text-align: center;
		overflow: hidden;
	}
	#menu_wrap ul li{
		width: 25%;
		padding: 10px;
		border-bottom: 1px solid gray;
	}
	#menu_wrap ul li a{
		display:inline-block;
		width: 100%;
		height: 100%;
	}
	#menu_wrap ul li a:hover{
		text-decoration: underline;
	}
</style>   
    
<div id="menu_wrap">
	<ul>
		<li><a href="${pageContext.request.contextPath}/manage/manageKinder">유치원 관리</a></li>
		<li><a href="${pageContext.request.contextPath}/manage/manageClass">반 관리</a></li>
		<li><a href="${pageContext.request.contextPath}/manage/manageParent">학부모 관리</a></li>
		<li><a href="${pageContext.request.contextPath}/manage/manageChildren">원아 관리</a></li>
	</ul>
</div>

<script>
	$("a").click(function() {
		$("li").css("background", "none");
		$(this).parent().css("background", "blue");
	})
</script>