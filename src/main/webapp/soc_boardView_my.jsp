<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import = "java.util.*" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 피드</title>
</head>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/soc_boardViewCss.css">
    <title>공지사항</title>
</head>
<script> 
document.getElementById('likeBtn').addEventListener('click', function() {
	  var imgSrc = this.querySelector('img').src;
	  if (imgSrc.includes('like_icon.png')) {
	    this.querySelector('img').src = 'imgs/board/like(1)_icon.png';
	  } else if (imgSrc.includes('like(1)_icon.png')) {
	    this.querySelector('img').src = 'imgs/board/like_icon.png';
	  }
	});

	document.getElementById('storeBtn').addEventListener('click', function() {
	  var imgSrc = this.querySelector('img').src;
	  if (imgSrc.includes('store_icon.png')) {
	    this.querySelector('img').src = 'imgs/board/store(1)_icon.png';
	  } else if (imgSrc.includes('store(1)_icon.png')) {
	    this.querySelector('img').src = 'imgs/board/store_icon.png';
	  }
	});
</script>
<body>
   <div class="Wrap">
   	<div class="sch_wrap">
   		<ul>
   		<li class="sch_01">
	   		<div class="sch_01_L">
		    	<a href="soc_basicboard.jsp"><img src="imgs/board/itlog_logo.png"></a>
		    </div>
   			<div class="sch_01_R">
		   		<div class="day_01"><a href="#">1day</a>&nbsp;&nbsp;&nbsp;&nbsp;
		   		<a href="#">2day</a>&nbsp;&nbsp;&nbsp;&nbsp;
		   		<a href="#">3day</a></div>
		   		<div>
		   		<input type="text" class="search-input" placeholder="검색어를 입력해주세요." />
		   		<input type="button" value="검색">
		   		</div>
	   		</div>
   		</li>
   		<li class="sch_02">
   			<div class="day_sch_02">
   				<h3>1Day<span style="margin-left:250px;"><a href="#" style="padding-left:30px;">편집</a></span></h3>
   				<div class="tcp">
	   				<div class="time">9:00</div>
	   				<div class="content">기상 및 조식</div>
	   				<div class="place">신라호텔</div>
   				</div><div class="tcp">
	   				<div class="time">9:00</div>
	   				<div class="content">기상 및 조식</div>
	   				<div class="place">신라호텔</div>
   				</div><div class="tcp">
	   				<div class="time">9:00</div>
	   				<div class="content">기상 및 조식</div>
	   				<div class="place">신라호텔</div>
   				</div><div class="tcp">
	   				<div class="time">9:00</div>
	   				<div class="content">기상 및 조식</div>
	   				<div class="place">신라호텔</div>
   				</div>
   				<div class="tcp">
	   				<div class="time">9:00</div>
	   				<div class="content">기상 및 조식</div>
	   				<div class="place">신라호텔</div>
   				</div>
   				<div class="tcp">
	   				<div class="time">9:00</div>
	   				<div class="content">기상 및 조식</div>
	   				<div class="place">신라호텔</div>
   				</div>
   				<div class="tcp">
	   				<div class="time">9:00</div>
	   				<div class="content">기상 및 조식</div>
	   				<div class="place">신라호텔</div>
   				</div>
   			</div>
   			<div class="day_sch_02">
   				<h3>2Day</h3>
   				<div class="tcp">
	   				<div class="time">9:00</div>
	   				<div class="content">기상 및 조식</div>
	   				<div class="place">신라호텔</div>
   				</div>
   				<div class="tcp">
	   				<div class="time">9:00</div>
	   				<div class="content">기상 및 조식</div>
	   				<div class="place">신라호텔</div>
   				</div>
   				<div class="tcp">
	   				<div class="time">9:00</div>
	   				<div class="content">기상 및 조식</div>
	   				<div class="place">신라호텔</div>
   				</div>
   			</div>
   			<div class="day_sch_02">
   				<h3>3Day</h3>
   				<div class="tcp">
	   				<div class="time">9:00</div>
	   				<div class="content">기상 및 조식</div>
	   				<div class="place">신라호텔</div>
   				</div>
   				<div class="tcp">
	   				<div class="time">9:00</div>
	   				<div class="content">기상 및 조식</div>
	   				<div class="place">신라호텔</div>
   				</div>
   				<div class="tcp">
	   				<div class="time">9:00</div>
	   				<div class="content">기상 및 조식</div>
	   				<div class="place">신라호텔</div>
   				</div>
   			</div>
   			</li>
   		</ul>
   	</div>
   	<div class="img_wrap">
   		<ul>
   		<li class="img_01"><a href="#"><img src="imgs/board/aaa1.jpg"></a></li>
   		</ul>
   	</div>
   		<div class="con_wrap">
   		<ul>
   		<li class="con_01">
	   		<img src="imgs/board/aaa1.jpg"><a href="#">OOO님</a>
	   		<span style="margin-left:220px; margin-top:10px; font-size:1.0em;"><a href="#">수정</a></span>
   			<span style="margin-left:-2px; margin-top:10px;font-size:1.0em;"><a href="#">삭제</a></span></li>
   		<li class="con_02">블라블라<br>블라블라<br>블라블라<br>블라블라<br>블라블라<br>
   		
   		</li>
   		<li class="con_03">
	   		<div class="rep01">
	   			<div class="rep_01">
	   			<img src="imgs/board/aaa1.jpg"><a href="#">김기동</a>
	   			</div>
	   			<div class="rep_02">우와앙 츄르뇸냠</div>
	   		</div>
	   		<div class="rep01">
	   			<div class="rep_01">
	   			<img src="imgs/board/aaa1.jpg"><a href="#">김기동</a>
	   			</div>
	   			<div class="rep_02">우와앙 츄르뇸냠</div>
	   		</div>
   		</li>
   		<li class="con_04">
   		<span>좋아요</span><span class="count">0개</span>
   		<span>댓글</span><span class="count">0개</span>
   			<div class="rep_icon">
	   			<a href="#" id="likeBtn"><img src="imgs/board/like(1)_icon.png"></a>
	   			<a href="#"><img src="imgs/board/share_icon.png"></a>
	   			<a href="#" id="storeBtn"><img src="imgs/board/store(1)_icon.png"></a>
   			</div>
   			<div class="rep_con">
   				<input type="text" class="rep_input" placeholder="댓글달기">
   				<input type="button" value="게시">
   			</div>
   		</li>
   		</ul>
   	</div>
   </div>
</body>
</html>