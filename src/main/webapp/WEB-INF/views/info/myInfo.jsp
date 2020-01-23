<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#container div#info{
		width: 350px;
		margin: 50px auto;
		font-size: 18px;
		clear: both;
		text-align: left;
	}
	#info p{
		line-height: 50px;
		font-family: 'Poor Story', cursive;
		font-size: 20px;
		font-weight: bold;
	}
	#info span{
		color: #F78300;
		margin-right: 10px;
		letter-spacing: 5px;
	}
	#btns{
		text-align: center;
		margin-top: 50px;
	}
	#btns a{
		margin: 0 10px;
		padding: 10px;
		color: #F24B6A;
		border: 1px solid #F24B6A;
		border-radius: 10px;
		font-size: 15px;
		font-weight: bold;
	}
	#btns a:hover{
		background: #F26D91;
		box-shadow: 2px 2px 3px #777;
		color: #fff;
	}
</style>

<section>
	<div id="container">
		<h1>내 정보</h1>
		<!-- 접속자가 본인이면 -->
		<c:if test="${mVo.mId == Auth}">
			<div id="info">
				<p><span> | 이름</span> ${mVo.mName}</p>
				<p><span> | 아이디 </span>${mVo.mId}</p>
				<p><span> | 연락처</span> ${mVo.mFirsttel}-${mVo.mMiddletel}-${mVo.mLasttel}</p>
				<p><span> | 생년월일</span> <fmt:formatDate value="${mVo.mRegdate}" pattern="yyyy년 MM월 dd일"/></p>
				<p id="btns">
					<a href="${pageContext.request.contextPath}/member/modify?mNo=${mVo.mNo}">개인정보 수정</a>
					<a href="${pageContext.request.contextPath}/member/secession?mNo=${mVo.mNo}" id="btnUnused">회원 탈퇴</a>
				</p>
			</div>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	$("#btnUnused").click(function() {
		var res = confirm("정말 탈퇴하시겠습니까?\n탈퇴 시 해당 아이디의 사용이 즉시 중지되며,\n가입 및 등록한 모든 유치원 정보는 삭제되지 않습니다.");
		if(!res){
			return false;	
		}
	})
</script>

<%@include file="../include/footer.jsp" %>