<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import = "java.util.ArrayList" %>
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


<body>

<header>
 <jsp:include page="header.jsp" />
</header> 	

<section style="height: 700px">
    <div class="board_wrap">
        <div class="board_title">
            <h2>공지사항</h2>
        </div>
        <div class="board_view_wrap">
        
        <jsp:useBean id="user" class= "dao.N_controller"/>
        

        	
        
        <% 
        	   request.setCharacterEncoding("utf-8");      
          
               String iii = request.getParameter("not_num");               
               N_MD N_arr = user.selectone(iii); 
               
              int not_view = user.update_view(iii);
                	
                %>
        <form action="cscenter_not_edit.jsp">
            <div class="board_view">
                <div class="title">
                    <input type="text" value="<%=N_arr.getNot_title() %>" name="not_title" readonly="readonly" id="n_view_title" onselectstart="return false;" onmousedown="return false;" >
                </div>           
                
                <div class="info">
                
                 <!-- <dl>
                        <dt>번호</dt> 
                        <dd> --> <input type="text" value="<%=N_arr.getNot_num() %>" name="not_num" readonly="readonly" hidden="hidden" > <!--</dd>
                    </dl>  --> 
                    
                    <dl>  
                    
                      <!-- <dt>글쓴이</dt> -->  
                      
                        <dd><input type="text" value="<%=N_arr.getNot_writer() %>" name="not_writer" readonly="readonly" onselectstart="return false;" onmousedown="return false;"></dd>
                    </dl>
                    
                    <dl>
                     <!--   <dt>작성일</dt>  -->  
                        <dd><input type="text" value="<%=N_arr.getNot_date() %>" name="not__date" readonly="readonly" onselectstart="return false;" onmousedown="return false;"></dd>
                    </dl>
                    
                    <!-- <dl>
                        <dt>조회</dt>
                        <dd>-->
                        
                        <input type="text" value="<%=not_view%>" name="n_view" readonly="readonly" hidden="hidden" >
                       
                        <!--  </dd>
                    </dl>    -->
                    
                </div>
                
                <div class="cont">
                    <input type="text" value="<%=N_arr.getNot_con() %>" name="not_con" readonly="readonly" onselectstart="return false;" onmousedown="return false;">
                </div>
            </div>
            
            <%  %>
            
            <div class="bt_wrap">
                <a href="cscenter_not_list.jsp" class="on">목록</a>
                <a href="cscenter_not_edit.jsp"><input type="submit" value="수정" style="width: 100px;" height="42px;"> </a>
            	<a href="cscenter_not_delete.jsp?not_num=<%=N_arr.getNot_num() %>"><input type="button" value="삭제" style="width: 100px;"></a>
            </div>
            
            </form>
            
        </div>
    </div>
    </section>
    
    <footer>
    	<jsp:include page="footer.jsp"/>
	</footer>
    
    
</body>
</html>