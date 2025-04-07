<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTf-8"%>

<%@ page import = "java.util.ArrayList" %>

<%@ page import = " java.util.Collections"%>
<%@ page import = "java.util.Comparator"%>

    
    <%@page import="dto.FAQ_MD" %>
    <%@page import="dao.N_controller" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>고객센터</title>
	 
	 <link rel="stylesheet" type="text/css" href="css/header_footer.css">
	 
	 <link rel="stylesheet" href="css/css.css">
	 <link rel="stylesheet" href="css/cscenter.css">
	 <link rel="stylesheet" type="text/css" href="css/cscenter_faq.css">
	 
	 <!-- faq js -->
	 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	 <script src="js/cscenter_faq.js" ></script>	 
	 
	 <style type="text/css">
	 
	 section .cscenter_menu_wrap .cscenter_menu:first-child, .cscenter_menu:nth-child(3) {
	      background-color: #f6f6f6;
	      border-radius: 10px;
	    }
	 
	    section .cscenter_menu_wrap .cscenter_menu:nth-child(2)  {
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

<% 
request.setCharacterEncoding("utf-8"); 

String faq_view = request.getParameter("faq_num");


%>

<body>

<!--헤더부분-->

	<header>
	   <jsp:include page="header.jsp" />
	</header>
	 
<!-- faq 부분이야  -->

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
						<div class="triangle"></div>
					
					</div>
					
					<div class="cscenter_menu" >
					
						<div class="cscenter_menu_txt">			
							<p><a href="cscenter_qna_list.jsp">직접 문의하기</a></p>

						</div>

					</div>
					
				</div>
							
	</div>

	<div class="cscenter_faq" >
		
			
			
			<div class="faq_search_wrap" >
			
				<div class="faq_search" >
				
					<form action="cscenter_faq_search.jsp">
			
						<input type="text" name="faq_search_input" placeholder="   질문 키워드를 입력해주세요">
  						<input type="submit" value="검색">
  					
  					</form>
  				
  				</div>
  				
  				<div class="faq_search_keyword">
  				
  				<h1>인기키워드</h3>
  					<ul>
  						<li>#여행계약서</li>
  						<li>#비회원예약</li>
  						<li>#예약취소및환불</li>
  						<li>#예약변경</li>
  						<li>#예약확인</li>
  						<li>#인원추가</li>
  						<li>#환불규정</li>
  					</ul>
  				</div>
			
			</div>
			
			<script type="text/javascript">
			
			const keyword = document.querySelectorAll('.faq_search_keyword li');

			const searchInput = document.querySelector('input[name="faq_search_input"]');
			const form = document.querySelector('form');

			for (const li of keyword) {
			  li.addEventListener('click', () => {
			    const liText = li.textContent.replace('#', '');
			    searchInput.value = liText;
			    form.submit();
			  });
			}

			
			
			</script>
			
			<div id="faq_title" >
			
				<div id="faq_title_wrap" >
				
					<h1>FAQ</h1>
					<h3>자주 하는 질문</h3>
					
					
				
				</div>
				
				<div class="faq_menu_list" >
				
					<ul>
						<li>여행지추가</li>
						<li>일정짜기</li>
						<li>항공예약</li>
						<li>투어예약</li>
						<li>쇼핑</li>
					</ul>
				
				</div>
			
			</div>
			
			<!-- <div>
				<ul>
					<li>top1</li>
					<li>top2</li>
					<li>top3</li>
					<li>top4</li>
					<li>top5</li>
					<li>top6</li>
					<li>top7</li>
					<li>top8</li>
					<li>top9</li>
					<li>top10</li>
				</ul>
			</div>  -->
			
			<!-- <div id="faq_container" >-->
			
			<div class="board_wrap">
        
        <div class="board_list_wrap">
            <div class="board_list">
            
                <div class="top">
                 <!-- <div class="num">번호</div>
                 	<div class="num">번호</div>
                    <div class="title">제목</div> -->   
                </div>
                
               
                <div class="faq_list" >
                
               <%
				ArrayList<FAQ_MD> faq_arr = user.F_select();
				
				// faq_arr를 조회수가 큰 순서대로 정렬합니다.
			    Collections.sort(faq_arr, new Comparator<FAQ_MD>() {
			        @Override
			        public int compare(FAQ_MD o1, FAQ_MD o2) {
			            // o1의 조회수가 o2의 조회수보다 크면 -1, 같으면 0, 작으면 1을 반환합니다.
			            return Integer.compare(o2.getFaq_view(), o1.getFaq_view());
			        }
			    });
				
			    for(int i =0; i < Math.min(faq_arr.size(), 10); i++) {
			        %>
			        <div class="faq_item">
			            <div class="num" ><span style="color: <%= i < 3 ? "red" : "black" %>" >TOP<%= (i + 1) %></span></div>
			            <div class="title" style="color: black;"><%=faq_arr.get(i).getFaq_title()%></div>
			            <!-- <div class="click" style="width: 10%; float: left;" ><img src="cscenterimg/faq_click.png" style="width: 30px; height: 30px;" > </div>  -->
			            <div class="count" hidden="hidden" ><%=faq_arr.get(i).getFaq_view() %></div>
			        </div>
			        <div class="con_wrap" style="display: none;" >
			            <div class="con" ><%=faq_arr.get(i).getFaq_con()%></div>
			        </div>
			        <%
			    }



				%>
                </div>
                
				  <script>
				  $(document).ready(function() {
			            $('.faq_item .title').on('click', function() {
			                var $faqItem = $(this).parent();
			                var $conWrap = $faqItem.next('.con_wrap');

			                // 현재 클릭한 faq_item에 active 클래스 추가
			                $faqItem.addClass('active');

			                // 현재 열려있는 con_wrap 찾아서 닫기
			                $('.faq_item.active').not($faqItem).removeClass('active').next('.con_wrap').slideUp();

			                // 클릭한 title의 con_wrap 열기
			                $conWrap.slideToggle();
			            });
			        });

				  </script>
                
	            </div>
	       
	            <div class="bt_wrap">
	                <a href="cscenter_qna_write.jsp" class="on" style="margin-top: 50px;" >등록</a>
	                <!--<a href="#">수정</a>-->
	            </div>
	            
	        </div>
    </div>
			
			
	</div>

	</section>

	<footer>
    	<jsp:include page="footer.jsp"/>
	</footer>

</body>

</html>