<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter" %>
<%@ page import="dto.Cominfo" %>
<%@ page import="dao.BoardDao" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
     <link rel="stylesheet" href="css/com_style.css">
</head> 
<body>
<jsp:include page="header.jsp"></jsp:include>
<% 
String mem_id = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
if (session.getAttribute("mem_id") != null)
{ 
	mem_id = (String)session.getAttribute("mem_id");
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
    script.println("location.href = 'main.jsp'");
    script.println("</script>");
}

Cominfo ci = new BoardDao().getBoard(com_num);
%>
    <div class="board_wrap">
        <div class="board_title">
            <strong>동행구인</strong>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                    <dt><%= ci.getCom_name().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></dt>
                    
                </div>
                <div class="info">
                    	<dl>
    				<dt>번호</dt>
   					 <dd><%= String.valueOf(ci.getCom_num()).replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></dd>
					</dl>
                    	<dl>
    				<dt>카테고리</dt>
   					 <dd><%= ci.getCom_bct().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></dd>
					</dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><%= ci.getCom_mem_id().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><%= ci.getCom_date().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></dd>
                    </dl>
                    <dl>
                        <dt>조회수</dt>
                        <dd><%= String.valueOf(ci.getCom_count()+1).replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></dd>
                    </dl>
              <!--       <dl>
                        <dt>조회</dt>
                        <dd>33</dd>
                    </dl> -->
                </div>
                <div class="cont">
                <%= ci.getCom_con().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %><br>
                </div>
            </div>
            <div class="bt_wrap2">
                <a href="com_list2.jsp" class="on1">목록</a>
                <a href="com_edit.jsp?com_num=<%=com_num%>" class="on"> <input class="on" type="submit"  value="수정"></a>
               <a href="deleteAction.jsp?com_num=<%=com_num%>"  class="on"> <input class="on" type="submit"  value="삭제"></a>
            </div>
        </div>
    </div>
    
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>