<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드명</title>
<link rel="stylesheet" href="../resources/css/member/login.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

	<div class="wrapper">
		<div class="wrap">
		<form id="login_form" method="post">
		<!-- 윗부분 바 -->
			<div class="top_gnb_area">
			<a href="/main">
				<img class="logo" src="../resources/img/logo.png">
			</a>	
				<ul class="top_left">
					<li><a href="../shop/productMain">제품보기</a></li>
					<li><a href="#">베스트셀러</a></li>
					
				</ul>
			
			</div>
			</div>
			
			<!-- 로그인 부분 -->
			
		<div class="login_wrap">
		<div class="logo_wrap">
			<span>로그인</span>
		</div>
		 
			<div class="id_wrap">
					<span>아이디</span>
					<div class="id_input_box">
					<input class="id_input"  name="id">
				</div>
			</div>
			<div class="pw_wrap">
				<span>비밀번호</span>
				<div class="pw_input_box">
					<input class="pw_input"  name="pw">
				</div>
			</div>
			<c:if test ="${result == 0}">
			<div class="login_warn">	사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
			</c:if>
			
			<div class="button">
			<div class="login_button_wrap">
				<input type="button" class="login_button" value="로그인">
				</div>
				
			<div>
				<input type="button" class="join" value="회원가입" >
			</div>
			
			<div class="login_btn">
				<input type="button" class="n_login" value="네이버 로그인">
				<input type="button" class="g_login" value="구글 로그인">
			</div>
			</div>
			
			</div>	
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
					<img src="../resources/img/logo.png">
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
		
			
		
		</form>
		
		
	<script>
 
    /* 로그인 버튼 클릭 메서드 */
    $(".login_button").click(function(){
        
        //alert("로그인 버튼 작동");
        
        //로그인 메서드 서버 요청
        $("#login_form").attr("action","/member/login");
        $("#login_form").submit();
        
    });
    
    /*회원가입 버튼 클릭 메서드*/
    $(".join").click(function(){
		alert("회원가입 버튼 작동")
	})
 
</script>
	

</body>
</html>
