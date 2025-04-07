
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 수정</title>
</head>
<body>

<jsp:useBean id="user" class= "dao.N_controller"/>

<%

String qna_title = request.getParameter("qna_title");
String qna_con = request.getParameter("qna_con");
String qna_num= request.getParameter("qna_num"); //request로 값을 받을 때는 String으로 받는다. 오히려 int로 받고 싶으면 Integer.parseInt()를 사용해야한다. 
//String viewcount = request.getParameter("viewcount");

out.print(qna_num);

user.Q_update(qna_title, qna_con, qna_num);

//response.sendRedirect("N_list.jsp");

%>


<script>
    alert("수정이 완료되었습니다.");
    location.href = "cscenter_qna_list.jsp";
</script>


</body>
</html>