<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
body {
    background-color: #f7f9fc;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #333;
    padding-top:100px;
}
.container {
    max-width: 800px;
    margin: auto;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 15px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}
h1 {
    font-size: 2rem;
    color: #0056b3;
    margin-bottom: 20px;
}
.form-label {
    font-weight: bold;
    color: #555;
}

/* 입력 필드 스타일 */
.form-control {
    border-radius: 10px;
    border: 1px solid #ddd;
    padding: 10px 15px;
    transition: border 0.3s ease;
}

.form-control:focus {
    border-color: #0056b3;
    box-shadow: 0 0 5px rgba(0, 86, 179, 0.5);
}

/* 버튼 스타일 */
.btn {
    border-radius: 50px;
    padding: 10px 20px;
    font-size: 1rem;
    transition: background-color 0.3s, transform 0.2s;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.btn-primary {
    background-color: #007bff;
    border: none;
    color: white;
}

.btn-primary:hover {
    background-color: #0056b3;
    transform: translateY(-2px);
}

.btn-secondary {
    background-color: #6c757d;
    border: none;
    color: white;
    margin-left: 10px;
}

.btn-secondary:hover {
    background-color: #5a6268;
    transform: translateY(-2px);
}

/* 여백 스타일 */
.mb-3 {
    margin-bottom: 1.5rem;
}

.my-5 {
    margin-top: 3rem;
    margin-bottom: 3rem;
}
</style>
<div class="container my-5">
    <h1 class="text-center mb-4">예약하기</h1>
    <form action="reservation_writer" method="post">
        <div class="mb-3">
            <label for="check_in_date" class="form-label">체크인 날짜</label>
            <input type="date" class="form-control" id="reservation_checkin_date" name="reservation_checkin_date" required>
        </div>
        <div class="mb-3">
            <label for="check_out_date" class="form-label">체크아웃 날짜</label>
            <input type="date" class="form-control" id="reservation_checkout_date" name="reservation_checkout_date" required>
        </div>
        <div class="mb-3">
            <label for="number_of_guests" class="form-label">예약 인원 수</label>
            <input type="number" class="form-control" id="reservation_guests_num" name="reservation_guests_num" required>
        </div>
        <div class="mb-3">
            <label for="total_price" class="form-label">총 결제 금액</label>
            <input type="number" class="form-control" id="reservation_price" name="reservation_price" required>
        </div>
        <button type="submit" class="btn btn-primary">예약 완료</button>
        <a href="${pageContext.request.contextPath}/reservation/reservation_list" class="btn btn-secondary">취소</a>
    </form>
</div>

<%@ include file="../common/footer.jsp"%>
