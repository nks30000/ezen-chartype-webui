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
	
<meta charset="UTF-8">
<link rel="stylesheet" href="/charType/resources/css/recomFriend.css">
<title>Recommend Friends</title>
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
			  	<div class="input-group-append">
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
<div class="main-content">
<div class="container">
<div class="row">
<div class="col-12">
	<div class="chat_container">
		<div class="job-box">
			<div class="job-box-filter">
				<div class="row">
					<div class="col-6 d-flex align-items-end">
					<label>Show 
					<select name="datatable_length" class="input-sm">
					<option value="10">10</option>
					<option value="25">25</option>
					<option value="50">50</option>
					<option value="100">100</option>
					</select>
					entries</label>
					</div>
					<div class="col-6 ">
						<div class="form-inline float-right">
							<div class="input-group">	 	
								<select class="form-control form-control-alternative" name="userSelecctMbti" id="userSelecctMbti">						 
	                        		<option value="">MBTI를 선택해주세요</option> 
	                        		<c:forEach var="item" items="${mbtiList}"> 
	                        			<option value="${item}" 
	                        				<c:if test ="${map.mbti eq item}">selected="selected"</c:if>>${item}</option> 
	                        		</c:forEach>                        
	                       		</select>
	                       		<div class="input-group-append">
								    <button type="button" class="btn btn-primary" onclick="getItem()">Search</button>
	                       		</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />


		    <div class="section-intro p-3">Could be your Best Friend!</div>
		    <c:choose>
		    <c:when test= "${fn:length(map.loveList) > 0 }" >
		    	<div class="integration-list row justify-content-center mt-5 mb-5">
		    	<c:forEach items="${map.loveList }" var="map" begin="0" end="4" varStatus="status">
		    		<div class="item col-1">
		    			<div>
					    	<c:choose>
					            <c:when test="${map.PROF_IMG == null}">
				                	<img src="https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTU0NjQzOTk4OTQ4OTkyMzQy/ansel-elgort-poses-for-a-portrait-during-the-baby-driver-premiere-2017-sxsw-conference-and-festivals-on-march-11-2017-in-austin-texas-photo-by-matt-winkelmeyer_getty-imagesfor-sxsw-square.jpg" alt="Circle Image" class="img-raised rounded-circle img-recom" width="55" height="55">
					            </c:when>
					  			<c:otherwise>
				  	 				<img src="/img/${map.PROF_IMG }" alt="Circle Image" class="img-raised rounded-circle img-recom" width="55" height="55">
					  			</c:otherwise>
							</c:choose>			  	 		
		  	 			</div>
		  	 			<p><a href="#openWin" onclick="openWin(this.innerHTML)">${map.ID }</a></p>
		    		</div>
	                
			    </c:forEach>
			    </div>
		    </c:when>
			  			
			  			<c:otherwise>
						   <div class="text-center">
						       There's no Data
						   </div>
						</c:otherwise>
		    </c:choose>

			<div class="inbox-message">
				
				
				<!-- 	<li>
						<a href="#">
							<div class="message-avatar">
								<img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
							</div>
							<div class="message-body">
								<div class="message-body-heading">
									<h5>Daniel Dock <span class="unread">Unread</span></h5>
									<span>7 hours ago</span>
								</div>
								<p>Hello, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolor....</p>
							</div>
						</a>
					</li> -->
			
		        <c:choose>
		          <c:when test="${fn:length(map.recomList) > 0 }">
		          	<ul>
		                <c:forEach items="${map.recomList }" var="map" varStatus="status">
						<li>
							<div class="message-avatar">
								<c:choose>
		              				<c:when test="${map.PROF_IMG == null}">
		                				<img src="https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTU0NjQzOTk4OTQ4OTkyMzQy/ansel-elgort-poses-for-a-portrait-during-the-baby-driver-premiere-2017-sxsw-conference-and-festivals-on-march-11-2017-in-austin-texas-photo-by-matt-winkelmeyer_getty-imagesfor-sxsw-square.jpg" alt="Circle Image" class="img-raised rounded-circle img-fluid" width="55" height="55">
		              				</c:when>
		              			<c:otherwise>
		              	 				<img src="/img/${map.PROF_IMG }" alt="Circle Image" class="img-raised rounded-circle img-fluid" width="55" height="55">
		              			</c:otherwise>
		              			</c:choose>
							</div>
							<div class="message-body">
								<div class="message-body-heading">
									<h5><a href="#openWin" onclick="openWin(this.innerHTML)">${map.ID }</a><span class="unread">${map.MBTI }</span></h5>
									<!-- <span>7 hours ago</span> -->
								</div>
								<p>${map.INTRO}</p>
								
							</div>
							<div class="message-buttons">
								<c:if test="${map.rowFollowCnt == 0 }">
	        						<button class="btn btn-outline-primary btn-sm btnRequestFollow" type="button" id="btnRequestFollow" data-target="${map.ID}">follow</button>			        		
			        					</c:if>
			        					<c:if test="${map.rowFollowCnt > 0 }">
			           				<button class="btn btn-primary btn-sm active btnRequestUnfollow" type="button" id="btnRequestUnfollow" data-target="${map.ID}" >following</button>
			        			</c:if>
							</div>
						</li>	
						</c:forEach>
						</ul>
					</c:when>					
					<c:otherwise>
						   <div class="text-center">
						       There's no Data
						   </div>
						</c:otherwise>
				</c:choose>	
				
			</div>
		</div>
	</div>
</div>
</div>
</div>
</div>
</body>

<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
	<script type="text/javascript">   
	
	function openWin(id){  
		window.location.href = "/charType/front/account/profile/timeline/"+id;

	}  
	
	function getItem(){	  	  
		  var userSelecctMbti = $("#userSelecctMbti");
		  location.href="/charType/recom/memberlist/"+userSelecctMbti.val();
		}
	
	
	$('.btnRequestFollow').click(function(e){
		var url = "/charType/follow/requestFollow?fId="+e.target.getAttribute("data-target");
		$.ajax({
			url : url,    
			type : "GET",   
			async : false, 
			success : function(data, status) {
				window.location.reload();
				console.log(data)
			}
		});
		
// 		window.location = "/charType/follow/requestFollow?fId="+e.target.getAttribute("data-target");

	})
	
	$('.btnRequestUnfollow').click(function(e){
		var url = "/charType/follow/deleteFollow?fId="+e.target.getAttribute("data-target");
		$.ajax({
			url : url,    
			type : "GET",   
			async : false, 
			success : function(data, status) {
				window.location.reload();
				console.log(data)
			}
		});
// 		window.location = "/charType/follow/deleteFollow?fId="+e.target.getAttribute("data-target");
	})


	
	</script>
</html>