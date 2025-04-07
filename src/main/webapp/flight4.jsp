<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>수하물</title> 
        <link rel="stylesheet" href="./css/flight4.css">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
        <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="//code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
        </script> 
        <script src="./js/flight4.js"></script>
    </head>
    <style type="text/css">
    </style>
<body>
<!-- 헤더 -->
<jsp:include page="header.jsp"></jsp:include>
<div class="divwrap1"> 
<div class="divwrap2"><!-- 수하물 제목 -->
<div class="divwrap3">
위탁 수하물
</div>
<div class="divwrap4">
추가 수하물로 마음까지 넉넉한 여행
</div>
</div>
<div class="divwrap5"><!-- 수하물 선택  -->
<div class="divwrap6">
<div class="divwrap7">
<div class="divwrap8">
<div class="divwrap9">
<div class="divwrap10">
15KG
</div>
<div class="divwrap11">
운임에 포함
</div>
</div>
<div class="divwrap12">
0원
</div>
</div>
</div>
<div class="divwrap7">
<div class="divwrap8">
<div class="divwrap9">
<div class="divwrap10">
+5KG
</div>
</div>
<div class="divwrap12">
8,000원
</div>
</div>
</div>
<div class="divwrap7">
<div class="divwrap8">
<div class="divwrap9">
<div class="divwrap10">
+10KG
</div>
</div>
<div class="divwrap12">
16,000원
</div>
</div>
</div>
</div>
<div class="divwrap6">
<div class="divwrap7">
<div class="divwrap8">
<div class="divwrap9">
<div class="divwrap10">
+15KG
</div>
</div>
<div class="divwrap12">
24,000원
</div>
</div>
</div>
<div class="divwrap7">
<div class="divwrap8">
<div class="divwrap9">
<div class="divwrap10">
+20KG
</div>
</div>
<div class="divwrap12">
32,000원
</div>
</div>
</div>
<div class="divwrap7">
<div class="divwrap8">
<div class="divwrap9">
<div class="divwrap10">
+25KG
</div>
</div>
<div class="divwrap12">
40,000원
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