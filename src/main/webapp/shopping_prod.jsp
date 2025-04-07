<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "java.util.ArrayList" %>
    
    <%@page import="vo.ProdInfo" %>
    <%@page import="dao.ProdDao" %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑 제품 상세 페이지</title>

<link rel="stylesheet" type="text/css" href="css/shopping_prod.css">

</head>


<body>

<header>
	<jsp:include page="header.jsp" />
</header>


<section>

<button onclick="scrollToTop()" id="scroll-to-top-button">Top</button>

<script type="text/javascript">
function scrollToTop() {
	  window.scrollTo({
	    top: 0,
	    behavior: "smooth"
	  });
	}

	window.onscroll = function() {scrollFunction()};
	  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	    document.getElementById("scroll-to-top-button").style.display = "block";
	  } else {
	    document.getElementById("scroll-to-top-button").style.display = "none";
	  }
	}

</script>	

		<%
		
			//이 페이지에서 받는건 일련번호로 셀렉한 한 레코드의 데이터들을 가져오는 건가 ??
			//int prod_num = Integer.parseInt(request.getParameter("prod_num"));
			ProdInfo prod = (ProdInfo) request.getAttribute("prod");
		
			int prod_num = prod.getProd_num();
			
			String prod_name = prod.getProd_name();
			
			//String prod_name = prod.getProd_name();
			String prod_bigct = prod.getProd_bigct();
			String prod_smallct = prod.getProd_smallct();
			String prodImgPath = "shopimg/" + prod.getProd_img();
			String prodImgPath2 = "shopimg/" + prod.getProd_img2();
			
			//int prod_quantity = prod.getProd_quantity();
			int prod_price = prod.getProd_price();
			
			
// 			String prod_mem_id = prod.getProd_mem_id();
			
			String prod_opbct = prod.getProd_opbct();
			String prod_opsct = prod.getProd_opsct();
			
			//String prod_review = prod.getProd_review();
			//String prod_qna  = prod.getProd_qna();]
		
		%>
	
<form action="shopping_cart.do"  >

<div id="s_order_wrap" >
	<div class="s_prod_wrap">
	
		<div class="img_wrap">
		
			<div id="s_prod_detail_img_wrap" >
			
				<div class="s_prod_detail_img" >
					<img style="width: 100px; height: 100px;" src=<%=prodImgPath %>>
				</div>
				
				<%
				String [] aaa  = new String[5];	
				for(int i =1 ; i<aaa.length ; i++){
					aaa[i]= "shopimg/shopping-prod"+prod_num+"-"+(i+1)+".jpg";
					
					//out.println(aaa[i]);
				
				%>
				
				<div class="s_prod_detail_img" >
					<img style="width: 100px; height: 100px;" src=<%=aaa[i] %>>
				</div>
				
				<%} %>
				
				
			</div>
			
			<div id="s_prod_big_img" >
				<img style="width: 500px; height: 500px;" src=<%=prodImgPath %>>
				<div id="square"></div>
			</div>
		</div>
		
		
		
		
		<div class="prod_info_wrap" >
		
			<div class="info_heading_wrap" >
			 
<!-- 				<div class="info_heading_desc"> -->
				
<%-- 				<input class="input-border-none" name="prod_bigct" value="<%=prod_bigct %>" readonly="readonly" > --%>
<!-- 				 >  -->
<%-- 				 <input class="input-border-none" name="prod_smallct" value=<%=prod_smallct %> readonly="readonly" >	 --%>
<!-- 				 </div> -->
				 
				<h2><input class="input-border-none" id="prod_name" name="prod_name" value="<%=prod_name %>" readonly="readonly" > </h2>
				
				<div class="info_heading_desc">고민이 될 때는 세트로!	</div>
		
			</div>
			
			<%
				String mem_id = (String)session.getAttribute("mem_id");
			%>
			
			<input type="hidden" name = "prod_mem_id" value = "<%=mem_id%>">
			
			<input type="hidden" name = "prod_num" value = "<%=prod_num %>">
			<input type="hidden" name = "prod_image" value="<%=prodImgPath %>" >
			<input type="hidden" name = "prod_opbct" value="<%=prod_opbct %>" >
			<input type="hidden" name = "prod_opsct" value="<%=prod_opsct %>" >
			
			
			<table>
				<tr>
					<th><%= "&#8361;" %></th>
					
					<td>
						<span>
							<input class="input-border-none" id="prod_price" name="prod_price" value="<%=prod_price %>" readonly="readonly" >
						</span>
					</td>
					
				</tr>
			</table>

			<div class="total_prod_wrap">
			
				<p id="prod_name2" ><%=prod_name %></p>
				
				<div id="quantity_wrap">
				
					<input type="text" id="quantity" class="qunt_up" name="prod_quantity" value="1" min="1">
					
						<div id="count_btn_wrap" >
							<a href="#" onclick="increaseQuantity(event)">
							  <img src="shopimg/btn_count_up.gif">
							</a>
							
							<a href="#" onclick="decreaseQuantity(event)">
							  <img src="shopimg/btn_count_down.gif">
							</a>

						</div>
				</div>
				
			</div>

			<div class="total_price_wrap">
				<div id="total_price">
				
					<input class="input-border-none" id="prod_total_price" name="prod_total_price" value="TOTAL<%= "&#8361;" %><%=prod_price %>" readonly="readonly" > 
				</div>
			</div>

			<script>
			
				function increaseQuantity(event) {
					  event.preventDefault(); // 기본 동작 취소
					  var quantityInput = document.getElementById("quantity");
					  var currentQuantity = parseInt(quantityInput.value);
					  quantityInput.value = currentQuantity + 1;
					  updateTotalPrice();
				}

				function decreaseQuantity(event) {
				  event.preventDefault(); // 기본 동작 취소
				  var quantityInput = document.getElementById("quantity");
				  var currentQuantity = parseInt(quantityInput.value);
				  if (currentQuantity > 1) {
				    quantityInput.value = currentQuantity - 1;
				    updateTotalPrice();
				  } else {
				    alert("최소 주문 수량은 1개입니다.");
				  }
				}
				
// 				//수량증가감소해야지 쉼표가 생겨서, 화면 들어오자마자 바로 쉼표 설정해주는 거 따로 추가했음.
// 				window.onload = function() {
// 					  var prodPrice = document.getElementById("prod_price").value;
// 					  var formattedProdPrice = numberWithCommas(parseFloat(prodPrice));
// 					  var totalPrice = "TOTAL" + "₩" + formattedProdPrice;
// 					  document.getElementById("prod_price").value = formattedProdPrice;
// 					  document.getElementById("prod_total_price").value = totalPrice;
// 					}
				
// 				//이게 쉼표넣을 자릿수 설정해주는 거. 위 window.onload랑 같이 있어야 작동하는 듯. 
// 				function numberWithCommas(x) { 
// 					  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
// 					}
				
				//total_price 쉼표 넣어주는 것.
 				function updateTotalPrice() {
// 				    var prodPrice = parseFloat(document.getElementById("prod_price").value.replace(",", ""));
					var prodPrice = document.getElementById("prod_price").value;
 				    var quantity = document.getElementById("quantity").value;
				    var totalPrice = prodPrice * quantity;
				    
 				    //document.getElementById("prod_total_price").value = "TOTAL₩" + totalPrice.toLocaleString();
 				    document.getElementById("prod_total_price").value = "TOTAL₩" + totalPrice;
 				  }
				
			</script>

			
			<div class="prod_button" >
			
			<!--	 <a href="shopping_cart.do?prod_num=<%=prod_num %>" class="prod_cart" >장바구니</a>   --> 
				
			<!--  	<a href="shopping_cart.do" class="prod_cart" > 
					<input id="add-to-cart-btn" class="input-border-none" type="submit" value="여기 장바구니"  >
					
				</a>    --> 
				
				<input type="submit" value="장바구니에 담기" onclick="showModal(); return false;" style="width: 48%; " >
				
<!-- 				<input id="add-to-cart-btn" class="" type="submit" value="장바구니 추가" onclick="showPopup()" > -->
				
				
				<!-- 모달 창 -->
				<div id="myModal" class="modal">
				  <div class="modal-content">
				  	<p>장바구니에 상품이 추가되었습니다.</p>
				    <span class="close" onclick="closeModal()"><button>쇼핑 계속하기</button></span>
				    <input type="submit">장바구니 바로가기
				  </div>
				</div>
				
				<a href="shopping_buy.do?prod_num=<%=prod_num %>&prod_mem_id=<%=mem_id %>" class="prod_buy" >구매하기</a>
				
			</div>
			
			<script>
			
			 function showModal() {
				    var modal = document.getElementById("myModal");
				    modal.style.display = "block";
				  }

				  function closeModal() {
				    var modal = document.getElementById("myModal");
				    modal.style.display = "none";
				  }

				  // 쇼핑 계속하기 버튼 클릭 시 모달 닫기
				 // document.querySelector('.close button').addEventListener('click', closeModal);
				}

			</script>
			
				<div id="kakao_checkout_button" >
					
					<div class="__checkout_buy_contents">
      
					  <span class="__checkout_img_comm __checkout_buy_title">
					    구매와 관리를<br>톡으로 간편하게
					  </span>
					
					      
					  <button type="button" class="__checkout_btn_buy "  onclick="openPopup()" >
					    <span class="__checkout_img_comm __checkout_img_buy">
					    
					      카카오 페이구매
					    </span>
					  </button>
					  
					  <script>
						function openPopup() {
							var url = "http://wepplication.github.io/tools/barcodeGen/";
							var width = 500;
							var height = 500;
							var left = 0;
							var top = 0;
							window.open(url, '_blank', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=' + width + ', height=' + height + ', top=' + top + ', left=' + left);
						}
						</script>
						
						
						
						
					
					      
					  <button type="button" class="__checkout_btn_wish ">
					    <span class="__checkout_img_comm __checkout_img_wish">찜</span>
					  </button>
					
					</div>
					
				</div>		
				
				<div id="naver_checkout_button"	>
				</div>
			</div>
		
		</div>
		
	</div>
	
	

<!-- -------------------- prod_additional 시작---------------------------- -->

	
	
	<div id="prod_additional">
	
		<div class="prod_detail_tab" id="myList1">
			<ul class="myList"  >
				<a href="#myList1"><li style="border-top: 2px solid #000;" >상품이미지</li></a>
				<a href="#myList2"><li>Q&A(리스트)</li></a>
				<a href="#myList3"><li>REVIEW</li></a>
			</ul>
		
		
		<div class="prod_detail_content" id="prod_img">
		
			<div class="info_img_wrap" >
				<img src="shopimg/prod_detail_img1.jpg" style="margin: 0 auto;" >
			</div> 
			
		</div>
		</div>
			
		<div class="prod_detail_tab" id="myList2">
			<ul class="myList" >
				<a href="#myList1"><li>상품이미지</li></a>
				<a href="#myList2"><li style="border-top: 2px solid #000;">Q&A()</li></a>
				<a href="#myList3"><li>REVIEW</li></a>
			</ul>
		
		<div class="prod_detail_content" id="prod_qna">
		
			<div id="prod_qna_wrap" >
			 	여기에 큐앤에이 리스트 나와야함.
			 	
			 	
			 </div>		
			 
		</div>
		</div>
		
			
		<div class="prod_detail_tab" id="myList3"		>
			<ul class="myList" >
				<a href="#myList1"><li>상품이미지</li></a>
				<a href="#myList2"><li>Q&A()</li></a>
				<a href="#myList3"><li style="border-top: 2px solid #000;">REVIEW</li></a>
			</ul>
		
		<div class="prod_detail_content" id="prod_review">
			<div id="prod_review_wrap">
				여기에 리뷰 리스트 나와야함
				
				
			</div>
		</div>
		</div>
	  
</div>


<!-- -------------------- prod_additional 끝 ---------------------------- -->

</div>


</form>
</section>

<footer>
<jsp:include page="footer.jsp" />
</footer>

</body>
</html>