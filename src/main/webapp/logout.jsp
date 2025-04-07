<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 세션 초기화 invalidate
response.sendredirect(MAinindex); -->

<%
request.setCharacterEncoding("utf-8");

session.invalidate();

response.sendRedirect("index.jsp");

%>


</body>
</html>

