<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTf-8"%>

<%@ page import = "java.util.ArrayList" %>
    
    <%@page import="dto.N_MD" %>
    <%@page import="dto.QNA_MD" %>
    <%@page import="dto.PROD_MD" %>
    
    <%@page import="vo.ProdInfo" %>
    <%@page import="vo.CartInfo" %>
    <%@page import="dao.N_controller" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>쇼핑 장바구니</title>

	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

	 <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
	 
	 <link rel="stylesheet" type="text/css" href="css/header_footer.css">
	 <link rel="stylesheet" type="text/css" href="css/shopping_cart.css">
	 
	 <!-- 헤더 js -->
	 <script src="js/slick-1.8.1/slick/slick.min.js"></script>

	 <script src="js/shopping_bn.js"></script>

</head>

<jsp:useBean id="user" class="dao.N_controller"/> 

<body>

	

			

<!--헤더부분-->

	<header>
	   <jsp:include page="header.jsp" />
	</header> 
	
			<%
			
					int prod_quantity = Integer.parseInt(request.getParameter("prod_quantity"));
					String prod_name = request.getParameter("prod_name");
					int prod_price = Integer.parseInt(request.getParameter("prod_price"));
					int prod_total_price = prod_price * prod_quantity; //제품값 * 수량 //따로 저장하지 않음.
					
					String prod_bigct = request.getParameter("prod_bigct");
					String prod_smallct = request.getParameter("prod_smallct");
					
					/////////////////////////////////////////////
					
					CartInfo cart = new CartInfo();
					
					int shop_bas_prod_num = cart.getShop_bas_prod_num();
					String shop_bas_prod_name = cart.getShop_bas_prod_name();
					int shop_bas_prod_quantity = cart.getShop_bas_prod_quantity();
					int shop_bas_prod_price =  cart.getShop_bas_prod_price();
					String shop_bas_mem_id = cart.getShop_bas_mem_id();
					
// 					pr.setShop_bas_smallct(prod_smallct);
// 					pr.setProd_name(prod_name);
					
// 					pr.setProd_total_price(prod_total_price);
					
// 					ProdInfo prod_info = user.Prod_order_info(pr);
			
// 					out.println(prod_quantity);
				%>
	<section>
	

		<div id="s_order" >
			<ul>
				<li>01장바구니</li>>
				<li>02주문서작성/결제</li>>
				<li>03주문완료</li>
			</ul>		
		</div>
		
		<div id="s_basketwrap" >
			<div id="s_basket" >
				<ul>
					<li>선택</li>
					<li>상품</li>
					<li>옵션</li>
					<li>상품금액</li>
					<li>수량</li>
					<li>배송비</li>
					<li>할인/적립</li>
					<li>합계금액</li>
					
				</ul>
			
			</div>
			
			<div class="s_basket_prod">
					
				<ul>
					<li>선택</li>
					<li><%=prod_name %></li>
					<li>옵션</li>
					<li><%=prod_price %></li>
					<li><%=prod_quantity %></li>
					
					<% if(prod_total_price >= 2000000) { %>
			            <li>무료</li>
			        <% } else { %>
			            <li>3000</li>
			        <% } %>
			        
					<li>할인/적립</li>
					
        			<% if(prod_total_price >= 2000000) { %>
						<li><%=prod_total_price %></li>
					<% } else { %>
						<li><%= 3000 + prod_total_price %></li>
					<% } %>

					
				</ul>
			
			</div>
			
			<div>
				<a href="shopping_cart_delete.do?shop_bas_prod_num=<%=shop_bas_prod_num %>">삭제</a>
			</div>
		
		</div>
	
	</section>


	<footer>
    	<jsp:include page="footer.jsp"/>
	</footer>

</body>

</html>