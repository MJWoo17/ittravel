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
    
         			<div class="select_area2">
         					<label class="come1"> 출발지 </label>
                            <select class="select1" name="air_deppt">
                              <option value="0" selected> 선택 </option>
                              <option value="CJU">제주</option>
                              <option value="PUS">김해/부산</option>
                              <option value="GMP">김포</option>
                              <option value="ICN">인천</option>
                              <option value="KWJ">광주</option>
                              <option value="RSU">여수</option>
                              <option value="USN">울산</option>
                              <option value="YNY">양양</option>
                              <option value="OSA">오사카</option>
                              <option value="NRT">도쿄(나리타)</option>
                              <option value="HND">도쿄(하네다)</option>
                              <option value="FUK">후쿠오카</option>
                              <option value="OKA">오키나와</option>
                              <option value="SPK">삿포로</option>
                              <option value="DAD">다낭</option>
                              <option value="BKK">방콕</option>
                              <option value="HKG">홍콩</option>
                              <option value="TPE">타이베이</option>
                              <option value="SGN">호치민시</option>
                              <option value="MNL">마닐라</option>
                              <option value="CEB">세부</option>
                              <option value="HAN">하노이</option>
                              <option value="SIN">싱가포르</option>
                              <option value="BKI">코타키나발루</option>
                              <option value="NHA">나트랑</option>
                              <option value="KUL">쿠알라룸푸르</option>
                              <option value="SHA">상하이</option>
                              <option value="TAO">청도</option>
                              <option value="CAN">광저우</option>
                              <option value="PEK">베이징</option>
                              <option value="LAX">로스앤젤레스</option>
                              <option value="HNL">하와이(호놀룰루)</option>
                              <option value="JFK">뉴욕</option>
                              <option value="YVR">밴쿠버</option>
                              <option value="SFO">샌프란시스코</option>
                              <option value="YYZ">토론토</option>
                              <option value="CDG">파리</option>
                              <option value="LHR">런던</option>
                              <option value="VVO">블라디보스토크</option>
                              <option value="FCO">로마</option>
                              <option value="PRG">프라하</option>
                              <option value="BCN">바르셀로나</option>
                              <option value="GUM">괌</option>
                              <option value="SYD">시드니</option>
                              <option value="MEL">멜버른</option>
                              <option value="BNE">브리즈번</option>
                              <option value="SPN">사이판</option>
                              <option value="AKL">오클랜드</option>
                              </select>
                              
                              <label class="come2" > 도착지 </label>
                              <select class="select2" name="air_arrpt">
                              <option value="0" selected> 선택 </option>
                              <option value="CJU">제주</option>
                              <option value="PUS">김해/부산</option>
                              <option value="GMP">김포</option>
                              <option value="ICN">인천</option>
                              <option value="KWJ">광주</option>
                              <option value="RSU">여수</option>
                              <option value="USN">울산</option>
                              <option value="YNY">양양</option>
                              <option value="OSA">오사카</option>
                              <option value="NRT">도쿄(나리타)</option>
                              <option value="HND">도쿄(하네다)</option>
                              <option value="FUK">후쿠오카</option>
                              <option value="OKA">오키나와</option>
                              <option value="SPK">삿포로</option>
                              <option value="DAD">다낭</option>
                              <option value="BKK">방콕</option>
                              <option value="HKG">홍콩</option>
                              <option value="TPE">타이베이</option>
                              <option value="SGN">호치민시</option>
                              <option value="MNL">마닐라</option>
                              <option value="CEB">세부</option>
                              <option value="HAN">하노이</option>
                              <option value="SIN">싱가포르</option>
                              <option value="BKI">코타키나발루</option>
                              <option value="NHA">나트랑</option>
                              <option value="KUL">쿠알라룸푸르</option>
                              <option value="SHA">상하이</option>
                              <option value="TAO">청도</option>
                              <option value="CAN">광저우</option>
                              <option value="PEK">베이징</option>
                              <option value="LAX">로스앤젤레스</option>
                              <option value="HNL">하와이(호놀룰루)</option>
                              <option value="JFK">뉴욕</option>
                              <option value="YVR">밴쿠버</option>
                              <option value="SFO">샌프란시스코</option>
                              <option value="YYZ">토론토</option>
                              <option value="CDG">파리</option>
                              <option value="LHR">런던</option>
                              <option value="VVO">블라디보스토크</option>
                              <option value="FCO">로마</option>
                              <option value="PRG">프라하</option>
                              <option value="BCN">바르셀로나</option>
                              <option value="GUM">괌</option>
                              <option value="SYD">시드니</option>
                              <option value="MEL">멜버른</option>
                              <option value="BNE">브리즈번</option>
                              <option value="SPN">사이판</option>
                              <option value="AKL">오클랜드</option>
                              </select>
                            </div>

</body>
</html>