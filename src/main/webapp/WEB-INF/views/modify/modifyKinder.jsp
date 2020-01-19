<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
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
		left: -3px; 
		top: -3px; 
		z-index: 1;
	}
</style>

<section>
	<div id="form_wrap">
		<form action="modifyKinder" method="post">	
			<fieldset>
				<legend>유치원 정보 수정</legend>
				<p>
					<label><span class="necessary">*</span>유치원 이름</label>
					<input type="text" name="kName" data-msg="이름을 입력하세요." value="${kVo.kName}" placeholder="예) 가나다유치원">
				</p>
				<p>
					<label><span class="necessary">*</span>유치원 연락처</label>
					<select name="kAreacode" id="areacode">
						<option value="02">02</option>
						<option value="031">031</option>
						<option value="032">032</option>
						<option value="033">033</option>
						<option value="041">041</option>
						<option value="042">042</option>
						<option value="043">043</option>
						<option value="044">044</option>
						<option value="051">051</option>
						<option value="052">052</option>
						<option value="053">053</option>
						<option value="054">054</option>
						<option value="055">055</option>
						<option value="061">061</option>
						<option value="062">062</option>
						<option value="063">063</option>
						<option value="064">064</option>
					</select>
					- <input type="tel" name="kDialing" id="dialing" value="${kVo.kDialing}" maxlength="3" size="3" data-msg="연락처를 입력하세요.">
					- <input type="tel" name="kTel" id="tel" value="${kVo.kTel}" maxlength="4" size="4" data-msg="연락처를 입력하세요.">
				</p>
				<p>
					<label><span class="necessary">*</span>주소</label>
					<input name="kZipcode" class="form-control zipCode" id="userZipCode" value="${kVo.kZipcode}" placeholder="우편번호" readonly="readonly"/>
					<button type="button" onclick="openDaumPostcode();">검색</button>
				</p>
				<p>
					<input type="text" name="kFirstaddr" class="form-control userFirstAddr" id="userFirstAddr" value="${kVo.kFirstaddr}" readonly="readonly" size="25" data-msg="주소를 입력하세요." />
					<input type="text" name="kLastaddr" class="form-control userSecondAddr" id="userSecondAddr" value="${kVo.kLastaddr}" data-msg="상세주소를 입력하세요." placeholder="상세 주소를 입력해주세요"/>
				</p>
				
				<!-- 팝업창 -->
				<div id="layer">
					<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
						id="btnCloseLayer"
						onclick="closeDaumPostcode()" alt="닫기 버튼">
				</div>
				<p class="guid">
					<span class="necessary">*</span>은 필수 입력 사항입니다.
				</p>
			</fieldset>
			
			<p id="submit">
				<input type="submit" value="수정">
			</p>
			
			<input type="hidden" name="kNo" value="${kVo.kNo}">
		</form>
	</div>
</section>

<!----- S C R I P T ----->
<script>		
	/* 연락처 자동 선택 */
	$("option[value='${kVo.kAreacode}']").attr("selected", "selected");	

	/* 등록 완료 시 공백 확인 */
	$("form").submit(function() {
		var res = check("input[data-msg]");
		
		if(res == false){ //공백 있을 시
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