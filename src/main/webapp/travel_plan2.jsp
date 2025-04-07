<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="UTf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="java.sql.*"%>

<script>
function addDays() {
  const fromDate = new Date(document.getElementsByName("depdate")[0].value);
  const toDate = new Date(document.getElementsByName("arrdate")[0].value);
  const days = Math.ceil((toDate - fromDate) / (1000 * 60 * 60 * 24));
  console.log(toDate-fromDate);

  const daysDiv = document.getElementById("days");
  daysDiv.innerHTML = "";
  for (let i = 1; i <= days; i++) {
    const dayDiv = document.createElement("div");
    dayDiv.id = "Day" + i;
    dayDiv.textContent = "Day " + i;
    daysDiv.appendChild(dayDiv);
  }
}

document.getElementsByName("depdate")[0].addEventListener("change", addDays);
document.getElementsByName("arrdate")[0].addEventListener("change", addDays);

var cityName = document.getElementsByTagName("h3")[0].innerHTML;
sessionStorage.setItem("cityName", cityName);

</script>

<%

	String city_name = request.getParameter("coouncity");
	Connection conn=null;
	Statement stmt = null;
	String result ="OK";

   try {
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamproject","root","1234");
      
      if(conn == null)
         throw new Exception("데이터베이스에 연결할 수 없습니다");
      
      stmt = conn.createStatement();   
      String city_eng = null;
      
      ResultSet rs = stmt.executeQuery("select city_eng from city_name where city_name = '" + city_name + "';");
      if(rs.next()){
         city_eng = rs.getString("city_eng");
         session.setAttribute("city_eng", city_eng);
      }
   }finally {
         try {
            stmt.close();
         } catch (Exception ignored){
         }
            try {
            conn.close();
         } catch(Exception ignored){
         }
   } 

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date fromDate = sdf.parse(request.getParameter("depdate"));
	Date toDate = sdf.parse(request.getParameter("arrdate"));

	long diffInMllies = Math.abs(toDate.getTime()-fromDate.getTime());
	long diff = TimeUnit.DAYS.convert( diffInMllies, TimeUnit.MILLISECONDS);
	
	
  // 선택한 날짜를 session 객체에 저장
  
  String destination = request.getParameter("coouncity");
  String smalltravel1 = request.getParameter("smalltravel1");
  String smalltravel2 = request.getParameter("smalltravel2");
  String fromDate1 = request.getParameter("depdate");
  String toDate1 = request.getParameter("arrdate");
  int howmany = Integer.parseInt(request.getParameter("howmany")); // input의 value 값 가져오기
  
  session.setAttribute("howmany", howmany);
  session.setAttribute("smalltravel1", smalltravel1);
  session.setAttribute("smalltravel2", smalltravel2);  
  session.setAttribute("fromDate", fromDate1);
  session.setAttribute("toDate", toDate1);
  session.setAttribute("coouncity", destination);
  session.setAttribute("diff",(int)diff); 
  session.setAttribute("howmany", howmany);
  response.sendRedirect("travel_sch_mng.jsp");
  %>
   
