<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>공지글 등록</h1>
	<form action="/notice/postNotice.do" method="post">

		<div class="input_wrap">
		제목:	<input name="noticeTitle">
		</div>
		<div class="input_wrap">
		내용:	<textarea rows="3" name="noticeContent"></textarea>
		</div>		
		<button class="btn">등록</button>
	</form>
</body>
</html>