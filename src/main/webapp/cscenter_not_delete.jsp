<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "java.util.ArrayList" %>
    
    <%@page import="dto.N_MD" %>
    <%@page import="dao.N_controller" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 삭제</title>
    <link rel="stylesheet" href="css/css.css">
    
</head>

<jsp:useBean id="user" class="dao.N_controller"/> 

<%
	String not_num = request.getParameter("not_num"); //여기 파라미터값을 num으로 가져와서 안됐었음.
	//근데 왜 not_num의 name을 num으로 줬는데, 넘어가는 페이지에 설정해놓은 not_num으로 받는거지??ㅠㅠ


user.N_delete(not_num);
%>	

<script type="text/javascript">
	alert("삭제되었습니다.");
</script> 

<%
	response.sendRedirect("cscenter_not_list.jsp");
%>
		
	


</html> 