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
<html lang="ko" class=""><head>

    <meta charset="UTF-8">
    <title>CodePen Demo</title>
  
    <meta name="robots" content="noindex">
  
    <link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">
    <link rel="mask-icon" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111">
    <link rel="canonical" href="https://codepen.io/creativetim/pen/mGKRJy?editors=1001">
  
    
    
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  
   <link rel="stylesheet" href="/charType/resources/css/main.css">
  
  <style>
  	body {
  		font-family: "맑은 고딕", Arial, serif;
  	}
  	.horizontal-divider-with-txt{
  		display: flex; 
  		flex-flow: row nowrap;
  		align-items: center;
  		text-align: center;
  	}
  	.horizontal-divider-with-txt > span{
  		display:block;
  		flex: 1 0 auto;
  		background-color:#fff;
  	}
  	.horizontal-divider-with-txt > .divider-text-front,
  	.horizontal-divider-with-txt > .divider-text-back {
 		flex: 1 1 auto;
 		height: 1px;
 		background-color: #aaa; 		
  	}
  	.input-ph-c{ display:block; padding: 1.5rem 0 1rem;}
  	.input-ph-c__txt{/*temp*/ display:none;}
  	.input-ph-c > .form-control{
  		width: 100%;
  	}
  	
  	.info-txt{
  		text-align:center; 
  		padding: 20px 0; 
  	}
  </style>
  
  <script>
	function goBack(-1) {
		history.go(-1);
	}
  	window.onload = function(){
  	}
  </script>
  </head>
  
  <body>
    
    
    <div class="page-header header-filter" style="background-image: url('https://rawgit.com/creativetimofficial/material-kit/master/assets/img/bg7.jpg'); background-size: cover; background-position: top center;">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 col-md-6 ml-auto mr-auto">
            <div class="card">
              <form method="post" >
                <div class="card-header card-header-primary text-center">
                  <h4 class="card-title">로그인에 문제가 있나요?</h4>
                </div>
                <div class="card-body">
                	<p class="info-txt">이메일 주소, 전화번호 또는 사용자 이름을 입력하시면 계정에 다시 액세스할 수 있는 링크를 보내드립니다.</p>
					<label class="input-ph-c input-ph-c__block">
	                    <input type="text" class="form-control" id="user_input" name="user_input" value="${mem.id }" placeholder="이메일또는 전화번호, 닉네임">
	                    <span class="input-ph-c__txt">이메일 전화번호 또는 닉네임</span>
					</label>
					<div class="text-center">
						<button type="submit" class="btn btn-primary btn-link btn-wd btn-lg">비밀번호 재발급</button>
						
		                <div class="horizontal-divider-with-txt">
		                	<div class="divider-text-front"></div>
		                	<span>또는</span>
		                	<div class="divider-text-back"></div>
		                </div>
		                
	                	<a href="${CONTEXT_PATH}/member/sign/form" class="btn btn-primary btn-link btn-wd btn-lg">새 계정 만들기</a>
	                </div>
                </div>
                <div class="text-center foot-btn" style="">
                	<button type="button" class="btn btn-primary btn-link btn-wd btn-lg" onclick="goBack();">돌아가기</button> 
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <footer class="footer text-center ">
        <p>Made by CharacterType team</p>
      </footer>
    </div>

</body>
</html>