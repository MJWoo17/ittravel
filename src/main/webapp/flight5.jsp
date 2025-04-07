<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta charset="utf-8">
        <title>가는 편 좌석 선택창</title>
        <link rel="stylesheet" href="./css/flight5.css">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
        <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="//code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
        </script> 
          <script src="./js/flight5.js"></script>
    </head>
    <style type="text/css">
    </style>
<body>
<!-- 헤더 -->
<jsp:include page="header.jsp"></jsp:include>
<div class="divwrap1"> <!-- 좌석 선택 전체 배경?  -->
<div class="divwrap2"> <!-- 비행기 창과 같이 만든 부분 -->
<div class="divwrap3"> <!-- 좌석 배치  -->
<div class="divwrap4">
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
</div>
<div class="divwrap5">
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
</div>
<div class="divwrap5">
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
</div>
<div class="divwrap5">
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
</div>
<div class="divwrap5">
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
<div class="divwrap4_1">
<div class="divwrap4_2">
</div>
</div>
</div>
</div>
</div>
</div>
<!-- 항공창 예약 진행 하단 배너 -->
<div class="divbottom1">
<div class="divbottom2">
<div class="divbottom2_1">
<div class="divbottom2_1_1">
예상 결제 금액 
</div>
</div>
<div class="divbottom2_2">
<div>
</div>
<div class="divbottom2_2_1">
55000<!-- 나중에 값 받아서 처리 -->
</div>
<div class="divbottom2_2_2">
원
</div>
</div>
<div class="divbottom2_3" onclick="location.href='flight3.jsp'">
<div class="divbottom2_3_1">
다음<!-- 왕복이면 오는날 비행기 조회 페이지로 보냄 -->
</div>
</div>
</div>
</div>
</body>
</html>