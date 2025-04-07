 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.FlightDao" %> 
<%@ page import="dto.Airinfo" %>
<%@ page import="java.sql.Time" %>
<%@ page import="java.util.Vector" %>
<jsp:useBean id="air" class="dto.Airinfo" scope="page"/>  
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
    String air_num = request.getParameter("air_num");
    String air_deppt = request.getParameter("air_deppt");
    String air_dday = request.getParameter("air_dday");
    String air_arrpt = request.getParameter("air_arrpt");
    String air_aday = request.getParameter("air_aday");
    String air_model = request.getParameter("air_model");
    String air_fligname = request.getParameter("air_fligname");
    String air_dday_time_str = request.getParameter("air_dday_time");
    String air_aday_time_str = request.getParameter("air_aday_time");
    Time air_dday_time = null;
    Time air_aday_time = null;
    if (air_dday_time_str != null && !air_dday_time_str.isEmpty()) {
        air_dday_time = Time.valueOf(air_dday_time_str);
    }
    if (air_aday_time_str != null && !air_aday_time_str.isEmpty()) {
        air_aday_time = Time.valueOf(air_aday_time_str);
    }
    String air_time_minute = request.getParameter("air_time_minute");
    String air_price = request.getParameter("air_price");
    
    
    FlightDao fd = new FlightDao();
    Vector<Airinfo> result = fd.pt(air);

        session.setAttribute("air_deppt", air_deppt);
        session.setAttribute("air_arrpt", air_arrpt);
        session.setAttribute("air_dday", air_dday);
        session.setAttribute("air_aday", air_aday);
        session.setAttribute("air_dday_time", air_dday_time);
        session.setAttribute("air_aday_time", air_aday_time);
        session.setAttribute("air_model", air_model);
        session.setAttribute("air_fligname", air_fligname);
        session.setAttribute("air_time_minute", air_time_minute);
        session.setAttribute("air_price", air_price);
        response.sendRedirect("flight2test.jsp");
   
%>

