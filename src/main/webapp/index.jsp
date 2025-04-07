
<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTf-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<head>
   <meta charset="utf-8">
   <title> it 로그인 </title>
</head>

<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="./slick-1.8.1/slick/slick.css">
<link rel="stylesheet" href="./slick-1.8.1/slick/slick-theme.css">

<body> 

	<header>
	   <jsp:include page="header.jsp" />
	</header> 
	
	<section>
   
    <div class="mainflightdiv1">
            <ul class="slider">
                <li>
                  <div style="background-image:url('mainindeximgs/메인인덱스슬라이드1.jpg')">
                    <dl class="right">
                    </dl>
                  </div>
                </li>
                <li>
                              <div style="background-image:url('mainindeximgs/메인인덱스슬라이드2.jpg')">
                    <dl>
                    </dl>
                  </div>
                </li>
                <li>
                  <div style="background-image:url('mainindeximgs/메인인덱스슬라이드3.jpg')">
                    <dl class="right">
                
                    </dl>
                  </div>
                </li>
                <li>
                     <div style="background-image:url('mainindeximgs/메인인덱스슬라이드1.jpg')">
                    <dl>
                
                    </dl>
                  </div>
                </li>
                <li>
                  <div style="background-image:url('mainindeximgs/메인인덱스슬라이드2.jpg');">
                    <dl class="right">
                  
                    </dl>
                  </div>
                </li>
                <li>
                  <div style="background-image:url('mainindeximgs/메인인덱스슬라이드3.jpg'')">
                    <dl>
                
                    </dl>
                  </div>
                </li>
              </ul>
        </div>

   </section>
   
       	<div class="reclistwrap">
    		<div class="socialfeedwrap">
    			<div class="title">소셜피드</div>
    			<div class="socialfeedsort">
    				<ul>
    					<li><button class="mainbtns">최신</li>
    					<li><button class="mainbtns">힐링</li>
    					<li><button class="mainbtns">연인</li>
    					<li><button class="mainbtns">친구</li>
    					<li><button class="mainbtns">부모님과</li>
    					<li><button class="mainbtns">혼자</li>
    					<li><button class="mainbtns">액티비티</li>
    					<li><button class="mainbtns">아이들과</li>
    					<li><div class = "seemore" >더보기</div>
    				</ul>
    			</div>
    			<div class="socialfeedpicswrap">
    				<ul>
    					<li><img src="mainindeximgs/so1.jpg"></li>
              <li><img src="mainindeximgs/so2.jpg"></li>
              <li><img src="mainindeximgs/so3.jpg"></li>
              <li><img src="mainindeximgs/so4.jpg"></li>
    				</ul>
    			</div>
    		</div>
    		<div class="rectourwrap">
    			<div class= "rectourtitleandsort">
    				<div class="title" style ="float : left;">추천투어</div>
		            <div class="rectoursort" style ="float:right;">
		            <div class="innersort">
		            
		                <div class="sort">나라선택
		                <span class="sorticon">arrow_drop_down</span>       
		              </div>
		              
		               <div class="sort-dropwrap" >
		               <ul>
		                 <li>이태리</li>
		                 <li>베트남</li>
		                 <li>라오스</li>
		               </ul>
		              </div>
		              
		          </div>
		    	  </div>
     		  </div>
    			
    			<div class="rectourpicswrap">
    				<div class="picline">
    					<ul>
    						<li><img src="mainindeximgs/tour1.jpg"></li>
                <li><img src="mainindeximgs/tour2.jpg"></li>
                <li><img src="mainindeximgs/tour3.jpg"></li>
                <li><img src="mainindeximgs/tour4.jpg"></li>

    					</ul>
    				</div>
    				<div class="picline">
    					<ul>
                <li><img src="mainindeximgs/tour5.jpg"></li>
                <li><img src="mainindeximgs/tour6.jpg"></li>
                <li><img src="mainindeximgs/tour7.jpg"></li>
                <li><img src="mainindeximgs/tour8.jpg"></li>

    					</ul>
    				</div>
    			</div>
    		</div>
    		<div class="mdrecwrap">
    			<div class="title">MD추천상품</div>
    			<div class="mdrecsort">
    				<ul>
    					<li><button class="mainbtns">최신</button></li>
    					<li><button class="mainbtns">베스트</button></li>
    					<li><div class = "seemore">더보기</div></li>
    				</ul>
    			</div>
    			<div class="mdrecpicswrap">
    				<div class="picline">
    					<ul>
    						<li><img src="mainindeximgs/md1.jpg"></li>
                <li><img src="mainindeximgs/md2.jpg"></li>
                <li><img src="mainindeximgs/md3.jpg"></li>
                <li><img src="mainindeximgs/md4.jpg"></li>
    					</ul>
    				</div>
    				<div class="picline">
    					<ul>
                <li><img src="mainindeximgs/md5.jpg"></li>
    					  <li><img src="mainindeximgs/md6.jpg"></li>
                <li><img src="mainindeximgs/md7.jpg"></li>
                <li><img src="mainindeximgs/md8.jpg"></li>
              </ul>
    			</div>
    		</div>

    	</div>
    	</div>
   
    <footer>
    	<jsp:include page="footer.jsp"/>
	</footer>
    
</body>
</html>
                                        