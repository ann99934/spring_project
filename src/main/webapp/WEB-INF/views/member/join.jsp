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
		</div>
		
		<!-- 비밀번호 -->
		<div class="pw_wrap">
			<div class="pw_name">비밀번호</div>
			<div class="pw_input_box"><input class="pw_input" name="pw"></div>
		</div>
		<!-- 비밀번호 확인 -->
		<div class="pwck_wrap">
			<div class="pwck_name">비밀번호 확인</div>
			<div class="pwck_input_box"><input class="pwck_input"></div>
		</div>
		
		<!-- 이름 -->
		<div class="name_wrap">
			<div class="name_name">이름</div>
			<div class="name_input_box"><input class="name_input" name="name"></div>
		</div>
		
		<!-- 이메일 -->
		<div class="email_wrap">
			<div class="email_name">이메일</div>
			<div class="email_input_box"><input class="email_input" name="email"></div>		
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
					<input class="post_input" name="post">
				</div>
				<!-- 주소찾기 버튼 -->
				<div class="addr_button"><span>주소찾기</span></div>
				<div class="clearfix"></div>
			</div>
			<!-- 주소 -->
			<div class="addr_input_1_wrap">
				<div class="addr_input_1_box">
					<input class="addr_input_1" name="addr1">
				</div>
			</div>
			<!-- 상세주소 -->
			<div class="addr_input_2_wrap">
				<div class="addr_input_2_box">
					<input class="addr_input_2" name="addr2">
				</div>
			</div>
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
	
	<!-- 스크립트 -->
	<script>
		var code = "";		// 이메일 전송 인증번호 저장을 위한 코드
	
		$(document).ready(function(){
			/* 회원가입 버튼 작동 */
			$(".join_button").click(function(){
				alert("회원가입");
				$("#join_form").attr("action","/member/join");
				$("#join_form").submit();
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
					}else{
						$('.id_input_re_1').css('display','none');
						$('.id_input_re_2').css('display','inline-block');
					}
				}	// success 종료
			});	// ajax 종료
		});		// function 종료
		
		/* 인증번호 이메일 전송 */
		$(".email_check_button").click(function(){
			var email = $(".email_input").val();		// 입력한 이메일
			var checkBox = $(".email_check_input");		// 인증번호 입력란
			var boxWrap = $(".email_check_input_box");	// 인증번호 입력란 박스
			
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
			}else{	// 인증번호 불일치
				checkResult.html("인증번호를 다시 확인해주세요.");
				checkResult.attr("class","incorrect");
			}
		});
	</script>

</body>
</html>