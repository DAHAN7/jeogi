<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
body {
    background-color: #f8f9fa;
    font-family: 'Arial', sans-serif;
}
.card {
    border-radius: 15px;
    border: none;
    transition: transform 0.2s, box-shadow 0.2s;
}

.card:hover {
    transform: scale(1.02);
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
}

.card-title {
    font-size: 1.5rem;
    color: #343a40;
}

.card-text {
    font-size: 1.1rem;
    color: #495057;
}
.list-group-item {
    border: none;
    padding: 15px;
    background-color: #ffffff;
}

.list-group-item:nth-child(odd) {
    background-color: #f1f3f5;
}

.list-group-item:hover {
    background-color: #e9ecef;
}

.btn-secondary {
    background-color: #6c757d;
    border: none;
    border-radius: 30px;
    padding: 10px 20px;
    font-size: 1rem;
    transition: background-color 0.3s, transform 0.2s;
}

.btn-secondary:hover {
    background-color: #5a6268;
    transform: translateY(-2px);
}

.text-primary {
    color: #007bff;
}

.text-center {
    text-align: center;
}

@media (max-width: 576px) {
    .card-title {
        font-size: 1.25rem;
    }

    .card-text {
        font-size: 1rem;
    }

    .btn-secondary {
        width: 100%;
    }
}

</style>
<div class="container my-5">
    <h1 class="text-center mb-4">예약 상세 정보</h1>
    <c:if test="${not empty reservation}">
        <div class="card shadow-lg mb-4">
            <div class="card-body">
                <h5 class="card-title">예약 번호: <strong>${reservation.reservation_num}</strong></h5>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">체크인 날짜: <strong>${reservation.reservation_checkin_date}</strong></li>
                    <li class="list-group-item">체크아웃 날짜: <strong>${reservation.reservation_checkout_date}</strong></li>
                    <li class="list-group-item">예약 인원 수: <strong>${reservation.reservation_guests_num}</strong></li>
                    <li class="list-group-item">총 결제 금액: <span class="text-primary"><strong>${reservation.reservation_price}</strong></span> 원</li>
                    <li class="list-group-item">상태: <strong>${reservation.reservation_status}</strong></li>
                    <li class="list-group-item">멤버번호: <strong>${reservation.member_num}</strong></li>
                    <li class="list-group-item">숙소번호: <strong>${reservation.accommodation_num}</strong></li>
                </ul>
                <a href="${pageContext.request.contextPath}/reservation/reservation_list" class="btn btn-secondary mt-3">목록으로 돌아가기</a>
            </div>
        </div>
    </c:if>

    <c:if test="${empty reservation}">
        <p class="text-center">예약 정보를 찾을 수 없습니다.</p>
        <a href="${pageContext.request.contextPath}/reservation/reservation_list" class="btn btn-secondary mt-3">목록으로 돌아가기</a>
    </c:if>
</div>

<%@ include file="../common/footer.jsp"%>