<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
				<ul class="list">
					<c:if test="${member==null}">
						<li>�α���</a/li>
						<li>ȸ������</li>
					</c:if>
					<c:if test="${member!=null}">
						<c:if test="${member.adminCk==1 }">
							<li><a href="/admin/main">������ ������</a>
						</c:if>
						<li><a id="gnb_logout_button">�α׾ƿ�</a></li>
						<li>���̷�</li>
						<li>��ٱ���</li>
					</c:if>
					<li>�� ����</li>
				</ul>

			</div>
			<div class="top_area">
				<div class="logo_area">
					<a href="/main"><img src="resources/img/hibook.png"></a>
				</div>
				<div class="search_area">
					<h1>Search area</h1>
				</div>
				<div class="login_area">

					<!-- �α��� ���� ���� ��� -->
					<c:if test="${member==null}">
						<div class="login_button">
							<a href="/member/login">�α���</a>
						</div>
						<span><a href="/member/join">ȸ������</a></span>
					</c:if>

					<!-- �������� �α��� ��� -->
					<c:if test="${member !=null}">

						<div class="login_success_area">
							<span>ȸ��:${member.memberName}</span> <span>�����ݾ�:<fmt:formatNumber
									value="${member.money}" pattern="\#,###,##" /></span> <span>����Ʈ:<fmt:formatNumber
									value="${member.point}" pattern="#,###" /></span> <a
								href="/member/logout.do">�α� �ƿ�</a>
						</div>
					</c:if>

				</div>
				<div class="clearfix"></div>
			</div>
			<div class="navi_bar_area">
				<h1>navi area</h1>
			</div>
			<div class="content_area">
				<h1>content area</h1>
			</div>
		</div>
	</div>

	<!-- footer ���� -->
	<div class="footer_nav">
		<div class="footer_nav_container">
			<ul>
				<li>ȸ��Ұ�</li>
				<span class="line">|</span>
				<li>�̿���</li>
				<span class="line">|</span>
				<li>������</li>
				<span class="line">|</span>
				<li>������</li>
				<span class="line">|</span>
				<li>ä������</li>
				<span class="line">|</span>
			</ul>
		</div>
	</div>

	<div class="footer">
		<div class="footer_container">
			<div class="footer_left">
				<img src="resources/img/hibook.png">
			</div>
			<div class="footer_right">
				(��)HiBook ��ǥ�̻�:���Ͽ�<br> ����� ��� ��ȣ:000-00-0000<br> ��ǥ ��ȭ
				��ȣ:02-000-0000<br> <br> COPYRIGHT(C) <strong>�Ͽ�.com</strong>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<script>
		/*gnb_area �α׾ƿ� ��ư �۵�*/
		$("#gnb_logout_button").click(function() {

			alert("��ư�ۿ�");

			/*$ajax({
				type : "POST",
				url : "/member/logout.do",
				success : function(data) {
					alert("�α׾ƿ� ����");
					document.location.reload();
				}
			});*/

		});
	</script>
</body>
</html>