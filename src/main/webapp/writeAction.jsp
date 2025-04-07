<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="dao.BoardDao" %>
    <%@ page import="dto.Cominfo" %>
    <%@ page import="java.io.PrintWriter"%>
    <% 
    request.setCharacterEncoding("UTF-8");
    %>
   <jsp:useBean id="board" class="dto.Cominfo" scope="page"/>
	<jsp:setProperty property="*" name="board"/>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% 
		request.setCharacterEncoding("UTF-8");
	
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		//회원 아이디와 패스워드가 일치하는지 비교
 		
 		BoardDao bd = new BoardDao();
 
		int result = bd.write(board);
 		
 		if(result == 1){
 			session.setAttribute("mem_id",mem_id);
			response.sendRedirect("com_list.jsp");
 		} else if(board.getCom_name() == null || board.getCom_con() == null){
 		%>	
 		<script>
 			alert('입력이 안된 사항이 있습니다.');
			history.go(-1);
		</script>	
		<%
 		} else if(result == -1){
		%>
		<script>
			alert('비회원 글쓰기는 불가합니다. 로그인 후 작성해 주세요.');
			history.go(-1);
		</script>	
		<%
 		}
		%>

</body>
</html>