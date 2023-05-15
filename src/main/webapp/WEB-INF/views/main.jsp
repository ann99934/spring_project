<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드명</title>
<link rel="stylesheet" href="resources/css/main.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

	<div class="wrapper">
		<div class="wrap">
		
		<!-- 윗부분 바 -->
			<div class="top_gnb_area">
			<a href="/main">
				<img class="logo" src="resources/img/logo.png">
				</a>
				<ul class="top_left">
					<li><a href="/shop/productMain">제품보기</a></li>
					<li><a href="">베스트셀러</a></li>
					
				</ul>
				
				<ul class="top_right">
				<!-- 로그인 x -->
				<c:if test= "${member == null}">
					<li>
					<a href="/member/login">로그인</a>
					</li>
					<li>
					<a href="/member/join">회원가입</a>
					</li>
					</c:if>
				
				<!-- 로그인 o -->	
				<c:if test="${member != null}">
				<div class="login_success_area">
					<c:if test="${member.adminCk == 1 }"> <!-- 관리자 계정 -->
						<li><a href="admin/main">관리자 페이지</a></li>
					</c:if>
					<li>${member.memberName} 님</li>
					<li>마이 페이지</li>
					<li>장바구니</li>
					<li><a href="/member/logout.do">로그아웃</a></li>
				</div>
				</c:if>
					</ul>
			</div>
			</div>
			
			
			
			<!-- 메인 화면 사진 부분 -->
			<div class="content_area">
				<p>어쩌고 저쩌고</p>
				<input type="button" class="btn-navi" value="전제품 보기">
				<input type="button" class="btn-navi" value="오프라인">
			</div>
				
		
		
		
		
		
			<!-- footer -->
			
		<div class="footer_nav">
			<div class="footer_nav_container">
				<ul>
					<li>회사소개</li>
					<span class="line">|</span>
					<li>이용약관</li>
					<span class="line">|</span>
					<li>고객센터</li>
					<span class="line">|</span>
					<li>광고문의</li>
					<span class="line">|</span>
					<li>채용정보</li>
					<span class="line">|</span>
				</ul>
			</div>
		</div>
	
		
		
		<div class="footer">
			<div class="footer_container">
				<div class="footer_left">
					<img src="resources/img/logo.png">
				</div>
				<div class="footer_right">
					(주) 브랜드명 어쩌고 | 사업자 등록번호: 119-86-38589
					<br>
					대표자: 이름바꿔 | 서울특별시 종로구 어쩌고
					<br>
					대표전화 : 1588-5588 | 이메일: cs@tamburins.com
					<br>
					COPYRIGHT(C) <strong>tamburins</strong>
					ALL RIGTHS RESERVED
				</div>
				
				
				
				<div class="clearfix"></div>
			</div>
		</div>
		
			
		</div>
	
	
	

</body>
</html>
