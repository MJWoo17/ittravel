<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="dao.UserDao" %> 

<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="dto.Joininfo"></jsp:useBean>

<jsp:setProperty property="*" name="user"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 확인</title>
</head>
<body>
<% 
	UserDao ud = new UserDao();
	int result = ud.join(user);
	
	if(result >= 1){
		 PrintWriter script = response.getWriter();
		 script.println("<script>");
		 script.println("alert('회원가입이 완료되었습니다.')");
		 script.println("location.href = 'index.jsp'");
		 script.println("</script>");
		 
	} else if(result == 0){
		 PrintWriter script = response.getWriter();
		 script.println("<script>");
		 script.println("alert('이미 존재하는 아이디입니다.')");
		 script.println("history.back()");
		 script.println("</script>");
	}

%>
</body>
</html>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@page import ="dto.N_MD" %>
	<%@page import="dao.N_controller" %>
	<%@page import ="dto.Join_MD" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<jsp:useBean id="user" class= "dao.N_controller"/>

<body>



<header>
   <jsp:include page="header.jsp" />
</header>

<% 
request.setCharacterEncoding("utf-8");



	Join_MD md = new Join_MD();

    String mem_id = request.getParameter("mem_id");
    String mem_pw = request.getParameter("mem_pw");
    String pwdcheck = request.getParameter("pwdcheck");
    String mem_name = request.getParameter("mem_name");
    String mem_nick = request.getParameter("mem_nick");
    String mem_birthyear = request.getParameter("mem_birthyear");
	String mem_birthmonth = request.getParameter("mem_birthmonth");
    String mem_birthday = request.getParameter("mem_birthday");
    String mem_email1 = request.getParameter("mem_email1");
    String mem_email2 = request.getParameter("mem_email2");
    String postal_code = request.getParameter("postal_code");
    String addr = request.getParameter("addr");
    String extra_addr = request.getParameter("extra_addr");
    String refer_addr = request.getParameter("refer_addr");
    String mem_mobile1 = request.getParameter("mem_mobile1");
    String mem_mobile2 = request.getParameter("mem_mobile2");
    String mem_mobile3 = request.getParameter("mem_mobile3");
    String mem_sex = request.getParameter("mem_sex");
    //String subscribe = request.getParameter("subscribe");
    String mem_news[] = request.getParameterValues("mem_news");
    String mem_newsstr="";
    for(int i=0; i<mem_news.length; i++){
       mem_newsstr = mem_newsstr + mem_news[i]+" ";
    }


    //객체에 id 정보를 설정한다. 
    md.setMem_id(mem_id); //객체에 password 정보를 설정한다. 
   	md.setMem_pw(mem_pw);
   	md.setMem_name(mem_name);
   	md.setMem_nick(mem_nick);
  	md.setMem_birthyear(mem_birthyear);
  	md.setMem_birthmonth(mem_birthmonth);
  	md.setMem_birthday(mem_birthday);
  	md.setMem_email1(mem_email1);
  	md.setMem_email2(mem_email2);
  	md.setPostal_code(postal_code);
  	md.setAddr(addr);
  	md.setExtra_addr(extra_addr);
  	md.setRefer_addr(refer_addr);
  	md.setMem_mobile1(mem_mobile1);
  	md.setMem_mobile2(mem_mobile2);
  	md.setMem_mobile3(mem_mobile3);
  	md.setMem_sex(mem_sex);
  	md.setMem_news(mem_newsstr);
	
	user.join_insert(md);
	
	//response.sendRedirect("N_list.jsp"); //form 버튼 없이 페이지를 넘겨준다. 
	


%>

<script>
alert("가입되었습니다.");
location.href = "Mainindex.jsp"; // N_list.jsp로 이동

</script>

<footer>
   <jsp:include page="footer.jsp"/>
	</footer>



</body>
</html> --%>