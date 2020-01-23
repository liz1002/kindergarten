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
		<h1>유치원 게시판 바로가기</h1>
		<c:if test="${Auth == null}">
			<h1>로그인 후 이용해주세요.</h1>
			<p><a href="${pageContext.request.contextPath}/auth/login">로그인</a>
		</c:if>
		<c:forEach var="dVo" items="${dList}">
			<p class="btnOpen" data-kNo="${dVo.kVo.kNo}">${dVo.kVo.kName}</p>
			<div class="cListView"></div>
		</c:forEach>
	</div>
</section>

<!-- 
<script id="template" type="text/t-handlebars-template">
	{{#each.}}
	<div id="cListView">
		<p>{{cName}}</p>
	</div>
</script> 
-->

<script>
	$(".btnOpen").click(function() {
		var target = $(this);
		
		$.ajax({
			url: "${pageContext.request.contextPath}/main/getCList",
			type: "get",
			data: {"kNo" : target.attr("data-kNo")},
			headers: {"Content-Type" : "application/json"},
			dataType:"json",
			success: function(res) {
				console.log(res);
				target.next().empty();
				$(res).each(function(i, obj) {
					var $span = $("<span>");
					var $a = $("<a>").text(obj.cName).attr("href", "${pageContext.request.contextPath}/main/mainClass?cNo=" + obj.cNo);
					var $br = $("<br>"); 
					$span.append($a);
					target.next().append($span, $br);
				})
			},
			error: function(err) {
				console.log(err);
			}
		})
	})
</script>

<%@include file="../include/footer.jsp" %>