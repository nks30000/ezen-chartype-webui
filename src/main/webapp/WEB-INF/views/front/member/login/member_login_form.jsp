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
  
    
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeConsoleRunner-d8236034cc3508e70b0763f2575a8bb5850f9aea541206ce56704c013047d712.js"></script>
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-4793b73c6332f7f14a9b6bba5d5e62748e9d1bd0b5c52d7af6376f3d1c625d7e.js"></script>
  <script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRuntimeErrors-4f205f2c14e769b448bcf477de2938c681660d5038bc464e3700256713ebe261.js"></script>
  </head>
  
  <body>
    
    
    <div class="page-header header-filter" style="background-image: url('/charType/resources/images/common/login_bg.jpg'); background-size:  auto 100%; background-position: top center;">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 col-md-6 ml-auto mr-auto">
            <div class="card card-login">
              <form method="post" >
                <div class="card-header card-header-primary text-center">
                  <h4 class="card-title">Login</h4>
                  <div class="social-line">
                    <a href="#pablo" class="btn btn-just-icon btn-link">
                      <i class="fa fa-facebook-square"></i>
                    </a>
                    <a href="#pablo" class="btn btn-just-icon btn-link">
                      <i class="fa fa-twitter"></i>
                    </a>
                    <a href="#pablo" class="btn btn-just-icon btn-link">
                      <i class="fa fa-google-plus"></i>
                    </a>
                  </div>
                </div>
                <!-- <p class="description text-center">Or Be Classical</p> -->
                
                <div class="card-body">
                
                <spring:hasBindErrors name="mem"/>
                  <div class="input-group">
                  </div>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="material-icons">face</i>
                      </span>
                    </div>                   
                    <input type="User ID" class="form-control" id="reg_id" name="id" value="${mem.id }" placeholder="User ID">
                  </div>
                  <form:errors cssClass="text-danger small" path="mem.id" element="p"/>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="material-icons">lock_outline</i>
                      </span>
                    </div>
                    <input type="password" class="form-control" id="reg_password" name="password" value="${mem.password }" placeholder="Password">
                  </div>
                  <form:errors cssClass="text-danger small" path="mem.password" element="p"/>
                </div>
                <div class="footer text-center">
                  <button type="submit" class="btn btn-primary btn-link btn-wd btn-lg">Login</button> 
                  <a href="${CONTEXT_PATH}/member/sign/form" class="btn btn-primary btn-link btn-wd btn-lg">Sign up</a>
                  <a href="${CONTEXT_PATH}/member/password/form" class="btn btn-primary btn-link btn-wd btn-lg">Forget your ID or Password?</a>
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
  
    
  <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script>
  <script src="https://rawgit.com/creativetimofficial/material-kit/master/assets/js/core/bootstrap-material-design.min.js"></script>
    <script src="https://cdpn.io/cp/internal/boomboom/pen.js?key=pen.js-e22493d8-df1b-af25-98f4-b9fcc5e41853" crossorigin=""></script>
  
  
</body>
</html>