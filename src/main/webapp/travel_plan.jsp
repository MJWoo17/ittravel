<%@ page language="java" contentType="text/html;charset=utf-8"	pageEncoding="UTf-8"%>
<%@page import="vo.TravelPlanVO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
 request.setCharacterEncoding("utf-8");
%>
<%
	ArrayList<TravelPlanVO> cityList=(ArrayList<TravelPlanVO>)request.getAttribute("cityList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/travel_plan.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>여행지 추가</title>
</head>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="js/travel_plan.js"></script>

<script>

	//화면 내 도시들 사진을 클릭했을 때 실행되는 팝업


	//화면에 표시된 배경 레이어를 클릭한 경우
	function closemodal() {

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

	function x() { //X표시 눌렀을 때 닫히도록 하는 기능
		$('#background').fadeOut(200);
		$('#front').fadeOut(200);
		$('body').removeClass('modal-open');
	}

	function add() { //모달창에서 여행지추가하기를 눌렀을 때, input text에 도시 이름을 넣기
		var smallcity1 = $('#smallcity1').text(); // smallcity1의 내용을 가져옴
		$('#background').fadeOut(200);
		$('#front').fadeOut(200);
		$('body').removeClass('modal-open');
		$('input[name=coouncity]').focus();
		var coouncityInput = $('input[name=coouncity]');
		coouncityInput.val(smallcity1);
		console.log(smallcity1);
	};
	
// 	function addpeople(){
// 		var howmany = $('.howmany');
// 		howmany.val(parseInt(howmany.val())+1);
// 		console.log(howmany.val());
		
// 		if(howmany.val()==8){
// 			$('#addp').attr("aria-disabled","true");
// 			$('#addp').prop("disabled",true);
// 		}else{
// 			$('#addp').attr("aria-disabled","false");
// 		}
		
// 	}
	

$(document).ready(function() { //인원 추가하기
  $('#addp').click(function() {
    var howmany = $('.howmany');
    howmany.val(parseInt(howmany.val()) + 1);
    console.log(howmany.val());

    if (howmany.val() == 8) {
      $('#addp').addClass('disable');
    }
	if(howmany.val()!=0){
		$('#subtractp').removeClass('disable');
	}
  });
});

$(document).ready(function() { //인원 빼기
	  $('#subtractp').click(function() {
	    var howmany = $('.howmany');
	    howmany.val(parseInt(howmany.val()) - 1);
	   

	    if(howmany.val()!=8){
			$('#addp').removeClass('disable');
		}
		
		if(howmany.val()==0){
			$('#subtractp').addClass('disable');
		}

	  });
	});


	
function inputnum(){ //인원 직접 입력하기
	var howmany = $('.howmany');
	
	if(howmany.val() == 8){
		$('#addp').addClass('disable');
	}else{
		$('#addp').removeClass('disable');
	}
	
	if(howmany.val()==0){
		$('#subtractp').addClass('disable');
	}else{
		$('#subtractp').removeClass('disable');
	}
}

</script>



<body>



	<header>
	<jsp:include page="/header.jsp" />
	</header>


	<section>

		<form action="insertTravel.bo" method="post">

			<!--///////////// 팝업창 ////////// 	 -->
			<div class='gray_layer' id='background' onclick="closemodal()"></div>
			<div class='over_layer' id='front'>
				<div class="photocity" style="display: flex;">
					<div class="photo" style="display: flex;">
						<div class="photo2" id="photo2" style="z-index: 1500; width: 300px; height: 400px; background-size: cover; overflow: hidden;"></div>
<!-- 				photo -->
					</div>
					<div class="cityexplain" style="display: flex;">
						<div class="cityexplain2" style="padding: 30px;">
							<h2 style="letter-spacing: 2px;" id="smallcity1" onclick="smallcity1()">방콕</h2>
							<h3	style="margin-top: 10px; font-family: TheJamsil2Light; letter-spacing: 2px;"id="smallcity2">BANGKOK</h3>
							<div style="font-family: TheJamsil2Light; color: grey; font-size: 15px; margin-top: 15px;">
								방콕은 이러쿵 저렇궁 저렇구요 Kids were laughing in my classes While I was
								scheming for the masses Who do you think you are? Dreaming 'bout
								being a big star They say, "You're basic", they say, "You're
								easy" You're always riding in the backseat Now I'm smiling from
								the stage while You were clapping in the nosebleeds</div>
							<div>
								<button type="button" style = "cursor : pointer; "id="modalchoose" onclick="add()">여행지 추가하기</button>
							</div>

<!--					 cityexplain2 -->
						</div>
						<div class="x" onclick="x()">X</div>
<!-- 				cityexplain -->
					</div>
<!--			 photocity				 -->
				</div>
<!-- 		over_layer -->
			</div>

			<!--///////////// 팝업창 ////////// 	 -->




			<!-- ///////////메인화면////////// -->


<!-- 		///////////여행지/날짜입력/////////// -->
			<div class="dessearch">
				<div id="inputwrap">
					<div id="destintext">떠나고 싶은 여행지를 검색해보세요!</div>
					<div class="depdatewrap">
						<ul>
							<li><input type="text" size="50" name="coouncity"
								class="inputdes" style="padding-left: 10px;" placeholder="여행지를 입력해주세요" required></li>
							<li><input type="button" class="btn" value="가는날"
								style="font-family: TheJamsil2Light;"> <input
								type="date" name="depdate" required></li>
							<li><input type="button" class="btn" value="오는날"
								style="font-family: TheJamsil2Light;"> <input
								type="date" name="arrdate" required></li>
							<li>															
								<div style="display: flex;" >
									<div class="material-symbols-outlined" style="margin-left: 10px; margin-top: 6px; color: grey; font-size:30px;">group</div>
									<div class="plusminus" id="subtractp" style="margin-left: 5px;" onclick="subtractpeople()"><img src="travelplanimgs/remove-13-16.png" style="width: 12px; height: 12px; padding-top:4px;"></div>
									<input class="howmany" name = "tra_ppl" onchange="inputnum()" style = "padding:3px; width: 20px;" value="1">	
									<div class="plusminus"id="addp" style="margin-left: 3px;" ><img src="travelplanimgs/add-43-16.png" style="width: 12px; height: 12px; padding-top:3px;"></div>
								</div>	
							</li>
							<li><input type="submit" id="desearbtn" value="선택완료"></li>
						</ul>
						<!-- depdatewrap -->
					</div>
<!--			inputwrap -->
				</div>
<!-- 		dessearch -->
			</div>
<!-- 		///////////여행지/날짜입력/////////// -->		


<!-- ///////////대륙별 추천 여행지/////////// -->
			<div id="continent">
				<div id="innercon">
					<ul id="filter-bar">
						<span class="pill"></span>
						<li onclick="reccity_all()">추천여행지</li>
						<li class="reccity1" onclick="reccity_asia()">아시아</li>
						<li class="reccity2" onclick="reccity_america()">아메리카</li>
						<li class="reccity3" onclick="reccity_europe()">유럽</li>
						<li class="reccity4" onclick="reccity_oceania()">오세아니아</li>
						<li class="reccity5" onclick="reccity_africa()">아프리카</li>
					</ul>
					<!-- innercon-->
				</div>
				<div id="greyinst">
					<font color="grey">추천여행지를 클릭해서 일정에 직접 추가해보세요</font>
					<!-- greyinst		 -->
				</div>
				<!-- continent -->
			</div>

			<div class="sortwrap">
				<div class="innersort">
					<div class="sort">
						추천순 <span class="sorticon">arrow_drop_down</span>
					</div>
					<div class="sort-dropwrap">
						<ul>
							<li>인기순</li>
							<li>추천순</li>
						</ul>
					</div>
<!-- 			innersort -->
				</div>
<!-- 		sortwrap -->
			</div>





			<div class="picswraps">
				<div class="recdes_asia">
					<div class="picwrap1">
					<%
					if(cityList != null){
						for(int i=0;i<cityList.size();i++){			
							if("asia".equals(cityList.get(i).getCity_con())){%>			 
							<div class="pntwrap" onclick="openmodal('<%=cityList.get(i).getCity_eng() %>','<%=cityList.get(i).getCity_name() %>')">
								<div class="pic">
									<img src="travelplanimgs/<%=cityList.get(i).getCity_eng() %>.jpg" class="zoom">
				<!-- 						pic	 -->
								</div>
								<div class="textwrap">
									<ul class="text">
										<li><%=cityList.get(i).getCity_name() %></li>  
				<!-- 									나중에 나라이름 넣을 것 -->
										<li><%=cityList.get(i).getCity_eng().toUpperCase()%></li>
									</ul>
				<!-- 						textwrap	 -->
								</div>
				<!-- 					pntwrap1 -->
							</div>
							<%}%>
						<%}
					}%>
					</div>
				</div>
				<div class="recdes_america">
					<div class="picwrap1">
					<%
					if(cityList != null){
						for(int i=0;i<cityList.size();i++){			
							if("america".equals(cityList.get(i).getCity_con())){%>			 
							<div class="pntwrap" onclick="openmodal('<%=cityList.get(i).getCity_eng() %>','<%=cityList.get(i).getCity_name() %>')">
								<div class="pic">
									<img src="travelplanimgs/<%=cityList.get(i).getCity_eng() %>.jpg" class="zoom">
				<!-- 						pic	 -->
								</div>
								<div class="textwrap">
									<ul class="text">
										<li><%=cityList.get(i).getCity_name() %></li>  
				<!-- 									나중에 나라이름 넣을 것 -->
										<li><%=cityList.get(i).getCity_eng().toUpperCase()%></li>
									</ul>
				<!-- 						textwrap	 -->
								</div>
				<!-- 					pntwrap1 -->
							</div>
							<%}%>
						<%}
					}%>
					</div>
				</div>
				<div class="recdes_europe">
					<div class="picwrap1">
					<%
					if(cityList != null){
						for(int i=0;i<cityList.size();i++){			
							if("europe".equals(cityList.get(i).getCity_con())){%>			 
							<div class="pntwrap" onclick="openmodal('<%=cityList.get(i).getCity_eng() %>','<%=cityList.get(i).getCity_name() %>')">
								<div class="pic">
									<img src="travelplanimgs/<%=cityList.get(i).getCity_eng() %>.jpg" class="zoom">
				<!-- 						pic	 -->
								</div>
								<div class="textwrap">
									<ul class="text">
										<li><%=cityList.get(i).getCity_name() %></li>  
				<!-- 									나중에 나라이름 넣을 것 -->
										<li><%=cityList.get(i).getCity_eng().toUpperCase()%></li>
									</ul>
				<!-- 						textwrap	 -->
								</div>
				<!-- 					pntwrap1 -->
							</div>
							<%}%>
						<%}
					}%>
					</div>
				</div>
				<div class="recdes_oceania">
					<div class="picwrap1">
					<%
					if(cityList != null){
						for(int i=0;i<cityList.size();i++){			
							if("oceania".equals(cityList.get(i).getCity_con())){%>			 
							<div class="pntwrap" onclick="openmodal('<%=cityList.get(i).getCity_eng() %>','<%=cityList.get(i).getCity_name() %>')">
								<div class="pic">
									<img src="travelplanimgs/<%=cityList.get(i).getCity_eng() %>.jpg" class="zoom">
				<!-- 						pic	 -->
								</div>
								<div class="textwrap">
									<ul class="text">
										<li><%=cityList.get(i).getCity_name() %></li>  
				<!-- 									나중에 나라이름 넣을 것 -->
										<li><%=cityList.get(i).getCity_eng().toUpperCase()%></li>
									</ul>
				<!-- 						textwrap	 -->
								</div>
				<!-- 					pntwrap1 -->
							</div>
							<%}%>
						<%}
					}%>
					</div>
				</div>
				<div class="recdes_africa">
					<div class="picwrap1">
					<%
					if(cityList != null){
						for(int i=0;i<cityList.size();i++){			
							if("africa".equals(cityList.get(i).getCity_con())){%>			 
							<div class="pntwrap" onclick="openmodal('<%=cityList.get(i).getCity_eng() %>','<%=cityList.get(i).getCity_name() %>')">
								<div class="pic">
									<img src="travelplanimgs/<%=cityList.get(i).getCity_eng() %>.jpg" class="zoom">
				<!-- 						pic	 -->
								</div>
								<div class="textwrap">
									<ul class="text">
										<li><%=cityList.get(i).getCity_name() %></li>  
				<!-- 									나중에 나라이름 넣을 것 -->
										<li><%=cityList.get(i).getCity_eng().toUpperCase()%></li>
									</ul>
				<!-- 						textwrap	 -->
								</div>
				<!-- 					pntwrap1 -->
							</div>
							<%}%>
						<%}
					}%>
					</div>
				</div>
<!-- 		picswraps -->
			</div>
<!-- ///////////대륙별 추천 여행지/////////// -->


<!-- 어디를 가야할 지 고민된다면..			 -->
			<div class="wheretogo">
				<div class="julwrap">
					<div class="btextwrap">어디를 가야할 지 고민된다면..</div>							
					<div class="ltextwrap">가장 많이 검색한 여행지</div>
					
					<div class="nemowrap">
						<div class="pic3s"  onclick="openmodal()">
							<img src="travelplanimgs/top4bali.jpg" class="zoom">
						</div>
						<div class="textwrap">
							<ul class="usertext">
								<li>인도네시아 발리</li>
								<li>Bali</li>
							</ul>
<!-- 					textwrap -->
						</div>
<!-- 				nemowrap -->
					</div>
	
					<div class="nemowrapwm">
						<div class="pic3s" onclick="openmodal()">
							<img src="travelplanimgs/top4paris.jpg" class="zoom">
						</div>
						<div class="textwrap">
							<ul class="usertext">
								<li>프랑스 파리</li>
								<li>Paris</li>
							</ul>
<!-- 					textwrap	 -->
						</div>
<!-- 				nemowrapwm	 -->
					</div>
					
					<div class="nemowrapwm">
						<div class="pic3s">
							<img src="travelplanimgs/top4newyork.jpg" class="zoom" onclick="openmodal()">
						</div>
						<div class="textwrap">
							<ul class="usertext">
								<li>미국 뉴욕</li>
								<li>New York</li>
							</ul>
<!-- 					textwrap -->
						</div>
<!-- 				nemowrapwm		 -->
					</div>

					<div class="nemowrapwml">
						<div class="pic3s">
							<img src="travelplanimgs/top4sydney.jpg" class="zoom" onclick="openmodal()">
						</div>
						<div class="textwrap">
							<ul class="usertext">
								<li>호주 시드니</li>
								<li>Sydney</li>
							</ul>
<!-- 					textwrap	 -->
						</div>
<!-- 				nemowrapwml		 -->
					</div>		
<!-- 			julwrap	 -->
				</div>

				<div class="julwrap">
					<div class="ltextwrap" id="modal">회원님들이 다녀오신 여행지</div>
					<div class="nemowrap">
						<div class="pic3s">
							<img src="travelplanimgs/dubai.jpg" class="zoom"
								onclick="openmodal()">
						</div>
						<div class="textwrap">
							<ul class="usertext">
								<li style="letter-spacing: 1px;">두바이를 다녀오신</li>
								<li style="letter-spacing: 1px;">eclips회원님의 이야기</li>
							</ul>
<!-- 					textwrap -->						
						</div>
<!-- 				nemowrapwm -->						
					</div>
					
					<div class="nemowrapwm">
						<div class="pic3s">
							<img src="travelplanimgs/bohol.jpg" class="zoom"
								onclick="openmodal()">
						</div>
						<div class="textwrap">
							<ul class="usertext">
								<li style="letter-spacing: 1px;">보홀을 다녀오신</li>
								<li style="letter-spacing: 1px;">Yeti회원님의 이야기</li>
							</ul>
<!-- 					textwrap -->						
						</div>
<!-- 				nemowrapwm -->						
					</div>
					
					<div class="nemowrapwm">
						<div class="pic3s">
							<img src="travelplanimgs/tainan.jpg" class="zoom"
								onclick="openmodal()">
						</div>
						<div class="textwrap">
							<ul class="usertext">
								<li style="letter-spacing: 1px;">타이난을 다녀오신</li>
								<li style="letter-spacing: 1px;">마루는 강쥐님의 이야기</li>
							</ul>
<!-- 					textwrap -->
						</div>
<!-- 				nemowrapwm -->					
					</div>

					<div class="nemowrapwml">
						<div class="pic3s">
							<img src="travelplanimgs/lasvegas.jpg" class="zoom"
								onclick="openmodal()">
						</div>
						<div class="textwrap">
							<ul class="usertext">
								<li style="letter-spacing: 1px;">라스베가스를 다녀오신</li>
								<li style="letter-spacing: 1px;">핸드폰진동님의 이야기</li>
							</ul>
<!-- 					textwrap -->
						</div>
<!-- 				nemowrapwml -->
					</div>
				</div>


				<div class="julwrap">
					<div class="ltextwrap">제철여행지 - 지금이 이 나라를 여행하기에 가장 좋은 날씨!</div>
					<div class="nemowrap">
						<div class="pic3s">
							<img src="travelplanimgs/venice.jpg" class="zoom">
						</div>
						<div class="textwrap">
							<ul class="usertext">
								<li>이태리</li>
								<li>Italy</li>
							</ul>
<!-- 					textwrap	 -->
						</div>
<!-- 				nemowrap -->
					</div>
					<div class="nemowrapwm">
						<div class="pic3s">
							<img src="travelplanimgs/taiwan.jpg" class="zoom">
						</div>
						<div class="textwrap">
							<ul class="usertext">
								<li>대만</li>
								<li>Taiwan</li>
							</ul>
<!-- 					textwrap	 -->
						</div>
<!-- 				nemowrapwm -->
					</div>
					<div class="nemowrapwm">6
						<div class="pic3s">
							<img src="travelplanimgs/vietnam.jpg" class="zoom">
						</div>
						<div class="textwrap">
							<ul class="usertext">
								<li>베트남</li>
								<li>VietNam</li>
							</ul>
<!-- 					textwrap -->
						</div>
<!-- 				nemowrapwm -->
					</div>

					<div class="nemowrapwml">
						<div class="pic3s">
							<img src="travelplanimgs/austria.jpg" class="zoom">
						</div>
						<div class="textwrap">
							<ul class="usertext">
								<li>오스트리아</li>
								<li>Austria</li>
							</ul>
<!-- 					textwrap	 -->
						</div>
<!-- 				nemowrapwml	 -->
					</div>
<!-- 			julwrap -->
				</div>
<!-- 		wheretogo -->
			</div>
<!-- 어디를 가야할 지 고민된다면..			 -->

		</form>
	</section>
	


	<footer>
<jsp:include page="/footer.jsp" />
	</footer>

<script>
function openmodal(city_eng, city_name) {
	$('#background').fadeIn(200);
	$('#front').fadeIn(200);
	$('body').addClass('modal-open');
	console.log(city_eng);
	document.getElementById("photo2").style.backgroundImage = "url('travelplanimgs/"+city_eng + ".jpg')",
	document.getElementById("smallcity1").innerText = city_name,
	document.getElementById("smallcity2").innerText = city_eng.toUpperCase()
};
</script>

</body>
</html>