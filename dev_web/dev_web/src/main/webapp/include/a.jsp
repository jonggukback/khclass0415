<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("r_name", "나신입");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a.jsp 페이지</title>
</head>
<body>
a-1. a.jsp를 요청합니다.
<br>
a-2. a.jsp페이지 내용이 출력 됩니다.
<br>
<jsp:include page="b.jsp" flush="false"/>
<br>
a-3. b.jsp를 경유한 후 출력됩니다.
</body>
</html>