<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
	#form_wrap .tel input, #form_wrap .tel select{
		width: 110px;		
	}
	#form_wrap #addr1 input{
		width: 300px;
	}	
	#form_wrap #addr2 input{
		width: 245px;
	}
	#form_wrap span.error{
		margin-left: 140px;
		color: #D91E1E;
		font-size: 14px;
		display: none;
	}
	div#layer{
		display: none; 
		position: fixed;
		overflow: hidden; 
		z-index: 1;
		-webkit-overflow-scrolling: touch;
	}
	img#btnCloseLayer{
		cursor: pointer; 
		position: absolute;
		width: 25px;
		right: -3px; 
		top: -3px; 
		z-index: 1;
	}
</style>

<section>
	<a href="${pageContext.request.contextPath}/teacher/manage" id="btnBack"></a>
	<div id="form_wrap">
		<form action="modify" method="post">
			<h1>반 정보 수정</h1>	
			<fieldset>
				<legend>유치원 정보</legend>
				<p>
					<label><span class="necessary">*</span>유치원 이름</label>
					<input type="text" value="${cVo.kVo.kName}" readonly="readonly">
				</p>
				<legend>반 정보</legend>
				<p>
					<label><span class="necessary">*</span>반 이름</label>
					<input type="text" name="cName" data-msg="이름을 입력하세요." value="${cVo.cName}" placeholder="반 이름" maxlength="20">
				</p>
				<p class="guid">
					<span class="necessary">*</span>은 필수 입력 사항입니다.
				</p>
			</fieldset>
			
			<input type="hidden" name="cNo" value="${cVo.cNo}">			
			<input type="hidden" name="kNo" value="${kVo.kNo}">
			
			<p id="submit">
				<input type="submit" value="수정">
			</p>
		</form>
	</div>
</section>

<!----- S C R I P T ----->
<script>		
	/* 연락처 자동 선택 */
	$("option[value='${kVo.kAreacode}']").attr("selected", "selected");	

	/* 형식 확인 */
	var regRes = true;
	
	//연락처
	$("#dialing, #tel").change(function() {		
		var dialingReg = /^[0-9]{3}$/;
		var telReg = /^[0-9]{4}$/;
		
		if(!dialingReg.test($("#dialing").val()) || !telReg.test($("#tel").val())){
			$("#tel").next().next().css("display", "inline");
			regRes = false;
		}else{
			$("#tel").next().next().css("display", "none");
			regRes = true
		}
	})
	
	/* 등록 완료 시 공백 확인 */
	$("form").submit(function() {
		var res = check("input[data-msg]");
		
		if(res == false){ //공백 있을 시
			return false;
		}
		
		if(regRes == false){ //형식 틀릴 시
			alert("올바르지 않은 형식입니다.");
			return false;
		}
	})
</script>

<!----- 주소 API SCRIPT ----->
<script>
	var element_layer = document.getElementById('layer');
	
	//주소 검색 닫아주기
	function closeDaumPostcode() {
		//iframe을 넣은 element를 안보이게 한다.
		element_layer.style.display = 'none';
	}
	
	//주소 검색 열어주기
	function openDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById("userZipCode").value = data.zonecode;
				document.getElementById("userFirstAddr").value = data.address;
				document.getElementById("userSecondAddr").focus();
				element_layer.style.display = 'none';
			},
			width : '100%',
			height : '100%'
		}).embed(element_layer);
		element_layer.style.display = 'block';
		initLayerPosition();
	}
	
	//팝업창 세부 설정
	function initLayerPosition() {
		var width = 350; //우편번호서비스가 들어갈 element의 width
		var height = 460; //우편번호서비스가 들어갈 element의 height
		var borderWidth = 1; //샘플에서 사용하는 border의 두께
		//위에서 선언한 값들을 실제 element에 넣는다.
		element_layer.style.width = width + 'px';
		element_layer.style.height = height + 'px';
		element_layer.style.border = borderWidth + 'px solid';
		//실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
		element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
				+ 'px';
		element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2.5 - borderWidth)
				+ 'px';
	}
</script>

<%@include file="../include/footer.jsp" %>