<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/member/join.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- 생일추가하기(캘린더) -->
</head>
<body>
	<form id="join_form" method="post">
		<!-- 아이디 -->
		<div class="id_wrap">
			<div class="id_name">아이디</div>
			<div class="id_input_box"><input class="id_input" name="id"></div>
			<!-- 아이디 중복 확인 문구 -->
			<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
			<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
			<span class="final_id_ck">아이디를 입력해주세요.</span>
		</div>
		
		<!-- 비밀번호 -->
		<div class="pw_wrap">
			<div class="pw_name">비밀번호</div>
			<div class="pw_input_box"><input class="pw_input" name="pw"></div>
			<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
		</div>
		<!-- 비밀번호 확인 -->
		<div class="pwck_wrap">
			<div class="pwck_name">비밀번호 확인</div>
			<div class="pwck_input_box"><input class="pwck_input"></div>
			<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
			<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
			<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
		</div>
		
		<!-- 이름 -->
		<div class="name_wrap">
			<div class="name_name">이름</div>
			<div class="name_input_box"><input class="name_input" name="name"></div>
			<span class="final_name_ck">이름을 입력해주세요.</span>
		</div>
		
		<!-- 이메일 -->
		<div class="email_wrap">
			<div class="email_name">이메일</div>
			<div class="email_input_box"><input class="email_input" name="email"></div>		
			<span class="final_email_ck">이메일을 입력해주세요.</span>
			<span class="email_input_box_warn"></span>
			<!-- 이메일 인증번호 -->
			<div class="email_check_wrap">
				<div class="email_check_input_box" id="email_check_input_box_false">
					<input class="email_check_input" disabled="disabled">
				</div>
				<div class="email_check_button">
					<span>인증번호 전송</span>
				</div>
				<div class="clearfix"></div>
				<span id="email_check_input_box_warn"></span>
			</div>
		</div>
		
		<!-- 주소 -->
		<div class="addr_wrap">	
			<div class="addr_name">주소</div>
			<!-- 우편번호 -->
			<div class="post_input_wrap">
				<div class="post_input_box">
					<input class="post_input" name="post" readonly="readonly">
				</div>
				<!-- 주소찾기 버튼 -->
				<div class="addr_button" onclick="execution_daum_address()"><span>주소찾기</span></div>
				<div class="clearfix"></div>
			</div>
			<!-- 주소 -->
			<div class="addr_input_1_wrap">
				<div class="addr_input_1_box">
					<input class="addr_input_1" name="addr1" readonly="readonly">
				</div>
			</div>
			<!-- 상세주소 -->
			<div class="addr_input_2_wrap">
				<div class="addr_input_2_box">
					<input class="addr_input_2" name="addr2" readonly="readonly">
				</div>
			</div>
			<span class="final_addr_ck">주소를 입력해주세요.</span>
		</div>
		
		<!-- 전화번호 -->
		<div class="tel_wrap">
			<div class="tel_name">전화번호</div>
			<div class="tel_input_box"><input class="tel_input" name="tel"></div>
		</div>
			
		<!-- 가입버튼 -->
		<div class="join_button_wrap">
			<input type="button" class="join_button" value="가입하기">
		</div>
	</form>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 스크립트 -->
	<script>
		var code = "";		// 이메일 전송 인증번호 저장을 위한 코드
		
		/* 유효성 검사 통과유무 변수 */
		var idCheck = false;	// 아이디
		var idckCheck = false;	// 아이디 중복검사
		var pwCheck = false;	// 비밀번호
		var pwckCheck = false;	// 비밀번호 확인
		var nameCheck = false;	// 이름
		var emailCheck = false;	// 이메일
		var emailnumCheck = false;	// 이메일 인증번호
		var addrCheck = false;	// 주소
	
		$(document).ready(function(){
			/* 회원가입 버튼 작동 */
			$(".join_button").click(function(){
				
				/* 입력값 변수 */
				var id = $('.id_input').val();		// id 입력란
				var pw = $('.pw_input').val();		// 비밀번호 입력란
				var pwck = $('.pwck_input').val();	// 비밀번호 확인 입력란
				var name = $('.name_input').val();	// 이름 입력란
				var email = $('.email_input').val();	// 이메일 입력란
				var addr = $('.addr_input_2').val();	// 주소 입력란
				
				/* 아이디 유효성 검사 */
				if(id == ""){
					$('.final_id_ck').css('display', 'block');
					idCheck = false;
				}else{
					$('.final_id_ck').css('display', 'none');
					idCheck = true;
				}
				/* 비밀번호 유효성 검사 */
				if(pw == ""){
					$('.final_pw_ck').css('display', 'block');
					pwCheck = false;
				}else{
					$('.final_pw_ck').css('display', 'none');
					pwCheck = true;
				}
				/* 비밀번호 확인 유효성 검사 */
				if(pwck == ""){
					$('.final_pwck_ck').css('display', 'block');
					pwckCheck = false;
				}else{
					$('.final_pwck_ck').css('display', 'none');
					pwckCheck = true;
				}
				/* 이름 유효성 검사 */
				if(name == ""){
					$('.final_name_ck').css('display', 'block');
					nameCheck = false;
				}else{
					$('.final_name_ck').css('display', 'none');
					nameCheck = true;
				}
				/* 이메일 유효성 검사 */
				if(email == ""){
					$('.final_email_ck').css('display', 'block');
					emailCheck = false;
				}else{
					$('.final_email_ck').css('display', 'none');
					emailCheck = true;
				}
				/* 주소 유효성 검사 */
				if(addr == ""){
					$('.final_addr_ck').css('display', 'block');
					addrCheck = false;
				}else{
					$('.final_addr_ck').css('display', 'none');
					addrCheck = true;
				}
				/* 최종 유효성 검사 */
				if(idCheck&&pwCheck&&pwckCheck&&nameCheck&&emailCheck&&emailnumCheck&&addrCheck){
					alert("회원가입");
					$("#join_form").attr("action","/member/join");
					$("#join_form").submit();
				}
				return false;
			});	
		});
		
		/* 아이디 중복검사 */
		$('.id_input').on("propertychange change keyup paste input", function(){
		//	console.log("keyup 테스트");
			
			var id = $('.id_input').val();		// .id_input에 입력되는 값;
			var data = {id : id}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
			
			$.ajax({
				type : "post",
				url : "/member/memberIdChk",
				data : data,
				success : function(result){
				//	console.log("성공 여부 : " + result);
				
					if(result != 'fail'){
						$('.id_input_re_1').css('display','inline-block');
						$('.id_input_re_2').css('display','none');
						idCheck = true;
					}else{
						$('.id_input_re_1').css('display','none');
						$('.id_input_re_2').css('display','inline-block');
						idCheck = false;
					}
				}	// success 종료
			});	// ajax 종료
		});		// function 종료
		
		/* 인증번호 이메일 전송 */
		$(".email_check_button").click(function(){
			var email = $(".email_input").val();		// 입력한 이메일
			var checkBox = $(".email_check_input");		// 인증번호 입력란
			var boxWrap = $(".email_check_input_box");	// 인증번호 입력란 박스
			var warnMsg = $(".email_input_box_warn");	// 이메일 입력 경고문
			
			/* 이메일 형식 유효성 검사 */
			if(emailFormCheck(email)){
				warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
				warnMsg.css("display", "inline-block");
			}else{
				warnMsg.html("올바르지 못한 이메일 형식입니다.");
				warnMsg.css("display", "inline-block");
				return false;
			}
			
			$.ajax({
				type : "GET",
				url : "emailCheck?email=" + email,
				success : function(data){
				//	console.log("data: " + data);
					checkBox.attr("disabled", false);
					boxWrap.attr("id", "email_check_input_box_true");
					code = data;
				}
			});	// ajax 종료
		});
		
		/* 인증번호 비교 */
		$(".email_check_input").blur(function(){
			var inputCode = $(".email_check_input").val();		// 입력코드
			var checkResult = $("#email_check_input_box_warn");	// 비교결과
			
			if(inputCode == code){	// 인증번호 일치
				checkResult.html("인증번호가 일치합니다.");
				checkResult.attr("class","correct");
				emailnumCheck = true;
			}else{	// 인증번호 불일치
				checkResult.html("인증번호를 다시 확인해주세요.");
				checkResult.attr("class","incorrect");
				emailnumCheck = false;
			}
		});
		
		/* 다음 주소 연동 */
		function execution_daum_address(){
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
	                    // 주소변수 문자열과 참고항목 문자열 합치기
	                    addr += extraAddr;
	                
	                } else {
	                   addr += ' ';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $(".post_input").val(data.zonecode);
	                $(".addr_input_1").val(addr);
	                // 커서를 상세주소 필드로 이동한다.
	                $(".addr_input_2").attr("readonly", false);
	                $(".addr_input_2").focus();
		        }
		    }).open();
		}
		
		/* 비밀번호 확인 일치 유효성 검사 */
		$('.pwck_input').on("propertychange change keyup paste input", function(){
			var pw = $('.pw_input').val();
			var pwck = $('.pwck_input').val();
			$('.final_pwck_ck').css('display','none');
			
			if(pw == pwck){
				$('.pwck_input_re_1').css('display','block');
				$('.pwck_input_re_2').css('display','none');
				pwckCheck = true;
			}else{
				$('.pwck_input_re_1').css('display','none');
				$('.pwck_input_re_2').css('display','block');
				pwckCheck = false;
			}
		});
		
		/* 입력 이메일 형식 유효성 검사 */
		function emailFormCheck(email){
			var form =  /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			return form.test(email);
		}
	</script>

</body>
</html>