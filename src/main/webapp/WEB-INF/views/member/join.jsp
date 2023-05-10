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
		아이디
		<input name="id">
		<br>
		
		비밀번호
		<input name="pw">
		<br>
		
		비밀번호 확인
		<input>
		<br>
		
		이름
		<input name="name">
		<br>
		
		이메일
		<input name="email">
		<br>
		
		<input><div>인증번호 전송</div>
		<br>
		
		<input name="post"><div>주소찾기</div>
		<input name="addr1"><br>
		<input name="addr2">
		<br>
		
		전화번호
		<input name="tel">
		<br>
		
		<!-- 가입버튼 -->
		<input type="button" class="join_button" value="가입하기">
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