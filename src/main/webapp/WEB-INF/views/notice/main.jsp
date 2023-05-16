<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/notice/main.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<h1>
		<a href="/notice/main">목록 페이지 입니다..</a>
	</h1>
	<div class="table_wrap">
		<a href="/notice/postNotice" class="top_btn">게시판 등록</a>
		<table>
			<thead>
				<tr>
					<th class="bno_width">번호</th>
					<th class="title_width">제목</th>
					<th class="writer_width">작성자</th>
					<th class="regdate_width">작성일</th>
					<th class="updatedate_width">수정일</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="list">

				<tr>
					<td><c:out value="${list.noticeNum}" /></td>
					<td><a class="move" href='<c:out value="${list.noticeNum}" />'>
							<c:out value="${list.noticeTitle}" />
					</a></td>
					<td><c:out value="관리자" /></td>
					<td><fmt:formatDate value="${list.postDate}"
							pattern="yyyy/MM/dd" /></td>
					<td><fmt:formatDate value="${list.updateDate}"
							pattern="yyyy/MM/dd" /></td>
				</tr>
			</c:forEach>
		</table>

		<div class="search_wrap">
			<div class="search_area">
				<select name="type">
					<option value=""
						<c:out value = "${pageMaker.cri.type == null?'selected':''}"/>>--</option>
					<option value="T"
						<c:out value = "${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
					<option value="C"
						<c:out value = "${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>

					<option value="TC"
						<c:out value = "${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
						+ 내용</option>
				</select> <input type="text" name="keyword" value="${pageMaker.cri.keyword}">
				<button>Search</button>
			</div>
		</div>

		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">

					<c:if test="${pageMaker.prev}">
						<li class="pageInfo_btn previous"><a
							href="${pageMaker.startPage-1}">previous</a></li>
					</c:if>
					<!-- 각 번호 페이지 버튼 -->
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li class="pageInfo_btn ${pageMaker.cri.pageNum==num?"active":""}">
							<!-- 3항 연산자 --> <a href="${num}">${num}</a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li class="pageInfo_btn next"><a
							href="${pageMaker.endPage+1}">next</a></li>
					</c:if>

				</ul>
			</div>
		</div>
		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
			<input type="hidden" name="type" value="${pageMaker.cri.type }">
		</form>
	</div>
	<script>
		$(document).ready(function() {
			let result = '<c:out value="${result}"/>';
			checkAlert(result);
			function checkAlert(result) {
				if (result === ' ') { //객체와 주소값까지 비교
					return; //return false = X -> true/false 개념이 아님
				}
				if (result === '등록 완료') {
					alert("등록이 완료되었습니다!!");
				}
				if (result === '수정 성공') {
					alert("수정이 완료되었습니다!!");
				}
				if (result === '삭제 성공') {
					alert("삭제가 완료되었습니다!!");
				}
			}
		});

		let moveForm = $("#moveForm");

		$(".move")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							moveForm
									.append("<input type='hidden' name='noticeNum' value='"
											+ $(this).attr("href") + "'>");
							moveForm.attr("action", "/notice/showNotice");
							moveForm.submit();
						});

		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/notice/main");
			moveForm.submit();
		});

		$(".search_area button").on("click", function(e) {
			e.preventDefault();
			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();

			if (!type) {
				alert("검색 종류를 선택하세요");
				return false;
			}
			if (!keyword) {
				alert("검색할 단어를 입력하세요");
				return false;
			}
			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});
	</script>
</body>
</html>