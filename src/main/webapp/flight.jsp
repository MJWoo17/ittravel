<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>항공 예약</title>
        <link rel="stylesheet" href="./css/flight.css">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
        <link rel="stylesheet" href="./slick-1.8.1/slick/slick.css">
        <link rel="stylesheet" href="./slick-1.8.1/slick/slick-theme.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js">
        
        </script> 
        <script src="./slick-1.8.1/slick/slick.min.js">

        </script>
        <script src="./js/flight.js">

        </script>
    </head>
    <style type="text/css">
    </style>
    <body > 
<jsp:include page="header.jsp"></jsp:include>


     <section>
      <div class="mainflightdiv1">
         <div class="mainflightdiv2">  
            <div class="flightdiv1">
                <div class="searchfield">
                  <div class="flightdiv2">
                    <ul class="tabs">
                      <li class="selected">
                        <a href="#" class="go1 cl1">
                            왕복
                        </a>
                      </li>
                      <li class="selected">
                        <a href="#" class="go1 cl2">
                         편도
                        </a>
                      </li>
                      <li class="selected" >
                        <a href="./many.html" class="go1">
                          다구간
                        </a>
                      </li>
                    </ul>
                    <div class="panels">
                      <div class="panels2">
                        <div>
                          <div class="row">
                            <div class="bowl">
                    
                            </div>
                            <form action="flightAction.jsp" method="post">
                            <!-- 출발지 / 도착지  -->
            				<jsp:include page="flightselectlist.jsp"></jsp:include>
                          
                            <div class="select_area2">
                              <label class="come1"> 가는날</label>
                              <input type="date" class="date1" name="air_dday">
              
                               <label class="come2"> 오는날</label>
                              <input type="date" class="date2" name="air_aday">
                           
                            </div> 

                              <div class="select_area2">
                              <label > 탑승 인원 </label>
                              <select class="personwrap1">
                              <option value="0" selected> 성인</option>
                              <option value="성인1"> 성인 1명</option>
                              <option value="성인2"> 성인 2명 </option>
                              <option value="성인3"> 성인 3명 </option>
                              <option value="성인4"> 성인 4명</option>
                              <option value="성인5"> 성인 5명 </option>
                              <option value="성인6"> 성인 6명 </option>
                              <option value="성인7"> 성인 7명</option>
                              <option value="성인8"> 성인 8명 </option>
                              <option value="성인9"> 성인 9명 </option>
                      
                              </select>
                              <select class="personwrap2">
                              <option value="0" selected> 소아 </option>
                              <option value="소아1"> 소아 1명</option>
                              <option value="소아2"> 소아 2명 </option>
                              <option value="소아3"> 소아 3명 </option>
                              <option value="소아4"> 소아 4명</option>
                              <option value="소아5"> 소아 5명 </option>
                              <option value="소아6"> 소아 6명 </option>
                              <option value="소아7"> 소아 7명</option>
                              <option value="소아8"> 소아 8명 </option>
                              <option value="소아9"> 소아 9명 </option>
                        
                              </select>
                              <select class="personwrap2">
                              <option value="none" selected> 유아 </option>
                             <option value="유아1"> 유아 1명</option>
                              <option value="유아2"> 유아 2명 </option>
                              <option value="유아3"> 유아 3명 </option>
                              <option value="유아4"> 유아 4명</option>
                              <option value="유아5"> 유아 5명 </option>
                              <option value="유아6"> 유아 6명 </option>
                              <option value="유아7"> 유아 7명</option>
                              <option value="유아8"> 유아 8명 </option>
                              <option value="유아9"> 유아 9명 </option>
                          
                              </select>
                              <input type="submit" value="항공권 검색">
                            </div>
							</form>
                          </div>  
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
        </div>


            <ul class="slider">
                <li>
                  <div style="background-image:url('./flightimgs/유럽6.jpg')">
                    <dl class="right">
                    </dl>
                  </div>
                </li>
                <li>
                  <div style="background-image:url('./flightimgs/유럽5.jpg');" >
                    <dl>
                    </dl>
                  </div>
                </li>
                <li>
                  <div style="background-image:url('./flightimgs/유럽7.jpg');">
                    <dl class="right">
                
                    </dl>
                  </div>
                </li>
                <li>
                  <div style="background-image:url('./flightimgs/유럽8.jpg');">
                    <dl>
                
                    </dl>
                  </div>
                </li>
                <li>
                  <div style="background-image:url('./flightimgs/유럽1.jpg');">
                    <dl class="right">
                  
                    </dl>
                  </div>
                </li>
                <li>
                  <div style="background-image:url('./flightimgs/유럽3.jpg');">
                    <dl>
                
                    </dl>
                  </div>
                </li>
              </ul>
        </div>

     </section>

     <section>
        <div class="centerdiv1">
           <div class="wrapdiv1">
          <img src="./flightimgs/배너1100.png" alt="">
      </div>

      <section>
            <div class="wrap4">
            <h2>해외 특가 항공권 ✈ </h2>
            <div class="imgdiv">

              <div class="salediv1">
                 <img src="./flightimgs/뉴욕1.jpg" alt="" >
                 <div class="fontdiv2"> 자유의 나라로 </div>
                  <div class="fontdiv1"> 인천 ↔ 뉴욕 </div>
                <div class="fontdiv3"> 1,096,100원~ </div>
              </div>

                 <div class="salediv1">
                        <img src="./flightimgs/방콕1.jpg" alt="" >
                        <div class="fontdiv2"> 지금 가장 뜨는 곳 </div>
                        <div class="fontdiv1"> 인천 ↔ 방콕 </div>
                        <div class="fontdiv3"> 383,600원~ </div>
              </div>
                 <div class="salediv2">
                        <img src="./flightimgs/하와이1.jpg" alt="" >
                        <div class="fontdiv2"> 휴양이 필요해 </div>
                        <div class="fontdiv1"> 인천 ↔ 하와이 </div>
                        <div class="fontdiv3"> 1,031,400원~ </div>
              </div>
                 <div class="salediv3">
                        <img src="./flightimgs/파리1.jpg" alt="" >
                        <div class="fontdiv2"> MD 강력 추천 </div>
                        <div class="fontdiv1"> 인천 ↔ 파리 </div>
                        <div class="fontdiv3"> 781,300원~ </div>
              </div>
              
            </div>
            
            </div>
        </div>

        <div class="wrap4">
            <h2>국내 특가 항공권 ✈ </h2>
            <div class="imgdiv">
              <div class="salediv1">
                 <img src="./flightimgs/제주도.jpg" alt="" >
                 <div class="fontdiv2"> 제주로 떠나요 </div>
                  <div class="fontdiv1"> 김포 ↔ 제주 </div>
                <div class="fontdiv3"> 90,000원~ </div>
              </div>

                 <div class="salediv1">
                        <img src="./flightimgs/부산.jpg" alt="" >
                        <div class="fontdiv2"> 지금 부산 바다로 </div>
                        <div class="fontdiv1"> 김포 ↔ 부산 </div>
                        <div class="fontdiv3"> 50,000원~ </div>
              </div>
                 <div class="salediv2">
                        <img src="./flightimgs/양양제주.jpg" alt="" >
                        <div class="fontdiv2"> 양양에서 제주로! </div>
                        <div class="fontdiv1"> 양양 ↔ 제주 </div>
                        <div class="fontdiv3"> 90,000원~  </div>
              </div>
                 <div class="salediv3">
                        <img src="./flightimgs/서울서울.jpg" alt="" >
                        <div class="fontdiv2"> 떠나요 서울로 </div>
                        <div class="fontdiv1"> 여수 ↔ 김포 </div>
                        <div class="fontdiv3"> 80,000원~  </div>
              </div>
              
            </div>
            
            </div>
        </div>


           <div class="wrapdiv1_1">
        <img src="./flightimgs/이동봉사1.png" alt="">
    </div>

     </section>
		
		        <div class="floating">
          <img src="./flightimgs/이동봉사 신청.png" style="opacity: 100%;"></a>
          </div>
          
    <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>