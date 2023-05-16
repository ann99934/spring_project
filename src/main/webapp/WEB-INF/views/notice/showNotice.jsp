<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<h1>조회 페이지</h1>
	<div class="input_wrap">
		<label>게시판 번호</label><input name="noticeNum"
			value='<c:out value="${pageInfo.noticeNum}"/>' readonly="readonly">
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label><input name="noticeTitle" readonly="readonly"
			value='<c:out value="${pageInfo.noticeTitle}"/>'>
	</div>
	<div class="input_wrap">
		<label>게시판 내용</label><br>
		<textarea rows="3" name="noticeContent" readonly="readonly"><c:out
				value="${pageInfo.noticeContent}" /></textarea>
	</div>
	
	<div class="input_wrap">
		<label>게시판 등록일</label><input name="postDate" readonly="readonly"
			value=<fmt:formatDate pattern="yyyy-MM-dd" value="${pageInfo.postDate}"/>>
	</div>
	<div class="input_wrap">
		<label>게시판 수정일</label><input name="updateDate" readonly="readonly"
			value=<fmt:formatDate pattern="yyyy-MM-dd" value="${pageInfo.updateDate}"/>>
	</div>
	<div class="btn_wrap">
		<a class="btn" id="main_btn">목록 페이지</a> <a class="btn" id="update_btn">수정하기</a>
	</div>
	<form id="infoForm" method="get" action="/board/modify">
		<input type="hidden" id="noticeNum" name="noticeNum"
			value='<c:out value = "${pageInfo.noticeNum}"/>'> <input
			type="hidden" name="pageNum"
			value='<c:out value = "${cri.pageNum}"/>'> <input
			type="hidden" name="amount" value='<c:out value = "${cri.amount}"/>'>
		<input type="hidden" name="type"
			value='<c:out value = "${cri.amount}"/>'> <input
			type="hidden" name="keyword"
			value='<c:out value = "${cri.keyword}"/>'>

	</form>
	<script>
		let form = $("#infoForm");
		$("#main_btn").on("click", function(e) {
			form.find("#noticeNum").remove();
			form.attr("action", "/notice/main");
			form.submit();
		});
		$("#update_btn").on("click", function(e) {
			form.attr("action", "/notice/updateNotice");
			form.submit();
		});
	</script>


</body>
</html>