<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<style>
body {
    font-family: 'Spoqa Han Sans Neo', 'sans-serif';
    background-color: #f5f5f5;
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
    color: #ff5a5f;
    font-size: 2.5rem;
    font-weight: bold;
    margin-bottom: 30px;
}

.form-group {
    margin-bottom: 20px;
}

label {
    font-weight: 500;
    color: #333;
    font-size: 1.2rem;
}

.form-control {
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    border: 1px solid #ced4da;
}

.btn {
    border-radius: 5px;
}

.btn-primary {
    background-color: #ff5a5f;
    border-color: #ff5a5f;
    transition: background-color 0.3s;
}

.btn-primary:hover {
    background-color: #e04a4f;
}

.btn-secondary {
    background-color: #ccc;
    border-color: #ccc;
}
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

form {
    background-color: #f8f9fa;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.form-group row {
    align-items: center;
}

.col-form-label {
    padding-top: calc(.375rem + 1px);
    padding-bottom: calc(.375rem + 1px);
    margin-bottom: 0;
    font-size: 1.1rem;
}

</style>
<div class="container my-5">
    <div class="text-center mb-4">
        <h1>숙소 수정하기</h1>
    </div>

    <c:if test="${not empty msg}">
        <div class="alert ${success ? 'alert-success' : 'alert-danger'}" role="alert">
            ${msg}
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/accommodation/accommodation_update" method="post">
        <input type="hidden" name="accommodation_num" value="${accommodation.accommodation_num}" />
      
        <div class="form-group row mb-4">
            <label for="name" class="col-md-2 col-form-label text-md-right">숙소 이름</label>
            <div class="col-md-10">
                <input class="form-control" id="name" name="name" type="text" value="${accommodation.accommodation_name}" required 
                       placeholder="숙소 이름을 입력하세요." />
            </div>
        </div>

        <div class="form-group row mb-4">
            <label for="address" class="col-md-2 col-form-label text-md-right">주소</label>
            <div class="col-md-10">
                <input class="form-control" id="address" name="address" type="text" value="${accommodation.accommodation_address}" required 
                       placeholder="숙소 주소를 입력하세요." />
            </div>
        </div>

        <div class="form-group row mb-4">
            <label for="price" class="col-md-2 col-form-label text-md-right">가격</label>
            <div class="col-md-10">
                <input class="form-control" id="price" name="price" type="number" value="${accommodation.accommodation_price}" required 
                       placeholder="가격을 입력하세요." />
            </div>
        </div>

        <div class="form-group row mb-4">
            <label for="type" class="col-md-2 col-form-label text-md-right">유형</label>
            <div class="col-md-10">
                <input class="form-control" id="type" name="type" type="text" value="${accommodation.accommodation_type}" required 
                       placeholder="숙소 유형을 입력하세요." />
            </div>
        </div>

        <div class="form-group row mb-4">
            <label for="description" class="col-md-2 col-form-label text-md-right">설명</label>
            <div class="col-md-10">
                <textarea class="form-control" id="description" name="description" rows="6" required 
                          placeholder="숙소 설명을 입력하세요.">${accommodation.accommodation_description}</textarea>
            </div>
        </div>

        <div class="form-group row mb-4">
            <label for="mainImage" class="col-md-2 col-form-label text-md-right">주 이미지 URL</label>
            <div class="col-md-10">
                <input class="form-control" id="mainImage" name="mainImage" type="url" value="${accommodation.accommodation_mainimages}" required 
                       placeholder="주 이미지 URL을 입력하세요." />
            </div>
        </div>

        <div class="form-group row mb-4">
            <label for="additionalImages" class="col-md-2 col-form-label text-md-right">추가 이미지 URL</label>
            <div class="col-md-10">
                <input class="form-control" id="additionalImages" name="additionalImages" type="url" value="${accommodation.accommodation_images1}" 
                       placeholder="추가 이미지 URL을 입력하세요." />
                <input class="form-control mt-2" name="additionalImages2" type="url" value="${accommodation.accommodation_images2}" 
                       placeholder="추가 이미지 URL을 입력하세요." />
            </div>
        </div>

        <div class="form-group row mb-4">
            <div class="col-md-12 text-center">
                <input type="submit" value="수정 완료" class="btn btn-primary btn-lg px-5" />
                <a href="${pageContext.request.contextPath}/accommodation/accommodation_list" class="btn btn-secondary btn-lg px-5 ml-3">목록으로 돌아가기</a>
            </div>
        </div>
    </form>
</div>

<%@ include file="../common/footer.jsp"%>
