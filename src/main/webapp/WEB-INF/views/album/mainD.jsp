<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	div#container {
		width: 100%;
	}
	#container h1 {
		text-align: center;
	}
	#container p {
		text-align: center;
		overflow: hidden;
	}
	#container #coment{
		font-size: 18px;
		margin: 50px auto;
		clear: both;
	}
	#container .cName {
		font-size: 20px;
		line-height: 40px; 
	}
	#container .cName a{
		font-weight: bold; 
	}
	#container .cName a:hover {
		color: #FBCB00;
	}
</style>

<section>
	<div id="container">
		<h1>${dVo.kVo.kName}<fmt:formatDate value="${dVo.kVo.kDate}" pattern="(yyyy)"/> 게시판</h1>		
		<p id="coment">앨범으로 이동할 반을 선택하세요.</p> 
		<div class="cList">
			<c:forEach var="cVo" items="${cList}">
				<p class="cName">
					<a href="${pageContext.request.contextPath}/album/main?cNo=${cVo.cNo}">
						${cVo.cName}
					</a>
				</p>
			</c:forEach>
		</div>
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