<%@page import="dao.BoardDao"%>
<%@page import="javax.swing.border.Border"%>
<%@page import="dao.FlightDao"%>
<%@page import="java.util.Vector"%>
<%@page import="dto.Airinfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>항공편 조회 결과</title>
</head>
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
%>
<h1>항공편 조회 결과</h1>
<table border="1">
  <tr>
    <th>항공편 번호</th>
    <th>출발지</th>
    <th>출발 날짜</th>
    <th>도착지</th>
    <th>도착 날짜</th>
    <th>기종</th>
    <th>항공사명</th>
  </tr>
  <%
 
  	
  FlightDao fd = new FlightDao();
	  Vector<Airinfo> list1 = fd.getList(pageNumber);    
for(int i = 0; i < list1.size(); i++){
	Airinfo ai = list1.get(i);
	
	if(ai.getAir_deppt().equals(air_deppt) && ai.getAir_arrpt().equals(air_arrpt)) {
	    if(air_dday == null || air_dday.isEmpty() || ai.getAir_dday().equals(air_dday)) { // air_deppt로 설정한 값만 가져옴 김포 선택하면 출발지가 김포인 것만
		 /* 날짜까지 포함하면 값이 안나오지만 출발지 도착지 모두 맞으면 검색이 되긴 함. */ 
  %>
  <tr>
    <td><%= ai.getAir_num() %></td>
    <td><%= ai.getAir_deppt() %></td>
    <td><%= ai.getAir_dday() %></td>
    <td><%= ai.getAir_arrpt() %></td>
    <td><%= ai.getAir_aday() %></td>
    <td><%= ai.getAir_model() %></td>
    <td><%= ai.getAir_fligname() %></td>
  </tr>
  <% 
	    } 
	 }
	 } %>
</table>
</body>
</html>