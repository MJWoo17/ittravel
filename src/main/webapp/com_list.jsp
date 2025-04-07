<%@page import="dao.BoardDao"%>
<%@page import="java.util.Vector"%>
<%@page import="dto.Cominfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 전체</title>
     <link rel="stylesheet" href="css/com_style.css">

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
// 로그인이 된 사람들은 로그인 정보를 담을 수 있도록 한다. 
 String com_mem_id =null;
if(session.getAttribute(com_mem_id) != null){
	com_mem_id =(String)session.getAttribute("com_mem_id");
	
}

int pageNumber = 1; // 기본 페이지, 기본적으로 페이지는 1부터 시작
if(request.getParameter("pageNumber") != null){
	// 정수형으로 타입 변경
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
%>

	<div class="bandiv1">
 		<div class="bandiv2" id="bandiv2" onclick="location.href='com_list3.jsp'">
 		중고장터
 		</div>
 		<div class="bandiv3" id="bandiv3" onclick="location.href='com_list2.jsp'" >
 		동행구인
 		</div>
 		<div class="bandiv4"  id="bandiv4" onclick="location.href='com_list.jsp'" >
 		전체
 		</div>
    	</div>
    
    <div class="board_wrap">
    <form action="search_list.jsp" method="post">
    	<div class="btall2">
  		<div class="titlediv1">
  		전체
  		</div>
  	
    	<div>
    		<select class="btdiv1" name="searchField">
    		<option value="0"> 선택 </option>
    		<option value="com_name"> 제목 </option>
    		<option value="com_mem_id"> 작성자 </option>
    		</select>
    	</div>
         <div class="btdiv3">
    	<input type="search" name="searchText" placeholder="검색어를 입력해주세요.">
    	</div>
    	<div class="bt_wrap1">
        <button type="submit" class="on1"> 검색 </button>
        </div>
     
    	</div>
    	</form>
    	
        <div class="board_title">
        
        </div>
        
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                	<div class="num">카테고리</div>
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">작성일</div>
                    <div class="count">조회</div>
                </div>
                
                <% 
           	  BoardDao bd = new BoardDao();
           	  Vector<Cominfo> list1 = bd.getList(pageNumber); 
           	  for(int i = 0; i < list1.size(); i++){
           	%>
				<div>
				<div class="num"><%=list1.get(i).getCom_bct()%></div>  
    			<div class="num"><%=list1.get(i).getCom_num()%></div> 
    			<div class="title" style="text-align:center;">
        		<a href="com_view.jsp?com_num=<%=list1.get(i).getCom_num()%>">
            		<%=list1.get(i).getCom_name()%>
        		</a>
    			</div>
    		    <div class="writer">
    			<%=list1.get(i).getCom_mem_id()%>
    			</div>
    			<div class="date">
    			<%=list1.get(i).getCom_date()%>
    			</div>
    			<div class="count">
    			<%=list1.get(i).getCom_count()%>
    			</div>
				</div>
            <%
           	  }
            %>
            
            <div class="board_page">
               <!--  <a href="#" class="bt first"><<</a> -->
                  <%
                if(pageNumber != 1) {
            	%>
                <a href="com_list.jsp?pageNumber=<%=pageNumber -1 %>" class="bt prev"><</a>
                <!-- <a href="#" class="num on">1</a>
                <a href="#" class="num">2</a>
                <a href="#" class="num">3</a>
                <a href="#" class="num">4</a>
                <a href="#" class="num">5</a> -->
                <%
                } if (bd.nextPage(pageNumber + 1)) {
            	%>
                <a href="com_list.jsp?pageNumber=<%=pageNumber +1 %>" class="bt next">></a>
                     <%
                }
            		%>
                <!-- <a href="#" class="bt last">>></a> -->
                
            </div>
            </div>
          <div class="bt_wrap">
        <a href="com_write.jsp" class="on">등록</a>
        </div>
          
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html> 