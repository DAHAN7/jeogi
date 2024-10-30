<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
body {
    font-family: 'Spoqa Han Sans Neo', 'sans-serif';
    background-color: #f5f5f5; /* 밝은 회색 배경 */
    padding-top:100px;
}

.container {
    max-width: 720px;
    margin: 0 auto;
    padding: 30px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h1 {
    color: #ff5a5f; /* 여기어때 메인 색상 */
    font-size: 2.5rem;
    font-weight: bold;
    margin-bottom: 30px;
}

.form-group {
    margin-bottom: 20px;
}

label {
    font-weight: 500; /* 약간 굵은 폰트 */
    color: #333;
    font-size: 1.2rem;
}

.form-control {
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    border: 1px solid #ced4da; /* Bootstrap 기본 border 색상 */
}

.btn {
    border-radius: 5px;
}

.btn-primary {
    background-color: #ff5a5f; /* 여기어때 메인 색상 */
    border-color: #ff5a5f;
    transition: background-color 0.3s; /* 호버 효과 부드럽게 */
}

.btn-primary:hover {
    background-color: #e04a4f; /* 호버 시 어두운 색상 */
}

.btn-secondary {
    background-color: #ccc;
    border-color: #ccc;
}

/* 추가적인 스타일 */
.alert {
    margin-bottom: 20px;
    border-radius: 5px;
    font-size: 1.1rem;
}

.alert-success {
    background-color: #d4edda;
    border-color: #c3e6cb;
    color: #155724;
}

.alert-danger {
    background-color: #f8d7da;
    border-color: #f5c6cb;
    color: #721c24;
}

.text-md-right {
    text-align: right;
}

textarea.form-control {
    resize: vertical;
}

.btn-lg {
    padding: 10px 20px;
    font-size: 1.2rem;
}

.ml-3 {
    margin-left: 1rem;
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

</style>
<div class="container my-5">
    <div class="text-center mb-4">
        <h1>리뷰 수정</h1>
    </div>

    <!-- 성공 또는 실패 메시지 표시 -->
    <c:if test="${not empty msg}">
        <div class="alert ${success ? 'alert-success' : 'alert-danger'}" role="alert">
            ${msg}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/review/update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="review_id" value="${review.review_id}" onsubmit="return validateForm();" enctype="multipart/form-data"/>
      
        <div class="form-group row mb-4">
            <label for="rating" class="col-md-2 col-form-label text-md-right">평점</label>
            <div class="col-md-10">
                <input class="form-control" id="rating" name="rating" type="number" value="${review.rating}" min="1" max="5" required 
                       placeholder="1에서 5 사이의 평점을 입력하세요." />
            </div>
        </div>

        <div class="form-group row mb-4">
            <label for="content" class="col-md-2 col-form-label text-md-right">내용</label>
            <div class="col-md-10">
                <textarea class="form-control" id="content" name="content" rows="6" required 
                          placeholder="리뷰 내용을 입력하세요.">${review.content}</textarea>
            </div>
        </div>

        <div class="form-group row mb-4">
            <label for="images" class="col-md-2 col-form-label text-md-right">이미지 파일</label>
            <div class="col-md-10">
                <input class="form-control" id="images" name="file" type="file" value="${review.fileName()}" accept="image/*" required 
                       placeholder="이미지 URL을 입력하세요." />
            </div>
        </div>

        <div class="form-group row mb-4">
            <div class="col-md-12 text-center">
                <input type="submit" value="수정 완료" class="btn btn-primary btn-lg px-5" />
                <a href="${pageContext.request.contextPath}/review/list" class="btn btn-secondary btn-lg px-5 ml-3">목록으로 돌아가기</a>
            </div>
        </div>
    </form>
</div>
<script>
function validateForm() {
	var imageUrl = document.getElementById("images").value;
	var file = document.getElementById("file").value;

	if (imageUrl === "" && file === "") {
		alert("이미지 URL 또는 파일 중 하나는 반드시 입력해야 합니다.");
		return false;
	}
	return true;
}
</script>
<%@ include file="../common/footer.jsp"%>
