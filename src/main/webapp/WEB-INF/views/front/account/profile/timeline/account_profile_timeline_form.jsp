<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>writeForm</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

</head>
<body>
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				<!-- <tr>
					<th scope="row">BOARD_NUM</th>
					<td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
				</tr> -->
				<tr>
					<th scope="row">TITLE</th>
					<td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
				</tr>
				
				<tr>
					<th scope="row">ID</th>
					<td><input type="text" id="ID" name="ID" class="wdp_90" value="${sessionScope.ID}"></input></td>
				</tr>
				
				<tr>
					<th scope="row">NICK</th>
					<td><input type="text" id="NICK" name="NICK" class="wdp_90" value="${sessionScope.NICK}"></input></td>
				</tr>
				
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="20" cols="100" title="CONTENT" id="CONTENT" name="CONTENT"></textarea>
					</td>
				</tr>
			<!-- 	<tr>
					<th scope="row">HIT_CNT</th>
					<td><input type="text" id="HIT_CNT" name="HIT_CNT" class="wdp_90"></input></td>
				</tr> -->
				
		<!-- 		<tr>
					<th scope="row">CREATE_DT</th>
					<td><input type="text" id="CREATE_DT" name="CREATE_DT" class="wdp_90"></input></td>
				</tr>
				 -->
				<tr>
					<th scope="row">CATEGORY</th>
					<td><input type="text" id="CATEGORY" name="CATEGORY" class="wdp_90"></input></td>
				</tr>
				
				<tr>
					<th scope="row">MBTI</th>
					<td><input type="text" id="MBTI" name="MBTI" class="wdp_90"></input></td>
				</tr>
				
		<!-- 	<tr>
					<th scope="row">LIKE_CNT</th>
					<td><input type="text" id="LIKE_CNT" name="LIKE_CNT" class="wdp_90"></input></td>
				</tr>
				 -->
					
			
			</tbody>
		</table>
		
		
		<input type="file" name="file"> <br/><br/>

		<a href="#this" class="btn" id="write">작성하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
	</form>
	
<form id="commonForm" name="commonForm"></form>
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
</body>
</html>