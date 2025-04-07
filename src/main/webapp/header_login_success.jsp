<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
     <%
     
     request.setCharacterEncoding("utf-8");
     String nick = (String) session.getAttribute("NICK"); //getAttribute (NICK)으로 설정한거 가져옴. String nick으로 저장함.
     //String id = (String) session.getAttribute("ID");
     
     
     out.println(nick);
      //String id = request.getParameter("mem_id"); //설정해놓은 name을 이용하여 값을 가져온다. String id에 가져온 값을 넣어놓음. 

      //session.setAttribute("IDa",id);

      //String으로 설정한 id를 다시 "IDa"로 설정한거. 이해 잘되게 일부러 다르게 설정해놓았음

      // 뒤파일 login3.jsp 에서 가져올 때는 session.getAttribute("key값") 으로 하면 된다.   ??
    		  
      %>
      