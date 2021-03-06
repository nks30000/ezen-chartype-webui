<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<c:set var="BASIC_PROFIMG" value="${CONTEXT_PATH}/resources/images/main/noimage_mem.png"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User information</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesgeet" href="https://rawgit.com/creativetimofficial/material-kit/master/assets/css/material-kit.css">

    <link rel="stylesheet" href="${CONTEXT_PATH}/resources/css/desktop.css">
    <link rel="stylesheet" href="${CONTEXT_PATH}/resources/css/sign-in.css">
    
    <%@ include file="/WEB-INF/include_popup_header.jspf" %>
    
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> -->
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
    <!-- jquery -->
	<script language="JavaScript" src="${CONTEXT_PATH}/resources/script/editScript.js"></script>
	
	
	<script>
	/* ?????????????????? */
	$(function() {
		$('#radioBtn a').on('click', function(){
		    var sel = $(this).data('title');
		    var tog = $(this).data('toggle');
		    $('#'+tog).prop('value', sel);
		    
		    $('a[data-toggle="'+tog+'"]').not('[data-title="'+sel+'"]').removeClass('active').addClass('notActive');
		    $('a[data-toggle="'+tog+'"][data-title="'+sel+'"]').removeClass('notActive').addClass('active');
		})
	})
	</script>
	
</head>

<body>
   <nav class="navbar navbar-color-on-scroll fixed-top  navbar-expand-lg " color-on-scroll="100" id="sectionsNav">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="${CONTEXT_PATH}/front/community/timeline/list"><span class="logo"></span><span class="sr-only">Material Kit </span></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
        </button>
      </div>

	  <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a href="/charType/front/community/timeline/list" class="nav-link">
						<i class="fa fa-home"></i>
					</a>
				</li>
				<li class="nav-item">
					<a href="/charType/account/profile/config/modify" class="nav-link">
						<i class="fa fa-heart-o"></i>
					</a>
				</li>
				<li class="nav-item">
					<a href="/charType/account/profile/config/modify" class="nav-link">
						<i class="fa fa-plus-square-o"></i>
					</a>
				</li>
        	<%-- 
        	<c:if test="${sessionScope.session_mem_id != null }">
				<li class="nav-item">
					<a href="/charType/account/profile/config/modify" class="nav-link">
						<i class="material-icons">apps</i> Edit Profile
					</a>
				</li>
				<li class="nav-item">
					<a href="/charType/logout" class="nav-link">
						<i class="material-icons">apps</i> Logout
					</a>
				</li>
				<li class="nav-item">
					<a href="/charType/front/community/timeline/list" class="nav-link">
						<i class="material-icons">apps</i> Main
					</a>
				</li>
        	</c:if> 
        	--%>
        	<li class="nav-item">
				<div class="dropdown">
				  <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    <i class="fa fa-user-circle"></i>
				  </a>
				
				  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				    <a class="dropdown-item" href="/charType/front/account/profile/timeline/${sessionScope.session_mem_id}"><i class="fa fa-user-circle-o  mr-2"></i>?????????</a>
				    <a class="dropdown-item" href="/charType/front/account/profile/timeline/${sessionScope.session_mem_id}"><i class="fa fa-gear  mr-2"></i>??????</a>
				    <a class="dropdown-item" href="/charType/logout"><i class="fa fa-sign-out  mr-2"></i>????????????</a>
				  </div>
				</div>
			</li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="main-content">
    <div class="container mt-7">
      <!-- Table -->
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
				<form method="post" id="frm" name="userinput" onSubmit="return checkIt()" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${mem.id}"/>
                	<h6 class="heading-small text-muted mb-4">User information</h6>
	                <div class="pl-lg-4">
	                  <div class="row">
	                    <div class="col-lg-4">
	                      <div class="form-group focused">
		                        <label class="form-control-label" for="input-first-name">Nick name
<!-- 		                        	<input type="button" name="confirmId" value="????????????" OnClick="checkNick()"  class="btn btn-sm btn-primary ml-1"> -->
		                        	
		                        </label>
		                      <div>
		                        <input type="text" id="nick" name="nick" value="${mem.nick }" class="form-control form-control-alternative" placeholder="Nick name">
		                       <%--  <form:errors cssClass="text-danger small" path="mem.nick"/> --%>
		                       	<div id="nickMessage"></div>
		                      </div>
	                       </div>
	                    </div>
	                  </div>
	                  <div class="row">
	                    <div class="col-lg-6">
	                      <div class="form-group">
	                        <label class="form-control-label" for="input-email">Email address                      	
	                        </label>
	                        <input type="email" id="email" name="email" value="${mem.email }" class="form-control form-control-alternative" placeholder="Please input your Email">
	                       <%--  <form:errors cssClass="text-danger small" path="mem.email"/> --%>
	                        <div>
								<p id="emailMessage"></p>
							</div>
	                      </div>
	                    </div>
	                  </div>
	                  
	                
	                  <div class="row">
	                  	<div class="col-lg-6">
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
	                		<label class="form-control-label">???????????????</label>
	                		<div>
	                			<div>
<%-- 									<input type="checkbox" name="private_yn" <c:if test='${mem.private_yn eq "Y"}'>checked</c:if>/> <span>????????????</span> --%>
	                			</div>
	                			<div class="input-group">
				    				<div id="radioBtn" class="btn-group">
				    					<a class="btn btn-primary btn-sm <c:choose><c:when test="${mem.private_yn == 'Y' }">active</c:when><c:otherwise>notActive</c:otherwise></c:choose>" data-toggle="happy" data-title="Y">YES</a>
				    					<a class="btn btn-primary btn-sm <c:choose><c:when test="${mem.private_yn == 'N' }">active</c:when><c:otherwise>notActive</c:otherwise></c:choose>" data-toggle="happy" data-title="N">NO</a>
				    				</div>
				    				<input type="hidden" name="private_yn" id="happy" value="${mem.private_yn }">
				    			</div>
	                		</div>
	                	</div>
	                	<div class="row">
		                    <div class="col-lg-4">
		                    	<div class="form-group ">
				                    <label class="form-control-label">Profile Image</label>
				                    <br/>
				                    <div class="text-center">
				                    	<c:choose>
				                    		<c:when test="${mem.prof_img != null }">
							                	<img id="thumbnailImg" width="400" src="/img/${ mem.prof_img}" alt="mem_img" class="img-circle"  style="width:100px; height: 100px; vertical-align: left" />
				                    		</c:when>
				                    		<c:otherwise>
							                	<img id="thumbnailImg" width="400" src="${ BASIC_PROFIMG }" alt="mem_img" class="img-circle"  style="width:100px; height: 100px; vertical-align: left" />
				                    		</c:otherwise>
				                    	</c:choose>
					                	
					                	<button type="button" id="btnResetProfImg" style="display:none;">reset</button>
				                    </div>
				  					<div class="text-right">
				  						<input type="file" id="uploadProfImg" name="prof_img" class="form-control form-control-alternative">
				  					</div>
				  					<br><br>
				  					
				  					<br><br>
			                	</div>
		                    </div>
		                    <div class="col-lg-8">
		                      <div class="form-group">
		                        <label class="form-control-label">
		                       	PHONE 
		                        </label>
		                        <div class="input-group">
			                        <input type="text"  id="reg_phone" name="phone" value="${mem.phone }" class="form-control form-control-alternative" placeholder="phone">
		                        </div>
		                       <%--  <form:errors cssClass="text-danger small" path="mem.phone"/> --%>
		                      </div>
		                      <div class="form-group">
		                        <label class="form-control-label" for="" >MBTI
		                        </label>
	                        	<select class="form-control form-control-alternative" name="mbti"> 
	                        		<option value="">??????????????????.</option> 
	                        		<c:forEach var="item" items="${mbtiList}"> 
	                        			<option value="${item}" 
	                        				<c:if test ="${mem.mbti eq item}">selected="selected"</c:if>>${item}</option> 
	                        		</c:forEach> 
	                       		</select>
		                        <br>
		            <a href="https://www.16personalities.com/ko/%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95">?????? MBTI ??????????????????</a> 
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
		                        	<img alt="back_img" src="/img/${mem.back_img}" class="back_img">
			                        <input type="file" id="uploadBackImg" name="back_img" class="form-control form-control-alternative" placeholder="">
		                        </div>
		                      </div>
		                    </div>
	                    </div>
	                </div>
                <div class="">
                	<input type="submit" class="btn btn-block btn-primary" value="Submit"/>
                </div>
                
                <div class="">
                	<input type="button" OnClick="withdrawUser()" class="btn btn-block btn-primary" value="Withdrawal"/>
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
<script>
function withdrawUser() {
	
	var frm = document.getElementById('frm');
	
	frm.action = "${CONTEXT_PATH}/member/deleteMember";
	console.log(frm.action);
	if(checkIt() != false) {
		if(confirm("?????? ??????????????????????")){
			frm.submit();
		} else{
			alert("????????? ?????????????????????.");
			window.location.reload();//????????? ????????????
		}
	}
	
}

function checkExt(target){//????????? ??????
	
	//??????????????? ????????? ???????????? ????????? ??? ??? ????????? ??????
	var trgValue= target.value;
	if( trgValue != "" ){
        var ext = trgValue.split('.').pop().toLowerCase();
	  if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
	     alert('?????? ?????? ?????? ??????????????????.');
	     $(target).val(""); // input file ???????????? ?????? ????????????.
	     return false;
	  }
    }
	
	// https://happy-hs.tistory.com/20
	/* ????????? ????????????
	if( $("#file_text").val() != "" ){
        var ext = $('#docufile').val().split('.').pop().toLowerCase();
	  if($.inArray(ext, ['gif','png','jpg','jpeg','doc','docx','xls','xlsx','hwp']) == -1) {
	     alert('?????? ?????? ?????? ??????????????????.');
	     $("#file_text").val(""); // input file ???????????? ?????? ????????????.
	     return;
	  }
    } 
	*/
}

function checkFileSize(target) {//????????????
	
	if(target.value!=""){
	    var fileSize = target.files[0].size;
	    var maxSize = 3 * 1024 * 1024;//3MB
	 	 
	    if(fileSize > maxSize){
	       alert("???????????? ???????????? 3MB ????????? ?????? ???????????????. ");
	       target.value = "";
	       return;
	     }
	    
	} 
	//????????????
	// https://happy-hs.tistory.com/20
	/* ????????? ????????????
	if(document.getElementById("file_text").value!=""){
	    var fileSize = document.getElementById("file_text").files[0].size;
	    var maxSize = 3 * 1024 * 1024;//3MB
	 	 
	    if(fileSize > maxSize){
	       alert("???????????? ???????????? 3MB ????????? ?????? ???????????????. ");
	        $("#file_text").val("");
	        return;
	     }
	}  */
}
function uploadImgPreview() {
	// @breif ????????? ?????? ??????
	let fileInfo = document.getElementById("uploadProfImg").files[0];
	let reader = new FileReader();
    // @details readAsDataURL( )??? ?????? ????????? ?????? ????????? onload??? ??????
    reader.onload = function() {
    	if(reader.result != null) {
	        document.getElementById("thumbnailImg").src = reader.result;
    	} 
    };
    
    // @details ????????? URL??? Base64 ????????? ????????????.
    // document.getElementById("thumbnailImg").src = reader.result;
    // document.getElementById("thumbnailUrl").innerText = reader.result;
    
    // @details onload ?????? addEventListener( ) ????????????
	// reader.addEventListener("load", function() {
    //    document.getElementById("thumbnailImg").src = reader.result;
    //    document.getElementById("thumbnailUrl").innerText = reader.result;
	// }, false);
			
	if( fileInfo ) {
        // @details readAsDataURL( )??? ?????? ????????? URL??? ????????????.
        reader.readAsDataURL( fileInfo );
    }
}

function apply(id){
	//???????????? id??? ???????????? ??????
	//????????? opener
	opener.document.regForm.nick.value=id;
	window.close();
}


function checkEmailForm(userInput) {
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // ????????? ????????? ????????? ?????? regExp??? ?????? 
	if (userInput.match(regExp) != null) { 
		return 1;
	} else { 
		return 0; 
	}
}
window.onload = function() {
	
	//????????? ??????
	document.getElementById("email").addEventListener("change", function(){
		var userInput = this.value;
		console.log(userInput);
		var result  = checkEmailForm(userInput);
		var html = "";
		/* 
		0: ?????? ??????, 1: ?????? ?????? 
		*/
		if(result == 0){
			html = "????????? ????????? ??????????????????." 
		}
		document.getElementById("email"+"Message").innerHTML = html;
	});
	//nick ??????
	document.getElementById("nick").addEventListener("change", function(){
		
		var userInput = this.value;
		console.log(userInput);
		
		var url = "${CONTEXT_PATH}/member/sign/popup/checkNick?nick="+ userInput;	
		
		var result  = "";
		var html = "";
		var id_regex = /^[a-z0-9_-]{4,20}$/;
 		//let reg_id1 = /^[a-z0-9_-]{4,20}$/; // ????????? + ?????? + ?????????/????????? ?????? 4~20??????
 		//let reg_id2 = /^[A-Za-z]{1}[A-Za-z0-9_-]{3,19}$/ // ????????? ???????????? ?????? ??????+?????????/????????? ?????? 4~20??????
		if(userInput.length < 1) {
			html = "??????????????????";
		}else {
			var valid = id_regex.test(userInput);
			console.log(valid);
			if (valid) {
				//?????? ??????
				//?????? ??????
				$.ajax({
					url : url,    
					type : "GET",   
					async : false, 
					success : function(data, status) {
						console.log("0: ????????????  1: ???????????? " + data)
						
						switch (data) {
							case 0 : 
								html = "???????????? ???????????? ???????????????.";
								break;
							case 1 :
								html = "?????? ????????? ??????????????????.";
								break;
							default : 
								html = "??? ??? ?????? ??????";
						}
					}
				});
			} else {
				if (userInput.length > 20 ) {
					html = "?????? ????????? 20?????? ?????? ??? ????????????.";
				} else {
					html = "?????? ??????. ??????(???????????? ??????), ??????, ????????????(\'_\',\'-\')?????? 4-20??? ????????? ???????????????.";
				}
			}
		}
		document.getElementById("nick"+"Message").innerHTML = html;
		
	});
	
	document.getElementById("btnResetProfImg").addEventListener("click", function(){
		document.getElementById("uploadProfImg").value = "";
		document.getElementById("btnResetProfImg").style.display = "none"; //reset ?????? ??????
		document.getElementById("thumbnailImg").src = "/img/${mem.prof_img}";
		
	})
	
	document.getElementById("uploadProfImg").addEventListener('change', (event) => {
		var target = event.target;
		if(checkExt(target)){
			return;
		}
		checkFileSize(target);
		uploadImgPreview();
		
		var resetBtn = document.getElementById("btnResetProfImg");
		console.log("resetBtndisplay : "+resetBtn.style.display);
		console.log(resetBtn.style.display =="none")
		
		target.value == "" ? resetBtn.style.display = "none" : resetBtn.style.display = ""; //reset ?????? ??????
		
	});
	document.getElementById("uploadBackImg").addEventListener('change', (event) => {
		var target = event.target;
		if(checkExt(target)){
			return;
		}
		checkFileSize(target);
	});
}
</script>
</body>
</html>