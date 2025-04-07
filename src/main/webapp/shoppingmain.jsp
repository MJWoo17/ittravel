<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTf-8"%>

    <%@page import = "java.util.ArrayList" %>
    <%@page import= "dao.ProdDao" %>
    <%@page import= "dao.N_controller" %>
    <%@page import= "vo.ProdInfo" %>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>쇼핑메인</title>

	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

	 <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	 
	 <link rel="stylesheet" type="text/css" href="css/shopping001.css">
	 
	 <link rel="stylesheet" type="text/css" href="css/shopping001_midbn2.css">
	 	 
	 <link rel="stylesheet" type="text/css" href="css/header_footer.css">
	 	 
	 <!-- 헤더 js -->
	 <script src="js/slick-1.8.1/slick/slick.min.js"></script>
	 <script src="js/flight.js"></script>
	 <script src="js/shopping_bn.js"></script>

</head>

<body>

<!--헤더부분-->

	<header>
	   <jsp:include page="header.jsp" />
	</header> 
	
	<div id="section_wrap">

	<section>
	
		<%
			String mem_id =(String)session.getAttribute("mem_id");
		%>
	
		<div id="shopping_quickmenu_wrap" >
			<ul>
				<li class="s_quickmenu" >
					<a href="shopping_cart_direct.do?mem_id=<%=mem_id %>" ><img alt="cartimg" src="shopimg/cart.png" style="width: 100px; height: 100px;" >장바구니</a>
				</li>
				
				<li class="s_quickmenu">
					<a href="" >찜 목록</a>
				</li>
				
				<li class="s_quickmenu">
					<a href="" >결제하기</a>
				</li>
			</ul>
		</div>
	
		 <div class="slideshow-container"> <!--광고배너 이미지 3개 -->

		     <div class="mySlideDiv fade active">
		        <a href="#"><img src="./shopimg/shopping-banner1.jpg" style="width: auto; height: 500px; margin-left: -310px;"></a>
		     </div>
		            
		     <div class="mySlideDiv fade">
		         <a href="#"><img src="./shopimg/shopping-banner2.jpg" style="width: auto; height: 500px; margin-left: -310px;"></a>
		     </div>
		            
		     <div class="mySlideDiv fade">
		        <a href="#"><img src="./shopimg/shopping-banner3.jpg" style="width: auto; height: 500px; margin-left: -310px;"></a>
		     </div>

		     <a class="prev" onclick="prevSlide()">&#10094;</a>
		     <a class="next" onclick="nextSlide()">&#10095;</a>
            
		</div> <!--광고배너 이미지 3개 -->
		
		<!--  

			<div class="shopping_topmenu_wrap">
				<div id="shopping_topmenu" >
					<ul>
						<li>캐리어</li>
						<li>가방</li>
						<li>여행용품</li>
						<li>아울렛</li>
					</ul>
				</div>
			</div>
			
		--> 
			
			<div id="allmenu"> <!-- 상품 전체 시작 -->

			<div id="hot_item"> <!-- hot item 시작 -->

				<p id="hot_txt">가장 먼저 살펴보세요</p>

				<div class="menu1">   <!--한줄-->
				
					<%	
						//데이터베이스에 있는 모든 정보를 가져와서 나열하고, 그걸 클릭해야되는거니까 arraylist가 맞나?
								
						ArrayList<ProdInfo> prodinfo = ( ArrayList<ProdInfo> ) request.getAttribute("articlemain");
						//request는 object로 받기 때문에 정확한 데이터타입을 정해줘야 함.
						//여기서는 arraylist로 받았기 때문에 (ArrayList<ProdInfo>) request.getAttribute("article"); 이렇게 받음.
						
						for(int i =0; i<8; i++ ) {
							
							String prodImgPath = "shopimg/" + prodinfo.get(i).getProd_img();
						
							//int prod_num = prodinfo.get(i).getProd_num();
							//String prod_name = prodinfo.get(i).getProd_name();
							//String prod_img = prodinfo.get(i).getProd_img();
									
					%> 
					
					<div id="prod_wrap" >
	
						<ul class="img_ul">
							<li>
								<a href="shopping_prod.do?prod_num=<%=prodinfo.get(i).getProd_num() %>">
									<img style="width: 240px; height: 240px; " src=<%=prodImgPath %>>
								</a>
							</li>
						</ul>
	
						<ul class="info_ul">
							<li><%=prodinfo.get(i).getProd_name() %></li>
						</ul>
						
					</div>
					
					<%
					}
					%>

				</div>  
				
				<!--한줄끝-->

			</div> <!-- hot item 끝 -->

			<div id="mid_bn_wrap">  <!-- 중간 배너 -->

				<div id="mid_bn1">
					<a href="#"><img src="./shopimg/shopping-bn1.jpg" style="width: 690px; height: 270px;"></a>
				</div>

				<div id="mid_bn2">
					<a href="#"><img src="./shopimg/shopping-bn2.jpg" style="width: 690px; height: 270px;"></a>
				</div>
			</div>
			
			<!-- //////////////뉴아이템 이 사이에 넣으면됨 //////////////////////////////////////////////////// -->

			<div id="new_item">  <!-- new item 시작-->

	            <p id="new_txt">이번 주에 새로 들어왔어요</p>
	         
	            <div class="menu2">
	            
	            <%
						//데이터베이스에 있는 모든 정보를 가져와서 나열하고, 그걸 클릭해야되는거니까 arraylist가 맞나?
								
						//ArrayList<ProdInfo> prodinfo = (ArrayList<ProdInfo>) request.getAttribute("article");
						//request는 object로 받기 때문에 정확한 데이터타입을 정해줘야 함.
						//여기서는 arraylist로 받았기 때문에 (ArrayList<ProdInfo>) request.getAttribute("article"); 이렇게 받음.
						
						for(int i = 8; i < 14; i++ ) {
							
							String prodImgPath = "shopimg/" + prodinfo.get(i).getProd_img();
						
						//int prod_num = prodinfo.get(i).getProd_num();
						//String prod_name = prodinfo.get(i).getProd_name();
						//String prod_img = prodinfo.get(i).getProd_img();
									
				%> 
	            
	            <div id="prod_wrap2" >
	            
	               <ul class="img_ul2" >
	                  <li>
	                     <a href="shopping_prod.do?prod_num=<%=prodinfo.get(i).getProd_num() %>">
	                        <img style="width: 320px; height: 320px;" src=<%=prodImgPath %>>
	                     </a>
	                  </li>
	               </ul>
	
	               <ul class="info_ul2">
	                  <li><%=prodinfo.get(i).getProd_name() %></li>
	               </ul>
	               
	            </div>
	            
	            	<%
					}
					%>
	            
	         </div>

         </div>   <!-- new item 끝-->
			

			<!-- ////////////////////////////////////////////////////////////////// -->

			<div id="only_item">

				<p id="only_txt">오직 It Travel에서만 만나볼 수 있어요</p>
			
				<div id="menu1_only">

					<ul class="img_ul" >
						
						<li id="only_img_1">
							<a href="#"><img style="width: 600px; height: 690px;" src="./shopimg/shopping-only-prod1.jpg"></a>
							<!-- <a href="#"><img style="width: 600px; height: 350px; float: right;" src=".\10d6489541c62552c1e9dc8734adb08a.jpg"></a> -->
						</li>

						<div id="only_img_4"> 
						
							<li class="only_img_4" >
								<a href="#"><img id="only_img_4_img1" src="./shopimg/shopping-only-prod2.jpg"></a>
							</li>
						
							<li class="only_img_4">
								<a href="#"><img id="only_img_4_img2" src="./shopimg/shopping-only-prod3.jpg"></a>
							</li>
	
							<li>
								<a href="#"><img style="width: 660px; height: 330px; float: right;" src="./shopimg/shopping-only-prod4.jpg"></a>
							</li>

						</div>
						
					</ul>

					<!-- <ul class="info_ul" style="margin-top: 600px;">
						<li>설명</li>
						<li>설명</li>
						<li>설명</li>
						<li>설명</li>
					</ul> -->

				</div>
			</div>

				<!-- /////////////////////////////2번째 광고 배너 -->
				
			<div id="banner2">

				  <ul class="slider">
				
					    <li>
					    	<a href="#"><img style="width: auto; height: 200px;" src="./shopimg/midbn5.jpg"></a>
					    </li>
					
					    <li>
					    	<a href="#"><img style="width: auto; height: 200px;" src="./shopimg/midbn6.jpg"></a>
					    </li>
					
					    <li>
					    	<a href="#"><img style="width: auto; height: 200px;" src="./shopimg/midbn7.jpg"></a>
					    </li>
				
				   <!--  <li>
				      <a href="#"><img style="width: 1920px; height: 200px;" src=".\midbn4.jpg"></a>
				    </li> -->
				    
				  </ul>
				
				<!--   <div class="btn">
				
				    <button type="button" id="prev"><</button>
				    <button type="button" id="next">></button>
				  </div> -->


		</div>	<!-- /////////////////////////////2번째 광고 배너 -->

	</div>	<!-- 상품 전체 끝 -->

	
			<div id="curation_item">

				<p id="curation_txt">고객님을 위한 It Travel 추천상품</p>
			
				<div class="menu3">
				
				<%	
						for(int i =15; i<27; i++ ) {
							
							String prodImgPath = "shopimg/" + prodinfo.get(i).getProd_img();
						
						//int prod_num = prodinfo.get(i).getProd_num();
						//String prod_name = prodinfo.get(i).getProd_name();
						//String prod_img = prodinfo.get(i).getProd_img();
									
					%> 
				
				<div id="prod_wrap3" >

					<ul class="img_ul" >
						
						<li>
							<a href="shopping_prod.do?prod_num=<%=prodinfo.get(i).getProd_num() %>">
								<img style="width: 240px; height: 240px;" src=<%=prodImgPath %>>

							</a>
						</li>
						
					</ul>

					<ul class="info_ul">
						<li><%=prodinfo.get(i).getProd_name() %></li>
					</ul>
					
			</div> 

			<%
				}
			%>
					
					<!-- curaionitem끝 -->

			<!-- ////////////////////////////////////// -->
			
			</div>
			</div>


		 <!-- allmenu 끝-->

	</section>
	
	</div>


	<footer>
    	<jsp:include page="footer.jsp"/>
	</footer>
	
</body>

</html>