<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Board_MD"%>
<%@ page import="dao.Board_controller"%>

<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>여행기 트래블로그</title>
<link rel="stylesheet" href="css/travelog.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>


<script>
	function addComment() {
		const commentInput = document.getElementById("leavecomment");
		const commentText = commentInput.value;
		if (commentText !== "") {
			const currentDate = new Date();
			const commentTime = currentDate.toLocaleString();
			const commentElement = document.createElement("div");
			commentElement.classList.add("comment");
			commentElement.innerText = commentText + " (" + commentTime + ")";
			const commentWrap = document.querySelector(".commentwrap");
			commentWrap.appendChild(commentElement);
			commentInput.value = "";
		}
	}
</script>


</head>


<body>
	<header>
	   <jsp:include page="header.jsp" />
	</header> 
	
	<section>
		<div class="mainwrap">
			<div class="maintitle">트래블로그</div>
			<button type="button"><a href="traveloglist.jsp">목록</a></button>
			<div class="contentwrap">
			
			<jsp:useBean id="board" class= "dao.Board_controller"/>

				<%
				 //session으로 가져오면 무조건 String으로 받으로 형변환해야 한다.
				//리턴값을 오브젝트로 받기 때문이다. 오브젝트는 int와 String를 받을 수 있기 때문에 정확히 변수의 타입을 확실히 정해주어야한다.
				String mem_id = (String) session.getAttribute("ID");

				if (mem_id == null) {
				%>

				<script>
// 					alert("로그인을 해주세요.");
// 					location.href = "Login_insert1.jsp";
				</script>

				<%
				}
				%>
				
				<%
				request.setCharacterEncoding("utf-8");

				String iii = request.getParameter("num");
				Board_MD board_md = board.selectOne(iii);

				//int viewcountint = N_arr.getN_view(); //불러온 게시물 정보에서 조회수값을 가져온다.
				// viewcountint++; //조회수값을 1씩 증가시킨다.

				// String viewcount = String.valueOf(viewcountint);

				// N_arr.setN_view(viewcount);

				// user.update(N_arr);
// 				int n_view = board.update_view(iii);//조회수 늘리기
				%>

				<div class="logtitle"><%=board_md.getLog_title() %></div>
				<div class="travelwhere"><%=board_md.getLog_where() %></div>
				<div class="travelwhen">여행일 <%=board_md.getLog_depdate() %>~<%=board_md.getLog_arrdate() %></div>
				<div class="howmanydays">몇박 몇일</div>
				<br>
				<div class="thumnailwrap">
					<div class="thumnail">
						<img src="<%=board_md.getLog_pic1() %>">
					</div>
					<%if(board_md.getLog_pic2() != null && board_md.getLog_pic2() != ""){ %>
					<div class="thumnail">
						<img src="<%=board_md.getLog_pic2() %>">
					</div>
					<%} %>
					<%if(board_md.getLog_pic3() != null && board_md.getLog_pic3() != ""){ %>
					<div class="thumnail">
						<img src="<%=board_md.getLog_pic3() %>">
					</div>
					<%} %>
					<%if(board_md.getLog_pic4() != null && board_md.getLog_pic4() != ""){ %>
					<div class="thumnail">
						<img src="<%=board_md.getLog_pic4() %>">
					</div>
					<%} %>
					<%if(board_md.getLog_pic5() != null && board_md.getLog_pic5() != ""){ %>
					<div class="thumnail">
						<img src="<%=board_md.getLog_pic5() %>">
					</div>
					<%} %>
				</div>
				<br>
				<div class="logcontent"><%=board_md.getLog_con() %></div>
				<br>
				<div class="sharetitle">방문한 곳 공유</div>
				<div class="daywrap">Day 1 - 2023.02.28</div>
				<div class="sharewhere">
					<ul>
						<li>호로콴</li>
						<li>호로콴</li>
					</ul>

				</div>
				<div class="daywrap">Day 2 - 2023.03.01</div>
				<div class="sharewhere">
					<ul>
						<li>마담콴</li>
						<li>르플라쥬</li>
						<li>한시장</li>
					</ul>
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


			<div class="commentwrap">
				<div class="comment">
					<div class="commentorpic">
						<img src="travelogimgs/nick2.jpg">
					</div>
					<div class="commentornick">초코</div>
					잘 보았읍니다 너무나 좋아보입니다<span class="comment-time">(2023-04-01
						15:32:00)</span>
				</div>
				<div class="comment">
					<div class="commentorpic">
						<img src="travelogimgs/nick1.jpg">
					</div>
					<div class="commentornick">심바</div>
					장미꽃 한 송이 놓고 갑니다,, 총총<span class="comment-time">(2023-04-01
						15:32:00)</span>
				</div>
				<div class="comment">
					<div class="commentorpic">
						<img src="travelogimgs/nick3.jpg">
					</div>
					<div class="commentornick">레오</div>
					음식이 참으로 맛있어보입니다<span class="comment-time">(2023-04-01
						15:32:00)</span>
				</div>
			</div>
			<input type="text" placeholder="댓글을 남겨보세요" class="leavecomment"
				id="leavecomment">
			<button type="button" value="등록" onclick="addComment()">등록</button>
		</div>
		
	</section>
		<footer>
    	<jsp:include page="footer.jsp"/>
	</footer>
	

</body>
</html>