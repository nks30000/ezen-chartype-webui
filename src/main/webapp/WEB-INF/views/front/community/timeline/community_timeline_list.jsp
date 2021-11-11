<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html lang="en">
<head>


	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesgeet" href="https://rawgit.com/creativetimofficial/material-kit/master/assets/css/material-kit.css">
    
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> -->
    <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${CONTEXT_PATH}/resources/css/desktop.css">
    
	<%@ include file="/WEB-INF/include-header.jspf" %>
	<%@ include file="/WEB-INF/include_popup_header.jspf" %>
	<script src="/charType/resources/script/communityTimeline.js"></script>
	<link rel="stylesheet" href="/charType/resources/css/communityTimeline.css">

<title>Main</title>

</head>
<body>
<nav class="navbar navbar-color-on-scroll fixed-top  navbar-expand-lg " color-on-scroll="100" id="sectionsNav">
    <div class="container">
      <div class="navbar-left navbar-translate">
        <a class="navbar-brand" href="${CONTEXT_PATH}/front/community/timeline/list"><span class="logo"></span><span class="sr-only">Material Kit </span></a>
      </div>
	  <div class="navbar-center collapse navbar-collase">
	  	<%-- <form id="searchfrm" name="searchfrm" novalidate="novalidate">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-md-9 col-sm-36 p-0">
                            <input type="text" id="searchtxt" name="searchtxt" class="form-control search-slt" placeholder="Search" ></input>
                        </div>
                  
                        <div class="col-md-3 col-sm-12 p-0">
                            <button type="button" class="btn btn-danger wrn-btn" id="search">Search</button>
                        </div>
                    </div>
                </div>
            </div>
        </form> --%>
        <form id="searchfrm" name="searchfrm" novalidate="novalidate">
		  	<div class="input-group">
			  	<input type="search" id="searchtxt" name="searchtxt" class="form-control" placeholder="Search"/>
			  	<div class="input-group-btn">
                    <button type="button" class="btn btn-primary" id="search">Search</button>
                </div>
		  	</div>
        </form>
	  </div>
	  <div class="navbar-right collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
        	<c:if test="${sessionScope.session_mem_id != null }">
				<li class="nav-item">
					<a href="/charType/front/community/timeline/list" class="nav-link">
						<i class="fa fa-home"></i>
					</a>
				</li>
				<li class="nav-item">
					<a href="javascript:void(0);" class="nav-link" onclick="alramModal('alram')" >
						<i class="fa fa-heart-o"></i>
					</a>
				</li>
				<li class="nav-item">
					<a href="javascript:void(0);" id="btnPopupWriteBoard" class="nav-link">
						<i class="fa fa-plus-square-o"></i>
					</a>
				</li>
				<!-- <li class="nav-item">
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
				</li> -->
	        	<li class="nav-item">
					<div class="dropdown">
					  <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    <i class="fa fa-user-circle"></i>
					  </a>
					
					  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					    <a class="dropdown-item" href="/charType/front/account/profile/timeline/${sessionScope.session_mem_id}"><i class="fa fa-user-circle-o  mr-2"></i>프로필</a>
					    <a class="dropdown-item" href="/charType/account/profile/config/modify"><i class="fa fa-gear  mr-2"></i>설정</a>
					    <a class="dropdown-item" href="/charType/logout"><i class="fa fa-sign-out  mr-2"></i>로그아웃</a>
					  </div>
					</div>
				</li>
        	</c:if> 
        </ul>
      </div>
    </div>
  </nav>
	<%-- 
	<ul > 
            <li class="nav-item">
          		<a href="/charType/front/account/profile/timeline/${sessionScope.session_mem_id}" class="nav-link">
         	    My page
            	</a>
    		 </li>        
    		
            <li class="nav-item">
           		 <a href="/charType/logout" class="nav-link">
            	Logout
        	     </a>
    		</li>          
       
    </ul> 
    --%>
<div class="main-content">

<section>
    <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://cdn.pixabay.com/photo/2016/02/18/22/18/picnic-1208229_960_720.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://cdn.pixabay.com/photo/2018/08/18/08/05/friends-3614311_960_720.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://cdn.pixabay.com/photo/2014/12/04/15/53/photomontage-556806_960_720.jpg" class="d-block w-100" alt="...">
            </div>
            <!--https://upload.wikimedia.org/wikipedia/commons/8/8d/Yarra_Night_Panorama%2C_Melbourne_-_Feb_2005.jpg-->
        </div>
        <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
 
</section>




<%-- 
<section class="search-sec">
    <div class="container">
        <form id="searchfrm" name="searchfrm" novalidate="novalidate">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-md-9 col-sm-36 p-0">
                            <input type="text" id="searchtxt" name="searchtxt" class="form-control search-slt" placeholder="Search" ></input>
                        </div>
                  
                        <div class="col-md-3 col-sm-12 p-0">
                            <button type="button" class="btn btn-danger wrn-btn" id="search">Search</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section> 
--%>


<div class="container mt-3">

  <div class="row">
  <hr>

			<c:choose>
			<c:when test="${fn:length(list) > 0}">
     			<section class="pinBoot ui-pinboot">
			<c:if test="${fn:length(list) > 0}">
				<c:forEach items="${list}" var="communityList">
 				
 					<article class="white-panel"><img src="/img/${communityList.SAVED_NM}" alt="" />
        				<h4><a href="#this" name="openPopup">${communityList.TITLE}</a>
        				<input type="hidden" name="BOARD_NUM" id="subBoardNum" value="${communityList.BOARD_NUM }">
        				<input type="hidden" name="ID" id="subId" value="${communityList.ID }" >      					
        				</h4>
        				<!-- 게시판 팝업을 위한 전송 데이터 -->
       						 <p>${communityList.CONTENT}</p>
      				</article>
 				</c:forEach>
			</c:if>
				<c:if test="${fn:length(priv) > 0}">
				<c:forEach items="${priv}" var="communityList">
 					<article class="white-panel"><img src="/img/${communityList.SAVED_NM}" alt="" />
        				<h4><a href="#this" name="openPopup">${communityList.TITLE}</a>
        				<input type="hidden" name="BOARD_NUM" id="subBoardNum" value="${communityList.BOARD_NUM }">
        				<input type="hidden" name="ID" id="subId" value="${communityList.ID }" >      					
        				</h4>
        				<!-- 게시판 팝업을 위한 전송 데이터 -->
       						 <p>${communityList.CONTENT}</p>
      				</article>
 				</c:forEach>
			</c:if>
	    	</section>
			</c:when>
			<c:otherwise>
				<div class="text-center">
					조회된 결과가 없습니다.
				</div>
           	</c:otherwise>
           	</c:choose>
  </div>
</div>

</div><!-- /.main-content -->

<div id="modalWrite" class="modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<%@ include file="/WEB-INF/include_popup_body.jspf" %>

</body>

<%@ include file="/WEB-INF/include-body.jspf" %>
<script type="text/javascript">

function popupWrite () {
	$("#modalWrite").modal("show");
}
$(document).ready(function(){
	$("#search").on("click", function(e){ //작성하기 버튼
		e.preventDefault();
		fn_searchNick();
	});
	
	$("#btnPopupWriteBoard").on("click", function() {
		popupWrite();	
	})
});

function fn_searchNick(){
	var comSubmit = new ComSubmit("searchfrm");
	comSubmit.setUrl("<c:url value='/front/community/timeline/search' />");
	comSubmit.submit();
}



</script>


</html>