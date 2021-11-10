<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${timelineMap.TITLE }</title>

	<!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>      
    <script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>    
    
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/charType/resources/css/popup.css">
    <link rel="stylesheet" href="/charType/resources/js/popup.js"> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
    
    <!-- <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>  -->
    <script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
    
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
                  <!-- <button type="button" class="close"  data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button> -->
                  <div class="img-poster clearfix" >
                    <a href=""><img class="img-circle" src="/img/${timelineMap.PROF_IMG}"/></a>                    
                    <strong><a href="#this" name="myPage">${timelineMap.NICK}</a>
                    <input type="hidden" id="ID" value="${timelineMap.ID}"></strong>
                    <span>${timelineMap.MBTI} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #${timelineMap.CATEGORY }</span>
                    <fmt:formatDate var="timelineCreateDt" value="${timelineMap.CREATE_DT}" pattern="MM.dd HH:mm"/>
                    <span>${timelineCreateDt }</span>
                    <br>
                    <p id="timelineContent">${timelineMap.CONTENT }</p>                    
                    <c:choose>
                    <c:when test="${timelineMap.likeCheck == 0 }">           
                   	<span><a href="#this" name="likeTimeline"><i class="bi bi-heart" style="font-size: 2rem; color: red;"></i></a>
					${timelineMap.likeCnt} &nbsp;&nbsp;
					<i class="bi bi-chat" style="font-size: 2rem; color: cornflowerblue;"></i> ${timelineMap.commentCnt }</span>
					</c:when>
					<c:otherwise>
					<span><a href="#this" name="deleteLikeTimeline"><i class="bi bi-heart-fill" style="font-size: 2rem; color: red;"></i></a>					
					${timelineMap.likeCnt} &nbsp;&nbsp;
                    <i class="bi bi-chat" style="font-size: 2rem; color: cornflowerblue;"></i> ${timelineMap.commentCnt }</span> <!-- 총 댓글 수 -->
                    </c:otherwise>
                    </c:choose>
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
                        <fmt:formatDate var="commentRegDate" value="${comment.REGDATE}" pattern="MM.dd HH:mm"/>                       
                        <span class="date sub-text">${commentRegDate }</span>                        
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
                  <input type="hidden" name="BOARD_ID" value="${timelineMap.ID }" >
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
		
		$("#modalBoard").modal('show');
		
/*  		 $("#openPopup").click(function(){			//팝업
			$("#modalBoard").modal('show');		
		}) 	 */ 	
		
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
		
		//게시글 좋아요 추가
		$("a[name='likeTimeline']").on("click", function(e){
			e.preventDefault();
			fn_likeTimeline($(this));
		});
		
		//게시글 좋아요 삭제
		$("a[name='deleteLikeTimeline']").on("click", function(e){
			e.preventDefault();
			fn_deleteLikeTimeline($(this));
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
	}
	
	function fn_deleteComment(obj){		
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/community/timeline/commentDelete' />");
		comSubmit.addParam("COMMENT_NUM", obj.parent().find("#COMMENT_NUM").val());
		comSubmit.addParam("BOARD_NUM",$("input[name='BOARD_NUM']").val());
 		comSubmit.addParam("ID",$("input[name='BOARD_ID']").val());
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
		comSubmit.addParam("CONTENTS", obj.parent().find("#CONTENTS").val());
		comSubmit.addParam("BOARD_NUM",$("input[name='BOARD_NUM']").val());
 		comSubmit.addParam("ID",$("input[name='BOARD_ID']").val());
		comSubmit.submit();	 
	}
 	
 	function fn_modifyTimeline(obj){  		
 		var html = "";
 		html += "<textarea id='modifyContents' ></textarea>"
		html += "<a href='#this' class='btn' name='updateContents'>수정</a>"
 		$("#timelineContent").html(html);
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
 		comSubmit.addParam("ID",$("input[name='BOARD_ID']").val());
 		comSubmit.submit();	 
 	}
 	
 	function fn_openAccountTimeline(obj){
 		var id = obj.parent().find("#ID").val(); 		
 		var comSubmit = new ComSubmit();
 		comSubmit.setUrl("<c:url value='/front/account/profile/timeline/"+id+"' />");		
		comSubmit.addParam("ID", id);		
		comSubmit.submit();	
 	}
 	
 	//게시글 좋아요 추가
 	function fn_likeTimeline(obj){
 		var boardNum = $("input[name='BOARD_NUM']").val();
 		var userId = $("input[name='ID']").val();
 		$.ajax({
 			url : "/charType/like/timeline/insertLike",
 			type : "post",
 			data : {"BOARD_NUM" : boardNum , "USER_ID" : userId},
 			success : function(data) {
 				location.reload();
 			} 			
 		});
 	}
 	
 	//게시글 좋아요 삭제
 	function fn_deleteLikeTimeline(obj){ 		
 		var boardNum = $("input[name='BOARD_NUM']").val();
 		var userId = $("input[name='ID']").val();
 		$.ajax({
 			url : "/charType/like/timeline/deleteLike",
 			type : "post",
 			data : {"BOARD_NUM" : boardNum , "USER_ID" : userId},
 			success : function(data) {
 				location.reload();
 			} 			
 		});
 	}
 	
	</script>

</body>
</html>