<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>bloggers</title>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="/charType/resources/css/popup.css">
    <link rel="stylesheet" href="/charType/resources/js/popup.js">
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> -->
    
</head>
<body>
   
    <!------ Include the above in your HEAD tag ---------->
    
<!--     <button type="button" id="openPopup"  data-toggle="modal" data-target="#modalBoard">게시글 팝업 띄우기</button> -->
     <!-- <button type="button" id="openPopup" >게시글 팝업 띄우기</button>  -->
    <div class="modal img-modal" id="modalBoard">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-body">
            <div class="row">
              <div class="col-md-8 modal-image">
              	<!-- 게시글 이미지 가져오기 -->
              	<c:forEach var="timelineImg" items="${imgList}" varStatus="var">
              		<c:choose>
              		<c:when test="${var.first}">
                	<img class="img-responsive " src="/img/${timelineImg.SAVED_NM}">
                	</c:when>
                	<c:otherwise>
                	<img class="img-responsive hidden" src="/img/${timelineImg.SAVED_NM}" />
                	</c:otherwise>
                	</c:choose>                
                </c:forEach>
                <a href="" class="img-modal-btn left"><i class="glyphicon glyphicon-chevron-left"></i></a>
                <a href="" class="img-modal-btn right"><i class="glyphicon glyphicon-chevron-right"></i></a>
              </div> 
              <!-- 게시글 정보 가져오기 -->
              <div class="col-md-4 modal-meta">
                <div class="modal-meta-top">
                  <button type="button" class="close"  data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                  <div class="img-poster clearfix" >
                    <a href=""><img class="img-circle" src="/img/${timelineMap.PROF_IMG}"/></a>                    
                    <strong><a href="#this" name="myPage">${timelineMap.NICK}</a>
                    <input type="hidden" id="ID" value="${timelineMap.ID}"></strong><span>${timelineMap.MBTI}</span>
                    <span>${timelineMap.CREATE_DT }</span>
                    <br>
                    <p id="timelineContent">${timelineMap.CONTENT }</p>
                    <span>댓글 수 : ${timelineMap.commentCnt }</span> <!-- 총 댓글 수 -->
                    <!-- 자신의 게시글 수정가능 -->
                   <c:if test="${sessionScope.session_mem_id == timelineMap.ID }">
                    <a href="#this" class="btn" id="modifyTimeline" >글수정</a>
                    </c:if>               
                  </div>
    				<!-- 댓글 리스트 가져오기 -->
    			<div id="comments">
                  <ul class="img-comment-list" >
                  	<c:forEach var="comment" items="${commentList}" varStatus="var">
                    <li>
                      <div class="comment-img">                      	
                        <img src="/img/${comment.PROF_IMG}">
                      </div>
                      <div class="comment-text">                      
                        <strong><a href="#this" name="myPage">${comment.NICK }</a>
                        <input type="hidden" id="ID" value="${comment.ID}"></strong>
                        <span>${comment.MBTI }</span>
                        <p id="comment_contents">${comment.CONTENTS }</p>                        
                        <span class="date sub-text">${comment.REGDATE }</span>                        
                        <div id="hidden">
                        	<!-- 자신의 댓글 수정 삭제 기능 -->
                        	<c:choose>
                        	<c:when test="${sessionScope.session_mem_id == comment.ID }">
                        		<a href="#this" class="btn" id="deleteComment"
                        			name="deleteComment">삭제</a>
                        		<a href="#this" class="btn" id="modifyComment"
                        			name="modifyComment">수정</a>
                        		<input type="hidden" id="COMMENT_NUM" 
                        			value="${comment.COMMENT_NUM }">
                        	</c:when>
                        	<c:otherwise>
                        		<input type="hidden" id="COMMENT_NUM" 
                        			value="${comment.COMMENT_NUM }">
                        	</c:otherwise>
                        	</c:choose>                                       		
                        </div>               
                      </div>
                    </li>
                    </c:forEach>
                  </ul>
                  </div>
                </div>
                <!-- 댓글 입력 -->
                <form id="comment" name="comment">
                <div class="modal-meta-bottom">
                  <input type="text" class="form-control" name="CONTENTS" placeholder="Leave a commment.."/>
                  <a href="#this" class="btn" id="writeComment">작성</a>                  
                  <input type="hidden" name="BOARD_NUM" value="${timelineMap.BOARD_NUM }" >
                  <input type="hidden" name="ID" value="${sessionScope.session_mem_id }" >                  
                  <input type="hidden" name="NICK" value="${sessionScope.session_mem_nick }" >
                  <input type="hidden" name="MBTI" value="${sessionScope.session_mem_mbti }" >
                  <input type="hidden" name="PROF_IMG" value="${sessionScope.session_mem_prof_img }" >
                </div>
                </form>
              </div>
            </div>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div>
    
    <form id="commonForm" name="commonForm"></form>
    
    <p class="text-center text-muted">Updated Dec. 5th 2016 with basic responsive styles</p>
	<script type="text/javascript">
	
	/* 이미지 슬라이드 */
	$(function(){
	    // This code is not even almost production ready. It's 2am here, and it's a cheap proof-of-concept if anything.
	    $(".img-modal-btn.right").on('click', function(e){
	        e.preventDefault();
	        cur = $(this).parent().find('img:visible()');
	        next = cur.next('img');
	        par = cur.parent();
	        if (!next.length) { next = $(cur.parent().find("img").get(0)) }
	        cur.addClass('hidden');
	        next.removeClass('hidden');
	        
	        return false;
	    })
	    
	    $(".img-modal-btn.left").on('click', function(e){
	        e.preventDefault();
	        cur = $(this).parent().find('img:visible()');
	        next = cur.prev('img');
	        par = cur.parent();
	        children = cur.parent().find("img");
	        if (!next.length) { next = $(children.get(children.length-1)) }
	        cur.addClass('hidden');
	        next.removeClass('hidden');
	        
	        return false;
	    })

	});
	
	$(document).ready(function(){
		
/* 		 $("#openPopup").click(function(){				//팝업
			var BOARD_NUM = ${BOARD_NUM};
			$.ajax({
				url : "/charType/community/timeline/detail",
				type : "post",
				data : BOARD_NUM,
				success : function(data) {
					$("#modalBoard").modal('show');
				}				
			});					
		}) */	 	
		
		$("#writeComment").on("click", function(e){ /* 댓글 작성 */
			e.preventDefault();
			fn_openWriteComment();
		});
		
		$("a[name='deleteComment']").on("click", function(e){ /* 삭제하기 */
			e.preventDefault();
			fn_deleteComment($(this));
		});
		
		$("a[name='modifyComment']").one("click", function(e){ /* 수정하기 */
			e.preventDefault();
			fn_modifyComment($(this));
		});
		
		$("#modifyTimeline").one("click", function(e){	/* 게시글 수정 */
			e.preventDefault();
			fn_modifyTimeline($(this));
		});
		
		$("a[name='myPage']").on("click", function(e){ /* 유저 마이페이지 가기 */
			e.preventDefault();
			fn_openAccountTimeline($(this));
		});
		
	});
/* 	function fn_openWriteComment(){
		var comment = $("form[name='comment']").serialize();
		alert(comment);
		$.ajax({
			url : "/community/timeline/commentWrite",
			type : "post",
			data : comment,
			success : function(data) {
				console.log(data)
			}			
		});
	} */
	
	
 	function fn_openWriteComment(){
		var comSubmit = new ComSubmit("comment");
		comSubmit.setUrl("<c:url value='/community/timeline/commentWrite' />");
		comSubmit.submit();

	
	function fn_deleteComment(obj){		
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/community/timeline/commentDelete' />");
		comSubmit.addParam("COMMENT_NUM", obj.parent().find("#COMMENT_NUM").val());		
		comSubmit.submit();	
	}
	
  	function fn_modifyComment(obj){
		var str = "<input type='text' name='CONTENTS' id='CONTENTS'>"
		+ "<a href='#this' class='btn' name='updateComment'>작성</a>";
		$(obj.parent()).append(str);	
		$("a[name='updateComment']").on("click", function(e){ /* 수정 완료하기 */
		 	e.preventDefault();
			fn_updateComment($(this));		
		});  
	} 
		
 	function fn_updateComment(obj){		
		var comSubmit = new ComSubmit();		
		comSubmit.setUrl("<c:url value='/community/timeline/commentModify' />");
		comSubmit.addParam("COMMENT_NUM", obj.parent().find("#COMMENT_NUM").val());
		comSubmit.addParam("CONTENTS", obj.parent().find("#CONTENTS").val()+'<span>(수정됨)</span>');		
		comSubmit.submit();	 
	}
 	
 	function fn_modifyTimeline(obj){
 		$("#timelineContent").html("<textarea id='modifyContents' value='${timelineMap.CONTENT }'><textarea>"
 				+"<a href='#this' class='btn' name='updateContents'>수정</a>");
 		$("a[name='updateContents']").on("click", function(e){ /* 수정 완료하기 */
		 	e.preventDefault();
			fn_updateContents($(this));		
		}); 
 	}
 	
 	function fn_updateContents(obj){ 		
 		var comSubmit = new ComSubmit();
 		comSubmit.setUrl("<c:url value='/community/timeline/modify' />");
 		comSubmit.addParam("CONTENT", $("#modifyContents").val());
 		comSubmit.addParam("BOARD_NUM",$("input[name='BOARD_NUM']").val());
 		comSubmit.submit();	 
 	}
 	
 	function fn_openAccountTimeline(obj){
 		var aaa = obj.parent().find("#ID").val();
 		alert(aaa);
 		var comSubmit = new ComSubmit();
 		comSubmit.setUrl("<c:url value='/front/account/profile/timeline	' />");		
		comSubmit.addParam("ID", obj.parent().find("#ID").val());		
		comSubmit.submit();	
 	}
	</script>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>