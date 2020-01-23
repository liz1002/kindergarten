<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#container{
		overflow: hidden;
	}
	#container h1#title{
		float: left;
	}
	#container p.btns{
		margin: 0 10px 50px;
		float: right;
		line-height: 50px;
		font-family: 'Poor Story', cursive;
	}
	#container .btns a{
		display: inline-block;
		padding: 2px 10px;
		background: #fff;
		color: #FBCB00;
		font-size: 17px;
		font-weight: bold;
		border: 1px solid #FBCB00;
		outline: none;
	}
	#container .btns a:hover {
		background: #FBCB00;
		color: #fff;
	}
	#container table{
		width: 100%;
		clear: both;
		border-collapse: collapse;
		border-top: 3px solid #ddd;
		border-bottom: 3px solid #ddd;
		font-family: 'Poor Story', cursive;
	}
	#container table th, #container table td{
		padding: 20px 10px;
		border-bottom: 1px solid #ddd;
		font-size: 18px;
	}
	#container td a{
		font-size: 15px;
		text-decoration: underline;
	}
	#container td.name a{
		font-weight: bold;
		font-size: 20px;
		text-decoration: none;
	}
	#container td.addr{
		text-align: left;
		padding-left: 30px;
	}
	#container td.addr span{
		color: #999;
	}
</style>

<section>	
	<div id="container">
		<h1 id="title">가입 신청 목록</h1>	
		<p class="btns"><a href="${pageContext.request.contextPath}/teacher/apply?mNo=${mNo}">유치원 가입</a></p>
		<p class="btns"><a href="${pageContext.request.contextPath}/teacher/manage">가입 유치원 목록</a></p>
		<c:if test="${Type == 2}">	
			<table>
				<tr>
					<th>유치원</th>
					<th>등록연도</th>
					<th>주소</th>
					<th>연락처</th>
					<th>반·역할</th>
					<th>별명</th>
					<th>신청 취소</th>					
				</tr>
			<c:if test="${taList.size() == 0}">
				<tr>
					<td colspan="7">가입 신청한 유치원이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="taVo" items="${taList}">
				<tr>
					<td class="name">
						<a href="#"> <!-- 게시판 이동 -->
							${taVo.cVo.kVo.kName}	
						</a>
					</td>
					<td>
						<fmt:formatDate value="${taVo.cVo.kVo.kDate}" pattern="yyyy"/>
					</td>
					<td class="addr">
						<span>${taVo.cVo.kVo.kZipcode}</span><br>
						${taVo.cVo.kVo.kFirstaddr}<br>
						${taVo.cVo.kVo.kLastaddr}
					</td>
					<td>${taVo.cVo.kVo.kAreacode}-${taVo.cVo.kVo.kDialing}-${taVo.cVo.kVo.kTel}</td>
					<td>
						${taVo.cVo.cName}·<c:if test="${taVo.tType == 1}">담임</c:if><c:if test="${taVo.tType == 2}">부담임</c:if>
					</td>
					<td>${taVo.tNickname}</td>
					<td>
						<span class="btnCancle">
							<a href="${pageContext.request.contextPath}/teacher/applyCancle?mNo=${mNo}&cNo=${taVo.cVo.cNo}&tType=${taVo.tType}">취소</a>
						</span>
					</td>
				</tr>
			</c:forEach>
			</table>
		</c:if>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	$(".btnCancle").click(function() {
		var res = confirm("정말 취소 하시겠습니까?");
		if(!res){
			return false;	
		}
	})
</script>

<%@include file="../include/footer.jsp" %>