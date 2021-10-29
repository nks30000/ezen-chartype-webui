<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/WEB-INF/include-header.jspf" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>

    <link rel="stylesheet" href="/charType/resources/css/popup.css">
    <link rel="stylesheet" href="/charType/resources/js/popup.js">
    <!------ Include the above in your HEAD tag ---------->
    
    
    <div class="modal img-modal">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-body">
            <div class="row">
              <div class="col-md-8 modal-image">
              	<!-- 게시글 이미지 가져오기 -->
              	<c:forEach var="timelineImg" items="${imgList}">
                <img class="img-responsive " src="/charType/html/resource/img/${timelineImg.SAVED_NM}.jpg">
                <img class="img-responsive hidden" src="http://upload.wikimedia.org/wikipedia/commons/1/1a/Bachalpseeflowers.jpg" />
                <img class="img-responsive hidden" src="http://www.netflights.com/media/216535/hong%20kong_03_681x298.jpg" />                    
                <a href="" class="img-modal-btn left"><i class="glyphicon glyphicon-chevron-left"></i></a>
                <a href="" class="img-modal-btn right"><i class="glyphicon glyphicon-chevron-right"></i></a>
                </c:forEach>
              </div>
              <!-- 게시글 정보 가져오기 -->
              <div class="col-md-4 modal-meta">
                <div class="modal-meta-top">
                  <button type="button" class="close"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                  <div class="img-poster clearfix">
                  	<p>${timelineMap.PROP_IMG}</p>
                    <a href=""><img class="img-circle" src="/charType/html/resource/img/${timelineMap.PROF_IMG}.jpg"/></a>                    
                    <strong><a href="">${timelineMap.NICK}</a></strong><span>${timelineMap.MBTI}</span>
                    <span>${timelineMap.CREATE_DT }</span> 
                    <p>${timelineMap.CONTENT }</p>
                    <span>댓글 수 : ${timelineMap.commentCnt }</span> <!-- 총 댓글 수 -->                            
                  </div>
    				<!-- 댓글 리스트 가져오기 -->
                  <ul class="img-comment-list">
                  	<c:forEach var="comment" items="${commentList}" varStatus="var">
                    <li>
                      <div class="comment-img">
                        <img src="/charType/html/resource/img/${comment.PROF_IMG}.jpg">
                      </div>
                      <div class="comment-text">                      
                        <strong><a href="">${comment.NICK }</a></strong>
                        <span>${comment.MBTI }</span>
                        <p id="comment_contents">${comment.CONTENTS }</p>                        
                        <span class="date sub-text">${comment.REGDATE }</span>                        
                        <div id="hidden">
                        	<c:choose>
                        	<c:when test="${sessionScope.ID == comment.ID }">
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
                    
                    
                    <li>
                      <div class="comment-img">
                        <img src="http://lorempixel.com/50/50/people/7">
                      </div>
                      <div class="comment-text">
                        <strong><a href="">Jane Doe</a></strong>
                        <p>Hello this is a test comment and this comment is particularly very long and it goes on and on and on.</p> <span>on December 5th, 2016</span>
                      </div>
                    </li>
                    <li>
                      <div class="comment-img">
                        <img src="http://lorempixel.com/50/50/people/9">
                      </div>
                      <div class="comment-text">
                        <strong><a href="">Jane Doe</a></strong>
                        <p class="">Hello this is a test comment.</p> <span class="date sub-text">on December 5th, 2016</span>
                      </div>
                    </li>
                  </ul>
                </div>
                <!-- 댓글 입력 -->
                <form id="comment" name="comment">
                <div class="modal-meta-bottom">
                  <input type="text" class="form-control" name="CONTENTS" placeholder="Leave a commment.."/>
                  <a href="#this" class="btn" id="writeComment">작성</a>                  
                  <input type="hidden" name="BOARD_NUM" value="${timelineMap.BOARD_NUM }" >
                  <input type="hidden" name="ID" value="${sessionScope.ID }" >                  
                  <input type="hidden" name="NICK" value="${sessionScope.NICK }" >
                  <input type="hidden" name="MBTI" value="${sessionScope.MBTI }" >
                  <input type="hidden" name="PROF_IMG" value="${sessionScope.PROF_IMG }" >
                </div>
                </form>
              </div>
            </div>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div>
    
    <%@ include file="/WEB-INF/include-body.jspf" %>
    
    <p class="text-center text-muted">Updated Dec. 5th 2016 with basic responsive styles</p>
	<script type="text/javascript">
	
	$(document).ready(function(){
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
		
	});
	
	function fn_openWriteComment(){
		var comSubmit = new ComSubmit("comment");
		comSubmit.setUrl("<c:url value='/community/timeline/commentWrite' />");
		comSubmit.submit();
	}
	
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
		comSubmit.addParam("CONTENTS", obj.parent().find("#CONTENTS").val()+'(수정됨)');		
		comSubmit.submit();	 
	} 
	</script>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>
</html>