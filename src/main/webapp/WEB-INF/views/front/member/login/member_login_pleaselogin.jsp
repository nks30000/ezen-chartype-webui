<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PleaseLogin</title>
</head>
<body>
<script type="text/javascript">
	alert("로그인이 필요한 서비스입니다. 먼저 로그인 해주세요.");
	
	if(parent != null){
		parent.window.location.href = "${CONTEXT_PATH}/member/login/form";
	}
	location.href = "${CONTEXT_PATH}/member/login/form";

</script>

</body>
</html>