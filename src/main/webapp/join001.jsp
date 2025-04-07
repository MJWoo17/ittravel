<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/join001.css">
<title>잇트 회원가입</title>
</head>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>




<script>

	//우편번호 검색 기능
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<script>

	//아이디 중복 체크 
	$(document).ready(function(){
		
		$("#idbtn").click(function(){
			var mem_id=$("#mem_id").val();
			if(mem_id.length >=5 && mem_id.length <=15) {
				$.ajax({
					type : "post",
					url : "join_id_check.jsp",
					data : {"mem_id" : mem_id},
					dataType : "html",
					success : function(result) {
						if(result.trim()==="OK"){
							alert("사용가능한 아이디입니다.")
						} else {
							alert("중복된 아이디입니다.")
						}
					}
				});
				
			} else {
				alert("5~12자 내의 아이디를 입력하세요.");
			}
		});
		
		//닉네임 중복 체크
		$("#mem_nickbtn").click(function(){
			var mem_nick=$("#mem_nick").val();
			if(mem_nick.length<=8 && mem_nick.length>=2) {
				$.ajax({
					type : "post",
					url :"join_nick_check.jsp",
					data : { "mem_nick" : mem_nick },
					dataType : "html",
					success : function(result) {
						if(result.trim()==="OK") {
							alert("사용가능한 닉네임");
						} else {
							alert("사용불가 닉네임");
						}
					}
				});
			} else {
				alert("2~8자 사이의 닉네임을 입력하세요.");
			}
		});

	      $("#mem_pw02").keyup(function(){
	          var mem_pw01 = $("#mem_pw01").val();
	          var mem_pw02 = $("#mem_pw02").val();
	          
	          if (mem_pw01.length>=8 && mem_pw01.length<=15) {
	             if (mem_pw02 != mem_pw01) {
	                $("#mem_pwMsg").html("<span>비밀번호가 일치하지않습니다.</span>");
	             } else {
	                $("#mem_pwMsg").html("<span>비밀번호가 일치합니다.</span>");
	             }
	          } else {
	             $("#mem_pwMsg").html("<span>8~15자 사이의 비밀번호를 입력하세요.</span>");
	          }
	          });

	    });
			
	 
    // ================ 인증번호=====================
    
    // 인증번호 버튼 누르기 전 번호창과 재전송 버튼을 가리는 jquery
    $(document).ready(function() {
   	 
   	  $(".idenwrap").hide();
   	});
    
 	// 인증번호 버튼을 눌렀을 때 뜨는 창
    function identify(){

    	var countDownDate = new Date().getTime()+(5*60*1000);
    	x = setInterval(function(){

    	var now = new Date().getTime();
    	var distance = countDownDate - now;

    	var minutes = Math.floor((distance % (1000 * 60 * 60))/(1000*60));
    	var seconds = Math.floor((distance % (1000*60))/1000);

    	if(minutes <10){
    		minutes = "0"+minutes;
    	}
    	if(seconds <10){
    		seconds = "0"+seconds;
    	}

    	document.getElementById("timer").innerHTML = minutes + ":" + seconds;

    	if(distance <0){

    		clearInterval(x);
    		document.getElementById("timer").innerHTML = "expired";
    	}

    	}, 1000);

    	/* alert("인증번호를 입력해주세요") */
    	$(".idenwrap").show();
    }


	// 타이머
    setTimeout(function(){


    	document.getElementById("numbox").disabled = true;
    	document.getElementById("idnumconfirm").disabled = true;

    }, 5*60*1000);


	// 인증번호 확인 버튼을 눌렀을 때 뜨는 alert
    function idenconfirm(){
    		alert ("인증되었습니다");
    		document.getElementById("numbox").disabled = true;
    		document.getElementById("idnumconfirm").disabled = true;
    		document.getElementById("phone1").disabled = true;
    		document.getElementById("phone2").disabled = true;
    		document.getElementById("phone3").disabled = true;
    		document.getElementById("numiden").disabled = true;
    		clearInterval(x);

    	

    }
	
 	// 재전송 버튼을 눌렀을 때 뜨는 alert
    function idenagain(){
    		document.getElementById("numbox").disabled = false;
    		document.getElementById("idnumconfirm").disabled = false;
    		document.getElementById("phone1").disabled = false;
    		document.getElementById("phone2").disabled = false;
    		document.getElementById("phone3").disabled = false;
    		document.getElementById("numiden").disabled = false;
    		clearInterval(x);
    		document.getElementById("timer").innerHTML = "05:00";
    		identify();
    		  setTimeout(function() {
    		    document.getElementById("numbox").disabled = true;
        		document.getElementById("idnumconfirm").disabled = true;
    		  }, 5*60*1000);
    }


		
</script>


<body>

	<div id="wrap" style="text-align: center;">
	
		<!--회원가입폼-->
		<form style="margin-top: 100px;" method="post"
			action="join002.jsp">
			<h2>회원가입</h2>
			<div class="line01" style="background-color: #7E7DCB;"></div>
			<div id="joinwrap">
				<table style="margin: auto auto;">
					<colgroup>
						<col width="150px" />
					</colgroup>
					<tr>
						<td>아이디</td>
						<td><input type="text" class="formal" id="mem_id"
							name="mem_id" value="${mem_id}" size="35" placeholder="아이디를 입력하세요."
							onkeyup="only(this.value)" required></td>
						<td><input type="button" id="idbtn" name="" value="중복확인"
							style="background-color: #7E7DCB; color: white; padding: 0 20px; border-radius: 5px; margin-left: 5px;"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" class="formal" id="mem_pw01"
							name="mem_pw" value="${mem_pw}" size="35" maxlength="18"
							placeholder="8~15자 사이의 비밀번호를 입력하세요" class="basic" required></td>
					</tr>
					<tr>
						<td>비밀번호확인</td>
						<td><input type="password" class="formal" id="mem_pw02"
							name="" value="" size="35" placeholder="한 번 더 입력해주세요"
							maxlength="18" required><br>
						<span id="mem_pwMsg" style="font-size: 0.9em; color: #7E7DCB;">
								비밀번호를 입력해주세요.</span></td>
						<td></td>
					</tr>

					<tr>
						<td>이름</td>
						<td><input type="text" class="formal" name="mem_name"
							value="${mem_name}" size="35" class="basic" required></td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td><input type="text" class="formal" name="mem_nick"
							id="mem_nick" value="" size="35" class="basic" required></td>
						<td><input type="button" id="mem_nickbtn" name=""
							value="중복확인"
							style="background-color: #7E7DCB; color: white; padding: 0 20px; border-radius: 5px; margin-left: 5px;"></td>
					</tr>

					<tr>
						<td>E-mail</td>
						<td><input type="text" name="mem_email1" value="${mem_email1}" size="18"
							class="mem_email" style="margin-right: 7px;"> <span
							style="opacity: 70%;">@</span> <select name="mem_email2">
								<option>선택</option>
								<option value="@naver.com">naver.com</option>
								<option value="@hanmail.net">hanmail.net</option>
								<option value="@google.com">google.com</option>
								<option>직접입력</option>
						</select>
					</tr>
					<tr>
					
						<td>주소</td>
						<td><input type="text" name="mem_addr1"
							id="sample6_postcode" placeholder="우편번호" readonly><br>
							<input type="text" name="mem_addr2" id="sample6_address"
							placeholder="주소" name="address" size="35" style="margin-top: 3px"
							readonly><br> <input type="text" 
							name="mem_addr3" id="sample6_detailAddress" placeholder="상세주소"
							style="margin-top: 3px" size="16"> <input type="text"
							 name="mem_addr4" id="sample6_extraAddress"
							placeholder="참고항목" size="15" style="margin-top: 3px"></td>
						<td><input type="button" onclick="sample6_execDaumPostcode()"
							name="" value="우편번호 검색"
							style="background-color: #7E7DCB; color: white; padding: 0 20px; border-radius: 5px; margin-left: 5px;"></td>
					</tr>
				
					<tr>
						<td>휴대폰</td>
						
						<td>
						<select name="mem_mobile0" class="formal" required>
								<option>통신사</option>
								<option value="kt">kt</option>
								<option value="skt">skt</option>
								<option value="lg u+">lg u+</option>
								<option value="알뜰폰">알뜰폰</option>
						</select> 
						
						<input type="text" class="formal" name="mem_mobile1" id = "phone1" value="${mem_mobile1}" size="3" maxlength="3" required> - 
						<input type="text" class="formal" name="mem_mobile2" id = "phone2" value="${mem_mobile2}" size="4" maxlength="4" required> - 
						<input type="text" class="formal" name="mem_mobile3" id = "phone3" value="${mem_mobile3}" size="4" maxlength="4" required>
						</td>
							
						<!-- 인증번호 구간은 기능에 맞춰 수정했습니다 -->
						<td> <button type = "button" id ="numiden" class="dupcheck" onclick="identify()" style="width : 115px; background-color: #7E7DCB; color: white; border-radius: 5px;"><font color ="white">인증번호 받기</font></button>
						</td>
					</tr>
							
							
					<tr class="idenwrap" style ="width: 500px">
							
									<td><input type="text" id="numbox" size="10" class="idenbox"></input></td>
									<td id="timer">05:00</td>
									<td>
									<button type="button" id="idnumconfirm" name="dupcheck"
										onclick="idenconfirm()">인증번호 확인</button></td>
									<td><button type="button" id="numagain"
										style="background-color: #bab9eb;" name="dupcheck"
										class="idennumber" onclick="idenagain()">재전송</button>
									</td>
					</tr>
					<td>성별</td>
					<td class="mem_sex"><input type="radio" name="mem_sex"
						id="men" value="M" style="width: 30px; height: 13px;"> <label
						for="M">남성</label> <input type="radio" name="mem_sex" id="women"
						value="F" style="width: 30px; height: 13px;"> <label
						for="F">여성</label></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><select name="mem_birth1">
								<%
								for (int i = 1960; i <= 2023; i++) {
								%><option  <%String years = i + "";%>><%=years%>년
								</option>
								<%
								}
								%>
						</select> <select name="mem_birth2">
								<%
								for (int i = 1; i <= 12; i++) {
								%><option  <%String months = i + "";%>><%=months%>월
								</option>
								<%
								}
								%>
						</select> <select name="mem_birth3">
								<%
								for (int i = 1; i <= 31; i++) {
								%><option  <%String days = i + "";%>><%=days%>일
								</option>
								<%
								}
								%>
						</select></td>
					</tr>
					<tr>
						<td>소식받기</td>
						<td><input type="checkbox" name="mem_news" value="sms"
							class="mem_news" style="width: 20px; height: 13px;" checked>
							<label>SMS</label> <input type="checkbox" name="mem_news"
							value="e-mail" class="mem_news"
							style="width: 20px; height: 13px;" checked> <label>E-mail</label>
							<input type="checkbox" name="mem_news" value="N" class="mem_news"
							style="width: 20px; height: 13px;" checked> <label>동의하지
								않음</label>
					</tr>

				</table>
				<div class="line01" style="background-color: #7E7DCB;"></div>

				<input class="but" type="submit" onclick="btn()" value="회원가입 완료"
					onclick=location.href="tour002.jsp">
			</div>
		</form>

	</div>


</body>
</html>