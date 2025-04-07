<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>  
<%@page import="java.sql.*"%>
<%
   String mem_nick = request.getParameter("mem_nick");
   Connection conn=null;
   Statement stmt = null;

   try {
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamproject","root","1234");
      if(conn == null)
         throw new Exception("데이터베이스에 연결할 수 없습니다");
      stmt = conn.createStatement();

      ResultSet rs = stmt.executeQuery("select * from mem_account where mem_nick = '" + mem_nick + "';");
      String result ="OK";
   if(rs.next())
   		result = "DUP";
      out.println(result);

      
      } finally {
         try {
            stmt.close();
         } catch (Exception ignored){
         }
            try {
            conn.close();
         } catch(Exception ignored){
         }
   } 
   // RequestDispatcher dis = request.getRequestDispatcher("join001.jsp");
   //    dis.forward(request, response);
%>