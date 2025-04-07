<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "java.util.ArrayList" %>
    
    <%@page import="dto.QNA_MD" %>
    <%@page import="dao.N_controller" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Q&A</title>
    <link rel="stylesheet" href="css/css.css">
    <link rel="stylesheet" href="css/cscenter.css">
    <link rel="stylesheet" href="css/cscenter_qna.css">
    
    
    <style type="text/css">
    
    section .cscenter_menu_wrap .cscenter_menu:first-child, .cscenter_menu:nth-child(2) {
	      background-color: #f6f6f6;
	      border-radius: 10px; 
	    }
    
	    section .cscenter_menu_wrap .cscenter_menu:nth-child(3) {
	      background-color: rgba(126, 125, 203, 0.26);
	      border-radius: 10px;
	    }
	    
	    .cscenter_menu {
	    
		  position: relative;
		}
		
		.triangle {
		
		  margin-left: 165px; /* 삼각형의 가로 길이의 절반 */
		  width: 0;
		  height: 0;
		  border-top: 10px solid rgba(126, 125, 203, 0.26); /* 삼각형의 높이 */
		  border-right: 10px solid transparent;
		  border-left: 10px solid transparent;
		}
    
    </style>
    
</head>


<jsp:useBean id="user" class="dao.N_controller"/> 



<body>

   <jsp:include page="header.jsp" />
   
<section>


	<div class="cscenter" >

			<div class="cscenter_menu_wrap" >
			
					<div class="cscenter_menu" >
					
						<div class="cscenter_menu_txt">			
							<p style="margin-left: 30px;"><a href="cscenter_not_list.jsp" >공지사항</a></p>
						</div>	
					
					</div>
					
					<div class="cscenter_menu" >
					
						<div class="cscenter_menu_txt">			
							<p><a href="cscenter_faq.jsp">자주하는 질문</a></p>
						</div>
					
					</div>
					
					<div class="cscenter_menu" >
					
						<div class="cscenter_menu_txt">			
							<p><a href="cscenter_qna_list.jsp">직접 문의하기</a></p>

						</div>
						
						<div class="triangle"></div>

					</div>
				
				</div>
							
		</div>

<form action="cscenter_qna_list_date.jsp">
    <div class="board_wrap">
    
        <div class="qna_title">
        
	        <div id="qna_title_wrap" >
	            <h1 style="font-size: 40px;" >Q&A</h1>
				<h3 style="font-size: 20px;" >직접 문의하기</h3>
			</div>
			
			<div class="qna_date_wrap" >
                
	        	<input type="date"  name="start_date" >
				<input type="date" name="end_date" >
				<input type="submit" value="조회하기" >
        
        	</div>
        </div>

        
        
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                 <!-- <div class="num">번호</div> -->   
                 	<div class="num">카테고리</div>
                    <div class="title">제목</div>
                    <div class="writer">질문자</div>
                    <div class="count">답변상황</div>
                    <div class="date">문의일</div>
                </div>
                
               
                <div >
               <%
               
               ArrayList<QNA_MD> N_arr = user.Q_select();
               
               
               
               int i = N_arr.size();
               
                for(i= i-1 ; i >=0; i = i-1) {  
                	
     
                	%>
                	
                    <div class="num"><%=N_arr.get(i).getQna_fil() %></div>
                    
                    <div class="title">
                    
				        <a href="cscenter_qna_view.jsp?qna_num=<%=N_arr.get(i).getQna_num()%>">
				        
				        <% if(N_arr.get(i).getQna_open().equals("비공개")) { %>
				        
				            <img src="cscenterimg/qna_secret.png">
				        <% } %>
				        
				        <%=N_arr.get(i).getQna_title()%></a>
				        
				    </div>
                    
                    
                    <div class="writer"><%=N_arr.get(i).getQna_mem_id() %></div>
                    <div class="writer"><%=N_arr.get(i).getQna_reply() %></div>
                    <div class="date"><%=N_arr.get(i).getQna_date() %></div>
                                 
                <%    
                }
                %>
                </div>
                
            </div>
            
            
       
            <div class="bt_wrap">
                <a href="cscenter_qna_write.jsp" class="on" style="margin-top: 50px;" >등록</a>
                <!--<a href="#">수정</a>-->
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