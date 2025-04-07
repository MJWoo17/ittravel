<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/travelogwrite.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>




<body>
	<header>
	   <jsp:include page="header.jsp" />
	</header> 
	

	<form action="writearrange.jsp" method="post"
		enctype="multipart/form-data">
		<div class="mainwrap">
			<div class="maintitle">트래블로그</div>
			<div class="contentwrap">
				<div class="textareawrap">
					<div class="title">
						<input type="text" id="log_title" name="log_title"
							placeholder="여기는 제목">
					</div>
					<div class="whereandwhen">
						<div class="title">
							<input type="text" id="log_where" name="log_where"
								placeholder="여행지">
						</div>
						<div class="title">
							<input type="text" id="log_depdate" name="log_depdate"
								placeholder="도착년월일">
								
								
						</div>
						<div class="title">
							<input type="text" id="log_arrdate" name="log_arrdate"
								placeholder="출발년월일">
						</div>
					</div>
				

				<div class="title">
					<input type="text" id="log_con" placeholder="여기는 내용">
				</div>
				</div>
				<label for="fileName1">파일명1 : </label><input type="file"
					name="file1" id="file1">
				<!-- 			<label for = "fileName2">파일명2 : </label><input type="file" name="file2" id = "file2"> -->
				<!-- 			<label for = "fileName3">파일명3 : </label><input type="file" name="file3" id = "file3"> -->
				<!-- 			<label for = "fileName4">파일명4 : </label><input type="file" name="file4" id = "file4"> -->
				<!-- 			<label for = "fileName5">파일명5 : </label><input type="file" name="file5" id = "file5"> -->
				<!-- 		여행기 DB를 만들어야지... -->


			</div>
		</div>
		<input type="submit">등록
		<button type="button">
			<a href="traveloglist.jsp">목록</a>
		</button>
	</form>
	
		<footer>
    	<jsp:include page="footer.jsp"/>
	</footer>
	
</body>
</html>