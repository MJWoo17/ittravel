<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="dto.Board_MD"%>
<%@page import="dao.Board_controller"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>여행기 트래블로그 리스트</title>
<link rel="stylesheet" href="css/traveloglist.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>

<jsp:useBean id="board" class="dao.Board_controller" />

<body>

	<header>
	   <jsp:include page="header.jsp" />
	</header> 
	
	<div class="mainwrap">
		<div class="maintitle">트래블로그</div>
				<button type="button" class="btns" style ="float:right;">
			<a href="travelogwrite.jsp">등록</a>
		</button>
		
		<div class="contentwrap">


			<%
               
               ArrayList<Board_MD> Board_list = board.selectList(); 
               
               //int i = Board_list.size();
               
                for(int i=0 ; i <Board_list.size(); i++) {  
                	
            %>



			<div class="listthumnail">
				<div class="thumnailarrange">
					<div class="thumnail">
						<img src="<%=Board_list.get(i).getLog_pic1() %>">
					</div>
					<div class="titleandcontent">
						<p><div class="title">
							<h1><a href="travelog.jsp?num=<%=Board_list.get(i).getLog_num()%>"><%=Board_list.get(i).getLog_title()%></a></h1>
						</div></p>
						<p>
						<div class="content" style ="margin-top: 20px;"><%=Board_list.get(i).getLog_con() %></div>
						</p>
					</div>
				</div>
				<div class="hitsandlikes">
					<div>
						<img src="travelogimgs/eye_check.png" width="20px">
					</div>
					<div class="hits">33</div>
					<div class="sorticon">favorite</div>
					<div class="likes">29</div>
					<div class="sorticon">comment</div>
					<div class="comments">3</div>
				</div>
			</div>


			<%    
                }
            %>

		</div>
		

	</div>

	<footer>
    	<jsp:include page="footer.jsp"/>
	</footer>


</body>
</html>