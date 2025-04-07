

	////////////////////////////광고 배너 이미지 3개 top

	$(document).ready(function () {
	$(".mySlideDiv").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
	
	setInterval(nextSlide, 4000); //4초(4000)마다 다음 슬라이드로 넘어감
});

//이전 슬라이드
function prevSlide() {
	$(".mySlideDiv").hide(); //모든 div 숨김
	var allSlide = $(".mySlideDiv"); //모든 div 객체를 변수에 저장
	var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
	
	//반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
	$(".mySlideDiv").each(function(index,item){ 
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
        
	});
	
	//새롭게 나타낼 div의 index
	var newIndex = 0;
    
	if(currentIndex <= 0) {
		//현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
		newIndex = allSlide.length-1;
	} else {
		//현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
		newIndex = currentIndex-1;
	}

	//모든 div에서 active 클래스 제거
	$(".mySlideDiv").removeClass("active");
    
	//새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
	$(".mySlideDiv").eq(newIndex).addClass("active");
	$(".mySlideDiv").eq(newIndex).show();

}

//다음 슬라이드
function nextSlide() {
	$(".mySlideDiv").hide();
	var allSlide = $(".mySlideDiv");
	var currentIndex = 0;
	
	$(".mySlideDiv").each(function(index,item){
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
        
	});
	
	var newIndex = 0;
	
	if(currentIndex >= allSlide.length-1) {
		//현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
		newIndex = 0;
	} else {
		//현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
		newIndex = currentIndex+1;
	}

	$(".mySlideDiv").removeClass("active");
	$(".mySlideDiv").eq(newIndex).addClass("active");
	$(".mySlideDiv").eq(newIndex).show();
	
}
///////////////////////////////광고 배너 이미지 3개 top 끝

///////////////////////////////광고 배너 이미지 3개 mid 시작

$(function(){
    var $slider = $('.slider'),
        $firstSlide = $slider.find('li').first() // 첫번째 슬라이드
        .stop(true).animate({'opacity':1},200); // 첫번째 슬라이드만 보이게 하기
  
    function PrevSlide(){ // 이전버튼 함수
      stopSlide();startSlide(); //타이머 초기화
      var $lastSlide = $slider.find('li').last() //마지막 슬라이드
      .prependTo($slider); //마지막 슬라이드를 맨 앞으로 보내기  
      $secondSlide = $slider.find('li').eq(1)//두 번째 슬라이드 구하기
      .stop(true).animate({'opacity':0},400); //밀려난 두 번째 슬라이드는 fadeOut 시키고
      $firstSlide = $slider.find('li').first() //맨 처음 슬라이드 다시 구하기
      .stop(true).animate({'opacity':1},400);//새로 들어온 첫 번째 슬라이드는 fadeIn 시키기
    }
    
    function NextSlide(){ // 다음 버튼 함수
      stopSlide();startSlide(); //타이머 초기화
      $firstSlide = $slider.find('li').first() // 첫 번째 슬라이드
      .appendTo($slider); // 맨 마지막으로 보내기
      var $lastSlide = $slider.find('li').last() // 맨 마지막으로 보낸 슬라이드
      .stop(true).animate({'opacity':0},400); // fadeOut시키기
      $firstSlide = $slider.find('li').first()// 맨 처음 슬라이드
      .stop(true).animate({'opacity':1},400);// fadeIn 시키기
    }
    
    $('#next').on('click', function(){ //다음버튼 클릭
      NextSlide();
    });
    $('#prev').on('click', function(){ //이전 버튼 클릭
      PrevSlide();
    });
  
    startSlide(); // 자동 슬라이드 시작
    
    var theInterval;
  
    function startSlide() {
      theInterval = setInterval(NextSlide, 5000); //자동 슬라이드 설정
    }
  
    function stopSlide() { //자동 멈추기
      clearInterval(theInterval);
    }
    
    $('.slider').hover(function(){ //마우스 오버시 슬라이드 멈춤
      stopSlide();
    }, function (){
      startSlide();
    });
  });

        $(function(){
        $(".innersort").click(function(){
           $(".sort-dropwrap").toggle();
        });
      });

///////////////////////////////광고 배너 이미지 3개 mid 끝
