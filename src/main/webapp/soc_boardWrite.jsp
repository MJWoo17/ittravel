<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잇로그 글쓰기</title>
</head>
	<link rel="stylesheet" href="css/soc_boardWriteCss.css">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> 
    <script src="./slick-1.8.1/slick/slick.min.js"></script>
</head>
<script>
function openmodal(){
	
	$('#background').fadeIn(200);
	$('#front').fadeIn(200);
	$('body').addClass('modal-open');
	
// 	$.ajax({
// 		url: "soc_modaldata.jsp",
// 		type: "get",
// 		data: {
// 			city_eng: city_eng,		
// 		},
// 		success: function(data){
// 			console.log(city_name);
// 			 var city_name = data.split(',')[0];
// 			document.getElementById("photo2").style.backgroundImage = "url('./travelplanimgs/" + city_eng + ".jpg')",	
//  			document.getElementById("smallcity1").innerText = city_name,
//  			document.getElementById("smallcity2").innerText = city_eng.toUpperCase()
 			
//  		}
// 	});

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
	

</script>


<%  String fromDate = (String) session.getAttribute("fromDate");
String toDate = (String) session.getAttribute("toDate"); %>

<body>
<form action="soc_writearrange.jsp" method ="post"> 

<div class ='gray_layer' id='background' onclick="closemodal()"></div>
 <div class="Wrap" id= 'front' style="display:none;">
  	<div class = "chooseplan">일정 선택하기</div>
  	<div class="planlist">
  		<h4 style="text-align:left; cursor : pointer;">방콕 <% out.println(fromDate); %> ~ <% out.println(toDate); %></h4>
  	</div>
  </div>


	<div class="wrap">
		<!-- 최상단 -->
		<div class="top_wrap">
			<div style="width:30%; display:flex;">
			<a><img src="imgs/board/icon_pack.png" onclick="openmodal()"></a>
<!-- 			<input id="img-selector" type="file" accept="image/*" style="display:none;"> -->
			<a href="#"><img src="imgs/board/gallery_icon.png" id="uploadimg" style="cursor : pointer;"></a>
<!-- 			<a href="#"><img src="imgs/board/movie_icon.png"></a> -->
<!-- 			<a href="#"><img src="imgs/board/pick_icon.png"></a> -->
			
					<table style="margin-top:35px;">
						<tr>
							<td align="center"><input type="file" name="uploadFile"
								id="uploadFile" multiple>
								<div id="preview"></div></td>
						</tr>
					</table>
				
				</div>
			<div style="width:40%;"></div>
			<div class="title">잇로그 글쓰기</div>
		</div>
		<div style="display:flex; justify-content:center;">
		<div class="travel_plan">
		
<%
    // 세션에서 가는 날과 오는 날 정보를 가져옴
    

  				
  	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
  	Date fromdate = dateFormat.parse(fromDate);
  	Date todate = dateFormat.parse(toDate);
  				
  
    // 해당 범위 내의 날짜에 해당하는 일정만 출력
    for (Date date = fromdate; date.compareTo(todate) <= 0; date = new Date(date.getTime() + (24 * 60 * 60 * 1000))) {
        %>
        <div class="day_plan">
            <div><%= dateFormat.format(date) %></div>
            <%-- 해당 날짜에 맞는 일정을 출력 --%>
            <%-- 예시로 스케줄1과 설명1을 두 개씩 출력하는 코드 작성 --%>
            <% for (int i = 1; i <= 2; i++) { %>
                <h4>스케줄<%= i %></h4>
                <h5>설명<%= i %></h5>
                 <h4>스케줄<%= i %></h4>
                <h5>설명<%= i %></h5>
            <% } %>
        </div>
    <% } %>
		<%-- startDate와 endDate 사이의 날짜를 하나씩 순회 --%>

    </div>

<!-- 			<div class="day_plan"> -->
<!-- 				<div>2023/04/22</div> -->
<!-- 				<h4>스케줄1</h4> -->
<!-- 					<h5>설명1</h5> -->
<!-- 				<h4>스케줄1</h4> -->
<!-- 				<h5>설명1</h5> -->
<!-- 				<h4>스케줄1</h4> -->
<!-- 				<h5>설명1</h5> -->
<!-- 				<h4>스케줄1</h4> -->
<!-- 				<h5>설명1</h5> -->
<!-- 				<h4>스케줄1</h4> -->
<!-- 				<h5>설명1</h5>				 -->
<!-- 			</div> -->
<!-- 			<div class="day_plan"> -->
<!-- 				<div>2023/04/23</div> -->
<!-- 				<h4>스케줄1</h4> -->
<!-- 					<h5>설명1</h5> -->
<!-- 				<h4>스케줄1</h4> -->
<!-- 				<h5>설명1</h5> -->
<!-- 				<h4>스케줄1</h4> -->
<!-- 				<h5>설명1</h5> -->
<!-- 				<h4>스케줄1</h4> -->
<!-- 				<h5>설명1</h5> -->
<!-- 				<h4>스케줄1</h4> -->
<!-- 				<h5>설명1</h5>				 -->
<!-- 			</div> -->
<!-- 			<div class="day_plan"> -->
<!-- 				<div>2023/04/24</div> -->
<!-- 				<h4>스케줄1</h4> -->
<!-- 					<h5>설명1</h5> -->
<!-- 				<h4>스케줄1</h4> -->
<!-- 				<h5>설명1</h5> -->
<!-- 				<h4>스케줄1</h4> -->
<!-- 				<h5>설명1</h5> -->
<!-- 				<h4>스케줄1</h4> -->
<!-- 				<h5>설명1</h5> -->
<!-- 				<h4>스케줄1</h4> -->
<!-- 				<h5>설명1</h5>				 -->
<!-- 			</div> -->
		</div>
		<!-- 텍스트박스 -->
		<div >
		<textarea placeholder="내용을 입력하세요."  name ="soc_con" id="soc_con"></textarea>
		<br>
		<a href="soc_basicboard.jsp"><input type="button" value="취소"></a><input type="button" value="등록">
		</div>
		
	</div>

	</form>
</body>
<script>

$(document).ready(function (e){
    $("input[type='file']").change(function(e){

      //div 내용 비워주기
      $('#preview').empty();

      var files = e.target.files;
      var arr =Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      preview(arr);
      
      
    });//file change
    
    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div에 이미지 추가
        var str = '<div style="display: inline-flex; padding: 10px;"><li>';
        str += '<span>'+fileName+'</span><br>';
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
            str += '</li></div>';
            $(str).appendTo('#preview');
          } 
          reader.readAsDataURL(f);
        }else{
          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
          $(str).appendTo('#preview');
        }
      });//arr.forEach
    }
  });


// const uploadimg = document.getElementById('uploadimg');
// const imageSelector = document.getElementById('img-selector');
// const soc_con = document.getElementById('soc_con');

// function focusEditor() {
//     soc_con.focus({preventScroll: true});
// }

// function addImage() {
//     imageSelector.click();
// }

// uploadimg.addEventListener('click', addImage);

// imageSelector.addEventListener('change', function (e) {
//     const files = e.target.files;
//     if (!!files) {
//         insertImageDate(files);
//     }
// });

// function insertImageDate(files) {
//     for (let i = 0; i < files.length; i++) {
//         const reader = new FileReader();
//         reader.addEventListener('load', function (e) {
//             const img = document.createElement('img');
//             img.src = reader.result;
//             soc_con.appendChild(img);
//         });
//         reader.readAsDataURL(files[i]);
//     }
// }

// focusEditor(); // 에디터에 포커스를 먼저 줍니다.

    
</script>

</html>