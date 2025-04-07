<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.Soc_dto"%>
<%@ page import="dao.Soc_controller"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="board" class="dao.Soc_controller" />

	<%
	request.setCharacterEncoding("utf-8");

	Soc_dto md = new Soc_dto();
	
	String uploadPath = request.getRealPath("/upload"); //첨부파일이 저장되는 곳 -> 프로젝트 폴더를 열면 안됨. tomcat이라는 애를 통해서 프로젝트가 읽히는 중
	//첨부파일은 어디에 있냐면 webapp 서버에 있음. 세션 같은 개념. 서버가 기억해야할 정보임.
	//프로젝트 폴더 전에 metadata라는 폴더가 있음. 그 정보들이 metadata에 들어가니까 metadata를 열것
	//metadata -> plugins -> org.eclipse.wst.server.core
	//폴더 열면 tmp0이라는 폴더가 있음. 0아니고 다른 게 붙어있을 수 있음. 
	//wtpwebapps에 프로젝트 파일이 있음 업로드가 잘됐으면 upload 폴더 안에 파일이 있을거라내..
	//upload 폴더를 만들어줬더니 파일이 들어갔네
	int size = 10 * 1024 * 1024;
	String name = "";
	String subject = "";
	String filename1 = "";
	String filename2 = "";
	String origfilename1 = "";
	String origfilename2 = "";

	
	
	try {
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());

		
		
// 		name = multi.getParameter("name");
// 		subject = multi.getParameter("subject");

		Enumeration files = multi.getFileNames();

		String file1 = (String) files.nextElement();
		filename1 = multi.getFilesystemName(file1);
		origfilename1 = multi.getOriginalFileName(file1);

		log("file1:: "+file1);
		log("filename1:: "+filename1);
		log("origfilename1:: "+origfilename1);
		
		String con = multi.getParameter("soc_con");
		//int viewcount =Integer.parseInt(multi.getParameter("view"));
		//String nowdate =multi.getParameter("nowdate");
// 		String depdate = multi.getParameter("log_depdate");
// 		String arrdate = multi.getParameter("log_arrdate");
		String pic1 = filename1;
			
		
		
		md.setSoc_con(con);
// 		md.setLog_depdate(depdate);
// 		md.setLog_arrdate(arrdate);
		md.setSoc_img(pic1);
		
		board.insert(md);

		
	} catch (Exception e) {
		e.printStackTrace();
	}

	//String numString = request.getParameter("num");
	//int num = (numString == null) ? 0 : Integer.parseInt(numString);

	//int num = Integer.parseInt(request.getParameter("num"));
	//out.println(num);

	
	//response.sendRedirect("N_list.jsp"); //form 버튼 없이 페이지를 넘겨준다.
	%>

	<script>
		alert("등록이 완료되었습니다.");
		location.href = "soc_boardView.jsp";
	</script>



</body>
</html>