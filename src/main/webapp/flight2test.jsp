<%@page import="dao.BoardDao"%>
<%@page import="javax.swing.border.Border"%>
<%@page import="dao.FlightDao"%>
<%@page import="java.util.Vector"%>
<%@page import="dto.Airinfo"%>
<%@page import="java.sql.Time" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>왕복 (가는날)</title>
        <link rel="stylesheet" href="./css/flight2.css">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
        <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="//code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/smoothness/jquery-ui.css">
        </script> 
        <script src="./slick-1.8.1/slick/slick.min.js">
        </script>
        <script src="./js/flight2.js"></script>
    </head>
    <style type="text/css">
    </style>
<body>
<%
int pageNumber = 1; // 기본 페이지, 기본적으로 페이지는 1부터 시작
if(request.getParameter("pageNumber") != null){
	// 정수형으로 타입 변경
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}

	String air_arrpt = null;
	if(session.getAttribute("air_arrpt") != null){
		air_arrpt = (String)session.getAttribute("air_arrpt");
	}
	String air_deppt = null;
	if(session.getAttribute("air_deppt") != null){
		air_deppt = (String)session.getAttribute("air_deppt");
	}
	
	String air_dday = null;
	if(session.getAttribute("air_dday") != null){
		air_dday = (String)session.getAttribute("air_dday");
	}
	
	String air_aday = null;
	if(session.getAttribute("air_aday") != null){
		air_aday = (String)session.getAttribute("air_aday");
	}
	
	Time air_dday_time = null;
	if(session.getAttribute("air_dday_time") != null){
	    // 문자열로부터 Time으로 변환
	    air_dday_time = Time.valueOf((String)session.getAttribute("air_dday_time"));
	}
	
	Time air_aday_time = null;
	if(session.getAttribute("air_aday_time") != null){
	    // 문자열로부터 Time으로 변환
	    air_aday_time = Time.valueOf((String)session.getAttribute("air_aday_time"));
	}
	
	String air_model = null;
	if(session.getAttribute("air_model") != null){
		air_model = (String)session.getAttribute("air_model");
	}
	
	String air_fligname = null;
	if(session.getAttribute("air_fligname") != null){
		air_fligname = (String)session.getAttribute("air_fligname");
	}
	
	int air_price = 0; // 기본 페이지, 기본적으로 페이지는 1부터 시작
	if(request.getParameter("air_price") != null){
		// 정수형으로 타입 변경
		air_price = Integer.parseInt(request.getParameter("air_price"));
	}
	int air_time_minute; // 기본 페이지, 기본적으로 페이지는 1부터 시작
	if(request.getParameter("air_time_minute") != null){
		// 정수형으로 타입 변경
		air_time_minute = Integer.parseInt(request.getParameter("air_time_minute"));
	
	}
%>
<!-- 헤더 -->
<jsp:include page="header.jsp"></jsp:include>

<div class="divwrap1"> <!-- 가장 큰 틀 -->
<div class="divwrap2"> <!-- 상단 배너 -->
<div class="divwrap2_1">
<div class="divwrap2_1_1">
<%= air_deppt %>
</div>
<div class="divwrap2_1_2">
->
</div>
<div class="divwrap2_1_1">
<%= air_arrpt %>
</div>
</div>
<div class="divwrap2_2">
<div class="divwrap2_1_1">
<%= air_dday %>
</div>
<div class="divwrap2_1_2">
->
</div>
<div class="divwrap2_1_1">
<%= air_aday %>
</div>
</div>
<div class="divwrap2_3">
성인 1
</div>
</div>
<!-- 상단 배너 끝  / 항공 조회표? 시작-->
 <%
 
  	
  FlightDao fd = new FlightDao();
	  Vector<Airinfo> list1 = fd.getList(pageNumber);    
for(int i = 0; i < list1.size(); i++){
	Airinfo ai = list1.get(i);
	
	if(ai.getAir_deppt().equals(air_deppt) && ai.getAir_arrpt().equals(air_arrpt)) {
	    if(air_dday == null || air_dday.isEmpty() || ai.getAir_dday().equals(air_dday)) { // air_deppt로 설정한 값만 가져옴 김포 선택하면 출발지가 김포인 것만
		 /* 날짜까지 포함하면 값이 안나오지만 출발지 도착지 모두 맞으면 검색이 되긴 함. */ 
  %>
<div class="divwrap3">
<div class="divwrap4">
<div class="divwrap4all">
<div class="divwrap4_1">
<%= ai.getAir_dday_time() %>
</div>
<div class="divwrap4_2">
<div class="divtimewrap2_1">
<div class="divtimewrap2">
<%
//ai.getAir_duration()는 분 단위로 저장된 소요시간 값입니다.
int duration = ai.getAir_time_minute();
int hours = duration / 60; // 시간 계산
int minutes = duration % 60; // 분 계산
%>
<%= hours %>
</div>
<div class="divtimewrap2">
시간
</div>
<div class="divtimewrap2">
<%= minutes %>
</div>
<div class="divtimewrap2">
분
</div>
</div>
<img src="./flightimgs/예약조회화살표.svg" >
</div>
<div class="divwrap4_3">
<%= ai.getAir_aday_time() %>
</div>
</div>
<div class="divwrap4all2">
<div class="divwrap4_4">
<%= ai.getAir_model() %> / <%=ai.getAir_fligname() %>
</div>

</div>
</div>
<div class="divwrap5" tabindex="0">
<div class="divwrap5_1">
<%= ai.getAir_price() %> <!-- 나중에 값 받아서 처리 -->
</div>
<div class="divwrap5_2">
원
</div>
</div>
</div>
  <% 
	    } 
	 }
	 } %>

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
<%= air_price%> <!-- 나중에 값 받아서 처리 -->
</div>
<div class="divbottom2_2_2">
원
</div>
</div>
<div class="divbottom2_3" onclick="location.href='flight3.jsp'">
<div class="divbottom2_3_1">
다음 여정 <!-- 왕복이면 오는날 비행기 조회 페이지로 보냄 -->
</div>
</div>
</div>
</div>
<%-- <!-- 푸터 -->
<jsp:include page="footer.jsp"></jsp:include> --%>
</body>
</html>