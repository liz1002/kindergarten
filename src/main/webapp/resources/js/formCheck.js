
//폼 화면 입력 확인
function check(objs){
	var cnt = 0;
	var res;
	
	$(objs).each(function(i, obj) {
		if($(obj).val() == ""){
			cnt++;
			res = $(obj).attr("data-msg"); //에러 메세지
			$(obj).focus();
			return false;
		}
	})
	
	if(0 < cnt){
		alert(res); //에러 메세지 팝업창
		return false;
	}
} 