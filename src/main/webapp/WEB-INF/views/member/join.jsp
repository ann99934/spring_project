<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
	<form id="join_form" method="post">
		<!-- 아이디 -->
		<div class="id_wrap">
			<div class="id_name">아이디</div>
			<div class="id_input_box"><input class="id_input" name="id"></div>
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
				<div class="email_check_input_box">
					<input class="email_check_input">
				</div>
				<div class="email_check_button">
					<span>인증번호 전송</span>
				</div>
				<div class="clearfix"></div>
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
		$(document).ready(function(){
			// 회원가입 버튼 작동
			$(".join_button").click(function(){
				alert("회원가입");
				$("#join_form").attr("action","/member/join");
				$("#join_form").submit();
			});	
		});
	</script>

</body>
</html>