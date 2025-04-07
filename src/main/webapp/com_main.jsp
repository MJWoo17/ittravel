<%@page import="dao.BoardDao"%>
<%@page import="java.util.Vector"%>
<%@page import="dto.Cominfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <style type="text/css" ></style>
     <link rel="stylesheet" href="./css/com_main.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
// 로그인이 된 사람들은 로그인 정보를 담을 수 있도록 한다. 
 String com_mem_id =null;
if(session.getAttribute(com_mem_id) != null){
	com_mem_id =(String)session.getAttribute("com_mem_id");
	
}

int pageNumber = 1; // 기본 페이지, 기본적으로 페이지는 1부터 시작
if(request.getParameter("pageNumber") != null){
	// 정수형으로 타입 변경
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
%>

    
    <div class="board_wrap">
	<div class="divwrap1">
	<div class="divwrap3">
	<div class="divwrap2" onclick="location.href='com_list.jsp'">
	전체
	</div>
	<div class="divwrap6" onclick="location.href='com_write.jsp'">
	글쓰기
	</div>
	</div>
 	<div class="divwrap3">
 	<div class="divwrap4" onclick="location.href='com_list2.jsp'">
 	동행구인
 	</div>
 	<div class="divwrap5" onclick="location.href='com_list3.jsp'">
 	중고장터
 	</div>
 	</div>
	</div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html> 