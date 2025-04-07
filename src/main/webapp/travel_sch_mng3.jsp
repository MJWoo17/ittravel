<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
   String name = request.getParameter("name");
   String loc2_name = name;

   Connection conn = null;
   Statement stmt = null;
   String result = "OK";
   String result2 = null;
   String loc2_cat = null;
   try {
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamproject","root","1234");

      if(conn == null)
         throw new Exception("데이터베이스에 연결할 수 없습니다");

      stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT loc2_filter, loc2_loc FROM loc_info2 WHERE loc2_name = '" + loc2_name + "';");

      if(rs.next()){
          String loc2_filter = rs.getString("loc2_filter");
          	if(loc2_filter.equals("1")){
  				loc2_cat = "맛집";       		
          	}else if(loc2_filter.equals("2")){
          		loc2_cat = "카페";
          	}else if(loc2_filter.equals("3")){
          		loc2_cat = "관광";
          	}else if(loc2_filter.equals("4")){
          		loc2_cat = "쇼핑";
          	}else if(loc2_filter.equals("5")){
          		loc2_cat = "숙소";
          	}          
          String loc2_loc = rs.getString("loc2_loc");      
          result2 = loc2_cat + "#$%" + loc2_loc;
          out.println(result2);
      } else {
          result = "NOT_FOUND";
          out.println(result);
      }

   } catch(Exception e) {
       result = "ERROR";
       e.printStackTrace();
       out.println(result);
   } finally {
       try {
           if(stmt != null) {
               stmt.close();
           }
       } catch(Exception ignored) {}
       try {
           if(conn != null) {
               conn.close();
           }
       } catch(Exception ignored) {}
   }
%>