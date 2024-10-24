<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"
	scope="session" />
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.navbar {
background-color:   
 #f8f9fa;
padding: 1rem 2rem;
font-family: 'Noto Sans KR', sans-serif;
}
.navbar-brand img {
width: 150px;
}
.nav-link {
color: #343a40;
font-weight: 700;
border-bottom: 2px solid transparent;
transition: border-color 0.3s ease, color 0.3s ease;
}
.nav-link:hover, .nav-link:focus, .nav-link.active {
border-color: #007bff;
color: #007bff;
}
.btn-login {
background-color: #007bff;
color: #fff;
border: none;
margin-left: 1rem;
transition: background-color 0.3s ease;
}
.btn-login:hover {
background-color: #0069d9;
}
.dropdown-menu {
border-radius: 0;
box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
}
.dropdown-item {
transition: background-color 0.3s ease;
}
.dropdown-item:hover, .dropdown-item:focus {
background-color: #f8f9fa;
}
@media (max-width: 768px) {
.navbar-nav {
margin-top: 1rem;
}
.btn-login {
margin-top: 1rem;
margin-left: 0;
}
}
</style>
</head>
<body>
	<script>
		var msg = '${msg}';
		if (msg != '')
			alert(msg);
	</script>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top">
		<div class="container">
			<a class="navbar-brand" href="${contextPath}/"> <img
				src="${contextPath}/resources/images/logo.jpg" alt="저기어때 로고">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>  

			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"   
 id="infoDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">   정보 </a>
						<div class="dropdown-menu" aria-labelledby="infoDropdown">
							<a class="dropdown-item"
								href="${contextPath}/customer_center/announcement">공지사항</a> <a
								class="dropdown-item" href="${contextPath}/customer_center/faq">FAQ</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="inquiryDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 문의 </a>
						<div class="dropdown-menu" aria-labelledby="inquiryDropdown">
							<a class="dropdown-item"
								href="${contextPath}/customer_center/chatbot">챗봇   상담</a> <a
								class="dropdown-item"
								href="${contextPath}/customer_center/customer-service">고객
								서비스</a> <a class="dropdown-item" href="${contextPath}/chat">문의채팅</a>
							<a class="dropdown-item" href="${contextPath}/userChat">저기어때
								회원 문의 채팅</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/review/list">이용 후기</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/inquiry/list">문의 내역</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/reservation/reservation">예약하기</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/accommodation/accommodation">숙소</a></li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><c:choose>
							<c:when test="${not empty sessionScope.member}">
								<a class="nav-link dropdown-toggle" href="#"
									id="profileDropdown" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">  

									${sessionScope.member.member_name}님 방가 :) </a>
								<div class="dropdown-menu" aria-labelledby="profileDropdown">
									<a class="dropdown-item" href="${contextPath}/member/profile">회원정보</a>
									<a class="dropdown-item" href="${contextPath}/member/logout">로그아웃</a>
								</div>
							</c:when>
							<c:otherwise>
								<li class="nav-item"><a href="${contextPath}/member/login"
									class="btn btn-login"> <i class="fas fa-sign-in-alt"></i>
										로그인
								</a></li>
								<li class="nav-item"><a
									href="${contextPath}/member/register" class="btn btn-login">
										<i class="fas fa-user-plus"></i> 회원가입
								</a></li>
							</c:otherwise>
						</c:choose></li>
				</ul>
			</div>
		</div>
	</nav>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	 

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>