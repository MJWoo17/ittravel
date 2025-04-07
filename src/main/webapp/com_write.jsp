<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
     <link rel="stylesheet" href="css/com_style.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
    <div class="board_wrap">
        <div class="board_title">
            <strong>커뮤니티</strong>
            <!-- <p>공지사항을 빠르고 정확하게 안내해드립니다.</p> -->
        </div>
  	<% 	
  	
  			request.setCharacterEncoding("UTF-8");
  			// 로그인한 사용자들이라면 , mem_id에 값이 담기게 될 것.
				String mem_id = null;
  				if(session.getAttribute("mem_id") != null){
  					mem_id = (String)session.getAttribute("mem_id");
  				}
  				 
  			%> 
        <form action="writeAction.jsp" method="post">
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text"  name="com_name" placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <div class="info">
                   <dl>
                        <dt>카테고리</dt>
                        <dd>
                      	<select class="catediv1" name="com_bct">
                      	<option value="동행구인" >동행구인</option>
                      	<option value="중고장터">중고장터</option>
                      	</select>
                        </dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>
                        <% 
                        out.println(mem_id+"님");
                        %>
                        <input type="hidden" name="com_mem_id" value="<%=mem_id%>">
						<!-- hidden으로 값을 넘겨줘야 db에서 막히지 않음 fk 요소라서 민감 중요 -->
                        </dd>
                    </dl>
                      
                </div>
                <div class="cont"> 
                    <textarea placeholder="내용 입력" name="com_con"></textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <input class="on1" type="submit" value="등록">
            </div>
        </div>
          </form>
    </div>
    
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>