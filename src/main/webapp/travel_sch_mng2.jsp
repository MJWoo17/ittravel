<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
   String loc_name_param = request.getParameter("loc_name_param");
   String loc2_name = loc_name_param;

   Connection conn = null;
   Statement stmt = null;
   String result = "OK";
   String result2 = null;

   try {
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamproject","root","1234");

      if(conn == null)
         throw new Exception("데이터베이스에 연결할 수 없습니다");

      stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT loc2_name, loc2_filter, loc2_name_lang, loc2_exp, loc2_addr, loc2_webp, loc2_hour, loc2_phone, loc2_loc, loc2_lat, loc2_lng FROM loc_info2 WHERE loc2_name = '" + loc2_name + "';");

      if(rs.next()){
          String loc2_filter = rs.getString("loc2_filter");
          String loc2_name_lang = rs.getString("loc2_name_lang");
          String loc2_exp = rs.getString("loc2_exp");
          String loc2_addr = rs.getString("loc2_addr");
          String loc2_webp = rs.getString("loc2_webp");
          	if(loc2_webp == null){
       			loc2_webp = ""; 	  
      	    }
          String loc2_hour = rs.getString("loc2_hour");
          	if(loc2_hour == null){
          		loc2_hour="";
          	}
		  String loc2_phone = rs.getString("loc2_phone");
		  	if(loc2_phone == null){
		  		loc2_phone="";
		  	}
		  String loc2_loc = rs.getString("loc2_loc");
		  String loc2_lat = rs.getString("loc2_lat");
		  String loc2_lng = rs.getString("loc2_lng");
		  	result2 = loc2_name + "#$%" + loc2_filter + "#$%" + loc2_name_lang + "#$%" + loc2_exp + "#$%" + loc2_addr + "#$%" + loc2_webp + "#$%" + loc2_hour + "#$%" + loc2_phone + "#$%" + loc2_loc + "#$%"
		  			+ loc2_lat + "#$%"+ loc2_lng;
          
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