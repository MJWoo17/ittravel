<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="dto.N_MD" %>
    <%@page import="dao.N_controller" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="css/css.css">
</head>

<%


String not_title = request.getParameter("not_title");
String not_num = request.getParameter("not_num"); //int여도 getParameter로 받으면 String으로 받는다!
String not_writer = request.getParameter("not_writer");
String not_date = request.getParameter("not_not_date");
String not_con = request.getParameter("not_con");
String not_viewcount = request.getParameter("not_view");


%>
<body>

<header>
 <jsp:include page="header.jsp" />
</header>

<section style="height: 700px;">
<form action="cscenter_not_edit2.jsp">
    <div class="board_wrap">
        <div class="board_title">
            <strong>공지사항 수정</strong>

        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" value="<%=not_title %>" name="not_title"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><input type="text" value="<%=not_writer %>" name="not_writer" readonly="readonly"></dd>
                    </dl>
                    
                </div>
                <div class="cont">
                    <textarea  name="not_con"><%=not_con %></textarea>
                    
                    <input type="text" value="<%=not_num %>" name="not_num" hidden="hidden">
                    <input type="text" value="<%=not_viewcount %>" name="viewcount" hidden="hidden">
                </div>
            </div>
            <div class="bt_wrap">
                <input type="submit" value="수정">
                <a href="cscenter_not_view.jsp">취소</a>
            </div>
        </div>
    </div>
   </form>
   
   </section>
   
   <footer>
    	<jsp:include page="footer.jsp"/>
	</footer>
   
</body>
</html>