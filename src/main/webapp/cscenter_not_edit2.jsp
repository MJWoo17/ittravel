<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <jsp:useBean id="user" class= "dao.N_controller"/>

<%

String not_title = request.getParameter("not_title");
String not_con = request.getParameter("not_con");
String not_num= request.getParameter("not_num"); //request로 값을 받을 때는 String으로 받는다. 오히려 int로 받고 싶으면 Integer.parseInt()를 사용해야한다. 
//String viewcount = request.getParameter("viewcount");

out.print(not_num);

user.not_update(not_title, not_con, not_num);

//response.sendRedirect("N_list.jsp");

%>


<script>
    alert("수정이 완료되었습니다.");
    location.href = "cscenter_not_list.jsp";
</script>


</body>
</html>