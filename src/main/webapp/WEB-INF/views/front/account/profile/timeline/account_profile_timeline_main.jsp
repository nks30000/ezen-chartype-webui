<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
  <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
  <link rel="stylesgeet" href="https://rawgit.com/creativetimofficial/material-kit/master/assets/css/material-kit.css">
  <link rel="stylesheet" href="/charType/resources/css/profile.css">
  <link rel="stylesheet" href="/charType/resources/css/timeline.css">
</head>

<body class="profile-page">
  <nav class="navbar navbar-color-on-scroll navbar-transparent    fixed-top  navbar-expand-lg " color-on-scroll="100" id="sectionsNav">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="https://demos.creative-tim.com/material-kit/index.html" target="_blank">Material Kit </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
        </button>
      </div>

<div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a href="/charType/myPageInfoMod" class="nav-link">
              <i class="material-icons">apps</i> Edit Profile
            </a>
    		</li>
           <li class="nav-item">
            <a href="/charType/logout" class="nav-link">
              <i class="material-icons">apps</i> Logout
            </a>
    		</li>
          
            <li class="nav-item">
            <a href="#-----------------" class="nav-link">
              <i class="material-icons">apps</i> Main
            </a>
    		</li>
        
        </ul>
      </div>
    </div>
  </nav>
            
            
            
            
  <div class="page-header header-filter" data-parallax="true" style="background-image:url('http://wallpapere.org/wp-content/uploads/2012/02/black-and-white-city-night.png');"></div>
  <div class="main main-raised">
    <div class="profile-content">
      <div class="container">
        <div class="row">
          <div class="col-md-6 ml-auto mr-auto">
            <div class="profile">
              <div class="avatar">
                <img src="https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTU0NjQzOTk4OTQ4OTkyMzQy/ansel-elgort-poses-for-a-portrait-during-the-baby-driver-premiere-2017-sxsw-conference-and-festivals-on-march-11-2017-in-austin-texas-photo-by-matt-winkelmeyer_getty-imagesfor-sxsw-square.jpg" alt="Circle Image" class="img-raised rounded-circle img-fluid">
              </div>
              <div class="name">
                <h3 class="title"> ${list[0].ID}  </h3>
                <h6>${list[0].MBTI}</h6>
                <a href="#pablo" class="btn btn-just-icon btn-link btn-dribbble"><i class="fa fa-dribbble"></i></a>
                <a href="#pablo" class="btn btn-just-icon btn-link btn-twitter"><i class="fa fa-twitter"></i></a>
                <a href="#pablo" class="btn btn-just-icon btn-link btn-pinterest"><i class="fa fa-pinterest"></i></a>
              </div>
            </div>
          </div>
        </div>
        <div class="description text-center">
          <p>${list[0].INTRO}</p>
        </div>
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
                  <a class="nav-link" href="#fav" role="tab" data-toggle="tab">
                    <i class="material-icons">palette</i>
                    Favorite
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#shop" role="tab" data-toggle="tab">
                    <i class="material-icons">favorite</i>
                    Shop List
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#style" role="tab" data-toggle="tab">
                    <i class="material-icons">favorite</i>
                    Style
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
 <!-- ============================================================================================== -->
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
                             </div>
                             </div>
                            
                              <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                    <div class="form-group">
                                        <label class="sr-only" for="message">post</label>
                                        <textarea class="form-control" id="CONTENT" name="CONTENT" rows="3" placeholder="What are you thinking?"></textarea>
                              </div>
                              </div>
        			   <input type="hidden" id="ID" name="ID" value="${sessionScope.ID}">
    				   <input type="hidden" id="NICK" name="NICK" value="${sessionScope.NICK}">
    				   <input type="hidden" id="MBTI" name="MBTI" value="${sessionScope.MBTI}">

                                
                                <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                                    <div class="form-group">
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" name="file">
                                            <label class="custom-file-label" for="customFile">Upload image</label>
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
                                    <a href=#this class="btn btn-primary" id="write">share</a>
                                </div>   
                            </div>
                        </div>
                    </div>
			 </form>
   

<!-- ============================================================================================== -->

        <div class="tab-content tab-space">
          <div class="tab-pane active text-center gallery" id="life">
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
          </div>
          
<!-- ============================================================================================== -->
          
          <div class="tab-pane text-center gallery" id="fav">
          	<div class="row">
          		<div class="col-md-3 ml-auto">

           <c:choose>
					<c:when test="${fn:length(fav) > 0}">
					<c:forEach items="${fav }" var="timelineFav" begin="0" step="2">
              			<img src ="/img/${timelineFav.SAVED_NM}">
              			<button id="delete" onclick="location.href='delete?num=${timelineFav.BOARD_NUM}'">delete</button>
       				  </c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           	 </c:choose>
              </div>
              <div class="col-md-3 mr-auto">
				<c:choose>
					<c:when test="${fn:length(fav) > 0}">
					<c:forEach items="${fav}" var="timelineFav" begin="1" step="2">
              			<img src ="/img/${timelineFav.SAVED_NM}">
              			<button id="delete" onclick="location.href='delete?num=${timelineFav.BOARD_NUM}'">delete</button>
       				  </c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           		 </c:choose>
              </div>
          </div>
          </div>
 <!-- ============================================================================================== -->
          
          
        <div class="tab-pane text-center gallery" id="shop">
          	<div class="row">
          		<div class="col-md-3 ml-auto">

           <c:choose>
					<c:when test="${fn:length(shop) > 0}">
					<c:forEach items="${shop}" var="timelineShop" begin="0" step="2">
              			<img src ="/img/${timelineShop.SAVED_NM}">
              			<button id="delete" onclick="location.href='delete?num=${timelineShop.BOARD_NUM}'">delete</button>
       				  </c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           	 </c:choose>
              </div>
              <div class="col-md-3 mr-auto">
                <c:choose>
					<c:when test="${fn:length(shop) > 0}">
					<c:forEach items="${shop}" var="timelineList" begin="1" step="2">
              			<img src ="/img/${timelineList.SAVED_NM}">
              			<button id="delete" onclick="location.href='delete?num=${timelineList.BOARD_NUM}'">delete</button>
       				  </c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           		 </c:choose>
              </div>
          </div>
          </div>
           <!-- ============================================================================================== -->
          
          <div class="tab-pane text-center gallery" id="style">
          	<div class="row">
          		<div class="col-md-3 ml-auto">

           <c:choose>
					<c:when test="${fn:length(style) > 0}">
					<c:forEach items="${style }" var="timelineList" begin="0" step="2">
              			<img src ="/img/${timelineList.SAVED_NM}">
              			<button id="delete" onclick="location.href='delete?num=${timelineList.BOARD_NUM}'">delete</button>
       				  </c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           	 </c:choose>
              </div>
              <div class="col-md-3 mr-auto">
                <c:choose>
					<c:when test="${fn:length(style) > 0}">
					<c:forEach items="${style}" var="timelineList" begin="1" step="2">
              			<img src ="/img/${timelineList.SAVED_NM}">
              			<button id="delete" onclick="location.href='delete?num=${timelineList.BOARD_NUM}'">delete</button>
       				  </c:forEach>
					</c:when>
						<c:otherwise>
							조회된 결과가 없습니다.
           				</c:otherwise>
           		 </c:choose>
              </div>
          </div>
          </div>
          
          </div>
          </div>
          </div>
          </div>

  <footer class="footer text-center ">
    <p>Made with <a href="https://demos.creative-tim.com/material-kit/index.html" target="_blank">Material Kit</a> by Creative Tim</p>
  </footer>

  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>


</body>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_insertBoard();
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.submit();
		}
		
		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/front/account/profile/write' />");
			comSubmit.submit();
		}



	</script>




</html>
