<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
 <h1>수정 페이지</h1>
   <form id="updateForm" method="post" action="/notice/updateNotice">
      <div class="input_wrap">
         <label>게시판 번호</label>
         <input type="text" name="noticeNum" value='<c:out value="${pageInfo.noticeNum}" />' readonly>
      </div>
      <div class="input_wrap">
         <label>게시판 제목</label>
         <input type="text" name="noticeTitle" value='<c:out value="${pageInfo.noticeTitle}" />'>
      </div>
      <div class="input_wrap">
         <label>게시판 내용</label>
         <textarea rows="3" name="noticeContent"><c:out value="${pageInfo.noticeContent}" /></textarea>
      </div>
      
      <div class="input_wrap">
         <label>게시판 등록일</label>
         <input type="text" name="postDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.postDate}"/>' readonly>
      </div>
      <div class="input_wrap">
         <label>게시판 수정일</label> 
         <input type="text" name="updateDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}" />' readonly>
      </div>
      <div class="btn_wrap">
         <a class="btn" id="main_btn">목록 페이지</a>
         <a class="btn" id="submit_btn">수정 완료</a>
         <a class="btn" id="cancel_btn">수정 취소</a>
         <a class="btn" id="delete_btn">삭 제</a>
      </div>
   </form>
   <form action="/notice/updateNotice" method="get" id="infoForm">
      <input type="hidden" id="noticeNum" name="noticeNum" value='<c:out value="${pageInfo.noticeNum}" />'>
      <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}" />'>
      <input type="hidden" name="amount" value='<c:out value="${cri.amount}" />'>
      <input type="hidden" name="type" value='<c:out value="${cri.type}" />'>
      <input type="hidden" name="keyword" value='<c:out value="${cri.keyword}" />'>
   </form>
   
   <script>
      let form = $("#infoForm");
      let mform = $("#updateForm");
      
      $("#main_btn").on("click", function(e) {
         form.find("#noticeNum").remove();
         form.attr("action", "/notice/main");
         form.submit();
      });
      $("#submit_btn").on("click", function(e) {
         mform.submit();
      });
      $("#cancel_btn").on("click", function(e) {
         form.attr("action", "/notice/showNotice");
         form.submit();
      });
      $("#delete_btn").on("click", function(e) {
         form.attr("action", "/notice/deleteNotice");
         form.attr("method", "post"); // post방식으로 바로 날림
         form.submit();
      });
   </script>
</body>
</html>