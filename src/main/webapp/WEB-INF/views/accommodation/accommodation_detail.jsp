<!-- accommodation_detail -->
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: 'Spoqa Han Sans Neo', 'sans-serif';
	background-color: #f5f5f5;
	padding-top: 110px;
}

.container {
	max-width: 720px;
	margin: 0 auto;
	padding: 30px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

#submitButton {
	background-color: #007bff; /* 파란색 배경 */
	color: white;
	border: none;
	padding: 12px 20px;
	font-size: 1.2rem;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
	transition: all 0.2s ease;
}

#submitButton:hover {
	background-color: #0069d9; /* 더 진한 파란색 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* 더 깊은 그림자 */
}

.accommodation-actions {
	display: flex;
	justify-content: center;
	gap: 20px; /* 버튼 사이 간격 */
}

.accommodation-actions .btn {
	padding: 10px 20px; /* 버튼 패딩 */
	font-size: 1.1rem;
	font-weight: 500;
	transition: all 0.2s ease; /* 호버 효과 */
}

.accommodation-actions .btn:hover {
	transform: translateY(-2px); /* 호버 시 위로 이동 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 */
}

h1 {
	color: #ff5a5f;
	font-size: 2.5rem;
	font-weight: bold;
	margin-bottom: 30px;
}

.accommodation-label {
	font-size: 1.2rem;
	font-weight: 500;
	color: #333;
}

.form-control-plaintext {
	font-size: 1.1rem;
	color: #666;
}

.accommodation-actions {
	display: flex;
	justify-content: center;
}

.accommodation-actions .btn {
	margin: 0 10px;
	font-size: 1.1rem;
	font-weight: 500;
}

.btn-warning {
	background-color: #f0ad4e;
	border-color: #f0ad4e;
}

.btn-danger {
	background-color: #d9534f;
	border-color: #d9534f;
}

.btn-secondary {
	background-color: #ccc;
	border-color: #ccc;
}

.img-fluid {
	max-width: 100%;
	height: auto;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.alert {
	border-radius: 5px;
	font-size: 1.1rem;
}

.alert-danger {
	background-color: #f8d7da;
	border-color: #f5c6cb;
	color: #721c24;
}

.review-section {
	margin-top: 40px;
}

.review-list {
	list-style: none;
	padding: 0;
}

.review-item {
	border: 1px solid #ccc;
	padding: 10px;
	margin: 10px 0;
}

.review-item p {
	margin: 0;
}
/* 폼 스타일 개선 */
form {
	background-color: #f8f9fa; /* 밝은 회색 배경 */
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 더 깊은 그림자 효과 */
}

.form-group row {
	align-items: center; /* 레이블과 입력 필드 수직 정렬 */
}

.col-form-label {
	padding-top: calc(.375rem + 1px);
	padding-bottom: calc(.375rem + 1px);
	margin-bottom: 0;
	font-size: 1.1rem; /* 레이블 폰트 크기 증가 */
}

.star-rating {
	display: inline-flex;
	direction: rtl; /* 오른쪽에서 왼쪽으로 배치 */
}

.star-rating input {
	display: none; /* input 요소 숨김 */
}

.star-rating label {
	font-size: 2rem;
	color: #ddd;
	cursor: pointer;
	transition: color 0.2s;
}

.star-rating input:checked ~ label {
	color: #f39c12;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	color: #f39c12; /* Hover시 별 색 */
}
</style>
<body>
	<div class="container accommodation-detail-container">
		<h1 class="text-center my-4">숙소 상세보기</h1>

		<c:if test="${not empty msg}">
			<p class="alert alert-danger text-center">${msg}</p>
		</c:if>

		<div class="form-group row">
			<label class="col-sm-3 col-form-label accommodation-label text-right">숙소
				ID</label>
			<div class="col-sm-9">
				<p class="form-control-plaintext">${accommodation.accommodation_num}</p>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-3 col-form-label accommodation-label text-right">숙소
				이름</label>
			<div class="col-sm-9">
				<p class="form-control-plaintext">${accommodation.accommodation_name}</p>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-3 col-form-label accommodation-label text-right">주소</label>
			<div class="col-sm-9">
				<p class="form-control-plaintext">${accommodation.accommodation_address}</p>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-3 col-form-label accommodation-label text-right">가격</label>
			<div class="col-sm-9">
				<p class="form-control-plaintext">${accommodation.accommodation_price}
					원</p>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-3 col-form-label accommodation-label text-right">유형</label>
			<div class="col-sm-9">
				<p class="form-control-plaintext">${accommodation.accommodation_type}</p>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-3 col-form-label accommodation-label text-right">설명</label>
			<div class="col-sm-9">
				<textarea class="form-control" rows="5" readonly>${accommodation.accommodation_description}</textarea>
			</div>
		</div>

		<div class="form-group row">
			<label class="col-sm-3 col-form-label accommodation-label text-right">메인
				이미지</label>
			<div class="col-sm-9">
				<img
					src="${contextPath}/displayFile?fileName=${accommodation.accommodation_mainimages}"
					alt="숙소 이미지" class="img-fluid" />
			</div>
		</div>

		<div class="accommodation-actions my-4">
			<a
				href="${pageContext.request.contextPath}/accommodation/accommodation_update?accommodation_num=${accommodation.accommodation_num}"
				class="btn btn-outline-warning"> <i class="bi bi-pencil-square"></i>
				수정
			</a>
			<form
				action="${pageContext.request.contextPath}/accommodation/accommodation_delete"
				method="post" style="display: inline;">
				<input type="hidden" name="accommodation_num"
					value="${accommodation.accommodation_num}" />
				<button type="submit" class="btn btn-outline-danger"
					onclick="return confirm('정말 삭제하시겠습니까?');">
					<i class="bi bi-trash"></i> 삭제
				</button>
			</form>
			<a
				href="${pageContext.request.contextPath}/accommodation/accommodation_list"
				class="btn btn-primary"> <i class="bi bi-list-ul"></i> 목록으로 돌아가기
			</a>
		</div>
	</div>



	<hr />
	<h2>리뷰 작성</h2>
	<div>
		<form action="${pageContext.request.contextPath}/review/write"
			method="post" onsubmit="return validateForm();"
			enctype="multipart/form-data">

			<div class="form-group row">
				<label
					class="col-sm-3 col-form-label accommodation-label text-right">숙소
					ID</label>
				<div class="col-sm-9">
					<p class="form-control-plaintext">${accommodation.accommodation_num}</p>
				</div>
			</div>

			<%-- <input name="member_num" value="${member.member_num}" />
             <input name="accommodation_num" value="1" /> 
        --%>

			<div class="form-group row mb-4">
				<label for="rating" class="col-md-2 col-form-label text-md-right">평점</label>
				<div class="col-md-10">
					<input class="form-control" id="rating" name="rating" type="number"
						min="1" max="5" placeholder="1에서 5 사이의 숫자를 입력하세요" required />
					<div class="star-rating">
						<input type="radio" id="star5" name="rating1" value="5" /> <label
							for="star5">☆</label> <input type="radio" id="star4"
							name="rating1" value="4" /> <label for="star4">☆</label> <input
							type="radio" id="star3" name="rating1" value="3" /> <label
							for="star3">☆</label> <input type="radio" id="star2"
							name="rating1" value="2" /> <label for="star2">☆</label> <input
							type="radio" id="star1" name="rating1" value="1" /> <label
							for="star1">☆</label>
					</div>
				</div>
			</div>

			<div class="form-group row mb-4">
				<label for="content" class="col-md-2 col-form-label text-md-right">내용</label>
				<div class="col-md-10">
					<textarea class="form-control" id="reviewContent" name="content"
						rows="6" cols="2" placeholder="리뷰 내용을 입력하세요" required></textarea>
				</div>
			</div>

			<div class="form-group row mb-4">
				<label for="file" class="col-md-2 col-form-label text-md-right">이미지
					파일</label>
				<div class="col-md-10">
					<input class="form-control" id="file" name="file" type="file"
						accept="image/*" />
				</div>
			</div>

			<div class="form-group row mb-4">
				<div class="col-md-12 text-center">
					<button id="submitButton">작성 완료</button>
					<a
						href="${pageContext.request.contextPath}/accommodation/accommodation_detail"
						class="btn btn-secondary btn-lg px-5 ml-3">목록으로 돌아가기</a>
				</div>
			</div>

		</form>
	</div>

	<!-- 리뷰 목록 출력 -->
	<div>
		<ul id="reviews"></ul>
	</div>
	<%@ include file="accommodationreview.jsp"%>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$(document).ready(
				function() {
					// 숫자 입력 필드 변경 시 별점 변경
					$("#rating").change(
							function() {
								let rating = $(this).val();
								$(
										"input[name='rating1'][value='"
												+ rating + "']").prop(
										'checked', true);
							});

					// 별점 클릭 시 숫자 입력 필드 변경
					$("input[name='rating1']").change(function() {
						let rating = $(this).val();
						$("#rating").val(rating);
					});
				});

		$("#submitButton").click(function() {
			console.log("버튼 클릭");
			let rating = $("input[name=rating1]");
			for (let i = 0; i <= 4; i++) {
				if (rating[i].checked)
					console.log(5 - i + "점");
			}
			let reviewContent = $("#reviewContent").val();
			console.log(reviewContent);
			let file = $("#file")[0].files[0];
			console.log(file.name);
			return false;
		})
	</script>
</body>
</html>
