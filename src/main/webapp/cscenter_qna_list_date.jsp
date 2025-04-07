<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import = "javax.servlet.http.HttpSession" %>
    <%@page import = "javax.servlet.http.HttpServletRequest" %>
    <%@page import = "javax.servlet.http.HttpServletResponse" %>
    
    <%@ page import = "java.util.ArrayList" %>
    
    <%@page import="dto.QNA_MD" %>
    <%@page import="dao.N_controller" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<jsp:useBean id="user" class="dao.N_controller"/> 

<body>

<%
//HttpSession session = request.getSession();
String start_date = request.getParameter("start_date");
String end_date = request.getParameter("end_date");

out.println(start_date);
out.println(end_date);

session.setAttribute("start_date", start_date);
session.setAttribute("end_date", end_date);

//ArrayList<QNA_MD> qna_date = user.Q_select_by_date(start_date, end_date); //설정한 날짜 구간만 나오게 할거임.
//qna_date에 그 해당날짜의 qna문의글만 들어가 있는거임




response.sendRedirect("cscenter_qna_list2.jsp");
%>



</body>
</html>