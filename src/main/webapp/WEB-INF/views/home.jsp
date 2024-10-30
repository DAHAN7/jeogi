<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
body {
  font-family: 'Spoqa Han Sans Neo', sans-serif;
  margin: 0;
  background-color: #f8f9fa;
  color: #222;
  line-height: 1.6;
}

a {
  color: #222;
  text-decoration: none;
  transition: color 0.3s ease;
}

a:hover,
a:focus {
  color: #007bff;
}
.navbar {
  background-color: #fff;
  padding: 1rem 0;
  border-bottom: 1px solid #eee;
  position: sticky;
  top: 0;
  z-index: 100;
}

.navbar-brand .logo {
  height: 30px;
}

.navbar-nav .nav-link {
  font-weight: 600;
  padding: 0.5rem 1rem;
  border-radius: 5px;
  transition: background-color 0.3s ease;
}

.navbar-nav .nav-link:hover,
.navbar-nav .nav-link:focus {
  background-color: #f8f9fa;
}

.dropdown-menu {
  border: none;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  border-radius: 5px;
}

.dropdown-item {
  padding: 0.5rem 1.5rem;
  color: #222;
  transition: background-color 0.3s ease;
}

.dropdown-item:hover,
.dropdown-item:focus {
  background-color: #f8f9fa;
}

.navbar-toggler:focus {
  outline: 2px solid #007bff;
}

.dropdown-toggle::after {
  margin-left: 0.255em;
}
.hero {
  background-color: #e9ecef;
  padding: 4rem 0;
  text-align: center;
}

.hero h1 {
  font-size: 3rem;
  font-weight: 700;
  margin-bottom: 1rem;
  color: #222;
}

.hero p {
  font-size: 1.5rem;
  margin-bottom: 2rem;
}
.btn-primary {
  background-color: #222;
  border-color: #222;
  color: #fff;
  padding: 1rem 2rem;
  font-size: 1.2rem;
  border-radius: 5px;
  transition: all 0.3s ease;
}

.btn-primary:hover,
.btn-primary:focus {
  background-color: #007bff;
  border-color: #007bff;
}
.card {
  border: none;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
  margin-bottom: 2rem;
  transition: transform 0.3s ease;
  border-radius: 10px;
  overflow: hidden;
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); 
}

.card-img-top {
  height: 200px;
  object-fit: cover;
}

.card-body {
  padding: 1.5rem; 
}

.card-title {
  font-size: 1.2rem;
  font-weight: 600;
  margin-bottom: 0.5rem;
}

.card-text {
  margin-bottom: 1rem;
}

footer {
  background-color: #333;
  color: #fff;
  padding: 2rem 0;
  text-align: center;
}

@media (max-width: 768px) {
  .hero h1 {
    font-size: 2.5rem;
  }

  .hero p {
    font-size: 1.2rem;
  }
}
</style>

<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>


<main>
    <section class="hero">
        <div class="container">
            <h1>여기어때, 당신의 여행을 위한 최고의 선택</h1>
            <p>국내 숙소, 해외 숙소, 항공권, 렌터카, 티켓까지!</p>
            <a href="${path}/reservation/reservation_list" class="btn btn-primary">숙소 예약하기</a>
        </div>
    </section>

    
           
  <section class="popular">
    <div class="container">
        <h2>인기 숙소</h2>
        <div class="row">
            <c:choose>
                <c:when test="${not empty accommodation_list}">
                    <c:forEach var="accommodation" items="${accommodation_list}">
                        <div class="col-md-4">
                            <a href="${path}/accommodation/accommodation_detail?accommodation_num=${accommodation.accommodation_num}">
                                <div class="card">
                                    <c:choose>
                                        <c:when test="${not empty accommodation.accommodation_mainimages}">
                                            <img src="${path}/displayFile?fileName=${accommodation.accommodation_mainimages}" class="card-img-top" alt="${accommodation.accommodation_name}" style="height: 200px; object-fit: cover;">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="com-img-area" style="width: 100%; height: 200px; overflow: hidden;">
                                                <img src="${path}/resources/default-image.png" alt="${accommodation.accommodation_name} 이미지" style="width: 100%; height: 100%; object-fit: cover;">
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <div class="card-body">
                                        <h5 class="card-title">${accommodation.accommodation_name}</h5>
                                        <p class="card-text">${accommodation.accommodation_description}</p>
                                        <p>
                                            <fmt:formatNumber value="${accommodation.accommodation_price}" pattern="#,###" />
                                            원
                                        </p>
                                        <a href="${path}/accommodation/accommodation_detail?accommodation_num=${accommodation.accommodation_num}" class="btn btn-primary">자세히 보기</a>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="col-md-12">
                        <p>인기 숙소가 없습니다.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</section>
</main>

<%@ include file="common/footer.jsp" %>
