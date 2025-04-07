<%@ page contentType="text/html; charset=UTF-8" %>

<%@page import ="dto.N_MD" %>
<%@page import="dao.N_controller" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="css/css.css">
</head>
<body>

<header>
 <jsp:include page="header.jsp" />
</header>


<%
		request.setCharacterEncoding("utf-8");

        String mem_nick = (String)session.getAttribute("mem_nick"); //session으로 가져오면 무조건 String으로 받으로 형변환해야 한다.
        													//리턴값을 오브젝트로 받기 때문이다. 오브젝트는 int와 String를 받을 수 있기 때문에 정확히 변수의 타입을 확실히 정해주어야한다.
             													
        if(mem_nick==null) {
        	
        	%>
        	
        	<script>
			    alert("로그인을 해주세요.");
			    location.href = "login001.jsp";
			</script>
        	
        	<% 
        }
        %>


	<section style="height: 700px">
    <div class="board_wrap">
        <div class="board_title">
        
            <h2>공지사항 입력</h2>

        </div>
        
        <jsp:useBean id="user" class="dao.N_controller"/>
        
        <form action="cscenter_not_write2.jsp" method="post">
        
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력" name="not_title" required="required" ></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><input type="text" value="관리자" name="not_writer" readonly="readonly" ></dd>
                    </dl>

                </div>
                
                <div class="cont">
                    <textarea placeholder="내용 입력" name="not_con" required="required"  ></textarea>
                </div>
            </div>
            
            <div class="bt_wrap">           
                <input class="on" type="submit" value="등록">      
                
            </div>
            
        </div>
        </form>
    </div>
   
    </section>
    
    <footer>
    	<jsp:include page="footer.jsp"/>
	</footer>
    

    
</body>
</html>