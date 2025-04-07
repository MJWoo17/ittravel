<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>it헤더</title>
	
	<link rel="stylesheet" type="text/css" href="css/header_footer.css">
	

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
   <script src="js/slick-1.8.1/slick/slick.min.js"></script>
  <script src="js/header_menu.js"></script>
 


</head>
<body>
    <header >
            
            <div class="hdwrap1">
                <div class="ftwrap1"><a href="index.jsp"><img src="mainindeximgs/logo.png" height="90px"style="padding-left: 20px; margin-top: 22px;"  ></a>
                    <div class="ftwrap2"></div>
                    <div class="search-wrapper active">
                      <div class="input-holder">
                          <input type="text" class="search-input" placeholder="검색어를 입력해주세요." />
                          <button class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
                      </div>
                      <!-- <span class="close" onclick="searchToggle(this, event);"></span> -->
                    </div>
                    <div class="topwrap1">
                      <ul>
                        <li><a href="cscenter_faq.jsp">고객센터</a></li>
                        <li class="login_false">
                        
                        <%
                        
                        String mem_nick = (String)session.getAttribute("mem_nick");
                        String mem_id = (String)session.getAttribute("mem_id");
                        
						if(mem_nick == null){  %>
						
                        <a href="login001.jsp">로그인</a>
                       
                        </li> 
                        <li class="login_false"><a href="join001.jsp">회원가입</a></li>    
                        <li class="login_true">
                        
                         <%} else{ 
                        	 
                        	 %>
                        	 
                        <a href="#" style="cursor: pointer;" > <%=mem_nick %>님 접속 </a>
                         
                        <a href="logout.jsp" style="cursor: pointer; margin-left: 30px; ">로그아웃</a>
                        
                       <%} %>
                       
                        </li>
                        <li class="login_true">
                        
                        </li>
                        
                      </ul>
                    </div>
                 </div> 
          </div>
          
          <div class="hdwrap2">
	          <div class="menuwrap1">
		          <ul>
		              <div id="menulist_all" >
		              
			              <li class="menulist2">  
			              	<% if(mem_nick != null){%>
			              		<a href="./travel_plan.jsp" class="menu">여행지추가</a>
			              	<% }else{%>
			              		<a href="#" class="menu" onclick="alert('로그인이 필요합니다!'); location.href='./login001.jsp';">여행지추가</a>
			              	<% }%>
			              </li>
			              
			              <li class="menulist3">
			              <% String destination = (String) session.getAttribute("coouncity");%>
			              	<% if(mem_nick != null){
			              		if(destination != null){%>
			              		<a href="./travel_sch_mng.jsp" class="menu">일정짜기</a><%}
			              		else{%>
			              		<a href="#" class="menu" onclick="alert('여행지를 먼저 추가해주세요'); location.href='./travel_plan.jsp';">일정짜기</a>
			              		<%} %>
			              	<% }else{%>
			              		<a href="#" class="menu" onclick="alert('로그인이 필요합니다!'); location.href='./login001.jsp';">일정짜기</a>
			              	<% }%>
			              </li>
			              
			              <li class="menulist4"> <a href="./flight.jsp" class="menu"> 항공예약 </a></li>
			              <li class="menulist5"> <a href="tour002.jsp"  class="menu" > 투어예약 </a></li>
			              <li class="menulist6"> <a href="soc_basicboard.jsp" class="menu"> 소셜 </a></li>
			              <li class="menulist7"> <a href="shoppingmain.do"  class="menu"  > 쇼핑 </a></li>
			              <li class="menulist8"> <a href="com_list.jsp" class="menu"> 커뮤니티 </a></li>
		              </div>		              
	              </ul>
	        </div>
	      </div>
	      
	      <div class="all_menu">
	      
	      </div>
   
          <div class="menuwrap2">
		      <div class="menuwrap3">
			      <div class="menu_down">
			      
				       <ul class="m_place">
				         <li>
				           <% if(mem_nick != null){%>
			              <a href="./travel_plan.jsp" class="menu">여행지추가</a>
			              <% }else{%>
			              <a href="#" class="menu" onclick="alert('로그인이 필요합니다!'); location.href='./login001.jsp';">여행지추가</a>
			              <% }%>
				         </li>		        
				      </ul>
			
				     <ul class="m_plan">
				         <li>
			              	<% if(mem_nick != null){
			              		if(destination != null){%>
			              		<a href="./travel_sch_mng.jsp" class="menu">일정짜기</a><%}
			              		else{%>
			              		<a href="#" class="menu" onclick="alert('여행지를 먼저 추가해주세요'); location.href='./travel_plan.jsp';">일정짜기</a>
			              		<%} %>
			              	<% }else{%>
			              		<a href="#" class="menu" onclick="alert('로그인이 필요합니다!'); location.href='./login001.jsp';">일정짜기</a>
			              	<% }%>
				         </li>
				
				     </ul>
				     <ul class="m_flight">
					      <li>
					          <a href="./flight.jsp">항공 홈</a>
					      </li>
					      <li>
					          <a href=""> 항공권 예매</a>
					      </li>
					      <li>
					         <a href="">내 항공권 조회</a>
					     </li>
				  	 </ul>
			  
					  <ul class="m_tour">
					      <li>
					          <a href="./tour002.jsp">투어 홈</a>
					      </li>
					      <li>
					          <a href="">국내</a>
					      </li>
					      <li>
					         <a href="">해외</a>
					     </li>
					  </ul>
			
					  <ul class="m_social">
					      <li>
					          <a href="soc_basicboard.jsp">소셜 홈</a>
					      </li>
					      <li>
					         <a href="soc_boardWrite.jsp">글 작성</a>
					     </li>
					     <li>
					         <a href="soc_board_my.jsp">내 피드</a>
					     </li>
					  </ul>
					
					  
					  <ul class="m_shopping">
					      <li>
					          <a href="shoppingmain.do">쇼핑 홈</a>
					      </li>
					      <li>
					          <a href="">캐리어</a>
					      </li>
					      <li>
					          <a href="">여행용품</a>
					      </li>
					      <li>
					          <a href="">잡화</a>
					      </li>
					   </ul>
	
					   <ul class="m_community">				
					      <li>
					          <a href="com_list.jsp">전체</a>
					      </li>
					        <li>
					          <a href="com_list2.jsp">동행구인</a>
					      </li>
					        <li>
					          <a href="com_list3.jsp">중고장터</a>
					      </li>
					   </ul>
			
			
			      </div>
     </div>
   </div>

   <div class="menuwrap8">
    <div class="menuwrap9">
      <ul>
        <li> <a href="./flight.html"> 항공 홈 </a></li>
        <li>항공권 예매</li>
        <li> 내 항공권 조회</li>
      </ul>
    </div>
   </div>
   
   <div class="menuwrap10">
    <div class="menuwrap11">
      <ul>
        <li></li>
        <li> <a href="./tour002.html">투어 홈 </a></li>
        <li> 국내 </li>
        <li> 해외 </li>
      </ul>
    </div>
   </div>

   <div class="menuwrap12">
    <div class="menuwrap13">
      <ul>
        <li>소셜 홈</li>
        <li>글 작성</li>
        <li>내 피드</li>
      </ul>
    </div>
   </div>

   <div class="menuwrap14">
    <div class="menuwrap15">
      <ul>
        <li>쇼핑 홈</li>
        <li>배낭</li>
        <li>잡화</li>
        <li>캐리어</li>
      </ul>
    </div>
   </div>
          
    </header>
      
</body>
</html>