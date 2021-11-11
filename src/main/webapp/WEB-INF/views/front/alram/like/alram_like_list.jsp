<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include-header.jspf" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
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
                        <h1>ALARM</h1>
                    </div>
                  
                    
                       <!-- ===================================  좋아요 댓글 알람   ========================================= -->
                    
                    
                    <c:forEach var = "alram" items="${alramList}">
                    <div class="d-flex flex-row justify-content-between align-items-center">
                        <div class="d-flex flex-row align-items-center">
                        <img class="rounded-circle" src="/img/${alram.PROF_IMG}" width="55" height="55">
                            <div class="d-flex flex-column align-items-start ml-2">
                            <span class="font-weight-bold">                            
                            	${alram.REG_ID} 
                            </span>
                            <span class="followers">
                                <c:if test="${alram.ALRAM_INDEX_NO == 1}">
                            		<a href="#this" name="readBoard"> ${alram.REG_ID} 님이 ${alram.TITLE} 게시물에 <strong>댓글을</strong> 작성했습니다</a>
                            		<input type="hidden" id="alram_id" value="${alram.ALRAM_ID}">
                            		<input type="hidden" id="alram_num" value="${alram.ALRAM_NUM}">
                            		<input type="hidden" id="alram_contnum" value="${alram.ALRAM_CONTNUM}">
                            	</c:if>
                            	
                            	<c:if test="${alram.ALRAM_INDEX_NO == 2}">
                            		<a href="#this" name="readBoard"> ${alram.REG_ID} 님이 ${alram.TITLE} 게시물에 <b>좋아요를</b> 눌렀습니다</a>
                            		<input type="hidden" id="alram_id" value="${alram.ALRAM_ID}">
                            		<input type="hidden" id="alram_num" value="${alram.ALRAM_NUM}">
                            		<input type="hidden" id="alram_contnum" value="${alram.ALRAM_CONTNUM}">
                            	</c:if>
                            	
                            	                           
                            </span>
                            </div>
                        </div>
                        <div class="d-flex flex-row align-items-center mt-2">
                        	<a href="#this" class="btn btn-primary btn-sm readAlram">확인</a>
                        	<input type="hidden" id="alram_num" value="${alram.ALRAM_NUM}">                        					
						</div>
                    </div>
                    </c:forEach>
           
                    <!-- ===================================  필로우 알람   ========================================= -->
                    <c:forEach var = "alram" items="${alramFollowList}">
                    <div class="d-flex flex-row justify-content-between align-items-center">
                        <div class="d-flex flex-row align-items-center">
                        <img class="rounded-circle" src="/img/${alram.PROF_IMG}" width="55" height="55">
                            <div class="d-flex flex-column align-items-start ml-2">
                            <span class="font-weight-bold">                            
                            	${alram.REG_ID} 
                            </span>
                            <span class="followers">
                            	<c:if test="${alram.ALRAM_INDEX_NO == 3}">	
                            		<a href="javascript:void(0);" name="readFollow"> ${alram.REG_ID} 님이 팔로우를 신청했습니다 </a>
                            		<input type="hidden" id="reg_id" value="${alram.REG_ID}">
                            		<input type="hidden" id="alram_num" value="${alram.ALRAM_NUM}">
                            	</c:if>
                            
                            </span>
                            </div>
                        </div>
                        <div class="d-flex flex-row align-items-center mt-2">
                        	<a href="#this" class="btn btn-primary btn-sm readAlram">확인</a>
                        	<input type="hidden" id="alram_num" value="${alram.ALRAM_NUM}">                        					
						</div>
                    </div>
                    </c:forEach>
                    
                    
         <!-- ============================================================================ -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="/WEB-INF/include-body.jspf" %>
    <script type = "text/javascript">
    	
    $(document).ready(function(){
    	
    		$(".readAlram").on("click", function(e){
    			e.preventDefault();
    			fn_readAlram($(this));
    				});
    		
    		$("a[name='readBoard']").on("click", function(e){
    			e.preventDefault();
    			var alram_id = $(this).parent().find("#alram_id").val();
    	    	var alram_num = $(this).parent().find("#alram_num").val();
    	    	var alram_contnum = $(this).parent().find("#alram_contnum").val();
    			parent.fn_readBoardV2(alram_id, alram_num, alram_contnum);
 			});
    		
    		$("a[name='readFollow']").on("click", function(e){
    			e.preventDefault();
    			var reg_id = $(this).parent().find("#reg_id").val();
    			var alram_num = $(this).parent().find("#alram_num").val();
    			console.log(reg_id);
    			console.log(alram_num);
    			parent.fn_readFollowV2(reg_id, alram_num);
 			});
    		
    		
    		
    		
    });    
    
    function fn_readAlram(obj){
    	var alram_num = obj.parent().find("#alram_num").val();
    	console.log(alram_num);
       	var comSubmit = new ComSubmit();
    	comSubmit.setUrl("<c:url value='/alram/list/readAlram'/>");
    	comSubmit.addParam("ALRAM_NUM", alram_num);
    	comSubmit.submit();
    }
    
    function fn_readBoard(obj){
    	var alram_id = obj.parent().find("#alram_id").val();
    	var alram_num = obj.parent().find("#alram_num").val();
    	var alram_contnum = obj.parent().find("#alram_contnum").val();
    	console.log(alram_num+","+alram_id+","+alram_contnum);
       	var comSubmit = new ComSubmit();
    	comSubmit.setUrl("<c:url value='/alram/list/readBoard'/>");
    	comSubmit.addParam("ALRAM_ID", alram_id);
    	comSubmit.addParam("ALRAM_NUM", alram_num);
    	comSubmit.addParam("ALRAM_CONTNUM", alram_contnum);
    	comSubmit.submit(); 
    }
    /* function fn_readBoardV2(alram_id, alram_num, alram_contnum){
    	console.log(alram_num+","+alram_id+","+alram_contnum);
       	var comSubmit = new ComSubmit();
    	comSubmit.setUrl("<c:url value='/alram/list/readBoard'/>");
    	comSubmit.addParam("ALRAM_ID", alram_id);
    	comSubmit.addParam("ALRAM_NUM", alram_num);
    	comSubmit.addParam("ALRAM_CONTNUM", alram_contnum);
    	comSubmit.submit(); 
    } */
    
    function fn_readFollow(obj){
    	var reg_id = obj.parent().find("#reg_id").val();
    	var alram_num = obj.parent().find("#alram_num").val();
    	console.log(reg_id+","+alram_num);
       	var comSubmit = new ComSubmit();
    	comSubmit.setUrl("<c:url value='/alram/list/readFollow'/>");
    	comSubmit.addParam("REG_ID", reg_id);
    	comSubmit.addParam("ALRAM_NUM", alram_num);
    	comSubmit.submit(); 
    }
//     function fn_readFollowV2(reg_id, alram_num){
//     	console.log(reg_id+","+alram_num);
//        	var comSubmit = new ComSubmit();
//     	comSubmit.setUrl("<c:url value='/alram/list/readFollow'/>");
//     	comSubmit.addParam("REG_ID", reg_id);
//     	comSubmit.addParam("ALRAM_NUM", alram_num);
//     	comSubmit.submit(); 
//     }
    

    function openWin(param){  
		parent.openWin(param);
		window.location.href = "/charType/front/account/profile/timeline?user_id="+param;

	}  

/*     $("input[name='alram']") */
    
   
    </script>
    
</body>
</html>
</html>