
            
//             function widenlist(){

//                 $(".schlist").toggle();

//             }

// 버튼 요소를 선택합니다.
  

  

var map;

function initMap() {
    var danang = { lat: 16.0544563 , lng: 108.0717219};
  	map = new google.maps.Map( document.getElementById('map'), {
      zoom: 12,
      center: danang
    });

  new google.maps.Marker({
    position: danang,
    map: map,
    label: "다낭 중심 좌표"
  });
}

function locinfo(loc2_name, loc2_filter, loc2_name_lang, loc2_addr, loc2_webp, loc2_hour, loc2_exp, loc2_phone, loc2_loc, loc2_lat, loc2_lng) {

//		$('#background').fadeIn(200);
		$('#front').fadeIn(200);
		$('body').addClass('modal-open');


	var map = new google.maps.Map(document.getElementById("map"), {});

	var loc_name1 = loc2_name;
	var loc_name_lang = loc2_name_lang;
	var loc_addr = loc2_addr;
	var loc_webp = loc2_webp;
// 	var loc_hours = loc2_hour.split(',');
// 		var mon = loc_hours[0];
// 		var tue = loc_hours[1];
// 		var wed = loc_hours[2];
// 		var thur = loc_hours[3];
// 		var fri = loc_hours[4];
// 		var sat = loc_hours[5];
// 		var sun = loc_hours[6];
	var loc_exp = loc2_exp;
	var loc_phone = loc2_phone;
	var loc_loc = loc2_loc;
	var loc_lat = parseFloat(loc2_lat);
	var loc_lng = parseFloat(loc2_lng);
	document.getElementById("loc").innerText = loc_loc;
	document.getElementById("loc1").innerText = loc_name1;
	document.getElementById("addr").innerText = loc_addr;
	document.getElementById("photo2").style.backgroundImage = "url('./schmngimgs/"+ loc_name1 + ".jpg')";
    document.getElementById("loc2").innerText = loc_name_lang;
    document.getElementById("description").innerText = loc_exp;
    var loc_filter = loc2_filter;
     	if(loc_filter == 1)
	            document.getElementById("category").innerText = "식당";			            		
     	else if(loc_filter ==2)
	            document.getElementById("category").innerText = "카페";
     	else if(loc_filter ==3)
	            document.getElementById("category").innerText = "관광";
     	else if(loc_filter ==4)
	            document.getElementById("category").innerText = "쇼핑";
     	else if(loc_filter ==5)
	            document.getElementById("category").innerText = "숙소";			            		
     document.getElementById("addr").innerText = loc_addr;
    

     
//      document.getElementById("mon").innerText = mon;
//      document.getElementById("tue").innerText = tue;
//      document.getElementById("wed").innerText = wed;
//      document.getElementById("thur").innerText = thur;
//      document.getElementById("fri").innerText = fri;
//      document.getElementById("sat").innerText = sat;
//      document.getElementById("sun").innerText = sun;
     document.getElementById("webp").innerText = loc_webp;
     document.getElementById("phone").innerText = loc_phone;
 	
 		var la = { lat: loc_lat, lng: loc_lng }
		map.panTo(la);
		map.setZoom(18);			
		
	var marker = new google.maps.Marker({
		position: la,
		map: map,
		title: loc_name1
	});					
};


//  function add() {
//    // 선택된 날짜를 가져옴
//    var selectedDate = document.querySelector("#date-select").value;
//
//    // 선택된 날짜를 출력할 새 div 요소를 생성함
//    var newDayDiv = document.createElement("div");
//    newDayDiv.classList.add("Day");
//    newDayDiv.innerHTML = `
//      <div style="margin-bottom: 10px; width: 280px;">
//        Day X (${selectedDate})
//        <div class="widen"><a href="widenlist">펼쳐보기</a></div>
//        <div class="edit">편집</div>
//        <div class="schlistwrap" id="widenlist">
//          <div class="schlist" id="schlist">
//            <ul>
//              <li>
//                <div class="listtitlewrap" id="container">
//                  <div class="listtitle" id="hoianresort">실크센스 리조트 호이안 </div>
//                  <div class="listremove" id="remove" onclick="removeListItem(this)">삭제</div>
//                  <!--  listtitlewrap -->
//                </div>
//                <div class="details">
//                  <div class="categories">숙소 호이안</div>
//                  <div class="memos">
//                    <ul>
//                      <li>체크인 시간 15:00</li>
//                      <li>동행인 추가하고 리셉션에서 여권보여주기</li>
//                      <li>체크인하... 
//    `;
//    
//    // 새 div 요소를 dayswrap 안에 추가함
//    var dayswrap = document.querySelector(".dayswrap");
//    dayswrap.appendChild(newDayDiv);
//  }
  
//  -----------------------
// function addlist() {
//	
//      var newItem = document.createElement("li");
//      newItem.innerHTML = `
//        <div class="listtitlewrap">
//          <div class="listtitle">${name}</div>
//          <div class="listremove" onclick="removeListItem(this)">삭제</div>
//        </div>
//        <div class="details">
//          <div class="categories">
//
//          </div>
//          <div class="btns">
//            <button style="float: left;" onclick="openModal()" class="addmemo100">메모추가</button>
//            <button style="margin-left: 70px;" onclick="openMoneyModal()" class="addmoney">가계부추가</button>
//          </div>
//        </div>
//      `;
//       var ul = document.createElement('ul');
//		ul.appendChild(newItem);
//
//      // memos 안의 li 요소 삭제
//      var memos = newItem.querySelector(".memos");
//      if (memos) {
//        memos.remove();
//      }
//
//      // 선택한 날짜와 일치하는 날짜의 밑에 추가
//      var dateElements = document.querySelectorAll(".dayswrap > div");
//      var selectedDate = document.getElementById("selectedDate").value;
//      for (var i = 0; i < dateElements.length; i++) {
//		var dateElement = dateElements[i];
//		var dateLabel = dateElement.querySelector(".days");
//		var formattedDate = dateLabel ? dateLabel.textContent.trim() : "";
//  	if (formattedDate === selectedDate) {
//    	dateElement.appendChild(ul);
//    break;
//        }
//      }
//
//      $(document).on("click", ".memo", function() {
//        var memo_id = $(this).data("id");
//        var memo_title = $(this).find(".memo-title").text();
//        var memo_content = $(this).find(".memo-content").text();
//
//        $("#modal-memo-id").val(memo_id);
//        $("#modal-memo-title").val(memo_title);
//        $("#modal-memo-content").val(memo_content);
//
//        $("#modal-memos").modal("show");
//      });
//    	console.log(selectedDate);
//    	console.log(formattedDate);
//    
//
//    };
//  -------------------------------
//  });
//  console.log(addlist);
//} 
  
//function addlist(name) {
//  $.ajax({
//    url: "travel_sch_mng3.jsp",
//    type: "get",
//    data: { name: name },
//    success: function(result2) {
//      var loc_filter = result2.split('#$%')[0].trim();
//      console.log(loc_filter);
//      var loc_loc = result2.split('#$%')[1];
//      console.log(loc_loc);
//
//      var newItem = document.createElement("li");
//      newItem.innerHTML = `
//        <div class="listtitlewrap">
//          <div class="listtitle">${name}</div>
//          <div class="listremove" onclick="removeListItem(this)">삭제</div>
//        </div>
//        <div class="details">
//          <div class="categories">
//            <div>${loc_filter} ·  ${loc_loc}</div>
//          </div>
//          <div class="btns">
//            <button style="float: left;" onclick="openModal()" class="addmemo100">메모추가</button>
//            <button style="margin-left: 70px;" onclick="openMoneyModal()" class="addmoney">가계부추가</button>
//          </div>
//        </div>
//      `;
//
//      // memos 안의 li 요소 삭제
//      var memos = newItem.querySelector(".memos");
//      if (memos) {
//        memos.remove();
//      }
//
//      var list = document.querySelector("#schlist ul");
//      list.appendChild(newItem);
//
//      $(document).on("click", ".memo", function() {
//        var memo_id = $(this).data("id");
//        var memo_title = $(this).find(".memo-title").text();
//        var memo_content = $(this).find(".memo-content").text();
//
//        $("#modal-memo-id").val(memo_id);
//        $("#modal-memo-title").val(memo_title);
//        $("#modal-memo-content").val(memo_content);
//
//        $("#modal-memos").modal("show");
//      });
//    }
//  });
//}


//            function addlist(name){
//
//                var plusUl = document.createElement("ul");
//                var newLi =          "<li>" 
//                    + "<div class='listtitlewrap'>"
//                    +"    <div class='listtitle' id='hoianresort'>"                      
//                    +    name
//                    +    "</div>"
//                    +    "<div class='listremove' onclick='removeListItem(this)'>"
//                    +    "삭제"
//                    +    "</div>"
//                    +    "</div>"
//                    +    "<div class='details'>"
//                    +        "<div class='memos'>"
//                    +          "<ul>"
//                    +         "</ul>"
//                    +        "</div>"
//                    +        "<div class='btns'>"
//                    +         "<button id='addmemo1' onclick='openModal()'>메모추가</button>"
//                    +"<div id='memo-modal' class='modal'>"
//                    +"    <div class='modal-content'>"
//                    +"                 <label for='memo-textarea' style ='font-size : 15px;'>메모</label>"
//                    +"                  <textarea id='memo-textarea' style='margin : 0 10px 10px 10px;'></textarea>"
//                    +"                   <div class ='confirmnclose'>"
//                    +"                        <div class='close' onclick='addMemo()' style='float : left;'>확인</div>"
//                    +"                        <div class='close' onclick='closeModal()' style = 'float:right;'>취소</div>"
//                    +"                    </div>"
//                    +"              </div>"
//                    +"        </div> "
//                    +         "<button class = 'addmoney' style ='margin-left : 70px;' id='moneymodal' onclick='openMoneyModal()'>가계부추가</button>"
//                    +        "</div>"
//                    +    "</div>"
//                    +"</li>   "
//                plusUl.innerHTML = newLi;
//                console.log(plusUl);
//                //console.log(document.getElementById("schlist"));
//                document.getElementById("schlist").appendChild(plusUl);
//
//          $(document).on('click', '.memo', function() {
//                var memo_id = $(this).data('id');
//                var memo_title = $(this).find('.memo-title').text();
//                var memo_content = $(this).find('.memo-content').text();
//  
//                 $('#modal-memo-id').val(memo_id);
//                 $('#modal-memo-title').val(memo_title);
//                 $('#modal-memo-content').val(memo_content);
//  
//                $('#modal-memos').modal('show');
//                    });
//            }




            function removedivs(button){
                const divToRemove = button.parentNode;
                const container = document.getElementById("container");
                container.removeChild(divToRemove);
               const removeButton = document.getElementById("remove");
                 removeButton.onclick = function() {
                 }
            }

            function removeListItem(el) {
                 var li = el.parentNode.parentNode; // 부모 노드(li)를 찾기 위해 두 번의 parentNode 호출
                    li.parentNode.removeChild(li); // 부모 노드에서 해당 li를 삭제
                }


//function openModal(memId) {
//  var background = document.querySelector(".background");
//  background.classList.add("show");
//  var memoDiv = document.getElementById(memId);
//}



function closeModal() {
  var background = document.querySelector(".background");
  background.classList.remove("show");
}


//
//          function openModal() {
//                var modal = document.getElentById("memo-modal");
//                 document.querySelector(".background").classList.toggle("show");
//                }
//
//
//				var memoButton = document.querySelector(".addmemo100");
//				
////				var memoButton = document.getElementById("addmemo100");
//				memoButton.addEventListener("click", function(event) {
//		  		event.preventDefault();
//	 			// TODO: li 요소를 생성하고, 날짜에 맞는 div에 추가하는 코드
//	 			// 마지막으로 새로 생성한 li 요소에 대해 onclick 이벤트 핸들러를 추가
//	 			modal.style.display = "block"; 
//				});           


//function openModal() {
//  var modal = document.getElementById("memo-modal");
//  $("#memo-modal").show();
//}
//
//function addMemoToItem() {
//  // TODO: li 요소를 생성하고, 날짜에 맞는 div에 추가하는 코드
//  // 마지막으로 새로 생성한 li 요소에 대해 onclick 이벤트 핸들러를 추가
//  openModal();
//}
//
//var memoButtons = document.querySelectorAll(".addmemo100");
//memoButtons.forEach(function(memoButton) {
//  memoButton.addEventListener("click", function(event) {
//    event.preventDefault();
//    addMemoToItem();
//  });
//});


                
                 function openMoneyModal() {
                	  var modal = document.getElementById("moneyback");
                	  modal.classList.add("show");
                	}
   
                function addMemo() {
                var memo = document.getElementById("memo-textarea").value;
                var memos = document.querySelectorAll(".memos ul")[0];
                var li = document.createElement("li");
                li.textContent = memo;
                memos.appendChild(li);
                closeModal();
                document.getElementById("memo-textarea").value = ""

                }
//
//                function closeModal() {
//                    var memo = document.getElementById("memo-textarea").value;
//                    var modal = document.getElementById("memo-modal");
//                    var memoInput = document.getElementById("memoInput");
//                    memo =""; 
//                    modal.style.display = "none";
//                     $(".addmemo1").show();
//                }


	function addDays(){
		const fromDate = newDate(document.getElementById(""))
	}
                

//background를 찾아서 class show를 붙였다 뗐다                
//	function show() {
//		  document.querySelector(".background").classList.toggle("show");
//		}

	function close() { 
		  document.querySelector(".background").classList.remove("show");
		}
	
	
// 	esc를 눌렀을 때 모달창이 닫히게 하는 기능 
    window.addEventListener("keydown", function (event) {
        if (event.key === "Escape" && document.querySelector(".background").classList.contains("show")) {
        	document.querySelector(".background").classList.remove("show");
        }
      });

    window.addEventListener("keydown", function (event) {
        if (event.key === "Escape" && document.getElementById("moneyback").classList.contains("show")) {
        	document.getElementById("moneyback").classList.remove("show");
        }
      });


       
           const addMoneyButtons = document.querySelectorAll('.addmoney');
    for (let i = 0; i < addMoneyButtons.length; i++) {
      addMoneyButtons[i].addEventListener('click', show);
    }

    const closeButtons = document.querySelectorAll('.close');
    for (let i = 0; i < closeButtons.length; i++) {
      closeButtons[i].addEventListener('click', close);
    }
    
    
    const addMemo100Buttons = document.querySelectorAll('.addmemo100');
    for (let i = 0; i < addMoneyButtons.length; i++) {
      addMemo100Buttons[i].addEventListener('click', show);
    }
//    
//    document.getElementById("addmemo1").addEventListener("click", function() {
//        document.getElementById("memo-textarea").focus();
//          });
//    

//var button = document.getElementById('button');
//button.addEventListener('click', danangcathedral);
//function danangcathedral(){
//	
//}




//function locinfo(loc2_name) {
//	
////			$('#background').fadeIn(200);
//			$('#front').fadeIn(200);
//			$('body').addClass('modal-open');
//
//
//		var map = new google.maps.Map(document.getElementById("map"), {});
//		var marker = new google.maps.Marker({});
//
//			$.ajax({
//				url : "travelSchMng.bo",
//				type : "get",
//				data : {
//						loc2_name : loc2_name
//				},
//				datatype: "Array",
//				success : function(result2) {
//					var loc_name1 = result2.split('#$%')[0].trim();
//					var loc_filter = result2.split('#$%')[1];
//					var loc_name_lang = result2.split('#$%')[2];
//					var loc_exp = result2.split('#$%')[3];
//					var loc_addr = result2.split('#$%')[4];
//					var loc_webp = result2.split('#$%')[5];
//					var loc_hour = result2.split('#$%')[6];
//					var loc_phone = result2.split('#$%')[7];
//					var loc_loc = result2.split('#$%')[8];
//					var loc_lat = parseFloat(result2.split("#$%")[9]); // 실수형으로 변환
//					var loc_lng = parseFloat(result2.split("#$%")[10]); // 실수형으로 변환
//					var hours = loc_hour.split(',');					
//					var mon = hours[0];
//					var tue = hours[1];
//					var wed = hours[2];
//					var thur = hours[3];
//					var fri = hours[4];
//					var sat = hours[5];
//					var sun = hours[6];
//													
//			            document.getElementById("photo2").style.backgroundImage = "url('./schmngimgs/"+ loc_name1 + ".jpg')";
//			            document.getElementById("loc1").innerText = loc_name1;
//			            document.getElementById("loc2").innerText = loc_name_lang;
//			            document.getElementById("description").innerText = loc_exp;
//			            	if(loc_filter == 1)
//					            document.getElementById("category").innerText = "식당";			            		
//			            	else if(loc_filter ==2)
//					            document.getElementById("category").innerText = "카페";
//			            	else if(loc_filter ==3)
//					            document.getElementById("category").innerText = "관광";
//			            	else if(loc_filter ==4)
//					            document.getElementById("category").innerText = "쇼핑";
//			            	else if(loc_filter ==5)
//					            document.getElementById("category").innerText = "숙소";			            		
//			            document.getElementById("addr").innerText = loc_addr;
//			            document.getElementById("mon").innerText = mon;
//			            document.getElementById("tue").innerText = tue;
//			            document.getElementById("wed").innerText = wed;
//			            document.getElementById("thur").innerText = thur;
//			            document.getElementById("fri").innerText = fri;
//			            document.getElementById("sat").innerText = sat;
//			            document.getElementById("sun").innerText = sun;
//			            document.getElementById("webp").innerText = loc_webp;
//			            document.getElementById("phone").innerText = loc_phone;
//						
//						console.log(loc_lat);
//						console.log(loc_name1);
//						var la = { lat: loc_lat, lng: loc_lng };
//						map.panTo(la);
//						map.setZoom(18);	
//						
//						var marker = new google.maps.Marker({
//							position: la,
//							map: map,
//							title: loc_name1
//						});											
//				}
//			});
//		};




 function filter() {
    var searchvalue, name, item, i;

    searchvalue = document.getElementById("searchvalue").value;
    item = document.getElementsByClassName("recpicntwrap");
	
    for (i = 0; i < item.length; i++) {
      name = item[i].querySelectorAll(".locnameandpic > .recinfo");
      if (name[0].innerHTML.indexOf(searchvalue) > -1) {
        item[i].style.display = "flex";
      } else {
        item[i].style.display = "none";
      }
    }

  };



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


//왼쪽 사이드바를 접는 함수
$(document).ready(function() {
  $(".hidesidebar").click(function() {
    $(".leftsidebar").toggleClass("active");
    $(".leftarrow").toggleClass("rotate");
  });
});

//오른쪽 사이드바를 접는 함수	
$(document).ready(function() {
  $(".hidesidebar-right").click(function() {
    $(".rightsidebar").toggleClass("active");
    $(".leftarrow").toggleClass("rotate");
  });
});	






