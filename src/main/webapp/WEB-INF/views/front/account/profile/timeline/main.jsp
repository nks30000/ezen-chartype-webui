<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>AccountMain</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>


<body>
<h2>게시판 목록</h2>
<table style="border:1px solid #ccc">
	<colgroup>
		<col width="10%"/>
		<col width="*"/>
		<col width="15%"/>
		<col width="20%"/>
	</colgroup>
	<thead>
		<tr>
			<th scope="col">글번호</th>
			<th scope="col">제목</th>
			<th scope="col">조회수</th>
			<th scope="col">작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach items="${list }" var="row">
					<tr>
						<td class="BOARD_NUM">${row.BOARD_NUM }</td>
						<td>${row.TITLE }</td>
						<td>${row.ID }</td>
						<td>${row.NICK }</td>
						<td><button id="delete" onclick="location.href='delete?num=${row.BOARD_NUM}'">delete</button></td>
						<td>${row.SAVED_NM}</td>
						<td><img src ="C:/charType/img/${row.SAVED_NM}">
						</td>
						 						    	
						
	

						
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">조회된 결과가 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
	</tbody>
</table>


	<script type="text/javascript">
	$(document).ready(function(){
		$("#delete_btn").on("click", function(e){ //삭제하기 버튼
			e.preventDefault();
			fn_deleteBoard();
		});
	});


	 	





</script>

</body>
</html>

