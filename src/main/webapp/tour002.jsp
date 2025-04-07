<%@ page language="java" contentType="text/html;charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>투어페이지</title>
	<!--link-->
	<link rel="stylesheet" href="css/tour_index.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
	
	<link rel="stylesheet" href="css/slick.css" />
	<link rel="stylesheet" href="css/slick-theme.css" />

	<script src="js/jquery.js"></script>
	
	<script src="js/slick-1.8.1/slick/slick.min.js"></script>
	
<script>
    $(document).ready(function() {
        $('#choi').on('change', function() {
            var choi = $(this).val();
            $('#for, #kor, #alist, #blist, #glist, #klist').hide();
            if (choi === '해외여행') {
                $('#for').show();
            } else if (choi === '국내여행') {
                $('#kor').show();
            }
        });
        
        $('#for').on('change', function() {
            var forVal = $(this).val();
            $('#alist, #blist, #glist, #klist').hide();
            if (forVal === '일본') {
                $('#alist').show();
            } else if (forVal === '동남아') {
                $('#blist').show();
            }
        });
        
        $('#kor').on('change', function() {
            var korVal = $(this).val();
            $('#glist, #klist').hide();
            if (korVal === '강원도') {
                $('#glist').show();
            } else if (korVal === '제주도') {
                $('#klist').show();
            }
        });
    });
</script>
	
</head>
<body>
 <header>
  <%@include file="header.jsp" %>
</header>


<div id="wrap" style="text-align: center;">
		<!--투어페이지-->
		<div id="topwrap" style="text-align: center;">
			<div class="slider">
				<div>
					<div class="imgwrap">
						<img src="imgs/tour/01tour (1).jpg">
						<span class="float-text">#하와이</span>
					</div>
				</div>
				<div>
					<div class="imgwrap">
						<img src="imgs/tour/tour08.jpg">
						<span class="float-text">#호옹콩</span>
					</div>
				</div>
				<div>
					<div class="imgwrap">	
						<img src="imgs/tour/01tour (2).png">
						<span class="float-text">#유럽</span>
					</div>
				</div>
				<div>
					<div class="imgwrap">
						<img src="imgs/tour/01tour (2).jpg">
						<span class="float-text">#호주</span>
					</div>
				</div>
				<div>
					<div class="imgwrap">
						<img src="imgs/tour/large.jpg">
						<span class="float-text">#오사카</span>
					</div>
				</div>
				<div>
					<div class="imgwrap">
						<img src="imgs/tour/01tour (1).png">
						<span class="float-text">#유럽</span>
					</div>
				</div>
				<div>
					<div class="imgwrap">
						<img src="imgs/tour/tour06.jpg">
						<span class="float-text">#어디지</span>
					</div>
				</div>
			</div>
			<div>
			<div id="all">
				<div id="cat_wrap">
					<div id="cat_wrap02">
					<div class="category" style="font-size: 15px;" >카테고리</div>
					<div id="cat_wrap01">
						<div class="group">
							<div class="select-group">
							
							<!-- 대분류 -->
								<select class="drop_02" id="choi" onchange="onChoiSelectChange()">
									<option>여행선택</option>
									<option>해외여행</option>
									<option>국내여행</option>
								</select>
								
							<!-- 중분류 -->
								<select class="drop_02" id="for" style="display:none;" onchange="onForSelectChange()">
									<option>나라선택</option>
									<option id="a">일본</option>
									<option id="b">동남아</option>
									<option id="c">홍콩·대만·중국</option>
									<option id="d">미주·하와이</option>
									<option id="e">유럽</option>
								</select>
								<select class="drop_02" id="kor" style="display:none;" onchange="onKorSelectChange()">
									<option>지역선택</option>
									<option id="f">서울·경기·인천</option>
									<option id="g">강원도</option>
									<option id="h">경상도</option>
									<option id="i">전라도</option>
									<option id="j">충청도</option>
									<option id="k">제주도</option>
								</select>
								
							<!-- 소분류 -->								
								<select class="drop_02" id="alist" style="display:none;">
									<option>도시선택</option>	
									<option id="aa">오사카</option>
									<option id="ab">도쿄</option>
								</select>
								<select class="drop_02" id="blist" style="display:none;">
									<option>도시선택</option>	
									<option id="ba">방콕</option>
									<option id="bb">하노이</option>
								</select>
								<select class="drop_02" id="glist" style="display:none;">
									<option>도시선택</option>	
									<option id="ga">춘천</option>
									<option id="gb">속초</option>
								</select>
								<select class="drop_02" id="klist" style="display:none;">
									<option>도시선택</option>
									<option id="ka">제주시</option>
									<option id="kb">서귀포시</option>
								</select>
							</div>
							<ul class="link-group">
								<li><a href="#">교통</a></li>
								<li><a href="#">테마파크</a></li>
								<li><a href="#">박물관</a></li>
								<li><a href="#">레저·액티비티</a></li>
								<li><a href="#">맛집</a></li>
							</ul>
						</div>
					</div>
					</div>
					</div>
			</div>
			<div id="bottomwrap">
				<div id="drop_1">
					<select class="drop_01">
						<option>인기순</option>
						<option>최신순</option>
						<option>판매량순</option>
						<option>가격낮은순</option>
					</select>
					<select class="drop_01">
						<option>#힐링</option>
						<option>#액티비티</option>
						<option>#맛집</option>
						<option>#교통</option>
						<option>#테마파크</option>
						<option>#문화</option>
					</select>
					<select class="drop_01">
						<option>#혼자</option>
						<option>#친구와</option>
						<option>#부모님과</option>
						<option>#아이와</option>
						<option>#연인과</option>
						<option>#반려동물과</option>
					</select>
				</div>
				<div class="wrap001">
					<div id="prod_con">
						<ul>
							<li class="aa">
								<div class="prod_img"><img src="imgs/tour/tour01.jpg"></div>
								<div class="prod_txt" >
									<div class="txt00">[히트상품]</div>
									<div class="txt01">
										<div>얼리버드 세부퍼시픽</div>
										<div>특가좌석</div>
									</div>
									<div class="txt02">세부 / 마닐라 편도 항공권<div>11</div>%</div>
									
									<div class="cal_wrap">
									<div class="img03"><img src="imgs/tour/calender.png" style="width: 24px; opacity: 70%;"></div>
									<div class="txt04">~9월 초 출발일</div>
									</div>
									
									<div class="txt05">899,000원~</div>
									<div class="average">
										<a href="#"><img src="imgs/tour/avg_45.png"></a>
										<a href="#">[29]</a>
									</div>
								</div>
							</li>
							<li class="aa">
								<div class="prod_img"><img src="imgs/tour/tour01.jpg"></div>
								<div class="prod_txt" >
									<div class="txt00">[히트상품]</div>
									<div class="txt01">
										<div>얼리버드 세부퍼시픽</div>
										<div>특가좌석</div>
									</div>
									<div class="txt02">세부 / 마닐라 편도 항공권<div>11</div>%</div>
									
									<div class="cal_wrap">
									<div class="img03"><img src="imgs/tour/calender.png" style="width: 24px; opacity: 70%;"></div>
									<div class="txt04">~9월 초 출발일</div>
									</div>
									
									<div class="txt05">899,000원~</div>
									<div class="average">
										<div><a href="#"><img src="imgs/tour/avg_45.png"></a></div>
										<div><a href="#">[29]</a></div>
									</div>
								</div>
							</li>
							<li class="aa">
								<div class="prod_img"><img src="imgs/tour/tour01.jpg"></div>
								<div class="prod_txt" >
									<div class="txt00">[히트상품]</div>
									<div class="txt01">
										<div>얼리버드 세부퍼시픽</div>
										<div>특가좌석</div>
									</div>
									<div class="txt02">세부 / 마닐라 편도 항공권<div>11</div>%</div>
									
									<div class="cal_wrap">
									<div class="img03"><img src="imgs/tour/calender.png" style="width: 24px; opacity: 70%;"></div>
									<div class="txt04">~9월 초 출발일</div>
									</div>
									
									<div class="txt05">899,000원~</div>
									<div class="average">
										<div><a href="#"><img src="imgs/tour/avg_45.png"></a></div>
										<div><a href="#">[29]</a></div>
									</div>
								</div>
							</li>
							<li class="aa">
								<div class="prod_img"><img src="imgs/tour/tour01.jpg"></div>
								<div class="prod_txt" >
									<div class="txt00">[히트상품]</div>
									<div class="txt01">
										<div>얼리버드 세부퍼시픽</div>
										<div>특가좌석</div>
									</div>
									<div class="txt02">세부 / 마닐라 편도 항공권<div>11</div>%</div>
									
									<div class="cal_wrap">
									<div class="img03"><img src="imgs/tour/calender.png" style="width: 24px; opacity: 70%;"></div>
									<div class="txt04">~9월 초 출발일</div>
									</div>
									
									<div class="txt05">899,000원~</div>
									<div class="average">
										<div><a href="#"><img src="imgs/tour/avg_45.png"></a></div>
										<div><a href="#">[29]</a></div>
									</div>
								</div>
							</li>
							<li class="aa">
								<div class="prod_img"><img src="imgs/tour/tour01.jpg"></div>
								<div class="prod_txt" >
									<div class="txt00">[히트상품]</div>
									<div class="txt01">
										<div>얼리버드 세부퍼시픽</div>
										<div>특가좌석</div>
									</div>
									<div class="txt02">세부 / 마닐라 편도 항공권<div>11</div>%</div>
									
									<div class="cal_wrap">
									<div class="img03"><img src="imgs/tour/calender.png" style="width: 24px; opacity: 70%;"></div>
									<div class="txt04">~9월 초 출발일</div>
									</div>
									
									<div class="txt05">899,000원~</div>
									<div class="average">
										<div><a href="#"><img src="imgs/tour/avg_45.png"></a></div>
										<div><a href="#">[29]</a></div>
									</div> 
								</div>
							</li>
							<li class="aa">
								<div class="prod_img"><img src="imgs/tour/tour01.jpg"></div>
								<div class="prod_txt" >
									<div class="txt00">[히트상품]</div>
									<div class="txt01">
										<div>얼리버드 세부퍼시픽</div>
										<div>특가좌석</div>
									</div>
									<div class="txt02">세부 / 마닐라 편도 항공권<div>11</div>%</div>
									
									<div class="cal_wrap">
									<div class="img03"><img src="imgs/tour/calender.png" style="width: 24px; opacity: 70%;"></div>
									<div class="txt04">~9월 초 출발일</div>
									</div>
									
									<div class="txt05">899,000원~</div>
									<div class="average">
										<div><a href="#"><img src="imgs/tour/avg_45.png"></a></div>
										<div><a href="#">[29]</a></div>
									</div>
								</div>
							</li>
						</ul>		
					</div>
					<div id="pagewrap">
						<ul>
							<li class="page_arr"><a href="#"><</a></li>
							<li class="page_icon"><a href="#">1</a></li>
							<li class="page_icon"><a href="#">2</a></li>
							<li class="page_icon"><a href="#">3</a></li>
							<li class="page_icon"><a href="#">4</a></li>
							<li class="page_icon"><a href="#">5</a></li>
							<li class="page_arr"><a href="#">></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>

	  <footer>
           <%@include file="footer.jsp" %>
        </footer>
	<script>
		$( document ).ready( function() {
			$('.slider').slick({
				autoplay: true,
				autoplaySpeed : 4000,
					arrows: false,
					centerMode: true,
					centerPadding: '0',
					slidesToShow: 4,
				});
			} );
		function searchToggle(obj, evt){
    var container = $(obj).closest('.search-wrapper');
        if(!container.hasClass('active')){
            container.addClass('active');
            evt.preventDefault();
        }
        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
            container.removeClass('active');
            // clear input
            container.find('.search-input').val('');
        }
}

	</script>	
</body>
</html>