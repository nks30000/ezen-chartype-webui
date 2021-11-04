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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User information</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="/charType/resources/css/sign-in.css">
    
    
    <!-- jquery -->
	<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
	<script language="JavaScript" src="/charType/resources/script/editScript.js"></script>
	
	<script>
		window.onload = function() {
			
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
						html = "검증 실패";
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
				<form method="post" name="userinput" onSubmit="return checkIt()" enctype="multipart/form-data">
					<input type="hidden" name="id" value="${mem.id}"/>
                	<h6 class="heading-small text-muted mb-4">User information</h6>
	                <div class="pl-lg-4">
	                  <div class="row">
	                    <div class="col-lg-4">
	                      <div class="form-group focused">
		                        <label class="form-control-label" for="input-first-name">Nick name
<!-- 		                        	<input type="button" name="confirmId" value="중복확인" OnClick="checkNick()"  class="btn btn-sm btn-primary ml-1"> -->
		                        	
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
	                        <div>
	                        <input type="email" id="reg_email" name="email" value="${mem.email }" class="form-control form-control-alternative" placeholder="Please input your Email">
	                       <%--  <form:errors cssClass="text-danger small" path="mem.email"/> --%>
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
	                		<label class="form-control-label">Private Y/N</label>
	                		<div>
	                			<div>
									<input type="checkbox" name="private_yn" <c:if test='${mem.private_yn eq "Y"}'>checked</c:if>/> <span>공개여부</span>
	<!-- 		                		<input type="hidden" name="private_yn" value="Y" /> <span>Private Y/N</span> -->
	                			</div>
	                		</div>
	                	</div>
	                	<div class="row">
		                    <div class="col-4">
		                    	<div class="form-group ">
				                    <label class="form-control-label">Profile Image</label>
				                    <br/>
				                    <div class="text-center my-4">
					                	<img width="400" src="/img/${mem.prof_img}" alt="mem_img" class="img-circle"  style="width:100px; height: 100px; vertical-align: left" />
				                    </div>
				  					<div class="text-right">
				  						<input type="file" name="prof_img" class="form-control form-control-alternative">
				  					</div>
				  					<br><br>
				  					
				  					<br><br>
			                	</div>
		                    </div>
		                    <div class="col-8">
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
	                        		<option value="">선택해주세요.</option> 
	                        		<c:forEach var="item" items="${mbtiList}"> 
	                        			<option value="${item}" 
	                        				<c:if test ="${mem.mbti eq item}">selected="selected"</c:if>>${item}</option> 
	                        		</c:forEach> 
	                       		</select>
		                        <%-- <select class="form-control form-control-alternative" name="mbti">
		                        	<option>ISTJ</option>
		                        	<option>ISFJ</option>
		                        	<option>INFJ</option>
		                        	<option>INTJ</option>
		                        	<option>ISTP</option>
		                        	<option>ISFP</option>
		                        	<option>INFP</option>
		                        	<option>INTP</option>
		                        	<option>ESTP</option>
		                        	<option>ESFP</option>
		                        	<option>ENFP</option>
		                        	<option>ENTP</option>
		                        	<option>ESTJ</option>
		                        	<option>ESFJ</option>
		                        	<option>ENFJ</option>
		                        	<option>ENTJ</option>
		                        </select> --%>
		                        <br>
		            <a href="https://www.16personalities.com/ko/%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95">나의 MBTI 확인하러가기</a> 
		                      </div>
		                    </div>
		                    
	                    </div>
	                 	<hr>
						<div class="form-group focused">
							<label class="form-control-label">About Me</label>
							<textarea rows="4" class="form-control form-control-alternative" name="intro" value="${mem.intro }" placeholder="A few words about you ..."></textarea>
						</div>
						<div class="row">
		                    <div class="col-lg-6">
		                      <div class="form-group focused">
		                        <label class="form-control-label">
		                       	Background Image 
		                        </label>
		                        <div class="input-group">
		                        	<img alt="back_img" src="/img/${mem.back_img}">
			                        <input type="file" name="back_img" class="form-control form-control-alternative" placeholder="">
		                        </div>
		                      </div>
		                    </div>
	                    </div>
	                </div>
                <div class="">
                	<input type="submit" class="btn btn-block btn-primary" value="Submit"/>
                </div>
                
                <div class="">
                	<input type="submit" OnClick="window.location='memberDelete.do'" class="btn btn-block btn-primary" value="Withdrawal"/>
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
</html>