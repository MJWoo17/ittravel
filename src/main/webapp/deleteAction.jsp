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
<title>삭제 확인</title>
</head>
<body>
 <%
        String mem_id = null;
        // 로그인 된 사람은 회원가입페이지에 들어갈수 없다
        if(session.getAttribute("mem_id") != null )
        {
        	mem_id = (String) session.getAttribute("mem_id");
        }
        
        if(mem_id == null)
        {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요')");
            script.println("location.href = 'login001.jsp'");
            script.println("</script>");
        } 
        int com_num = 0;
        if (request.getParameter("com_num") != null)
        {
        	com_num = Integer.parseInt(request.getParameter("com_num"));
        }
        if (com_num == 0)
        {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글입니다')");
            script.println("location.href = 'com_list.jsp'");
            script.println("</script>");
        }
        Cominfo ci = new BoardDao().getBoard(com_num);
        if (!mem_id.equals(ci.getCom_mem_id()))
        {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 없습니다')");
            script.println("location.href = 'com_list.jsp'");
            script.println("</script>");
        
        } else {
        	BoardDao bd = new BoardDao();
            int result = bd.delete(com_num);
                if(result == -1){ // 글삭제에 실패했을 경우
                    PrintWriter script = response.getWriter(); //하나의 스크립트 문장을 넣을 수 있도록.
                    script.println("<script>");
                    script.println("alert('글 삭제에 실패했습니다.')");
                    script.println("history.back()");
                    script.println("</script>");
                }
                else { // 글삭제에 성공했을 경우
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("location.href= 'com_list.jsp'");
                    script.println("</script>");
                }
            }
        
        
    %>
</body>
</html>