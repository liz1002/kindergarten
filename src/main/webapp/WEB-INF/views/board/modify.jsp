<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#form_wrap h1{
		margin-bottom: 50px;
	}
	#form_wrap fieldset{
		text-align: center;
	}
	#form_wrap input{
		width: 620px;
	}
	#form_wrap textarea {
		padding: 20px;
	}
	#form_wrap div#chList{
		width: 500px;
		margin: auto;
	}
	div#chList{
		width: 300px;
		height: 300px;
    	padding: 30px 50px;
		border: 2px solid #FBCB00;
		background: #FFF;
		position: absolute;
		top: 200px;
		left: 400px;
		display: none;
	}
	
	/* 체크박스 디자인 */
	#form_wrap input[type="checkbox"] { /* 실제 체크박스는 화면에서 숨김 */
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip: rect(0, 0, 0, 0);
		border: 0
	}

	#form_wrap input[type="checkbox"]+label {
		display: inline-block;
		width: 40px;
		position: relative;
		cursor: pointer;
		margin-top: 28px;
		margin-left: 10px;
	}
	
	#form_wrap input[type="checkbox"]+label:before { /* 가짜 체크박스 */
		content: ' ';
	    width: 21px;
	    height: 21px;
	    border: 1px solid #FBCB00;
	    border-radius: 3px;
	    position: absolute;
	    left: 0;
	    top: 0;
	    margin-top: -15px;
	    opacity: .6;
	    transition: all .15s, border-color .0s;
	}
	
	#form_wrap input[type="checkbox"]:checked+label:before { /* 체크박스를 체크했을때 */
		width: 12px;
	    top: -5px;
	    left: 5px;
	    opacity: 1;
	    border-top-color: transparent;
	    border-left-color: transparent;
	    transform: rotate(45deg);
	}	
</style>

<section>
	<a href="#" id="btnBack"></a>
	<div id="form_wrap">
		<h1>게시글 수정</h1>		
		<form action="modify" method="post">
			<fieldset>
				<c:if test="${bVo.mVo.mType == 1 || bVo.mVo.mType == 2}">
					<p align="left">
						<input type="checkbox" name="bNotice" value="1" id="notice" ${bVo.bNotice == 1 ? 'checked=checked' : ''}> 
						반 공지로 등록<label for="notice"></label>
					</p>
				</c:if>
				<p>
					<input type="text" name="bTitle" value="${bVo.bTitle}" placeholder="제목(50글자 이내)" data-msg="제목을 입력하세요" maxlength="50">
				</p>
				<p>
					<textarea name="bContent" placeholder="내용을 입력해주세요." data-msg="내용을 입력하세요"
								 cols="100" rows="20">${bVo.bContent}</textarea>
				</p>
			</fieldset>
				
			<input type="hidden" name="bNo" value="${bVo.bNo}">
				
			<p id="submit">
				<input type="submit" value="수정">
			</p>
		</form>
	</div>
		
	<div id="chList">
		<p>
			<input type="checkbox" id="checkAll">
			<label for="checkAll"></label>전체 선택
		</p>
		<div>
		<c:forEach var="chVo" items="${chList}" varStatus="idx">
			<p>
				<input type="checkbox" class="check" id="${idx.index}" value="${chVo.chNo}">
				<label for="${idx.index}"></label>
				${chVo.chName}<span><fmt:formatDate value="${chVo.chRegdate}" pattern="(yyyy/MM/dd)"/></span>
			</p>
		</c:forEach>
		</div>
		<button type="button" id="complete">선택 완료</button>
	</div>
</section>

<!----- S C R I P T ----->
<script>
	/* 뒤로가기 */
	$("#btnBack").click(function() {
		history.back();
	})

	/* 완료 시 공백 확인 */
	$("form").submit(function() {
		var res = check("input[data-msg], textarea[data-msg]");
		
		if(res == false){ //공백 있을 시
			return false;
		}
	})
</script>

<%@include file="../include/footer.jsp" %>