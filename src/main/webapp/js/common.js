/**
 * 
 */
 
function gfn_isNull(str) {  //받아온 str값이 null인지 확인 하는 함수.
	if(str == null) return true;
	if(str == "NaN") return true;
	if(new String(str).valueOf() == "undefined") return true;
	var chkStr = new String(str); //new String(str) : str을 String타입으로 변환
	if(chkStr.valueOf() == "undefined") return true;
	if(chkStr == null ) return true;
	if(chkStr.toString().length == 0) return true;
	return false;
}

function ComSubmit(opt_formId) {	//폼이름을 받아옴 
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	//폼 이름이 null일 경우  commonForm으로 지정하고, 아닐 경우 그대로 사용
	this.url = "";
	
	if(this.formId == "commonForm") {	//폼이름이 "commonForm"일 경우
		$("#commonForm").empty();		//데이터를 리셋 
	}
	this.setUrl = function setUrl(url) {  //url을 받아서 저장
		this.url = url;
	};
	
	this.addParam = function addParam(key,value) {
		$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"'>"));
		//히든으로 값을 보내기 위함
	};
	
	this.submit = function submit(){	
		var frm =$("#"+this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.submit();
	};
	
}

var gfv_ajaxCallback = "";
function ComAjax(opt_formId){ 
	this.url = ""; 
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.param = ""; 
	
	if(this.formId == "commonForm"){ 
		var frm = $("#commonForm"); 
		if(frm.length > 0){
			frm.remove(); 
		} 
		var str = "<form id='commonForm' name='commonForm'></form>";
		$('body').append(str); 
		} 
		
		this.setUrl = function setUrl(url){ 
			this.url = url; 
		}; 
		
		this.setCallback = function setCallback(callBack){ 
			fv_ajaxCallback = callBack; 
		}; 
			
		this.addParam = function addParam(key,value){ 
			this.param = this.param + "&" + key + "=" + value; 
		}; 
		
		this.ajax = function ajax(){ 
			if(this.formId != "commonForm"){ 
				this.param += "&" + $("#" + this.formId).serialize(); 
			} 
			$.ajax({ 
				url : this.url, 
				type : "POST", 
				data : this.param, 
				async : false, 
				success : function(data, status) {  //위의 모든 작업이 성공적으로 실행 되었을 시
					if(typeof(fv_ajaxCallback) == "function"){ 
						fv_ajaxCallback(data); 
						} else { 
							eval(fv_ajaxCallback + "(data);"); 
						} 
					} 
			}); 
		}; 
}

/* 
divId : 페이징 태그가 그려질 
div pageIndx : 현재 페이지 위치가 저장될 input 태그 id 
recordCount : 페이지당 레코드 수 
totalCount : 전체 조회 건수 
eventName : 페이징 하단의 숫자 등의 버튼이 클릭되었을 때 호출될 함수 이름 
*/

var gfv_pageIndex = null; 
var gfv_eventName = null; 
function gfn_renderPaging(params){ 
	var divId = params.divId; //페이징이 그려질 div id 
	gfv_pageIndex = params.pageIndex; //현재 위치가 저장될 input 태그 
	var totalCount = params.totalCount; //전체 조회 건수 
	var currentIndex = $("#"+params.pageIndex).val(); //현재 위치 
	if($("#"+params.pageIndex).length == 0 || gfn_isNull(currentIndex) == true){ 
		currentIndex = 1; 
		} 
		
		var recordCount = params.recordCount; //페이지당 레코드 수 
		if(gfn_isNull(recordCount) == true){ 
			recordCount = 20; 
			} 
			var totalIndexCount = Math.ceil(totalCount / recordCount); // 전체 인덱스 수 
			gfv_eventName = params.eventName; 
			
			$("#"+divId).empty(); 
			var preStr = ""; 
			var postStr = ""; 
			var str = ""; 
			var first = (parseInt((currentIndex-1) / 10) * 10) + 1; 
			var last = (parseInt(totalIndexCount/10) == parseInt(currentIndex/10)) ? 
					totalIndexCount%10 : 10; 
			var prev = (parseInt((currentIndex-1)/10)*10) - 9 > 0 ? 
					(parseInt((currentIndex-1)/10)*10) - 9 : 1; 
			var next = (parseInt((currentIndex-1)/10)+1) * 10 + 1 < totalIndexCount ?
				(parseInt((currentIndex-1)/10)+1) * 10 + 1 : totalIndexCount; 
			
			if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨앞, 앞 태그 작성 
					preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>" 
					+ "<a href='#this' class='pad_5' onclick='_movePage("+prev+")'>[<]</a>"; 
			
			} else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨앞 태그 작성 
					preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>"; 
			} 
			
			if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨뒤, 뒤 태그 작성 
					postStr += "<a href='#this' class='pad_5' onclick='_movePage("+next+")'>[>]</a>" 
					+ "<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>"; 
			} else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨뒤 태그 작성 
					postStr += "<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>"; 
			} 
			
			for(var i=first; i<(first+last); i++){ 
				if(i != currentIndex){ 
					str += "<a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a>"; 
				} else { 
					str += "<b><a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a></b>"; 
				} 
			} 
			$("#"+divId).append(preStr + str + postStr); 
		} 
		
		function _movePage(value){ 
			$("#"+gfv_pageIndex).val(value); 
			if(typeof(gfv_eventName) == "function"){ 
				gfv_eventName(value); 
			} else { 
				eval(gfv_eventName + "(value);"); 
			} 
}














