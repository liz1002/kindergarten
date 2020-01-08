<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	div#form_wrap{
		width: 70%;
		margin: 20px auto;
	}
	#form_wrap h1{
		margin-bottom: 30px;
	}
	#form_wrap h3{
		margin-bottom: 20px;
		text-align: center;
	}
	fieldset {
		width: 500px;
		margin: 10px auto;
		padding: 20px 50px;
		background: #F2F3F5;
	}
	legend{
		padding: 0px 10px;
		font-weight: bold;
	}
	form p{
		overflow: hidden;
		line-height: 50px;
	}
	label {
		display: inline-block;
		width: 20%;
		float: left;
	}
	span.necessary{
		margin-right: 5px; 
		color: #f00;
		vertical-align: middle;
	}
	input{
		padding: 3px;
	}
	span#coment{
		font-size: 13px;
		color: gray;
		margin-left: 15px;
	}
</style>

<section>
	<div id="form_wrap">
		<h1>${cVo.cName}</h1>
		<h3>원아 관리</h3>
		<form action="joinUser" method="post">	
			<fieldset>
				<legend>원아 정보</legend>
				<p>
					<label><span class="necessary">*</span>이름</label>
					<input type="text" name="chName" data-msg="이름을 입력하세요.">
				</p>	
				<p>
					<label><span class="necessary">*</span>생년월일</label>
					<input type="date" name="chRegdate" data-msg="생년월일을 선택하세요.">
				</p>	
			</fieldset>
			
			<p>
				<input type="submit" value="원아 추가"> <!-- 클릭 시 바로 DB에 추가 후 아래 리스트 갱신 -->
			</p>
			
			<input type="hidden" name="kNo" value="유치원 번호">
			<input type="hidden" name="cNo" value="반 번호">
		</form>
		
		<div id="childList">
			<h3>원아 목록</h3>
			<c:forEach var="chVo" items="${chList}">
				<p>
					${chVo.chName} | 
					<fmt:formatDate value="${chVo.chRegdate}" pattern="yyyy년 MM월 dd일"/>
				</p>
			</c:forEach>
		</div>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	$("form").submit(function() {
		$.ajax({
			url: "${pageContext.request.contextPath}/manage/overlap",
			type: "get",
			data: {"mId" : target.val()},
			headers: {"Content-Type" : "application/json"},
			dataType:"text",
			success: function(res) {
				console.log(res);
				
			},
			error: function(err) {
				console.log(err);
			}
		})
		
		return false;
	})	
</script>

<%@include file="../include/footer.jsp" %>