<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="${CONTEXT_PATH}/resources/css/sign-in.css">
	<script language="JavaScript" src="${CONTEXT_PATH}/resources/script/script.js" charset="UTF-8"></script>
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
	<script>
	
	
	
	function blankCheck(p){
		var id=p.id.value;
		id=id.trim();
		if(id.length<4){
			alert("아이디는 4글자 이상 입력해 주세요");
			return false;
		}//if end
		return true;
	} //end
	function apply(id){
		//중복확인 id를 부모창에 적용
		//부모창 opener
		opener.document.regForm.nick.value=id;
		window.close();
	}
	
	function formInit(param) {
		var arr = new Array();
		if(Array.isArray(param)){
			
			arr = arr.concat(param);
			for(i= 0; i < arr.length; i++) {
				var target = document.getElementById(arr[i]);
				target.addEventListener("focusout", function() {
					
				});
			}
		}
	}
	
	
	window.onload = function() {
		
		var checkInputs = [
			"id",
			"nick"
		]
// 		formInit(checkInputs);
		
		//id 검증
		document.getElementById("id").addEventListener("focusout", function(){
			
			var userInput = this.value;
			console.log(userInput);
			
			var url = "${CONTEXT_PATH}/member/sign/popup/checkId?id="+ userInput;	
			
			var result  = "";
			var html = "";
			var id_regex = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/; //반드시 영문으로 시작 영문숫자조합 4_20자리
	// 		let reg_id1 = /^[a-z0-9_-]{4,20}$/; // 소문자 + 숫자 + 언더바/하이픈 허용 4~20자리
	// 		let reg_id2 = /^[A-Za-z]{1}[A-Za-z0-9_-]{3,19}$/ // 반드시 영문으로 시작 숫자+언더바/하이픈 허용 4~20자리
			if(userInput.length < 1) {
				html = "입력해주세요";
			}else {
				var valid = id_regex.test(userInput);
				console.log(valid);
				if (valid) {
					//검증 성공
					//서버 통신
					$.ajax({
						url : url,    
						type : "GET",   
						async : false, 
						success : function(data, status) {
							console.log("0: 사용불가  1: 사용가능 " + data)
							
							switch (data) {
								case 0 : 
									html = "중복되는 아이디가 존재합니다.";
									break;
								case 1 :
									html = "사용 가능한 아이디입니다.";
									break;
								default : 
									html = "알 수 없는 결과";
							}
						}
					});
				} else {
					if (userInput.length > 20 ) {
						html = "너무 깁니다 20자를 넘길 수 없습니다.";
					} else {
						html = "검증 실패. 영문, 숫자 4-20자 이내로 작성하세요.";
					}
				}
			}
			document.getElementById("id"+"Message").innerHTML = html;
			
		});
		
		//nick 검증
		document.getElementById("nick").addEventListener("focusout", function(){
			
			var userInput = this.value;
			console.log(userInput);
			
			var url = "${CONTEXT_PATH}/member/sign/popup/checkNick?nick="+ userInput;	
			
			var result  = "";
			var html = "";
			var id_regex = /^[a-z0-9_-]{4,20}$/;
	// 		let reg_id1 = /^[a-z0-9_-]{4,20}$/; // 소문자 + 숫자 + 언더바/하이픈 허용 4~20자리
	// 		let reg_id2 = /^[A-Za-z]{1}[A-Za-z0-9_-]{3,19}$/ // 반드시 영문으로 시작 숫자+언더바/하이픈 허용 4~20자리
			if(userInput.length < 1) {
				html = "입력해주세요";
			}else {
				var valid = id_regex.test(userInput);
				console.log(valid);
				if (valid) {
					//검증 성공
					//서버 통신
					$.ajax({
						url : url,    
						type : "GET",   
						async : false, 
						success : function(data, status) {
							console.log("0: 사용불가  1: 사용가능 " + data)
							
							switch (data) {
								case 0 : 
									html = "중복되는 닉네임이 존재합니다.";
									break;
								case 1 :
									html = "사용 가능한 닉네임입니다.";
									break;
								default : 
									html = "알 수 없는 결과";
							}
						}
					});
				} else {
					if (userInput.length > 20 ) {
						html = "너무 깁니다 20자를 넘길 수 없습니다.";
					} else {
						html = "검증 실패. 영문, 숫자 4-20자 이내로 작성하세요.";
					}
				}
			}
			document.getElementById("nick"+"Message").innerHTML = html;
			
		});
	}
	</script>
</head>

<body>
  <div class="main-content">
    <div class="container mt-7">
      <!-- Table -->
      <h2 class="mb-5">My Profile Card</h2>
      <div class="row">
        <div class="col-xl-8 m-auto order-xl-1">
          <div class="card bg-secondary shadow">
            <div class="card-header bg-white border-0">
              <div class="row align-items-center">
                <div class="col-8">
                  <h3 class="mb-0">My account</h3>
                </div>
               
              </div>
            </div>
            <div class="card-body">
              <%-- <spring:hasBindErrors name="mem"/> --%>
				<form id="userInput" method="post" name="userinput" onSubmit="return checkIt()"  enctype="multipart/form-data">
                <h6 class="heading-small text-muted mb-4">User information</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group focused">
                        <label class="form-control-label">
                        ID *
<!--                         <input type="button" name="confirmId" value="중복확인" OnClick="openConfirmId(this.form)"  class="btn btn-sm btn-primary ml-1"> -->
                        </label>
                        <div class="input-group">
	                        <input type="text"  id="id" name="id" value="${mem.id }" class="form-control form-control-alternative" placeholder="ID">
	                        <div>
								<p id="idMessage"></p>
							</div>
                        </div>
                        <%-- <form:errors cssClass="text-danger small" path="mem.id"/> --%>
                      </div>
                    </div>
                  </div>  
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group focused">
						<label class="form-control-label" for="input-first-name">Nick name *
<!-- 							<input type="button" name="confirmId" value="중복확인" OnClick="openConfirmId(this.form)"  class="btn btn-sm btn-primary ml-1"> -->
							
						</label>
						<div>
						  <input type="text" id="nick" name="nick" value="${mem.nick }" class="form-control form-control-alternative" placeholder="Nick name">
						<%--  <form:errors cssClass="text-danger small" path="mem.nick"/> --%>
							<div>
								<p id="nickMessage"></p>
							</div>
						</div>
                       </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">Email address *                     	
                        </label>
                        <input type="email" id="reg_email" name="email" value="${mem.email }" class="form-control form-control-alternative" placeholder="Please input your Email">
                       <%--  <form:errors cssClass="text-danger small" path="mem.email"/> --%>
                      </div>
                    </div>
                  </div>
                  
                
                  <div class="row">
                  	<div class="col-lg-4">
                      <div class="form-group focused">
                        <label class="form-control-label" for="password">Password</label>
                        <input type="password" id="reg_password" name="password" value="" placeholder="Password" class="form-control form-control-alternative" placeholder="Password">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-last-name">Rewrite Password</label>
                        <input type="password"  id="reg_confirmPassword" name="confirmPassword" value="" placeholder="Rewrite Password" class="form-control form-control-alternative" >
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4">
                
                
                <!-- Description -->
                <h6 class="heading-small text-muted mb-4">About me</h6>
                
                <div class="pl-lg-4">
                	<div class="form-group">
                		<label class="form-control-label">Private Y/N</label>
                		<div>
                			<div>
<%-- 		                		<input type="checkbox" name="private_yn" <c:if test="${mem.private_yn eq 'Y'}">checked</c:if>/> <span>공개여부</span> --%>
		                		<input type="checkbox" name="private_yn" /> <span>Private Y/N</span>
		                		
                			</div>
                		</div>
                	</div>
                	<div class="row">
	                    <div class="col-4">
	                    	<div class="form-group ">
			                    <label class="form-control-label">Profile Image</label>
			                    <br/>
			                    <div class="text-center my-4">
				                	<img id="thumbnailImg" width="400" src="${CONTEXT_PATH}/resources/images/main/noimage_mem.png" alt="mem_img" class="img-circle"  style="width:100px; height: 100px; vertical-align: left" />
			                    </div>
			  					<div class="text-right">
			  						<input type="file" id="uploadProfImg" name="prof_img" class="form-control form-control-alternative">
			  					</div>
			  					<br><br>
			  					
			  					<br><br>
		                	</div>
	                    </div>
	                    <div class="col-8">
	                      <div class="form-group">
	                        <label class="form-control-label">
	                       	PHONE *
	                        </label>
	                        <div class="input-group">
		                        <input type="text"  id="reg_phone" name="phone" value="${mem.phone }" class="form-control form-control-alternative" placeholder="phone">
	                        </div>
	                       <%--  <form:errors cssClass="text-danger small" path="mem.phone"/> --%>
	                      </div>
	                      <div class="form-group">
	                        <label class="form-control-label" for="input-MBTI">MBTI
	                        </label>
	                        <select class="form-control form-control-alternative" name="mbti"> 
                        		<option value="">선택해주세요.</option> 
                        		<c:forEach var="item" items="${mbtiList}"> 
                        			<option value="${item}" 
                        				<c:if test ="${mem.mbti eq item}">selected="selected"</c:if>>${item}</option> 
                        		</c:forEach> 
                       		</select>
	                        <br>
	            			<a href="https://www.16personalities.com/ko/%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95">나의 MBTI 확인하러가기</a> 
	                      </div>
	                    </div>
	                    
                    </div>
                 	<hr>
					<div class="form-group focused">
						<label class="form-control-label">About Me</label>
						<textarea rows="4" class="form-control form-control-alternative" name="intro" placeholder="A few words about you ...">${mem.intro }</textarea>
					</div>
					<div class="row">
	                    <div class="col-lg-6">
	                      <div class="form-group focused">
	                        <label class="form-control-label">
	                       	Background Image 
	                        </label>
	                        <div class="input-group">
		                        <input type="file"  id="" name="back_img" class="form-control form-control-alternative">
	                        </div>
	                      </div>
	                    </div>
	                    
                    </div>
                </div>
                <div class="">
                	<input type="submit" class="btn btn-block btn-primary" value="SUBMIT"/>
                </div>
            
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <footer class="footer">
    <div class="row align-items-center justify-content-xl-between">
      <div class="col-xl-6 m-auto text-center">
        <div class="copyright">
          <p>Made by CharacterType team</p>
        </div>
      </div>
    </div>
  </footer>

</body>
<script type="text/javascript">
document.getElementById("uploadProfImg").addEventListener('change', (event) => {
	var target = event.target;
	checkExt(target);
	checkFileSize(target);
	uploadImgPreview();
});

function checkExt(target){
	//확장자 검사
	var trgValue= target.value;
	console.log(trgValue);
// 	if( trgValue != "" ){
//         var ext = trgValue.split('.').pop().toLowerCase();
// 	  if($.inArray(ext, ['gif','png','jpg','jpeg','doc','docx','xls','xlsx','hwp']) == -1) {
// 	     alert('등록 할수 없는 파일명입니다.');
// 	     $("#file_text").val(""); // input file 파일명을 다시 지워준다.
// 	     return;
// 	  }
//     }
	/* if( $("#file_text").val() != "" ){
        var ext = $('#docufile').val().split('.').pop().toLowerCase();
	  if($.inArray(ext, ['gif','png','jpg','jpeg','doc','docx','xls','xlsx','hwp']) == -1) {
	     alert('등록 할수 없는 파일명입니다.');
	     $("#file_text").val(""); // input file 파일명을 다시 지워준다.
	     return;
	  }
    } */
}

function checkFileSize() {
// 	var profMaxSize = ${PROF_MAX_SIZE};
	//용량체크
// 	if(document.getElementById("file_text").value!=""){
// 	    var fileSize = document.getElementById("file_text").files[0].size;
// 	    var maxSize = 3 * 1024 * 1024;//3MB
	 	 
// 	    if(fileSize > maxSize){
// 	       alert("첨부파일 사이즈는 3MB 이내로 등록 가능합니다. ");
// 	        $("#file_text").val("");
// 	        return;
// 	     }
// 	} 
}
function uploadImgPreview() {
	// @breif 업로드 파일 읽기
	let fileInfo = document.getElementById("uploadProfImg").files[0];
	let reader = new FileReader();
    // @details readAsDataURL( )을 통해 파일을 읽어 들일때 onload가 실행
    reader.onload = function() {
    	
    	if(reader.result != null) {
        // @details 파일의 URL을 Base64 형태로 가져온다.
	        document.getElementById("thumbnailImg").src = reader.result;
    	} else {
    		document.getElementById("thumbnailImg").src = "${CONTEXT_PATH}/resources/images/main/noimage_mem.png";
    	} 
    	
        // @details 파일의 URL을 Base64 형태로 가져온다.
        document.getElementById("thumbnailImg").src = reader.result;
//         document.getElementById("thumbnailUrl").innerText = reader.result;
		console.log(reader);
    };
    // @details onload 대신 addEventListener( ) 사용가능
	// reader.addEventListener("load", function() {
    //    document.getElementById("thumbnailImg").src = reader.result;
    //    document.getElementById("thumbnailUrl").innerText = reader.result;
	// }, false);
			
	if( fileInfo ) {
        // @details readAsDataURL( )을 통해 파일의 URL을 읽어온다.
        reader.readAsDataURL( fileInfo );
    }
}
</script>
</html>