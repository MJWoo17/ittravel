
function pwcheck() {

    const pw = document.getElementById("password").value;
    const pwcheck = document.getElementById("passwordcheck").value;
    const pwcheckmsg = document.getElementById("pwcheck_msg");

    if (pw === pwcheck) {
        pwcheckmsg.innerHTML = "비밀번호가 일치합니다.";

    } else {
    	pwcheckmsg.innerHTML="비밀번호가 일치하지않습니다."
    }
}

//=============================번호

	function mobile1() {
		const box1 =document.getElementById("mobile1");

		let value = box1.value; //입력된 값이 숫자가 아닌 경우 삭제합니다.

		value = value.replace(/[^0-9]/g, "");
		box1.value=value;
		if (box1.value.length === 3) {
			document.getElementById("mobile2").focus();
		}
	}

	function mobile2() {
		const box2 = document.getElementById("mobile2");

		let value = box2.value;
		value = value.replace(/[^0-9]/g,"");
		box2.value = value;
		if (box2.value.length === 4) {
			document.getElementById("mobile3").focus();
		}
	}

	function mobile3() {
		const box3 = document.getElementById("mobile3");

		let value = box3.value;
		value = value.replace(/[^0-9]/g,"");
		box3.value = value;
		if (box3.value.length === 4) {

			
		}
	}

	//--------------생년월일
	
	function yearboxtxt() {
		const yearb= document.getElementById("yearbox").value;
		if (yearb.length === 4) {
			document.getElementById("monthbox").focus();
		}
	}

	function monthboxtxt() {
		const monthb= document.getElementById("monthbox").value;
		if (monthb.length === 2) {
			document.getElementById("daybox").focus();
		}
	}

	function dayboxtxt() {
		const dayb= document.getElementById("daybox").value;
		if (dayb.length === 2) {
			document.getElementById("mobthbox").focus();
		}
	}

	///--------------------------가입관련버튼이

	function joincancel() {  //$가 없으면 자바스크립트
		alert("가입이 취소되었습니다.")

	}


	//============================아이디 중복 검사


	$(function(){ //$가 있으면 jquery
		$("#idcheckbutton").click(function (){
			var id = $("#idbox").val();

			if (id ==="") {
				alert("아이디를 입력해주세요.");
				return false; //false는 이 jquery 자체를 중단시킨다. 그 return false가 없으면 ajax로 가서 중복 또는 사용가능 하다는 alert이 나온다. alert을 막기위해 return false를 쓴다.
			}

			$.ajax({
				url: "iddup.jsp?iid="+id,
				type: "get",

				success : function (result) {
					if(result.trim() ==="false") {
						alert("중복된 ID입니다.");
					} 
					else {
						alert("사용가능한 ID입니다.");
					}
					//alert(result);
					// body...
				}
			});
		});
	});