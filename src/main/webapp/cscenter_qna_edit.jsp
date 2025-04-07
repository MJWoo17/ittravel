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
    <title>Q&A 수정하기</title>
    <link rel="stylesheet" href="css/css.css">
    <link rel="stylesheet" href="css/cscenter.css">
    <link rel="stylesheet" href="css/cscenter_qna.css">
</head>

<%


String qna_title = request.getParameter("qna_title");
String qna_num = request.getParameter("qna_num"); //int여도 getParameter로 받으면 String으로 받는다!
String qna_writer = request.getParameter("qna_writer");
String qna_date = request.getParameter("qna_date");
String qna_con = request.getParameter("qna_con");
//String viewcount = request.getParameter("n_view");


%>
<body>

<header>
 <jsp:include page="header.jsp" />
</header>

<section style="height: 700px;">
<form action="cscenter_qna_edit2.jsp">
    <div class="board_wrap">
        <div class="board_title">
            <strong>문의 수정하기</strong>

        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input name="qna_title" type="text" value="<%=qna_title %>" name="title"></dd>
                    </dl>
                </div>
                
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><input id="qna_writer" type="text" value="<%=qna_writer %>" name="writer" readonly="readonly" onselectstart="return false;" onmousedown="return false;"></dd>
                    </dl>
                    
                </div>
                
                <div class="cont">
                    <textarea  name="qna_con"><%=qna_con %></textarea>
                    
                    <input type="text" value="<%=qna_num %>" name="qna_num" hidden="hidden">
                  
                </div>
            </div>
            <div class="bt_wrap">
                <input type="submit" value="수정">
                <a href="cscenter_qna_view.jsp">취소</a>
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