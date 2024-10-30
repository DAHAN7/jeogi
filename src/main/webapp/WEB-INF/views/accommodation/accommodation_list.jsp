<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp"%>

<style>
body{
padding-top:100px;
}
.card {
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.card-img-top {
	border-bottom: 1px solid #ddd;
}

.card-body {
	padding: 20px;
}

.card-title {
	font-size: 1.25rem;
	color: #333;
}

.card-subtitle {
	font-size: 1rem;
	color: #777;
}

.card-text {
	font-size: 0.875rem;
	color: #555;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
	transition: background-color 0.3s ease, border-color 0.3s ease;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #004085;
}

.container {
	max-width: 1200px;
}

.row {
	margin: 0;
}

.col-md-4 {
	padding: 0 15px;
}

.text-center {
	text-align: center;
}

.my-4 {
	margin-top: 1.5rem;
	margin-bottom: 1.5rem;
}

.my-5 {
	margin-top: 3rem;
	margin-bottom: 3rem;
}

.page-item {
	display: inline-block;
}
</style>

<div class="container my-5">
	<h1 class="text-center mb-4">숙소 목록</h1>
	<a
		href="${pageContext.request.contextPath}/accommodation/accommodation_writer"
		class="btn btn-primary mb-4">숙소 추가하기</a>

	<div class="row">
		<c:forEach items="${accommodation_list}" var="accommodation">
			<div class="col-md-4 mb-4">
				<div class="card shadow-sm rounded">
					<img
						src="${contextPath}/displayFile?fileName=${accommodation.accommodation_mainimages}"
						alt="${accommodation.accommodation_name}" class="card-img-top"
						style="height: 200px; object-fit: cover;">
					<div class="card-body">
						<h5 class="card-title">${accommodation.accommodation_name}</h5>
						<h6 class="card-subtitle mb-2 text-muted">${accommodation.accommodation_address}</h6>
						<p class="card-text">${accommodation.accommodation_description}</p>
						<p class="card-text">
							<strong>가격:</strong> ${accommodation.accommodation_price}원
						</p>
						<div class="d-flex justify-content-end">
							<a
								href="${pageContext.request.contextPath}/accommodation/accommodation_detail?accommodation_num=${accommodation.accommodation_num}"
								class="btn btn-info">숙소 상세 보기</a>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div class="pagination justify-content-center">
		<c:if test="${pm.prev}">
			<li class="page-item"><a class="page-link"
				href="?page=${pm.startPage - 1}">&lt;</a></li>
		</c:if>
		<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
			<li class="page-item ${pm.cri.page eq i ? 'active' : ''}"><a
				class="page-link" href="?page=${i}">${i}</a></li>
		</c:forEach>
		<c:if test="${pm.next}">
			<li class="page-item"><a class="page-link"
				href="?page=${pm.endPage + 1}">&gt;</a></li>
		</c:if>
	</div>
</div>

<script>
	function detail(accommodation_num) {
		window.location.href = '${pageContext.request.contextPath}/accommodation/accommodation_detail?accommodation_num='
				+ accommodation_num;
	}
</script>

<%@ include file="../common/footer.jsp"%>
