<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<style>
	#form_wrap textarea {
		padding: 20px;
		height: 100px;
	}
	#form_wrap span#chNameList{
		margin-left: 10px;
	}
	#form_wrap span#preview{
		display: block;
		width: 400px;
		margin: 0 auto;
	}
	#form_wrap span#preview img{
		max-width: 100%;
	}
	#form_wrap input[type='file']{
		outline: none;
		padding: 0;
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
		overflow: hidden;
	}
	#chList div{
		height: 200px;
		overflow: auto;
	}
	#chList button#close{
		float: right;
		width: 27px;
		height: 27px;
		background: #fff;
		border: 1px solid #FBCB00;
		color: #FBCB00;
		font-size: 18px;
	}
	#chList button#close:hover{
		background: #FBCB00;
		color: #fff;
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
		<h1>앨범 추가</h1>		
		<form action="regist" method="post" enctype="multipart/form-data">
			<fieldset>
				<!-- <p>
					<button type="button" id="selChild">원아 선택</button>
					<span id="chNameList"></span>
				</p> -->
				<p>
					<input type="file" name="file" placeholder="사진을 선택해주세요." data-msg="사진을 선택하세요.">
					<span id="preview"></span>
				</p>
				<p>
					<textarea name="aComent" placeholder="사진에 대한 설명을 입력해주세요." cols="100" rows="10"></textarea>
				</p>
			</fieldset>
			
			<input type="hidden" name="tVo.tNo" value="${tVo.tNo}">
				
			<p id="submit">
				<input type="submit" value="등록">
			</p>
		</form>
	</div>
		
	<div id="chList">
		<button id="close" type="button">X</button>
		<p>
			<input type="checkbox" id="checkAll">
			<label for="checkAll"></label>전체 선택
		</p>
		<div>
			<c:forEach var="chVo" items="${chList}" varStatus="idx">
				<p>
					<input type="checkbox" class="check" id="${idx.index}" value="${chVo.chNo}" data-chName="${chVo.chName}">
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
	/* 원아 선택 */
	$("#selChild").click(function() {
		$("#chList").css("display", "block");
	})
	
	$("#checkAll").change(function() {
		$(".check").prop("checked", ($(this).prop("checked")));
	})
	
	$("#close").click(function() {
		$("#chList").css("display", "none");
	})
	
	var chNoList = new Array(); //선택한 원아 번호 저장
	
	$("#complete").click(function() {
		$("#chNameList").empty();
		
		$(".check:checked").each(function(i, obj) {
			chNoList.push($(this).val());
			if($(".check:checked").length > i+1){
				$("#chNameList").append($(this).attr("data-chName") + ", ");				
			}else{
				$("#chNameList").append($(this).attr("data-chName"));
			}
		});
		
		if(chNoList.length == 0){
			alert("원아를 선택하지 않았습니다.");
		}
		
		$("#chList").css("display", "none");
	})
	
	/* 사진 선택 */
	$("input[name='file']").change(function() {
		$("#preview").empty();
		
		//$(this) : jquery obj
		//$(this)[0] : javascript obj
		//File Read는 javascript만 가능
		for(var i=0; i<$(this)[0].files.length; i++){
			var file = $(this)[0].files[i];
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function(e) {
				var $img = $("<img>").attr("src", e.target.result);
				$("#preview").append($img);
			}
		}
	})
	
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