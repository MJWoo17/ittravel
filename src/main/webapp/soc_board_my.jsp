<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="UTF-8"%>
    <%@page import ="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>내 피드</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
<link rel="stylesheet" href="css/soc_boardCss.css">

</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
<script>
function openmodal(){
	
	$('#background').fadeIn(200);
	$('#front').fadeIn(200);
	$('body').addClass('modal-open');
	
};

function closemodal(){

	$('#background').fadeOut(200);
	$('#front').fadeOut(200);	
	$('body').removeClass('modal-open');
}

function close(){
	 $('#background').fadeOut(200);
	 $('#front').fadeOut(200);
	 $('body').removeClass('modal-open');
}


$(document).keyup(function(e) {
	  if (e.key === "Escape") { // ESC 키를 눌렀을 때
	    // 모달 팝업 닫기
	    $('#background').fadeOut(200);
	    $('#front').fadeOut(200);
		$('body').removeClass('modal-open');
	  }
	}); 
	



	function latest(){
		var p = document.getElementById('popularBtn');
		var l = document.getElementById('latestBtn');
		    
		p.style.backgroundColor = 'white';
		p.style.color = '#7E7DCB';
		l.style.backgroundColor = '#7E7DCB';
		l.style.color = 'white';
	}
	function popular(){
		var p = document.getElementById('popularBtn');
		var l = document.getElementById('latestBtn');
		    
		l.style.backgroundColor = 'white';
		l.style.color = '#7E7DCB';
		p.style.backgroundColor = '#7E7DCB';
		p.style.color = 'white';
	}
    
		
	 $('#x').on('click', function(){ //다음버튼 클릭
		 $('#background').fadeOut(200);
		    $('#front').fadeOut(200);
			$('body').removeClass('modal-open');
	    });
	
	 
	 function addComment() {
		  const commentInput = document.getElementById("leavecomment");
		  const commentText = commentInput.value;
		  if (commentText !== "") {
		    const currentDate = new Date();
		    const commentTime = currentDate.toLocaleString();
		    const commentElement = document.createElement("div");
		    commentElement.classList.add("rep01");
		    const rep01Element = document.createElement("div");
		    rep01Element.classList.add("rep_01");
		    const authorElement = document.createElement("img");
		    authorElement.setAttribute("src", "imgs/board/aaa1.jpg");
		    const nameElement = document.createElement("a");
		    nameElement.setAttribute("href", "#");
		    nameElement.innerText = "김기동";
		    rep01Element.appendChild(authorElement);
		    rep01Element.appendChild(nameElement);
		    const commentContentElement = document.createElement("div");
		    commentContentElement.classList.add("rep_02");
		    commentContentElement.innerText = commentText + " (" + commentTime + ")";
		    commentElement.appendChild(rep01Element);
		    commentElement.appendChild(commentContentElement);
		    const commentWrap = document.querySelector(".con_03");
		    commentWrap.appendChild(commentElement);
		    commentInput.value = "";
		  }
		}
	
	
</script>

<body>

<div>   

	<!-- /////////boardView_my.jsp//////////// -->

   <div class ='gray_layer' id='background' onclick="closemodal()"></div>
   <div class="Wrap" id= 'front' style="display:none; style="overflow : auto;"">
   	<div class="sch_wrap">
   		<ul>
   		<li class="sch_01">
	   		<div class="sch_01_L">
		    	<h3 class="country">태국</h3>
		    	<h1 class="city">방콕</h1>
		    </div>
   			<div class="sch_01_R">
		   		<div class="day_01">
		   		<a href="#">1day</a>
		   		<a href="#">2day</a>
		   		<a href="#">3day</a>		   		
		   		</div>
		   		<div>
		   		<input type="text" class="search-input" placeholder="검색어를 입력해주세요."  />
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
   		<li class="con_01" style = "display:flex;">
	   		<img src="imgs/board/aaa1.jpg"><a href="#">우왕탱님</a>
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
   		<span>좋아요</span><span class="count">5개</span>
   		<span>댓글</span><span class="count">10개</span>
   			<div class="rep_icon">
	   			<a href="#" id="likeBtn"><img src="imgs/board/like(1)_icon.png"></a>
	   			<a href="#"><img src="imgs/board/share_icon.png"></a>
	   			<a href="#" id="storeBtn"><img src="imgs/board/store(1)_icon.png"></a>
   			</div>
   			<div class="rep_con">
   				<input type="text" class="rep_input" id = "leavecomment" placeholder="댓글달기">
 				<button type="button" onclick="addComment()">게시</button>
   			</div>
   		</li>
   		</ul>
   	</div>
   </div>
		

	<div class="postWrap"><!-- 전체div -->
	    <!-- 로고,검색창,아이콘 박스 -->
	    <div class="titleWrap">
		    <div class="postLogo">
		    	<a href="soc_basicboard.jsp"><img src="imgs/board/itlog_logo.png"></a>
		    </div>
		    <div class="searchBox">
		       <input type="text" class="search-input" placeholder="검색어를 입력해주세요." />
		       <input type="button" value="검색">
		    </div>
		    <div class="postIcon">
		    	<a href="tour002.jsp"><img src="imgs/board/home_icon.png"></a>
		    	<a href="soc_boardWrite.jsp"><img src="imgs/board/plus_icon.png"></a>
		    	<a href="#"><img src="imgs/board/bell_icon.png"></a>
		    	<a href="#"><img src="imgs/board/person_icon.png"></a>
		    </div>
		  </div>
		 
	    <!-- 이미지리스트1 -->
	 	<div class="imglistWrap" id="list">
		    <div class="imglist">
			    <div>
				    <img src="imgs/board/aaa1.jpg" onclick="openmodal()">
				    <div>
					    <div class="likeBox">
					    <div>좋아요 3개</div>&nbsp;&nbsp;&nbsp;&nbsp;<div>댓글 5개</div>
					    </div>
				    	<div class="tagbox">#김시도 #김기동 #고영이 #오에오에 #블라블라라라랄 #김시도 #김기동 #고영이 #오에오에</div>
			    	</div>
			    	</div>
			    	<div>
				    <img src="imgs/board/aaa10.jpg" onclick="openmodal()">
				    <div>
					    <div class="likeBox">
					    <div>좋아요 5개</div>&nbsp;&nbsp;&nbsp;&nbsp;<div>댓글 6개</div>
					    </div>
				    	<div class="tagbox">#김시도 #김기동 #고영이 #오에오에 #블라블라라라랄 #김시도 #김기동 #고영이 #오에오에</div>
			    	</div>
			    	</div>
			    	<div>
				    <a href="soc_boardView_my.jsp" class="popup"><img src="imgs/board/aaa12.jpg"></a>
				    <div>
					    <div class="likeBox">
					    <div>좋아요 12개</div>&nbsp;&nbsp;&nbsp;&nbsp;<div>댓글 4개</div>
					    </div>
				    	<div class="tagbox">#김시도 #김기동 #고영이 #오에오에 #블라블라라라랄 #김시도 #김기동 #고영이 #오에오에</div>
			    	</div>
			    	</div>
			    	
			    	
			    </div>
		    </div>
		    	 	<div class="imglistWrap" id="list">
		    <div class="imglist">
			    <div>
				    <img src="imgs/board/aaa10.jpg" onclick="openmodal()">
				    <div>
					    <div class="likeBox">
					    <div>좋아요 6개</div>&nbsp;&nbsp;&nbsp;&nbsp;<div>댓글 n개</div>
					    </div>
				    	<div class="tagbox">#김시도 #김기동 #고영이 #오에오에 #블라블라라라랄 #김시도 #김기동 #고영이 #오에오에</div>
			    	</div>
			    	</div>
			    	<div>
				    <img src="imgs/board/aaa5.jpg" onclick="openmodal()">
				    <div>
					    <div class="likeBox">
					    <div>좋아요 4개</div>&nbsp;&nbsp;&nbsp;&nbsp;<div>댓글 2개</div>
					    </div>
				    	<div class="tagbox">#김시도 #김기동 #고영이 #오에오에 #블라블라라라랄 #김시도 #김기동 #고영이 #오에오에</div>
			    	</div>
			    	</div>
			    	<div>
				    <a href="soc_boardView_my.jsp" class="popup"><img src="imgs/board/aaa6.jpg"></a>
				    <div>
					    <div class="likeBox">
					    <div>좋아요 12개</div>&nbsp;&nbsp;&nbsp;&nbsp;<div>댓글 8개</div>
					    </div>
				    	<div class="tagbox">#김시도 #김기동 #고영이 #오에오에 #블라블라라라랄 #김시도 #김기동 #고영이 #오에오에</div>
			    	</div>
			    	</div>
			    	
			    	
			    </div>
		    </div>
	    </div>
	</div>
  </body>
</html>