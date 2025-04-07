<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="UTF-8"%>
    <%@page import ="java.util.*" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>잇로그</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css">
<link rel="stylesheet" href="css/soc_boardCss.css">

</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
$(document).ready(function() {
    $("#list").magnificPopup({
        delegate: 'a.popup',
        type: 'ajax',
        modal: false,
        showCloseBtn: false,
        closeOnContentClick: false,
        closeOnBgClick: true,
        enableEscapeKey: true,
        callbacks: {
            ajaxContentAdded: function() {
                this.content.addClass('white-popup');
                this.content.on('click', function(e){
                	e.stopPropagation();
                });
            }
        }, 
    }); 
});

$(document).ready(function() {
    $('#write').magnificPopup({
        type: 'ajax',
        modal: false,
        showCloseBtn: false,
        closeOnContentClick: false,
        closeOnBgClick: true,
        enableEscapeKey: true,
        callbacks: {
            ajaxContentAdded: function() {
                this.content.addClass('white-popup');
                this.content.on('click', function(e){
                	e.stopPropagation();
                });
            }
        },
    }); 
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
	 
// 	 function incrementLike() {
// 		  // 서버에 Ajax 요청을 보내어 like 값을 증가시킴
// 		  $.ajax({
// 		    url: 'soc_increment_like.jsp', // 서버의 URL
// 		    type: 'POST', // 요청 메서드
// 		    data: {soc_like: soc_like}, // 요청 데이터 (게시물 ID 등)
// 		    success: function(result) {
// 		      // 요청이 성공하면 클라이언트에서 like 값을 갱신
// 		      var likeCount = parseInt($('#like-count').text()) + 1;
// 		      $('#like-count').text(likeCount);
// 		    }
// 		    });
// 		}


function incrementlike(){
	var likeCount = parseInt($('.like-count').text());
	  likeCount= likeCount + 1 ;
	  $('.like-count').text(likeCount);
	  $('.countlike2').text(likeCount);
	  
}



	
function countReplies() {
	const commentCount = document.querySelector('.comment-count');
	const rep02Count = document.querySelectorAll('.rep_02').length;
	commentCount.innerText = rep02Count;
	}

	</script>

<body>





<!-- ////////////////boardView.jsp////////////////// -->
	<div class ='gray_layer' id='background' onclick="closemodal()"></div>
   <div class="Wrap" id= 'front' style="display:none;">
 
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
   				<h3>1Day</h3>
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
   		<li class="img_01"><a href="#"><img src="imgs/board/aaa11.jpg"></a></li>
   		</ul>
   	</div>
   		<div class="con_wrap" >
   		<ul>
   		<li class="con_01" style = "display:flex;">
	   		<img src="imgs/board/aaa1.jpg"><a href="#">김기동님</a>
	   		<span id = 'x'  style ="font-size: 20px;color : grey;margin-left : 270px; vertical-align:center;">X</span>
	   		</li>
   		<li class="con_02" style="position: relative;">블라블라<br>블라블라<br>블라블라<br>블라블라<br>블라블라<br>
   			<span style=" position: absolute; bottom:0; margin:0 0 15px 280px; color: grey; float: right;">2023-04-06 18:32</span>
   		</li>

	   	<li>	
   		<div class="con_03">
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
   		</div>
   		</li>
   		
   		<li class="con_04">
   		<span class="likeandcomment">좋아요</span><span class="like-count">0</span><span class="likeandcomment" style="margin:0;">개</span>
   		<span class="likeandcomment">댓글</span><span class="comment-count">0</span><span class="likeandcomment" style="margin:0;">개</span>
   			<div class="rep_icon">
	   			<img src="imgs/board/like(1)_icon.png" onclick="incrementlike()" >
	   			<a href="#"><img src="imgs/board/share_icon.png"></a>
	   			<a href="#" id="storeBtn"><img src="imgs/board/store(1)_icon.png"></a>
   			</div>
   			<div class="rep_con">
   				<input type="text" class="rep_input" id="leavecomment" placeholder="댓글달기">
   				<button type="button" onclick="addComment()">게시</button>
  
   			</div> 
   		</li>
   		</ul>
   	</div>

</div>




<!-- 글목록 시작 -->
<div>   
	<div class="postWrap"><!-- 전체div -->
	    <!-- 로고,검색창,아이콘 박스 -->
	    <div class="titleWrap">
		    <div class="postLogo">
		    	<a href="soc_basicboard.jsp"><img src="imgs/board/itlog_logo.png"></a>
		    </div>
		    <div class="searchBox">
		       <input type="text" class="search-input" placeholder="검색어를 입력해주세요." style = "width: 380px; height: 34px;"/>
		       <input type="button" value="검색">
		    </div>
		    <div class="postIcon">
		    	<a href="tour002.jsp"><img src="imgs/board/home_icon.png"></a>
		    	<a href="soc_boardWrite.jsp" id="write"><img src="imgs/board/plus_icon.png"></a>
		    	<a href="#"><img src="imgs/board/bell_icon.png"></a>
		    	<a href="soc_board_my.jsp"><img src="imgs/board/person_icon.png"></a>
		    </div>
		  </div>
		 
	    <!-- 이미지리스트1 -->
			<div class="imglistWrap" id="list">
				<div class="filter">
					<input type="button" value="인기순" id="popularBtn"
						onclick="popular()"> <input type="button" value="최신순"
						id="latestBtn" onclick="latest()">
				</div>
				
<%-- <c:forEach begin="1" end="6"> --%>
<!-- <div style="width:1000px;"> -->
<!-- <img src="imgs/board/aaa5.jpg" onclick="openmodal()" class="img-fluid"> -->
<!-- </div> -->
<%-- </c:forEach> --%>


<!-- 		<div class="imglist"> -->
<%-- 					<c:forEach begin="1" end="6" var="i" step="1"> --%>
<%-- 						<c:if test="${(i - 1) % 3 == 0}"> --%>
<!-- 							<div class="row"> -->
<%-- 							</c:if> --%>
<!-- 						<div class="col-4"> -->
<!-- 									<img src="imgs/board/aaa5.jpg" onclick="openmodal()" class="img-fluid"> -->
<!-- 										<div class="likeBox"> -->
<!-- 											<span class="likeandcomment">좋아요</span><span -->
<!-- 												class="countlike2" style="font-size: 12.8px;">0</span>개&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 											<div>댓글 n개</div> -->
<!-- 										</div> -->
<!-- 										<div class="tagbox">#김시도 #김기동 #고영이 #오에오에 #블라블라라라랄 #김시도 -->
<!-- 											#김기동 #고영이 #오에오에</div>					 -->
<%-- 								<c:if test="${i % 3 == 0 || i == page.cri.amount}"> --%>
<!-- 							</div> -->
<%-- 						</c:if> --%>
<!-- 						</div> -->
<%-- 				</c:forEach> --%>
<!-- 		</div> -->
<!-- </div> -->


				<div class="imglist">
					<div>
				    <img src="imgs/board/aaa5.jpg" onclick= "openmodal()">
				    <div>
					    <div class="likeBox">
					    <div>좋아요 n개</div>&nbsp;&nbsp;&nbsp;&nbsp;<div>댓글 n개</div>
					    </div>
				    	<div class="tagbox">#김시도 #김기동 #고영이 #오에오에 #블라블라라라랄 #김시도 #김기동 #고영이 #오에오에</div>
			    	</div>
			    	</div>
					<div>
				    <img src="imgs/board/aaa7.jpg" onclick= "openmodal()">
				    <div>
					    <div class="likeBox">
					    <div>좋아요 n개</div>&nbsp;&nbsp;&nbsp;&nbsp;<div>댓글 n개</div>
					    </div>
				    	<div class="tagbox">#김시도 #김기동 #고영이 #오에오에 #블라블라라라랄 #김시도 #김기동 #고영이 #오에오에</div>
			    	</div>
			    	</div>
			    	<div>
				    <a href="soc_boardView.jsp" class="popup"><img src="imgs/board/aaa9.jpg"></a>
				    <div>
					    <div class="likeBox">
					    <div>좋아요 n개</div>&nbsp;&nbsp;&nbsp;&nbsp;<div>댓글 n개</div>
					    </div>
				    	<div class="tagbox">#김시도 #김기동 #고영이 #오에오에 #블라블라라라랄 #김시도 #김기동 #고영이 #오에오에</div>
			    	</div>
			    	</div>
			    </div>
			    
			    <br>
			    
			    				<div class="imglist">
					<div>
				    <img src="imgs/board/aaa1.jpg" onclick= "openmodal()">
				    <div>
					    <div class="likeBox">
					    <div>좋아요 n개</div>&nbsp;&nbsp;&nbsp;&nbsp;<div>댓글 n개</div>
					    </div>
				    	<div class="tagbox">#김시도 #김기동 #고영이 #오에오에 #블라블라라라랄 #김시도 #김기동 #고영이 #오에오에</div>
			    	</div>
			    	</div>
					<div>
				    <img src="imgs/board/aaa2.jpg" onclick= "openmodal()">
				    <div>
					    <div class="likeBox">
					    <div>좋아요 n개</div>&nbsp;&nbsp;&nbsp;&nbsp;<div>댓글 n개</div>
					    </div>
				    	<div class="tagbox">#김시도 #김기동 #고영이 #오에오에 #블라블라라라랄 #김시도 #김기동 #고영이 #오에오에</div>
			    	</div>
			    	</div>
			    	<div>
				    <a href="soc_boardView.jsp" class="popup"><img src="imgs/board/aaa3.jpg" onclick= "openmodal()">
				    <div>
					    <div class="likeBox">
					    <div>좋아요 n개</div>&nbsp;&nbsp;&nbsp;&nbsp;<div>댓글 n개</div>
					    </div>
				    	<div class="tagbox">#김시도 #김기동 #고영이 #오에오에 #블라블라라라랄 #김시도 #김기동 #고영이 #오에오에</div>
			    	</div>
			    	</div>
			    </div>
			    
			    
			    	
			    </div>
		    </div>
	    </div>
	</div>

  </body>
</html>