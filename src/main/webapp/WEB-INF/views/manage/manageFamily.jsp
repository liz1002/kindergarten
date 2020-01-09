<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>

<section>
	<div id="container">				
		<p>
			<label><span class="necessary">*</span>학부모</label>
			<select id="addParent">
				<option value="">학부모 선택</option>
				<c:forEach var="pVo" items="${pList}">
					<option value="${pVo.mVo.mNo}">${pVo.mVo.mNickname}</option>
				</c:forEach>
			</select>
		</p>
		<p id="parentList">
			<label><span class="necessary">&numsp;</span>선택 목록</label>
		</p>
	</div>
</section>
				
				
<!----- S C R I P T ----->				
<script>				
	$("#addParent").change(function() {
		var mName = $("#addParent option:selected").text();
		var mNo = $(this).val();
		
		var $span = $("<span>").addClass("parents").attr("data-mNo", mNo).text(mName);
		var $button = $("<button>").addClass("btnRemove").attr("type", "button").text("X");
		$("#parentList").append($span.append($button));
	})
	
	
	$(document).on("click", ".btnRemove", function() {
		$(this).parent().remove();
	})
</script>	

<%@include file="../include/footer.jsp" %>