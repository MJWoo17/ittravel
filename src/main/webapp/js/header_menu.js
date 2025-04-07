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

  $( document ).ready( function() {

    $('.center').slick({

       autoplay: true,
       autoplaySpeed: 2000,
        centerMode: true,
        centerPadding: '60px',
        slidesToShow: 3,
        responsive: [
          {
            breakpoint: 768,
            settings: {
              arrows: false,
              centerMode: true,
              centerPadding: '40px',
              slidesToShow: 3
            }
          },
          {
            breakpoint: 480,
            settings: {
              arrows: false,
              centerMode: true,
              centerPadding: '40px',
              slidesToShow: 1
            }
          }
        ]

      
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
  };
  
  //////////////////////////////////////////////////////////헤더 메뉴 내려오는 거 시작


  $(function(){
    $("div[class=menuwrap2]").hide();
    $("div[class=menuwrap4]").hide();
    $("div[class=menuwrap6]").hide();
    $("div[class=menuwrap8]").hide();
    $("div[class=menuwrap10]").hide();
    $("div[class=menuwrap12]").hide();
    $("div[class=menuwrap14]").hide();
    $("div[class=menuwrap16]").hide();
    $("div[class=mainflightdiv3]").hide();
    $("div[class=mainflightdiv2_1]").hide();
    $("div[class=mainflightdiv2_2]").hide();
    $("div[class=mainflightdiv3_1]").hide();
    $("div[class=mainflightdiv3_2]").hide();
    $("div[class=mainflightdiv4]").hide();
    $("div[class=mainflightdiv4_1]").hide();
    $("div[class=mainflightdiv4_2]").hide();
    $("div[class=mainflightdiv5]").hide();
    $("div[class=mainflightdiv5_1]").hide();
    $("div[class=mainflightdiv5_2]").hide();


    $("#menulist_all").mouseenter(function(){
      $("div[class=menuwrap4]").hide();
      $("div[class=menuwrap6]").hide();
      $("div[class=menuwrap8]").hide();
      $("div[class=menuwrap10]").hide();
      $("div[class=menuwrap12]").hide();
      $("div[class=menuwrap14]").hide();
      $("div[class=menuwrap16]").hide();
        $("div[class=menuwrap2]").slideDown(500);
       
    });
    
    
    $("div[class=menuwrap2]").mouseleave(function(){
        $("div[class=menuwrap2]").slideUp(800);
    });

    $("div[class=menuwrap4]").mouseleave(function(){
      $("div[class=menuwrap4]").slideUp(800);
  });
  $("div[class=menuwrap6]").mouseleave(function(){
    $("div[class=menuwrap6]").slideUp(800);
});

$("div[class=menuwrap8]").mouseleave(function(){
  $("div[class=menuwrap8]").slideUp(800);
});

$("div[class=menuwrap10]").mouseleave(function(){
  $("div[class=menuwrap10]").slideUp(800);
});

$("div[class=menuwrap12]").mouseleave(function(){
  $("div[class=menuwrap12]").slideUp(800);
});

$("div[class=menuwrap14]").mouseleave(function(){
  $("div[class=menuwrap14]").slideUp(800);
});

$("div[class=menuwrap16]").mouseleave(function(){
  $("div[class=menuwrap16]").slideUp(800);
});

});

  //////////////////////////////////////////////////////////헤더 메뉴 내려오는 거 끝
  
  $(function(){
    $("div[class=all_menu]").hide();
    
  $(".menulist1").mouseenter(function() {
	  $("div[class=all_menu]").slideDown(500);
	  
  });
  
  $("div[class=all_menu]").mouseleave(function(){
        $("div[class=all_menu]").slideUp(800);
    });
  
  });
  
  
  
  //여행지추가, 일정짜기 눌렀을 때 로그인 화면으로 전환


