<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/> 

<!DOCTYPE html>
<html lang="en">
<head>
	

  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
  <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
  <link rel="stylesgeet" href="https://rawgit.com/creativetimofficial/material-kit/master/assets/css/material-kit.css">
  <link rel="stylesheet" href="/charType/resources/css/desktop.css">
	<%@ include file="/WEB-INF/include_popup_header.jspf" %>
<!--   <link rel="stylesheet" href="/charType/resources/css/profile.css"> -->

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> -->
  <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script src="/charType/resources/script/communityTimeline.js"></script>
<script src="/charType/resources/script/blocksit.js"></script>


<link rel="stylesheet" href="/charType/resources/css/communityTimeline.css">
<link rel="stylesheet" href="/charType/resources/css/timeline.css">
  
  
</head>

<body class="profile-page">
  <nav class="navbar navbar-color-on-scroll fixed-top navbar-expand-lg " color-on-scroll="100" id="sectionsNav">
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
            
            
            
            
  <div class="page-header header-filter" data-parallax="true" style="
	  <c:choose>
		  <c:when test='${map.member.prof_img != null}'>background-image:url('/img/${map.member.back_img}');</c:when>
		  <c:otherwise>background-image:url('http://wallpapere.org/wp-content/uploads/2012/02/black-and-white-city-night.png');</c:otherwise>
	  </c:choose>">
  </div>
  <div class="main main-raised">
    <div class="profile-content">
      <div class="container">
        <div class="row">
          <div class="col-md-6 ml-auto mr-auto">
            <div class="profile">
              <div class="avatar">
              <c:choose>
              	<c:when test="${map.member.prof_img == null}">
                <img src="https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTU0NjQzOTk4OTQ4OTkyMzQy/ansel-elgort-poses-for-a-portrait-during-the-baby-driver-premiere-2017-sxsw-conference-and-festivals-on-march-11-2017-in-austin-texas-photo-by-matt-winkelmeyer_getty-imagesfor-sxsw-square.jpg" alt="Circle Image" class="img-raised rounded-circle img-fluid">
              	</c:when>
              <c:otherwise>
              	 <img src="/img/${map.member.prof_img}" alt="Circle Image" class="img-raised rounded-circle img-fluid">
              </c:otherwise>
              </c:choose>
              
              </div>
              <div class="name">
                <h6><span class="badge badge-info">${map.member.mbti}</span></h6>
                <h3 class="title"> ${map.member.nick}  </h3>
                <!-- 
                <a href="javascript:void(0);" onclick="alramModal('alram')" >알림</a>
                <a href="#pablo" class="btn btn-just-icon btn-link btn-twitter"><i class="fa fa-twitter"></i></a>
                <a href="#pablo" class="btn btn-just-icon btn-link btn-pinterest"><i class="fa fa-pinterest"></i></a> 
                -->
              </div>
            </div>
          </div>
        </div>
        <div class="description text-center">
          <p>${map.member.intro}</p>
        </div>
        		
				
				<div class="name d-flex justify-content-center" >
					<div class="text-center m-3">
	 					<a href="javascript:void(0);" onclick="followModal('follow')" >
	 					<h3 class="title"> ${map.followCnt }</h3></a>      
	                	<h6>Followers</h6> 
					</div>
                  	<div class="vertical-line"></div>
					<div class="text-center m-3">
						<a href="javascript:void(0);" onclick="followModal('following')" >
	            		<h3 class="title"> ${map.followingCnt }</h3></a>              
	                	<h6>Following</h6>
					</div>            		                                       
               </div>
               
               <div class="text-center mt-3">
	        		<%-- <c:when test="${map.following_id == sessionScope.session_mem_id}"> --%>
	          		<c:if test="${map.following_id != map.follow_id}">
	          			<!-- follow하지 않은상태-->	
			        	<c:if test="${map.followYN == 0 }">			        
			        		<button class="btn btn-dark btn-sm" type="button" id="btnRequestFollow">follow</button>			        		
			        	</c:if>
			        	<!-- follow한 상태일때-->	
			        	<c:if test="${map.followYN == 1 }">
			           		<button class="btn btn-dark btn-sm active" type="button" id="btnRequestUnfollow" >following</button>
			        	</c:if>			        		       
					</c:if>
					<%-- </c:when> --%>
        		</div>
				
	          					        		        	        		
<c:choose>
 <c:when test="${map.member.private_yn=='N'}">	          					        		        	        		      
				
        <div class="row">
          <div class="col-md-6 ml-auto mr-auto">
            <div class="profile-tabs">
              <ul class="nav nav-pills nav-pills-icons justify-content-center" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" href="#life" role="tab" data-toggle="tab">
                    <i class="material-icons">camera</i>
                    Life
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link " href="#fav" role="tab" data-toggle="tab">
                    <i class="material-icons">favorite</i>
                    Favorite
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#shop" role="tab" data-toggle="tab">
                    <i class="material-icons">palette</i>
                    Shop List
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#style" role="tab" data-toggle="tab">
                    <i class="material-icons">style</i>
                    Style
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
 <!-- ============================================================================================== -->



 <c:choose>
              	<c:when test="${ID == sessionScope.session_mem_id}">
                
 
 <%-- 
 <form id="frm" name="frm" enctype="multipart/form-data">
                     <div class="card gedf-card">
                        <div class="card-header">
                            <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">Make
                                        a publication</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="images-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#images">Images</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <div class="tab-content" id="myTabContent">
                            
                          	  <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                   <div class="form-group">
                                   <label class="sr-only" for="message">post</label>
                                   <textarea class="form-control" id="TITLE" name="TITLE" rows="1" placeholder="Write your title"></textarea>
                                   <textarea class="form-control" id="CONTENT" name="CONTENT" rows="3" placeholder="What are you thinking?"></textarea>
                                 			
                             </div>
                             </div>
                            
                         
                                        
                             
        			   <input type="hidden" id="ID" name="ID" value="${sessionScope.session_mem_id}">
    				   <input type="hidden" id="NICK" name="NICK" value="${sessionScope.session_mem_nick}">
    				   <input type="hidden" id="MBTI" name="MBTI" value="${sessionScope.session_mem_mbti}">

                                
                                <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                                    <div class="form-group">
                                        <div class="custom-file">
                                        	<div id="fileDiv">
                                            	<p>
                                            	<input type="file" name="file_0">
                                 				<a href="#this" class="btn" id="deleteFile">delete</a>
                                            	</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="py-4"></div>
                                </div>
                                  <label for="CATEGORY">Choose a category:</label>
								<select name="CATEGORY" id="CATEGORY">
  									<option value="LIFE">LIFE</option>
  									<option value="FAVORITE">FAVORITE</option>
  									<option value="SHOP">SHOP LIST</option>
  									<option value="STYLE">STYLE</option>
								</select>
                            </div>
                            <div class="btn-toolbar justify-content-between">
                                <div class="btn-group">
                                <a href=#this class="btn btn-primary" id="addFile">add file</a>
                                    <a href=#this class="btn btn-primary" id="write">share</a>
                                </div>   
                            </div>
                        </div>
                    </div>
			 </form> 
			 --%>
</c:when>
</c:choose>   




<!-- ============================================================================================== -->
       

        <div class="tab-content tab-space">
		<div class="tab-pane active text-center gallery" id="life">
		    <section class="blockIt ui-pinboot">

           <c:choose>
					<c:when test="${fn:length(life) > 0}">
					<c:forEach items="${life}" var="timelineLife">
             			<article class="white-panel"><img src="/img/${timelineLife.SAVED_NM}" alt="" />
        				<h4><a href="#" name="openPopup">${timelineLife.TITLE}</a>
        				<input type="hidden" name="BOARD_NUM" id="subBoardNum" value="${timelineLife.BOARD_NUM }">
        				<input type="hidden" name="ID" id="subId" value="${timelineLife.ID }" >
        				</h4>
       					 <p>${timelineLife.CONTENT}</p>
      					</article>
<%--               			<button id="delete" onclick="location.href='delete?num=${timelineFav.BOARD_NUM}'">delete</button>
 --%>       				
 					</c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           	 </c:choose>
  		 </section>
		</div>



        

        
        
        
          <%-- <div class="tab-pane active text-center gallery" id="life">
            <div class="row">
              <div class="col-md-3 ml-auto">
              	<c:choose>
					<c:when test="${fn:length(life) > 0}">
					<c:forEach items="${life }" var="timelineLife" begin="0" step="2">
              			<img src ="/img/${timelineLife.SAVED_NM}">
              			<button id="delete" onclick="location.href='delete?num=${timelineLife.BOARD_NUM}'">delete</button>
       				  </c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           	 </c:choose>
              </div>
              <div class="col-md-3 mr-auto">
                <c:choose>
					<c:when test="${fn:length(life) > 0}">
					<c:forEach items="${life}" var="timelineLife" begin="1" step="2">
              			<img src ="/img/${timelineLife.SAVED_NM}">
              			<button id="delete" onclick="location.href='delete?num=${timelineLife.BOARD_NUM}'">delete</button>
       				  </c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           		 </c:choose>
              </div> 
            </div>
          </div> --%>
          
<!-- ============================================================================================== -->
          
          <div class="tab-pane text-center gallery" id="fav">
	  	   <section class="blockIt ui-pinboot">

			     <c:choose>
			    
					<c:when test="${fn:length(fav) > 0}">
					<c:forEach items="${fav}" var="timelineFav">
             			<article class="white-panel"><img src="/img/${timelineFav.SAVED_NM}" alt=""/>
        				<h4><a href="#" name="openPopup">${timelineFav.TITLE}</a>
        				<input type="hidden" name="BOARD_NUM" id="subBoardNum" value="${timelineFav.BOARD_NUM }">
        				<input type="hidden" name="ID" id="subId" value="${timelineFav.ID }" >
        				</h4>
       					 <p>${timelineFav.CONTENT}</p>
      					</article>
<%--               			<button id="delete" onclick="location.href='delete?num=${timelineFav.BOARD_NUM}'">delete</button>
 --%>       				
 					</c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           				
           	 </c:choose>
		
          </section>
          </div>
          
 <!-- ============================================================================================== -->
          
          
        <div class="tab-pane text-center gallery" id="shop">
          <section class="blockIt ui-pinboot">

           <c:choose>
					<c:when test="${fn:length(shop) > 0}">
					<c:forEach items="${shop}" var="timelineShop">
             			<article class="white-panel"><img src="/img/${timelineShop.SAVED_NM}" alt="">
        				<h4><a href="#" name="openPopup">${timelineShop.TITLE}</a>
        				<input type="hidden" name="BOARD_NUM" id="subBoardNum" value="${timelineShop.BOARD_NUM }">
        				<input type="hidden" name="ID" id="subId" value="${timelineShop.ID }" >
        				</h4>
       					 <p>${timelineShop.CONTENT}</p>
      					</article>
<%--               			<button id="delete" onclick="location.href='delete?num=${timelineFav.BOARD_NUM}'">delete</button>
 --%>       				
 					</c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           	 </c:choose>
    </section>
	</div>
          
       
           <!-- ============================================================================================== -->
          
          <div class="tab-pane text-center gallery" id="style">
          	          <section class="blockIt ui-pinboot">

           <c:choose>
					<c:when test="${fn:length(style) > 0}">
					<c:forEach items="${style}" var="timelineStyle">
             			<article class="white-panel"><img src="/img/${timelineStyle.SAVED_NM}" alt="">
        				<h4><a href="#" name="openPopup">${timelineStyle.TITLE}</a>
        				<input type="hidden" name="BOARD_NUM" id="subBoardNum" value="${timelineStyle.BOARD_NUM }">
        				<input type="hidden" name="ID" id="subId" value="${timelineStyle.ID }" >
        				</h4>
       					 <p>${timelineStyle.CONTENT}</p>
      					</article>
<%--               			<button id="delete" onclick="location.href='delete?num=${timelineFav.BOARD_NUM}'">delete</button>
 --%>       				
 					</c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           	 </c:choose>
    </section>
          	
          	
          	
          	
          	
          	
          	
          </div>
          </div>
</c:when>

<c:when test="${map.member.private_yn=='Y'}">
 	<c:if test="${map.privateCheck == 1}">
		
        <div class="row">
          <div class="col-md-6 ml-auto mr-auto">
            <div class="profile-tabs">
              <ul class="nav nav-pills nav-pills-icons justify-content-center" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" href="#life" role="tab" data-toggle="tab">
                    <i class="material-icons">camera</i>
                    Life
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link " href="#fav" role="tab" data-toggle="tab">
                    <i class="material-icons">favorite</i>
                    Favorite
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#shop" role="tab" data-toggle="tab">
                    <i class="material-icons">palette</i>
                    Shop List
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#style" role="tab" data-toggle="tab">
                    <i class="material-icons">style</i>
                    Style
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
 <!-- ============================================================================================== -->



 <c:choose>
              	<c:when test="${ID == sessionScope.session_mem_id}">
                
 
 <%-- 
 <form id="frm" name="frm" enctype="multipart/form-data">
                     <div class="card gedf-card">
                        <div class="card-header">
                            <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">Make
                                        a publication</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="images-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#images">Images</a>
                                </li>
                            </ul>
                        </div>
                        <div class="card-body">
                            <div class="tab-content" id="myTabContent">
                            
                          	  <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                   <div class="form-group">
                                   <label class="sr-only" for="message">post</label>
                                   <textarea class="form-control" id="TITLE" name="TITLE" rows="1" placeholder="Write your title"></textarea>
                                   <textarea class="form-control" id="CONTENT" name="CONTENT" rows="3" placeholder="What are you thinking?"></textarea>
                                 			
                             </div>
                             </div>
                            
                         
                                        
                             
        			   <input type="hidden" id="ID" name="ID" value="${sessionScope.session_mem_id}">
    				   <input type="hidden" id="NICK" name="NICK" value="${sessionScope.session_mem_nick}">
    				   <input type="hidden" id="MBTI" name="MBTI" value="${sessionScope.session_mem_mbti}">

                                
                                <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                                    <div class="form-group">
                                        <div class="custom-file">
                                        	<div id="fileDiv">
                                            	<p>
                                            	<input type="file" name="file_0">
                                 				<a href="#this" class="btn" id="deleteFile">delete</a>
                                            	</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="py-4"></div>
                                </div>
                                  <label for="CATEGORY">Choose a category:</label>
								<select name="CATEGORY" id="CATEGORY">
  									<option value="LIFE">LIFE</option>
  									<option value="FAVORITE">FAVORITE</option>
  									<option value="SHOP">SHOP LIST</option>
  									<option value="STYLE">STYLE</option>
								</select>
                            </div>
                            <div class="btn-toolbar justify-content-between">
                                <div class="btn-group">
                                <a href=#this class="btn btn-primary" id="addFile">add file</a>
                                    <a href=#this class="btn btn-primary" id="write">share</a>
                                </div>   
                            </div>
                        </div>
                    </div>
			 </form> 
 --%>
</c:when>
</c:choose>   




<!-- ============================================================================================== -->
       

        <div class="tab-content tab-space">
		<div class="tab-pane active text-center gallery" id="life">
		    <section class="blockIt ui-pinboot">

           <c:choose>
					<c:when test="${fn:length(life) > 0}">
					<c:forEach items="${life}" var="timelineLife">
             			<article class="white-panel"><img src="/img/${timelineLife.SAVED_NM}" alt="" />
        				<h4><a href="#" name="openPopup">${timelineLife.TITLE}</a>
        				<input type="hidden" name="BOARD_NUM" id="subBoardNum" value="${timelineLife.BOARD_NUM }">
        				<input type="hidden" name="ID" id="subId" value="${timelineLife.ID }" >
        				</h4>
       					 <p>${timelineLife.CONTENT}</p>
      					</article>
<%--               			<button id="delete" onclick="location.href='delete?num=${timelineFav.BOARD_NUM}'">delete</button>
 --%>       				
 					</c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           	 </c:choose>
  		 </section>
		</div>



        

        
        
        
          <%-- <div class="tab-pane active text-center gallery" id="life">
            <div class="row">
              <div class="col-md-3 ml-auto">
              	<c:choose>
					<c:when test="${fn:length(life) > 0}">
					<c:forEach items="${life }" var="timelineLife" begin="0" step="2">
              			<img src ="/img/${timelineLife.SAVED_NM}">
              			<button id="delete" onclick="location.href='delete?num=${timelineLife.BOARD_NUM}'">delete</button>
       				  </c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           	 </c:choose>
              </div>
              <div class="col-md-3 mr-auto">
                <c:choose>
					<c:when test="${fn:length(life) > 0}">
					<c:forEach items="${life}" var="timelineLife" begin="1" step="2">
              			<img src ="/img/${timelineLife.SAVED_NM}">
              			<button id="delete" onclick="location.href='delete?num=${timelineLife.BOARD_NUM}'">delete</button>
       				  </c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           		 </c:choose>
              </div> 
            </div>
          </div> --%>
          
<!-- ============================================================================================== -->
          
          <div class="tab-pane text-center gallery" id="fav">
	  	   <section class="blockIt ui-pinboot">

			     <c:choose>
			    
					<c:when test="${fn:length(fav) > 0}">
					<c:forEach items="${fav}" var="timelineFav">
             			<article class="white-panel"><img src="/img/${timelineFav.SAVED_NM}" alt=""/>
        				<h4><a href="#" name="openPopup">${timelineFav.TITLE}</a>
        				<input type="hidden" name="BOARD_NUM" id="subBoardNum" value="${timelineFav.BOARD_NUM }">
        				<input type="hidden" name="ID" id="subId" value="${timelineFav.ID }" >
        				</h4>
       					 <p>${timelineFav.CONTENT}</p>
      					</article>
<%--               			<button id="delete" onclick="location.href='delete?num=${timelineFav.BOARD_NUM}'">delete</button>
 --%>       				
 					</c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           				
           	 </c:choose>
		
          </section>
          </div>
          
 <!-- ============================================================================================== -->
          
          
        <div class="tab-pane text-center gallery" id="shop">
          <section class="blockIt ui-pinboot">

           <c:choose>
					<c:when test="${fn:length(shop) > 0}">
					<c:forEach items="${shop}" var="timelineShop">
             			<article class="white-panel"><img src="/img/${timelineShop.SAVED_NM}" alt="">
        				<h4><a href="#" name="openPopup">${timelineShop.TITLE}</a>
        				<input type="hidden" name="BOARD_NUM" id="subBoardNum" value="${timelineShop.BOARD_NUM }">
        				<input type="hidden" name="ID" id="subId" value="${timelineShop.ID }" >
        				</h4>
       					 <p>${timelineShop.CONTENT}</p>
      					</article>
<%--               			<button id="delete" onclick="location.href='delete?num=${timelineFav.BOARD_NUM}'">delete</button>
 --%>       				
 					</c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           	 </c:choose>
    </section>
	</div>
          
       
           <!-- ============================================================================================== -->
          
          <div class="tab-pane text-center gallery" id="style">
          	          <section class="blockIt ui-pinboot">

           <c:choose>
					<c:when test="${fn:length(style) > 0}">
					<c:forEach items="${style}" var="timelineStyle">
             			<article class="white-panel"><img src="/img/${timelineStyle.SAVED_NM}" alt="">
        				<h4><a href="#" name="openPopup">${timelineStyle.TITLE}</a>
        				<input type="hidden" name="BOARD_NUM" id="subBoardNum" value="${timelineStyle.BOARD_NUM }">
        				<input type="hidden" name="ID" id="subId" value="${timelineStyle.ID }" >
        				</h4>
       					 <p>${timelineStyle.CONTENT}</p>
      					</article>
<%--               			<button id="delete" onclick="location.href='delete?num=${timelineFav.BOARD_NUM}'">delete</button>
 --%>       				
 					</c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           	 </c:choose>
    </section>
          	
          	
          	
          	
          	
          	
          	
          </div>
          </div>
		
		
    </c:if>
    
    <c:if test="${map.privateCheck == 0}">
    이 계정은 비공개 계정입니다.
    </c:if>
    </c:when>
    </c:choose>
          </div>
          </div>
          </div>
          
	<div id="modalWrite" class="modal">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-control-panel">
		        	<button type="button" class="close float-left"  data-dismiss="modal"><i class="fa fa-angle-left"></i><span class="sr-only">Close</span></button>
		        </div>
<!-- 				<div class="modal-header"> -->
<!-- 					<button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 			          <span aria-hidden="true">&times;</span> -->
<!-- 			        </button> -->
<!-- 				</div> -->
				<div class="modal-body">
					<form id="frm" name="frm" enctype="multipart/form-data">
			            <div class="card gedf-card">
			               <div class="card-header">
			                   <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
			                       <li class="nav-item">
			                           <a class="nav-link active" id="images-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#images">Images</a>
			                       </li>
			                       <li class="nav-item">
			                           <a class="nav-link" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">Make
			                               a publication</a>
			                       </li>
			                   </ul>
			               </div>
			               <div class="card-body">
								<div class="tab-content" id="myTabContent">
			                   
								<div class="tab-pane fade" id="posts" role="tabpanel" aria-labelledby="posts-tab">
									<div class="form-group">
										<label class="sr-only" for="message">post</label>
										<textarea class="form-control" id="TITLE" name="TITLE" rows="1" placeholder="Write your title"></textarea>
										<textarea class="form-control" id="CONTENT" name="CONTENT" rows="3" placeholder="What are you thinking?"></textarea>
										   			
									</div>
								</div>
								<input type="hidden" id="ID" name="ID" value="${sessionScope.session_mem_id}">
								<input type="hidden" id="NICK" name="NICK" value="${sessionScope.session_mem_nick}">
								<input type="hidden" id="MBTI" name="MBTI" value="${sessionScope.session_mem_mbti}">
								<div class="tab-pane fade show active" id="images" role="tabpanel" aria-labelledby="images-tab">
								    <div class="form-group">
								        <div class="">
								        	<div id="fileDiv" class="img-list">
								            	<p class="img-item" id="imgWrap0">
									            	<img alt="이미지" src="" id="img0">
									            	<input type="file" name="file_0" id="file_0">
									 				<a href="javascript:void(0);" class="btn btn-primary file-popup">add</a>
									 				<a href="javascript:void(0);" class="btn btn-primary delete-file" id="deleteFile">delete</a>
								            	</p>
								            </div>
								        </div>
								    </div>
								    <div class="py-4"></div>
								</div>
								<label for="CATEGORY">Choose a category:</label>
								<select name="CATEGORY" id="CATEGORY" class="form-control">
									<option value="LIFE">LIFE</option>
									<option value="FAVORITE">FAVORITE</option>
									<option value="SHOP">SHOP LIST</option>
									<option value="STYLE">STYLE</option>
								</select>
								</div>
								<div class="btn-toolbar justify-content-between">
								    	<a href="javascript:void(0);" class="btn btn-primary" id="btnReset">Reset</a>
								    	<a href=#this class="btn btn-primary" id="addFile">add file</a>
								    	<a href="javascript:void(0);" class="btn btn-primary" id="btnTabNext">Next</a>
								    	
								        <a href=#this class="btn btn-primary" id="write">share</a>
								    <div class="btn-group">
								    </div>   
								</div>
			                </div>
			            </div>
					</form>	
				</div>
			</div>
		</div>
	</div>       


	
  <footer class="footer text-center ">
    <p>Made by <b>CharacterType</b> team</p>
  </footer>

  

<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <!-- <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary">Save changes</button>
	      </div> -->
<!-- 	      <iframe src="/charType/follow/follow_list" height="500px"></iframe> -->
	    </div>
	  </div>
	</div>
	<%@ include file="/WEB-INF/include-body.jspf" %>
	<%@ include file="/WEB-INF/include_popup_body.jspf" %>
</body>


<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

	<script type="text/javascript">
		var gfv_count = 1;
	
		$(document).ready(function(){
			
			initImgForm($("#imgWrap0"));
			
			
			//글쓰기 팝업 next 버튼
			$("#modalWrite").find("#btnTabNext").on("click", function(){
				var nav = $(this).parents(".modal-content:first").find(".nav");
				var navLink = $(this).parents(".modal-content:first").find(".nav-link.active");
				var navItem = navLink.parent();
				var index = navItem.index();
				nav.find(".nav-item").eq(index+1).find(".nav-link").click();
			}) 
			
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_insertBoard();
			});
			
			$("#addFile").on("click", function(e){ //파일 추가 버튼 
				e.preventDefault(); 
				fn_addFile(); 
			});


		$('#btnRequestFollow').click(function(){
			window.location = "/charType/follow/requestFollow?fId=${map.pageId}";

		})
		
		$('#btnRequestUnfollow').click(function(){
			window.location = "/charType/follow/deleteFollow?fId=${map.pageId}";
		})
		
		$('#btnalram').click(function(){
			window.location = "/charType/alram/list/like?ALRAM_ID=${sessionScope.session_mem_id}";
		})
		$('#btnPopupWriteBoard').click(function(){
			$("#modalWrite").modal({
				backdrop:'static',
				keyboard:false
			});
		})
		$('#btnReset').click(function(){
			document.getElementById('frm').reset();
			
			$("#frm").find("input[type='file']").each(function(index, el) {
				console.log(el)
				$(el).parent().removeClass("added");
				$(el).siblings("img").attr("src", "");
			})
			if ($("#fileDiv").find(".img-item").length > 1 ) {
				$("#fileDiv").find(".img-item:first").siblings().remove();
			}
		})
		
		$('.profile-tabs').find('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
// 		  $($(e.target).attr('href')).find(".pinBoot").pinterest_grid();
		    var container = $($(e.target).attr('href')).find(".blockIt");
			
		    var timer
			var option = {
			        numOfCol: 3,
			        offsetX: 0,
			        offsetY: 10,
			        blockElement: '.white-panel'
			    }
			var wth = container[0].offsetWidth;
			
			var setcol = function () {
				if(wth > 1000) {
					option.numOfCol = 4
				} else if(wth > 900) {
					option.numOfCol = 3
				} else if(wth > 600) {
					option.numOfCol = 2
				} else {
					option.numOfCol = 1
				}
			}
			
			
			container.BlocksIt(option);
			
			$(window).resize(function() {
				
				wth = container[0].offsetWidth;
				
				setcol();
				
				timer = setTimeout( function(){
					container.BlocksIt(option);
				}, 500)
			})
		})
		gridInit();
	});
		function gridInit (el) {
			var container = $(".blockIt");
			
			if (el) {
				container = el;
			}
			
		    var timer
			var option = {
			        numOfCol: 3,
			        offsetX: 0,
			        offsetY: 10,
			        blockElement: '.white-panel'
			    }
			var wth = container[0].offsetWidth;
			
			var setcol = function () {
				if(wth > 900) {
					option.numOfCol = 4
				} else if(wth > 700) {
					option.numOfCol = 3
				} else if(wth > 600) {
					option.numOfCol = 2
				} else {
					option.numOfCol = 1
				}
			}
			
			
			container.BlocksIt(option);
			
			$(window).resize(function() {
				
				wth = container[0].offsetWidth;
				
				setcol();
				
				timer = setTimeout( function(){
					container.BlocksIt(option);
				}, 500)
			})
		}
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.submit();
		}
		
		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/front/account/profile/write' />");
			comSubmit.submit();
		}
		
		
		function fn_addFile(){
			if( document.getElementById("file_"+ (gfv_count-1)).files.length == 0){
				alert("빈 폼이 있어요")
				return;
			}
			var itemId = "imgWrap"+gfv_count;
			var formName = "file_"+gfv_count;
			var delBtnId = "deleteFile"+gfv_count;
			var thumbnailId = "img"+gfv_count;
			var str = "<p id='"+itemId+"' class='img-item'><img src='' id='"+ thumbnailId+"'/><input type='file' id='"+formName+"' name='file_"+(gfv_count)+"'><a href='javascript:void(0);' class='btn btn-primary file-popup'>add</a><a href=''#this' class='btn btn-primary delete-file' id='deleteFile"+(gfv_count)+"' name='deleteFile'>delete</a></p>";
			
			$("#fileDiv").append(str);
			initImgForm($("#"+itemId));
			
// 			$("#"+itemId).find(".file-popup").click(function(){
// 				e.preventDefault();
// 				$('#'+formName).trigger("click");
// 			});
// 			$("#"+itemId).find(".delete-file").on("click", function(e){ //삭제 버튼
// 				e.preventDefault();
// 				fn_deleteFile($(this));
// 			});

// 			$("#"+itemId).find("input").on("change", function(e) {
// 				uploadImgPreview(formName, thumbnailId );
// 				$('#'+itemId).addClass("added");
// 				$(e.target).siblings("img").show();
// 			})
			$('#'+formName).trigger("click");
			gfv_count++;
		}
		
		function fn_deleteFile(obj){
			if($("#fileDiv").find(".img-item").length == 1){
				alert("하나밖에 안남음")
				return;
			}
			obj.parent().remove(); 
			
		}


		
		function followModal(param) {
			
			var uri = "";
			var html = "";
			
			if(param== "follow"){
				uri="/charType/follow/follow_list/${pageId}";
			}else if(param== "following") {
				uri="/charType/follow/following_list/${pageId}";
			}
			
			html = "<iframe src='"+ uri +"' style='height: 500px;'></iframe>";
			
			$("#exampleModalCenter").find(".modal-content").html(html);
			
			$("#exampleModalCenter").modal('show');
		}
		

		function openWin(param){  
			window.location.href = "/charType/front/account/profile/timeline/"+param;
//	 	    window.open("/charType/front/account/profile/timeline?user_id="+param, "userId", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
		}  
		
		function alramModal(param) {
			
			var uri = "";
			var html = "";
			
			if(param== "alram"){
				uri="/charType/alram/list/like?ALRAM_ID=${sessionScope.session_mem_id}";
			}else if(param== "alram") {
				uri="/charType/alram/list/like?ALRAM_ID=${sessionScope.session_mem_id}";
			}
			
			html = "<iframe src='"+ uri +"' style='height: 500px;'></iframe>";
			
			$("#exampleModalCenter").find(".modal-content").html(html);
			
			$("#exampleModalCenter").modal('show');
		}
		

		function openWin(param){  
			window.location.href = "/charType/front/account/profile/timeline/"+param;
//	 	    window.open("/charType/front/account/profile/timeline?user_id="+param, "userId", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
		}  

		function fn_readBoardV2(alram_id, alram_num, alram_contnum){
	    	console.log(alram_num+","+alram_id+","+alram_contnum);
	       	var comSubmit = new ComSubmit();
	    	comSubmit.setUrl("<c:url value='/alram/list/readBoard'/>");
	    	comSubmit.addParam("ALRAM_ID", alram_id);
	    	comSubmit.addParam("ALRAM_NUM", alram_num);
	    	comSubmit.addParam("ALRAM_CONTNUM", alram_contnum);
	    	comSubmit.submit(); 
	    }
	    
	    function fn_readFollowV2(reg_id, alram_num){
	    	console.log(reg_id+","+alram_num);
	       	var comSubmit = new ComSubmit();
	    	comSubmit.setUrl("<c:url value='/alram/list/readFollow'/>");
	    	comSubmit.addParam("REG_ID", reg_id);
	    	comSubmit.addParam("ALRAM_NUM", alram_num);
	    	comSubmit.submit(); 
	    }
		
		
		function uploadImgPreview(id, trgId) {
			// @breif 업로드 파일 읽기
			let fileInfo = document.getElementById(id).files[0];
			let reader = new FileReader();
		    // @details readAsDataURL( )을 통해 파일을 읽어 들일때 onload가 실행
		    reader.onload = function() {
		    	if(reader.result != null) {
			        document.getElementById(trgId).src = reader.result;
		    	}
		    };
			if( fileInfo ) {
		        // @details readAsDataURL( )을 통해 파일의 URL을 읽어온다.
		        reader.readAsDataURL( fileInfo );
		    } else {
		    	fn_deleteFile($("#"+trgId));
	    	}
		}
		
		function initImgForm (el) {
			var addBtn = el.find(".file-popup");
			var delBtn = el.find(".delete-file");
			
			addBtn.click(function(e){
				e.preventDefault();
				el.find("input").trigger("click");
			});
			delBtn.on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});

			el.find("input").on("change", function(e) {
				uploadImgPreview($(this).attr("id"), $(e.target).siblings("img").attr("id") );
				el.addClass("added");
// 				$(e.target).siblings("img").show();
			})
		}
	</script>




</html>
