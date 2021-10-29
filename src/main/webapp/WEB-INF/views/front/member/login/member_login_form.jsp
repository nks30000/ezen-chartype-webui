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
<html lang="en" class=""><head>

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
    
    
    <div class="page-header header-filter" style="background-image: url('https://rawgit.com/creativetimofficial/material-kit/master/assets/img/bg7.jpg'); background-size: cover; background-position: top center;">
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
                  <a href="memberFind.do" class="btn btn-primary btn-link btn-wd btn-lg">Forget your ID or Password?</a>
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
  
  <style>
    /* google fonts */

/* fallback */
@font-face {
    font-family: 'Material Icons';
    font-style: normal;
    font-weight: 400;
    src: url(https://fonts.gstatic.com/s/materialicons/v41/flUhRq6tzZclQEJ-Vdg-IuiaDsNcIhQ8tQ.woff2) format('woff2');
  }
  /* cyrillic-ext */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 300;
    src: local('Roboto Light'), local('Roboto-Light'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmSU5fCRc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+0460-052F, U+1C80-1C88, U+20B4, U+2DE0-2DFF, U+A640-A69F, U+FE2E-FE2F;
  }
  /* cyrillic */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 300;
    src: local('Roboto Light'), local('Roboto-Light'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmSU5fABc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
  }
  /* greek-ext */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 300;
    src: local('Roboto Light'), local('Roboto-Light'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmSU5fCBc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+1F00-1FFF;
  }
  /* greek */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 300;
    src: local('Roboto Light'), local('Roboto-Light'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmSU5fBxc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+0370-03FF;
  }
  /* vietnamese */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 300;
    src: local('Roboto Light'), local('Roboto-Light'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmSU5fCxc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+0102-0103, U+0110-0111, U+1EA0-1EF9, U+20AB;
  }
  /* latin-ext */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 300;
    src: local('Roboto Light'), local('Roboto-Light'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmSU5fChc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
  }
  /* latin */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 300;
    src: local('Roboto Light'), local('Roboto-Light'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmSU5fBBc4AMP6lQ.woff2) format('woff2');
    unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
  }
  /* cyrillic-ext */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    src: local('Roboto'), local('Roboto-Regular'), url(https://fonts.gstatic.com/s/roboto/v18/KFOmCnqEu92Fr1Mu72xKKTU1Kvnz.woff2) format('woff2');
    unicode-range: U+0460-052F, U+1C80-1C88, U+20B4, U+2DE0-2DFF, U+A640-A69F, U+FE2E-FE2F;
  }
  /* cyrillic */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    src: local('Roboto'), local('Roboto-Regular'), url(https://fonts.gstatic.com/s/roboto/v18/KFOmCnqEu92Fr1Mu5mxKKTU1Kvnz.woff2) format('woff2');
    unicode-range: U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
  }
  /* greek-ext */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    src: local('Roboto'), local('Roboto-Regular'), url(https://fonts.gstatic.com/s/roboto/v18/KFOmCnqEu92Fr1Mu7mxKKTU1Kvnz.woff2) format('woff2');
    unicode-range: U+1F00-1FFF;
  }
  /* greek */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    src: local('Roboto'), local('Roboto-Regular'), url(https://fonts.gstatic.com/s/roboto/v18/KFOmCnqEu92Fr1Mu4WxKKTU1Kvnz.woff2) format('woff2');
    unicode-range: U+0370-03FF;
  }
  /* vietnamese */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    src: local('Roboto'), local('Roboto-Regular'), url(https://fonts.gstatic.com/s/roboto/v18/KFOmCnqEu92Fr1Mu7WxKKTU1Kvnz.woff2) format('woff2');
    unicode-range: U+0102-0103, U+0110-0111, U+1EA0-1EF9, U+20AB;
  }
  /* latin-ext */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    src: local('Roboto'), local('Roboto-Regular'), url(https://fonts.gstatic.com/s/roboto/v18/KFOmCnqEu92Fr1Mu7GxKKTU1Kvnz.woff2) format('woff2');
    unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
  }
  /* latin */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    src: local('Roboto'), local('Roboto-Regular'), url(https://fonts.gstatic.com/s/roboto/v18/KFOmCnqEu92Fr1Mu4mxKKTU1Kg.woff2) format('woff2');
    unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
  }
  /* cyrillic-ext */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 500;
    src: local('Roboto Medium'), local('Roboto-Medium'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmEU9fCRc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+0460-052F, U+1C80-1C88, U+20B4, U+2DE0-2DFF, U+A640-A69F, U+FE2E-FE2F;
  }
  /* cyrillic */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 500;
    src: local('Roboto Medium'), local('Roboto-Medium'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmEU9fABc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
  }
  /* greek-ext */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 500;
    src: local('Roboto Medium'), local('Roboto-Medium'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmEU9fCBc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+1F00-1FFF;
  }
  /* greek */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 500;
    src: local('Roboto Medium'), local('Roboto-Medium'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmEU9fBxc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+0370-03FF;
  }
  /* vietnamese */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 500;
    src: local('Roboto Medium'), local('Roboto-Medium'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmEU9fCxc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+0102-0103, U+0110-0111, U+1EA0-1EF9, U+20AB;
  }
  /* latin-ext */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 500;
    src: local('Roboto Medium'), local('Roboto-Medium'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmEU9fChc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
  }
  /* latin */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 500;
    src: local('Roboto Medium'), local('Roboto-Medium'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmEU9fBBc4AMP6lQ.woff2) format('woff2');
    unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
  }
  /* cyrillic-ext */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 700;
    src: local('Roboto Bold'), local('Roboto-Bold'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmWUlfCRc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+0460-052F, U+1C80-1C88, U+20B4, U+2DE0-2DFF, U+A640-A69F, U+FE2E-FE2F;
  }
  /* cyrillic */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 700;
    src: local('Roboto Bold'), local('Roboto-Bold'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmWUlfABc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
  }
  /* greek-ext */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 700;
    src: local('Roboto Bold'), local('Roboto-Bold'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmWUlfCBc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+1F00-1FFF;
  }
  /* greek */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 700;
    src: local('Roboto Bold'), local('Roboto-Bold'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmWUlfBxc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+0370-03FF;
  }
  /* vietnamese */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 700;
    src: local('Roboto Bold'), local('Roboto-Bold'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmWUlfCxc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+0102-0103, U+0110-0111, U+1EA0-1EF9, U+20AB;
  }
  /* latin-ext */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 700;
    src: local('Roboto Bold'), local('Roboto-Bold'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmWUlfChc4AMP6lbBP.woff2) format('woff2');
    unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
  }
  /* latin */
  @font-face {
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 700;
    src: local('Roboto Bold'), local('Roboto-Bold'), url(https://fonts.gstatic.com/s/roboto/v18/KFOlCnqEu92Fr1MmWUlfBBc4AMP6lQ.woff2) format('woff2');
    unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
  }
  /* cyrillic-ext */
  @font-face {
    font-family: 'Roboto Slab';
    font-style: normal;
    font-weight: 400;
    src: local('Roboto Slab Regular'), local('RobotoSlab-Regular'), url(https://fonts.gstatic.com/s/robotoslab/v7/BngMUXZYTXPIvIBgJJSb6ufA5qWr4xCCQ_k.woff2) format('woff2');
    unicode-range: U+0460-052F, U+1C80-1C88, U+20B4, U+2DE0-2DFF, U+A640-A69F, U+FE2E-FE2F;
  }
  /* cyrillic */
  @font-face {
    font-family: 'Roboto Slab';
    font-style: normal;
    font-weight: 400;
    src: local('Roboto Slab Regular'), local('RobotoSlab-Regular'), url(https://fonts.gstatic.com/s/robotoslab/v7/BngMUXZYTXPIvIBgJJSb6ufJ5qWr4xCCQ_k.woff2) format('woff2');
    unicode-range: U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
  }
  /* greek-ext */
  @font-face {
    font-family: 'Roboto Slab';
    font-style: normal;
    font-weight: 400;
    src: local('Roboto Slab Regular'), local('RobotoSlab-Regular'), url(https://fonts.gstatic.com/s/robotoslab/v7/BngMUXZYTXPIvIBgJJSb6ufB5qWr4xCCQ_k.woff2) format('woff2');
    unicode-range: U+1F00-1FFF;
  }
  /* greek */
  @font-face {
    font-family: 'Roboto Slab';
    font-style: normal;
    font-weight: 400;
    src: local('Roboto Slab Regular'), local('RobotoSlab-Regular'), url(https://fonts.gstatic.com/s/robotoslab/v7/BngMUXZYTXPIvIBgJJSb6ufO5qWr4xCCQ_k.woff2) format('woff2');
    unicode-range: U+0370-03FF;
  }
  /* vietnamese */
  @font-face {
    font-family: 'Roboto Slab';
    font-style: normal;
    font-weight: 400;
    src: local('Roboto Slab Regular'), local('RobotoSlab-Regular'), url(https://fonts.gstatic.com/s/robotoslab/v7/BngMUXZYTXPIvIBgJJSb6ufC5qWr4xCCQ_k.woff2) format('woff2');
    unicode-range: U+0102-0103, U+0110-0111, U+1EA0-1EF9, U+20AB;
  }
  /* latin-ext */
  @font-face {
    font-family: 'Roboto Slab';
    font-style: normal;
    font-weight: 400;
    src: local('Roboto Slab Regular'), local('RobotoSlab-Regular'), url(https://fonts.gstatic.com/s/robotoslab/v7/BngMUXZYTXPIvIBgJJSb6ufD5qWr4xCCQ_k.woff2) format('woff2');
    unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
  }
  /* latin */
  @font-face {
    font-family: 'Roboto Slab';
    font-style: normal;
    font-weight: 400;
    src: local('Roboto Slab Regular'), local('RobotoSlab-Regular'), url(https://fonts.gstatic.com/s/robotoslab/v7/BngMUXZYTXPIvIBgJJSb6ufN5qWr4xCC.woff2) format('woff2');
    unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
  }
  /* cyrillic-ext */
  @font-face {
    font-family: 'Roboto Slab';
    font-style: normal;
    font-weight: 700;
    src: local('Roboto Slab Bold'), local('RobotoSlab-Bold'), url(https://fonts.gstatic.com/s/robotoslab/v7/BngRUXZYTXPIvIBgJJSb6u92w7CLwR2oefDofMY.woff2) format('woff2');
    unicode-range: U+0460-052F, U+1C80-1C88, U+20B4, U+2DE0-2DFF, U+A640-A69F, U+FE2E-FE2F;
  }
  /* cyrillic */
  @font-face {
    font-family: 'Roboto Slab';
    font-style: normal;
    font-weight: 700;
    src: local('Roboto Slab Bold'), local('RobotoSlab-Bold'), url(https://fonts.gstatic.com/s/robotoslab/v7/BngRUXZYTXPIvIBgJJSb6u92w7CCwR2oefDofMY.woff2) format('woff2');
    unicode-range: U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
  }
  /* greek-ext */
  @font-face {
    font-family: 'Roboto Slab';
    font-style: normal;
    font-weight: 700;
    src: local('Roboto Slab Bold'), local('RobotoSlab-Bold'), url(https://fonts.gstatic.com/s/robotoslab/v7/BngRUXZYTXPIvIBgJJSb6u92w7CKwR2oefDofMY.woff2) format('woff2');
    unicode-range: U+1F00-1FFF;
  }
  /* greek */
  @font-face {
    font-family: 'Roboto Slab';
    font-style: normal;
    font-weight: 700;
    src: local('Roboto Slab Bold'), local('RobotoSlab-Bold'), url(https://fonts.gstatic.com/s/robotoslab/v7/BngRUXZYTXPIvIBgJJSb6u92w7CFwR2oefDofMY.woff2) format('woff2');
    unicode-range: U+0370-03FF;
  }
  /* vietnamese */
  @font-face {
    font-family: 'Roboto Slab';
    font-style: normal;
    font-weight: 700;
    src: local('Roboto Slab Bold'), local('RobotoSlab-Bold'), url(https://fonts.gstatic.com/s/robotoslab/v7/BngRUXZYTXPIvIBgJJSb6u92w7CJwR2oefDofMY.woff2) format('woff2');
    unicode-range: U+0102-0103, U+0110-0111, U+1EA0-1EF9, U+20AB;
  }
  /* latin-ext */
  @font-face {
    font-family: 'Roboto Slab';
    font-style: normal;
    font-weight: 700;
    src: local('Roboto Slab Bold'), local('RobotoSlab-Bold'), url(https://fonts.gstatic.com/s/robotoslab/v7/BngRUXZYTXPIvIBgJJSb6u92w7CIwR2oefDofMY.woff2) format('woff2');
    unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB, U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
  }
  /* latin */
  @font-face {
    font-family: 'Roboto Slab';
    font-style: normal;
    font-weight: 700;
    src: local('Roboto Slab Bold'), local('RobotoSlab-Bold'), url(https://fonts.gstatic.com/s/robotoslab/v7/BngRUXZYTXPIvIBgJJSb6u92w7CGwR2oefDo.woff2) format('woff2');
    unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193, U+2212, U+2215, U+FEFF, U+FFFD;
  }
  
  .material-icons {
    font-family: 'Material Icons';
    font-weight: normal;
    font-style: normal;
    font-size: 24px;
    line-height: 1;
    letter-spacing: normal;
    text-transform: none;
    display: inline-block;
    white-space: nowrap;
    word-wrap: normal;
    direction: ltr;
    -webkit-font-feature-settings: 'liga';
    -webkit-font-smoothing: antialiased;
  }
  
  
  
  html *{
    -webkit-font-smoothing: antialiased;
  }
  
  /* typography */
  
  h1,
  .h1 {
    font-size: 3.3125rem;
    line-height: 1.15em;
  }
  
  h2,
  .h2 {
    font-size: 2.25rem;
    line-height: 1.5em;
  }
  
  h3,
  .h3 {
    font-size: 1.5625rem;
    line-height: 1.4em;
  }
  
  h4 {
    font-size: 1.125rem;
    line-height: 1.5em;
  }
  
  h5,
  .h5 {
    font-size: 1.0625rem;
    line-height: 1.55em;
    margin-bottom: 15px;
  }
  
  h6,
  .h6 {
    font-size: 0.75rem;
    text-transform: uppercase;
    font-weight: 500;
  }
  
  p {
    font-size: 14px;
    margin: 0 0 10px;
  }
  
  /* animtaions */
  
  @keyframes topbar-x {
      0% {
        top: 0px;
        transform: rotate(0deg);
      }
      45% {
        top: 6px;
        transform: rotate(145deg);
      }
      75% {
        transform: rotate(130deg);
      }
      100% {
        transform: rotate(135deg);
      }
    }
    @-webkit-keyframes topbar-x {
      0% {
        top: 0px;
        -webkit-transform: rotate(0deg);
      }
      45% {
        top: 6px;
        -webkit-transform: rotate(145deg);
      }
      75% {
        -webkit-transform: rotate(130deg);
      }
      100% {
        -webkit-transform: rotate(135deg);
      }
    }
    @-moz-keyframes topbar-x {
      0% {
        top: 0px;
        -moz-transform: rotate(0deg);
      }
      45% {
        top: 6px;
        -moz-transform: rotate(145deg);
      }
      75% {
        -moz-transform: rotate(130deg);
      }
      100% {
        -moz-transform: rotate(135deg);
      }
    }
    @keyframes topbar-back {
      0% {
        top: 6px;
        transform: rotate(135deg);
      }
      45% {
        transform: rotate(-10deg);
      }
      75% {
        transform: rotate(5deg);
      }
      100% {
        top: 0px;
        transform: rotate(0);
      }
    }
    @-webkit-keyframes topbar-back {
      0% {
        top: 6px;
        -webkit-transform: rotate(135deg);
      }
      45% {
        -webkit-transform: rotate(-10deg);
      }
      75% {
        -webkit-transform: rotate(5deg);
      }
      100% {
        top: 0px;
        -webkit-transform: rotate(0);
      }
    }
    @-moz-keyframes topbar-back {
      0% {
        top: 6px;
        -moz-transform: rotate(135deg);
      }
      45% {
        -moz-transform: rotate(-10deg);
      }
      75% {
        -moz-transform: rotate(5deg);
      }
      100% {
        top: 0px;
        -moz-transform: rotate(0);
      }
    }
    @keyframes bottombar-x {
      0% {
        bottom: 0px;
        transform: rotate(0deg);
      }
      45% {
        bottom: 6px;
        transform: rotate(-145deg);
      }
      75% {
        transform: rotate(-130deg);
      }
      100% {
        transform: rotate(-135deg);
      }
    }
    @-webkit-keyframes bottombar-x {
      0% {
        bottom: 0px;
        -webkit-transform: rotate(0deg);
      }
      45% {
        bottom: 6px;
        -webkit-transform: rotate(-145deg);
      }
      75% {
        -webkit-transform: rotate(-130deg);
      }
      100% {
        -webkit-transform: rotate(-135deg);
      }
    }
    @-moz-keyframes bottombar-x {
      0% {
        bottom: 0px;
        -moz-transform: rotate(0deg);
      }
      45% {
        bottom: 6px;
        -moz-transform: rotate(-145deg);
      }
      75% {
        -moz-transform: rotate(-130deg);
      }
      100% {
        -moz-transform: rotate(-135deg);
      }
    }
    @keyframes bottombar-back {
      0% {
        bottom: 6px;
        transform: rotate(-135deg);
      }
      45% {
        transform: rotate(10deg);
      }
      75% {
        transform: rotate(-5deg);
      }
      100% {
        bottom: 0px;
        transform: rotate(0);
      }
    }
    @-webkit-keyframes bottombar-back {
      0% {
        bottom: 6px;
        -webkit-transform: rotate(-135deg);
      }
      45% {
        -webkit-transform: rotate(10deg);
      }
      75% {
        -webkit-transform: rotate(-5deg);
      }
      100% {
        bottom: 0px;
        -webkit-transform: rotate(0);
      }
    }
    @-moz-keyframes bottombar-back {
      0% {
        bottom: 6px;
        -moz-transform: rotate(-135deg);
      }
      45% {
        -moz-transform: rotate(10deg);
      }
      75% {
        -moz-transform: rotate(-5deg);
      }
      100% {
        bottom: 0px;
        -moz-transform: rotate(0);
      }
    }
    
    
    .nav-open .navbar-collapse {
      -webkit-transform: translate3d(0px, 0, 0);
      -moz-transform: translate3d(0px, 0, 0);
      -o-transform: translate3d(0px, 0, 0);
      -ms-transform: translate3d(0px, 0, 0);
      transform: translate3d(0px, 0, 0);
    }
    .nav-open .navbar-translate {
      -webkit-transform: translate3d(-230px, 0, 0);
      -moz-transform: translate3d(-230px, 0, 0);
      -o-transform: translate3d(-230px, 0, 0);
      -ms-transform: translate3d(-230px, 0, 0);
      transform: translate3d(-230px, 0, 0);
    }
  
  
  /* navbar */
  
  .navbar {
      border: 0;
      border-radius: 3px;
      padding: 10px 0;
      margin-bottom: 20px;
      color: #555;
      background-color: #fff!important;
      box-shadow: 0 4px 18px 0 rgba(0,0,0,.12), 0 7px 10px -5px rgba(0,0,0,.15);
      z-index: 3;
  }
  
  .navbar.navbar-transparent {
      background-color: transparent!important;
      box-shadow: none;
      padding-top: 25px;
      color: #fff;
  }
  
  .navbar.fixed-top {
      border-radius: 0;
  }
  
  .navbar .navbar-brand {
      position: relative;
      color: inherit;
      height: 50px;
      font-size: 1.125rem;
      font-weight: 300;
      line-height: 30px;
      padding: .625rem 0;
  }
  
  .navbar .navbar-toggler .navbar-toggler-icon {
      position: relative;
      width: 22px;
      height: 2px;
      vertical-align: middle;
      outline: 0;
      display: block;
      border-radius: 1px;
      background-color: #fff;
  }
  
  .navbar .navbar-toggler .navbar-toggler-icon+.navbar-toggler-icon {
    margin-top: 4px;
  }
  
  .navbar .navbar-toggler .navbar-toggler-icon:nth-child(2) {
      top: 0px;
      -webkit-animation: topbar-back 500ms linear 0s;
      -moz-animation: topbar-back 500ms linear 0s;
      animation: topbar-back 500ms 0s;
      -webkit-animation-fill-mode: forwards;
      -moz-animation-fill-mode: forwards;
      animation-fill-mode: forwards;
    }
    .navbar .navbar-toggler .navbar-toggler-icon:nth-child(3) {
      opacity: 1;
    }
    .navbar .navbar-toggler .navbar-toggler-icon:nth-child(4) {
      bottom: 0px;
      -webkit-animation: bottombar-back 500ms linear 0s;
      -moz-animation: bottombar-back 500ms linear 0s;
      animation: bottombar-back 500ms 0s;
      -webkit-animation-fill-mode: forwards;
      -moz-animation-fill-mode: forwards;
      animation-fill-mode: forwards;
    }
    .navbar .navbar-toggler.toggled .navbar-toggler-icon:nth-child(2) {
      top: 6px;
      -webkit-animation: topbar-x 500ms linear 0s;
      -moz-animation: topbar-x 500ms linear 0s;
      animation: topbar-x 500ms 0s;
      -webkit-animation-fill-mode: forwards;
      -moz-animation-fill-mode: forwards;
      animation-fill-mode: forwards;
    }
    .navbar .navbar-toggler.toggled .navbar-toggler-icon:nth-child(3) {
      opacity: 0;
    }
    .navbar .navbar-toggler.toggled .navbar-toggler-icon:nth-child(4) {
      bottom: 6px;
      -webkit-animation: bottombar-x 500ms linear 0s;
      -moz-animation: bottombar-x 500ms linear 0s;
      animation: bottombar-x 500ms 0s;
      -webkit-animation-fill-mode: forwards;
      -moz-animation-fill-mode: forwards;
      animation-fill-mode: forwards;
    }
    
    .navbar .navbar-nav .nav-item .nav-link {
      position: relative;
      color: inherit;
      padding: .9375rem;
      font-weight: 400;
      font-size: 12px;
      border-radius: 3px;
      line-height: 20px;
      text-transform: uppercase;
  }
  
  .navbar .navbar-nav .nav-item .nav-link:not(.btn) .material-icons {
      margin-top: -7px;
      top: 3px;
      position: relative;
      margin-right: 3px;
  }
  
  .navbar .navbar-nav .nav-item .nav-link .material-icons {
      font-size: 1.25rem;
      max-width: 24px;
      margin-top: -1.1em;
  }
  
  .navbar .navbar-nav .nav-item .nav-link:not(.btn) .material-icons {
      margin-top: -7px;
      top: 3px;
      position: relative;
      margin-right: 3px;
  }
  .navbar .navbar-nav .nav-item .nav-link .fa, .navbar .navbar-nav .nav-item .nav-link .material-icons {
      font-size: 1.25rem;
      max-width: 24px;
      margin-top: -1.1em;
  }
  
  .navbar .navbar-nav .nav-item .nav-link:not(.btn-just-icon) .fa {
      position: relative;
      top: 2px;
      margin-top: -4px;
      margin-right: 4px;
  }
  
  a .material-icons {
      vertical-align: middle;
  }
  
  /* dropdown */
  
  .dropdown-menu {
      position: absolute;
      top: 100%;
      left: 0;
      z-index: 1000;
      float: left;
      min-width: 10rem;
      margin: .125rem 0 0;
      font-size: 1rem;
      color: #212529;
      text-align: left;
      background-color: #fff;
      background-clip: padding-box;
      border-radius: .25rem;
  }
  
  .dropdown-menu.dropdown-with-icons .dropdown-item {
      padding: .75rem 1.25rem .75rem .75rem;
  }
  
  .dropdown-menu .dropdown-item, .dropdown-menu li>a {
      position: relative;
      width: auto;
      display: flex;
      flex-flow: nowrap;
      align-items: center;
      color: #333;
      font-weight: 400;
      text-decoration: none;
      font-size: .8125rem;
      border-radius: .125rem;
      margin: 0 .3125rem;
      -webkit-transition: all 150ms linear;
      -moz-transition: all 150ms linear;
      -o-transition: all 150ms linear;
      -ms-transition: all 150ms linear;
      transition: all 150ms linear;
      min-width: 7rem;
      padding: .625rem 1.25rem;
      overflow: hidden;
      line-height: 1.428571;
      text-overflow: ellipsis;
      word-wrap: break-word;
  }
  
  .dropdown-menu.dropdown-with-icons .dropdown-item .material-icons {
      vertical-align: middle;
      font-size: 24px;
      position: relative;
      margin-top: -4px;
      top: 1px;
      margin-right: 12px;
      opacity: .5;
  }
  
  .dropdown-menu .dropdown-item:hover, .dropdown-menu a:active, .dropdown-menu a:focus, .dropdown-menu a:hover {
      box-shadow: 0 4px 20px 0 rgba(0,0,0,.14), 0 7px 10px -5px rgba(156,39,176,.4);
      background-color: #9c27b0;
      color: #FFF;
  }
  
  .page-header {
      height: 100vh;
      background-size: cover;
      margin: 0;
      padding: 0;
      border: 0;
      align-items: center;
  }
  
  .header-filter::before {
      position: absolute;
      z-index: 1;
      width: 100%;
      height: 100%;
      display: block;
      left: 0;
      top: 0;
      content: "";
      background: rgba(0,0,0,.5);
  }
  
  .card {
      border: 0;
      margin-bottom: 30px;
      margin-top: 135px;
      border-radius: 6px;
      color: rgba(0,0,0,.87);
      background: #fff;
      width: 100%;
      box-shadow: 0 2px 2px 0 rgba(0,0,0,.14), 0 3px 1px -2px rgba(0,0,0,.2), 0 1px 5px 0 rgba(0,0,0,.12);
      z-index: 2;
  }
  
  .card-login .card-header {
      padding: 20px 0;
      margin: -40px 20px 15px;
  }
  
  .card-login .card-body {
      padding: 0 30px 0 10px;
  }
  .card [class*=header-]{
    color: #fff;
  }
  
  .card h4.card-title {
      margin-top: 10px;
      font-size: 1.125rem;
      font-weight: 700;
      font-family: "Roboto Slab","Times New Roman",serif;
  }
  
  .card .card-header {
      border-radius: 3px;
      padding: 1rem 15px;
      margin-left: 15px;
      margin-right: 15px;
      margin-top: -30px;
      border: 0;
      background: linear-gradient(60deg,#eee,#bdbdbd);
  }
  
  .card .card-header-primary{
        background: linear-gradient(60deg,#ab47bc,#7b1fa2);
        box-shadow: 0 5px 20px 0 rgba(0,0,0,.2), 0 13px 24px -11px rgba(156,39,176,.6);
  }
  
  .card-login .social-line {
      margin-top: 16px;
      text-align: center;
      padding: 0;
  }
  
  .card-login .social-line .btn {
      color: #fff;
      margin-left: 5px;
      margin-right: 5px;
  }
  
  .card-login .input-group {
      padding-bottom: 7px;
      margin: 27px 0 0;
  }
   
   .description {
      color: #999;
  }
  
  p {
      margin: 0 0 10px;
  }
      /* input */
      
      .input-group .input-group-text {
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 0 15px;
      background-color: transparent;
      border-color: transparent;
      }
  .form-control{
    font-size: 14px;
  }
  
  
  .form-control:focus{
    box-shadow: none;
  }
  .form-control::placeholder {
    color: #6c757d;
    opacity: 1;
    font-size: 14px !important;
  }
  
  .form-control::-moz-placeholder {
    color: #AAAAAA;
    font-weight: 400;
    font-size: 14px;
  }
  
  .form-control:-ms-input-placeholder {
    color: #AAAAAA;
    font-weight: 400;
    font-size: 14px;
  }
  
  .form-control::-webkit-input-placeholder {
    color: #AAAAAA;
    font-weight: 400;
    font-size: 14px;
  }
  
  .form-control, .is-focused .form-control {
      background-image: linear-gradient(to top,#9c27b0 2px,rgba(156,39,176,0) 2px),linear-gradient(to top,#d2d2d2 1px,rgba(210,210,210,0) 1px);
  }
  
      /* buttons */
      
      .btn {
      position: relative;
      padding: 12px 30px;
      margin: .3125rem 1px;
      font-size: .75rem;
      font-weight: 400;
      line-height: 1.428571;
      text-decoration: none;
      text-transform: uppercase;
      letter-spacing: 0;
      border: 0;
      border-radius: .2rem;
      outline: 0;
      transition: box-shadow .2s cubic-bezier(.4,0,1,1),background-color .2s cubic-bezier(.4,0,.2,1);
      will-change: box-shadow,transform;
      color: #fff;
      background-color: #999;
      border-color: #999;
      box-shadow: 0 2px 2px 0 rgba(153,153,153,.14), 0 3px 1px -2px rgba(153,153,153,.2), 0 1px 5px 0 rgba(153,153,153,.12);
  }
      
  .btn.btn-just-icon{
      font-size: 24px;
      height: 41px;
      min-width: 41px;
      width: 41px;
      padding: 0;
      overflow: hidden;
      position: relative;
      line-height: 41px;
      }
  
  .btn.btn-just-icon .fa{
        margin-top: 0;
      position: absolute;
      width: 100%;
      transform: none;
      left: 0;
      top: 0;
      height: 100%;
      line-height: 41px;
      font-size: 20px;
  }
  
      
      .btn.btn-link {
      box-shadow: none;
  }
  
  .btn.btn-primary.btn-link {
    background-color: transparent;
    color: #9c27b0;
    box-shadow: none;
  }
  
  .btn.btn-primary.btn-link:hover,
  .btn.btn-primary.btn-link:focus,
  .btn.btn-primary.btn-link:active {
    background-color: transparent;
    color: #9c27b0;
  }
  
  .btn.btn-lg,
  .btn-group-lg>.btn,
  .btn-group-lg .btn {
    padding: 1.125rem 2.25rem;
    font-size: 0.875rem;
    line-height: 1.333333;
    border-radius: 0.2rem;
  }
  
  a:hover,
  a:focus,
  .btn:hover,
  .btn:focus {
    color: #89229b;
    text-decoration: none;
  }
  
  /* footer */
  
  footer {
      position: absolute;
      width: 100%;
      background: 0 0;
         bottom: 0;
      color: #fff;
      z-index: 1;
  }
  
  footer {
      padding: .9375rem 0;
      text-align: center;
  }
  
  footer ul {
      padding: 0;
      margin-bottom: 0;
      list-style: none;
  }
  
  footer p{
      font-weight: 300;
  }
  footer ul li {
      display: inline-block;
  }
  
  footer p a {
      color: #fff;
      font-weight: 400;
  }
  
  footer .copyright {
      padding: 15px 0;
      font-weight: 300;
  }
  
  footer .copyright .material-icons {
      font-size: 18px;
      position: relative;
      top: 3px;
  }
  
  .footer .copyright a {
      color: #fff;
  }
  
  @media (max-width: 991px){
  .navbar .navbar-translate {
      width: 100%;
      position: relative;
      display: flex;
      -ms-flex-pack: justify!important;
      justify-content: space-between!important;
      -ms-flex-align: center;
      align-items: center;
      -webkit-transition: transform .5s cubic-bezier(.685,.0473,.346,1);
      -moz-transition: transform .5s cubic-bezier(.685,.0473,.346,1);
      -o-transition: transform .5s cubic-bezier(.685,.0473,.346,1);
      -ms-transition: transform .5s cubic-bezier(.685,.0473,.346,1);
      transition: transform .5s cubic-bezier(.685,.0473,.346,1);
  }
  
  .navbar-collapse {
      position: fixed;
      display: block;
      top: 0;
      height: 100vh;
      width: 230px;
      right: 0;
      margin-right: 0!important;
      z-index: 1032;
      visibility: visible;
      background-color: #fff;
      overflow-y: visible;
      border-top: none;
      text-align: left;
      padding-right: 0;
      padding-left: 0;
      max-height: none!important;
      -webkit-transform: translate3d(230px,0,0);
      -moz-transform: translate3d(230px,0,0);
      -o-transform: translate3d(230px,0,0);
      -ms-transform: translate3d(230px,0,0);
      transform: translate3d(230px,0,0);
      -webkit-transition: all .5s cubic-bezier(.685,.0473,.346,1);
      -moz-transition: all .5s cubic-bezier(.685,.0473,.346,1);
      -o-transition: all .5s cubic-bezier(.685,.0473,.346,1);
      -ms-transition: all .5s cubic-bezier(.685,.0473,.346,1);
      transition: all .5s cubic-bezier(.685,.0473,.346,1);
  }
  
  .navbar-collapse .navbar-nav .nav-item .nav-link {
      color: #3C4858;
      margin: 5px 15px;
  }
  
  .navbar-collapse .navbar-nav .nav-item:after {
      width: calc(100% - 30px);
      content: "";
      display: block;
      height: 1px;
      margin-left: 15px;
      background-color: #e5e5e5;
  }
  
  .navbar-collapse .dropdown-toggle:after {
      position: absolute;
      right: 16px;
      margin-top: 8px;
  }
  
  .navbar .dropdown .dropdown-menu, .navbar .dropdown.show .dropdown-menu {
      background-color: transparent;
      border: 0;
      padding-bottom: 15px;
      transition: none;
      -webkit-box-shadow: none;
      box-shadow: none;
      transform: none!important;
      width: auto;
      margin-bottom: 15px;
      padding-top: 0;
      height: 300px;
      animation: none;
      opacity: 1;
      overflow-y: scroll;
  }
  .navbar .dropdown-menu .dropdown-item {
      margin-left: 1.5rem;
      margin-right: 1.5rem;
  }
  
  
  }
  
  .page-header{
      min-height: 700px;
      position: relative;
  }
  
  </style>


</body>
</html>