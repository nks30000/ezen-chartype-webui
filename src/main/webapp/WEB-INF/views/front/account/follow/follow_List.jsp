<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <style>
        body {
            background: #eee
        }

        .followers {
            font-size: 12px
        }
     </style>
</head>
<body>

    <div class="container mt-5">
        <div class="d-flex justify-content-center row">
            <div class="col-md-6">
                <div class="p-3 bg-white text-center">
                    <div><img src="https://i.imgur.com/yFeV2ed.png">
                        <h1>${map.fId}</h1>
                    </div>
                    <p>Follow some beautiful soul who&nbsp;<br>have some interests like you!<br><br></p>
                    
                    <c:choose>
	                	<c:when test="${fn:length(map.followList) > 0}">
	                  		<c:forEach items="${map.followList }" var="row">
		                  		<div class="d-flex flex-row justify-content-between align-items-center mt-2">
			                    	<div class="d-flex flex-row justify-content-between align-items-center">
				                        <div class="d-flex flex-row align-items-center">
				                        	<img class="rounded-circle" src="/img/${row.PROF_IMG}" width="55" height="55">
				                            <div class="d-flex flex-column align-items-start ml-2">
				                            <span class="font-weight-bold"><a href="#openWin" onclick="openWin(this.innerHTML)">${row.ID }</a></span>
				                            <span class="followers">${row.FOLLOWING_CNT} followers</span></div>
				                        </div>
				                    </div>	         
				                    <div class="d-flex flex-row align-items-center mt-2">
				                    	<c:if test="${row.ID != sessionScope.session_mem_id }">
						                    <c:if test="${row.rowFollowCnt == 0 }">
				        						<button class="btn btn-outline-primary btn-sm" type="button" id="btnRequestFollow" data-target="${row.ID}">follow</button>			        		
				        					</c:if>
				        					<c:if test="${row.rowFollowCnt > 0 }">
				           						<button class="btn btn-primary btn-sm active" type="button" id="btnRequestUnfollow" data-target="${row.ID}" >following</button>
				        					</c:if>
				                    	</c:if>
				                    </div>  
			                    </div>     
                 			</c:forEach>
	                     </c:when>
		              
						<c:otherwise>
						   <tr>
						       <td colspan="4">There's no followers</td>
						   </tr>
						</c:otherwise>
	            	</c:choose>                                 
            </div>
        </div>
    </div>
  </div>  
  </body>
  <script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
	<script type="text/javascript">   
	
	function openWin(param){  
		parent.openWin(param);
		window.location.href = "/charType/front/account/profile/timeline?user_id="+param;

	}  
	

	$('#btnRequestFollow').click(function(e){
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
	
	$('#btnRequestUnfollow').click(function(e){
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