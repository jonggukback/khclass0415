<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String r_name = (String) request.getAttribute("r_name"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b.jsp 페이지</title>
</head>
<body>
b-1. 이 페이지는 a.jsp 페이지 내에 출력됩니다.
<br>
b-2. 여기는 b.jsp 페이지 내용 입니다.
<br>
b-3. 같은 request 영역내 공유하는 자원인 name 값은 [<%=r_name %>] 입니다.
</body>
</html>