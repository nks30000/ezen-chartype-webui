<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/include-header.jspf" %>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="/charType/resources/script/communityTimeline.js"></script>
<script src="/charType/resources/script/communitySearch.js"></script>
<link rel="stylesheet" href="/charType/resources/css/communityTimeline.css">
<link rel="stylesheet" href="/charType/resources/css/communitySearch.css">


<meta charset="UTF-8">
<title>검색결과</title>
</head>
<body>

<ul >
        
        
             <li class="nav-item">
          		<a href="/charType/front/account/profile/timeline" class="nav-link">
         	    My page
            	</a>
    		 </li>
        
    		
            <li class="nav-item">
           		 <a href="/charType/logout" class="nav-link">
            	Logout
        	     </a>
    		</li>
          
       
        </ul>

<section>
    <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://pbs.twimg.com/media/EGHYvttU4AAYKb7?format=jpg&name=large" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://pbs.twimg.com/media/EGHYvtkUcAAuc8T?format=jpg&name=large" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://pbs.twimg.com/media/EGHYvtjU0AAO8w1?format=jpg&name=large" class="d-block w-100" alt="...">
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

<div class="container">
<h4>Nick related search results </h4><br/>
</div>
	<div class="container">
			<section class="pinBoot">
			
			
			
			<c:choose>
			<c:when test="${fn:length(nick) > 0}">
				<c:forEach items="${nick}" var="nickList">
				<div class="white-panel">
				<img src="/img/${nickList.PROF_IMG}" alt="" /><br/>
					ID:${nickList.ID}<br/>
					Nick:${nickList.NICK}<br/>
					MBTI:${nickList.MBTI}
				</div>		
 				</c:forEach>
			</c:when>
				<c:otherwise>
							조회된 결과가 없습니다.
           		</c:otherwise>
           	 </c:choose>
           	</section>
	</div>
<%-- <div class="container">
	<div class="tab">
		<button class="tablinks" onclick="openCity(event, 'All')" id="defaultOpen">ALL</button>
		<button class="tablinks" onclick="openCity(event, 'Nick')">NICK</button>
		<button class="tablinks" onclick="openCity(event, 'Title')">TITLE</button>
	</div>


<div id="All" class="tabcontent tab-space">

     <section class="pinBoot2">
			<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list}" var="communityList">
					<article class="white-panel"><img src="/img/${communityList.SAVED_NM}" alt="" />
        				<h4><a href="#">${communityList.TITLE}</a></h4>
       						 <p>${communityList.CONTENT}</p>
      				</article>     				
 				</c:forEach>
			</c:when>
				<c:otherwise>
							조회된 결과가 없습니다.
           		</c:otherwise>
           	 </c:choose>
    	</section>
</div>

<div id="Nick" class="tabcontent tab-space">

     <section class="pinBoot2">
			<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list}" var="communityList">
					<article class="white-panel"><img src="/img/${communityList.SAVED_NM}" alt="" />
        				<h4><a href="#">${communityList.TITLE}</a></h4>
       						 <p>${communityList.CONTENT}</p>
      				</article>     				
 				</c:forEach>
			</c:when>
				<c:otherwise>
							조회된 결과가 없습니다.
           		</c:otherwise>
           	 </c:choose>
    	</section>
</div>


<div id="Title" class="tabcontent">
	<section class="pinBoot2">
			<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list}" var="communityList">
					<article class="white-panel"><img src="/img/${communityList.SAVED_NM}" alt="" />
        				<h4><a href="#">${communityList.TITLE}</a></h4>
       						 <p>${communityList.CONTENT}</p>
      				</article>     				
 				</c:forEach>
			</c:when>
				<c:otherwise>
							조회된 결과가 없습니다.
           		</c:otherwise>
           	 </c:choose>
    </section>

</div>
  
</div> --%>


</body>

<%@ include file="/WEB-INF/include-body.jspf" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#search").on("click", function(e){ //작성하기 버튼
		e.preventDefault();
		fn_searchNick();
	});
});



function fn_searchNick(){
	var comSubmit = new ComSubmit("searchfrm");
	comSubmit.setUrl("<c:url value='/front/community/timeline/search' />");
	comSubmit.submit();
}


</script>

</html>