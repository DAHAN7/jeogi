<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
body {
    background-color: #f0f4f8;
    font-family: 'Helvetica Neue', Arial, sans-serif;
    color: #333;
    padding-top:100px;
}

/* 카드 스타일 */
.card {
    border: none;
    border-radius: 15px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    background: linear-gradient(145deg, #ffffff, #e6e6e6);
    box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1), -5px -5px 15px rgba(255, 255, 255, 0.8);
}

.card:hover {
    transform: scale(1.05);
    box-shadow: 8px 8px 25px rgba(0, 0, 0, 0.2), -8px -8px 25px rgba(255, 255, 255, 0.9);
}

/* 카드 본문 스타일 */
.card-body {
    padding: 20px;
}

/* 제목 및 텍스트 스타일 */
.card-title {
    font-size: 1.5rem;
    color: #0056b3;
    margin-bottom: 15px;
}

.card-text {
    font-size: 1rem;
    color: #555;
    margin: 10px 0;
}

/* 페이지 컨테이너 스타일 */
.container {
    max-width: 1200px;
}

/* 중앙 정렬 */
.text-center {
    text-align: center;
}

/* 여백 */
.my-5 {
    margin: 3rem 0;
}

/* 페이지 아이템 스타일 */
.page-item {
    display: inline-block;
}

/* 버튼 스타일 */
.btn-primary {
    background-color: #007bff;
    border: none;
    border-radius: 50px;
    padding: 10px 20px;
    font-size: 1rem;
    transition: background-color 0.3s, transform 0.2s;
    box-shadow: 0 4px 8px rgba(0, 123, 255, 0.2);
}

.btn-primary:hover {
    background-color: #0056b3;
    transform: translateY(-2px);
}

/* 페이지네이션 스타일 */
.pagination {
    margin: 20px 0;
}

.pagination .page-link {
    border: none;
    color: #007bff;
    padding: 10px 15px;
}

.pagination .page-item.active .page-link {
    background-color: #007bff;
    color: white;
}

.pagination .page-item:hover .page-link {
    background-color: #e9ecef;
    color: #0056b3;
}

/* 반응형 스타일 */
@media (max-width: 576px) {
    .card-title {
        font-size: 1.25rem;
    }

    .card-text {
        font-size: 0.9rem;
    }

    .btn-primary {
        width: 100%;
    }
}
</style>

<div class="container my-5">
   <h1 class="text-center mb-4">예약 목록</h1>

   <c:if test="${empty reservation_list}">
      <p class="text-center">예약이 없습니다.</p>
   </c:if>

   <c:if test="${not empty reservation_list}">
      <div class="row">
         <c:forEach var="reservation" items="${reservation_list}">
				<div class="col-md-4 mb-4">
					<div class="card shadow-sm rounded">
						<div class="card-body">
							<p class="card-text">예약번호: ${reservation.reservation_num}</p>
							<p class="card-text">체크인 날짜: ${reservation.reservation_checkin_date}</p>
							<p class="card-text">체크아웃 날짜: ${reservation.reservation_checkout_date}</p>
							<p class="card-text">예약 인원 수: ${reservation.reservation_guests_num}</p>
							<p class="card-text">
								총 결제 금액: <span class="text-primary">${reservation.reservation_price}</span>
								원
							</p>
							<p class="card-text">상태: ${reservation.reservation_status}</p>
							<p class="card-text">멤버번호: ${reservation.member_num}</p>
							<p class="card-text">숙소번호: ${reservation.accommodation_num}</p>

							<div class="d-flex justify-content-end">
								<button class="btn btn-primary"
									onclick="detail(${reservation.reservation_num})">자세히 보기</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
      </div>
   </c:if>

   <div class="container">
      <ul class="pagination justify-content-center">
         <c:if test="${pm.prev}">
            <li class="page-item"><a class="page-link"
               href="?page=${pm.startPage-1}">&lt;</a></li>
         </c:if>
         <c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
            <li class="page-item ${pm.cri.page == i ? 'active' : ''}">
               <a class="page-link" href="?page=${i}">${i}</a>
            </li>
         </c:forEach>
         <c:if test="${pm.next}">
            <li class="page-item"><a class="page-link"
               href="?page=${pm.endPage+1}">&gt;</a></li>
         </c:if>
      </ul>
   </div>

   <div class="text-center my-4">
      <a href="${pageContext.request.contextPath}/reservation/reservation_writer"
         class="btn btn-primary">예약하기</a>
   </div>
</div>

<script>
   function detail(reservation_num) {
      window.location.href = '${pageContext.request.contextPath}/reservation/reservation_detail?reservation_num=' + reservation_num;
   }
</script>

<%@ include file="../common/footer.jsp"%>
