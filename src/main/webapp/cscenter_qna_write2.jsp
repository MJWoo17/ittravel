<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="dto.QNA_MD" %>
    <%@page import="dao.N_controller" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="user" class= "dao.N_controller"/>

<% 
request.setCharacterEncoding("utf-8");

String qna_mem_nick = (String) session.getAttribute("mem_nick"); //세션에 떠있는 아이디 (회원가입에 저장되어있는 아이디)
String qna_mem_id = (String) session.getAttribute("mem_id");


QNA_MD md = new QNA_MD(); //QNA_MD에다가 저장할거임.

String qna_fil = request.getParameter("qna_fil"); //앞에서 선택한 카테고리
String qna_title =request.getParameter("qna_title"); //앞에서 입력한 제목
//String qna_mem_id =request.getParameter("qna_mem_id"); //
String qna_con =request.getParameter("qna_con"); //앞에서 입력한 내용
String qna_img = request.getParameter("qna_img");//앞에서 첨부한 파일
String qna_open = request.getParameter("qna_open");

md.setQna_fil(qna_fil);
md.setQna_title(qna_title);
md.setQna_mem_id(qna_mem_id);
md.setQna_con(qna_con);
md.setQna_img(qna_img);
md.setQna_open(qna_open);

//md.setViewcount(viewcount);
//md.setNowdate(nowdate);


user.Q_insert(md);

//response.sendRedirect("N_list.jsp"); //form 버튼 없이 페이지를 넘겨준다. 


%>

<script>
    alert("등록이 완료되었습니다.");
    location.href = "cscenter_qna_list.jsp";
</script>



</body>
</html>