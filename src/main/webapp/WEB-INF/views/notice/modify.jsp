<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#form_wrap p#date{
		text-align: center;
		font-size: 17px;
		font-weight: bold;
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
	#chList div{
		height: 200px;
		overflow: auto;
	}
	#chList p{
		overflow: hidden;
		text-align: left;
		margin: 10px auto;
		font-size: 18px;
	}
	#chList p input{
		width: 30px;
		height: 30px;
		margin-right: 30px;
		float: left;
	}
	#chList p label {
		float: left;
	}
	#chList span{
		font-size: 15px;
	}
	#chList button#complete{
		width: 80px;
		height: 30px;
    	margin: 20px 100px;
		font-size: 15px;
		outline: none;
		border: 1px solid #FBCB00;
		color: #FBCB00;
		background: #fff;
		text-align: center;
	}
	#chList button#complete:hover{
		font-weight: bold;
	}
	
	/* 체크박스 디자인 */
	#chList input[type="checkbox"] { /* 실제 체크박스는 화면에서 숨김 */
		position: absolute;
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip: rect(0, 0, 0, 0);
		border: 0
	}

	#chList input[type="checkbox"]+label {
		display: inline-block;
		position: relative;
		cursor: pointer;
		margin-top: 15px;
   		margin-right: 50px;
	}
	
	#chList input[type="checkbox"]+label:before { /* 가짜 체크박스 */
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
	
	#chList input[type="checkbox"]:checked+label:before { /* 체크박스를 체크했을때 */
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
		<h1>알림장 작성</h1>		
		<form action="modify" method="post">
			<fieldset>
				<!-- <p>
					<button type="button" id="selChild">원아 선택</button>
				</p> -->
				<p id="date"><fmt:formatDate value="${nVo.nDate}" pattern="yyyy년 MM월 dd일 E요일"/></p>
				<p>
					<textarea name="nContent" placeholder="전달하실 내용을 입력해주세요." data-msg="알림장 내용을 입력하세요"
								 cols="100" rows="20">${nVo.nContent}</textarea>
				</p>
			</fieldset>
			
			<input type="hidden" name="nNo" value="${nVo.nNo}">
			<input type="hidden" name="tVo.tNo" value="${nVo.tVo.tNo}">
			<input type="hidden" name="chVo.chNo" value="${nVo.chVo.chNo}">
				
			<p id="submit">
				<input type="submit" value="수정">
			</p>
		</form>
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