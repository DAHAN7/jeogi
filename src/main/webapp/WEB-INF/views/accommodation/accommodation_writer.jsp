<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>

<div class="container my-5">
    <h1 class="text-center mb-4">숙소 추가</h1>
    <form action="accommodation_writer" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="accommodation_name" class="form-label">숙소 이름</label>
            <input type="text" class="form-control" id="accommodation_name" name="accommodation_name" required>
        </div>
        <div class="mb-3">
            <label for="accommodation_address" class="form-label">주소</label>
            <input type="text" class="form-control" id="accommodation_address" name="accommodation_address" required>
        </div>
        <div class="mb-3">
            <label for="accommodation_description" class="form-label">설명</label>
            <textarea class="form-control" id="accommodation_description" name="accommodation_description" required></textarea>
        </div>
        <div class="mb-3">
            <label for="accommodation_type" class="form-label">유형</label>
            <input type="text" class="form-control" id="accommodation_type" name="accommodation_type" required>
        </div>
        <div class="mb-3">
            <label for="accommodation_price" class="form-label">가격</label>
            <input type="number" class="form-control" id="accommodation_price" name="accommodation_price" required>
        </div>
        <div class="mb-3">
            <label for="accommodation_mainimages" class="form-label">대표 이미지</label>
            <input type="file" class="form-control" id="accommodation_mainimages" name="file">
        </div>
        <div class="mb-3">
            <label for="accommodation_images1" class="form-label">이미지 1</label>
            <input type="file" class="form-control" id="accommodation_images1" name="file">
        </div>
        <div class="mb-3">
            <label for="accommodation_images2" class="form-label">이미지 2</label>
            <input type="file" class="form-control" id="accommodation_images2" name="file">
        </div>
        <button type="submit" class="btn btn-primary">숙소 추가</button>
        <a href="${pageContext.request.contextPath}/accommodation/accommodation_list" class="btn btn-secondary">취소</a>
    </form>
</div>

<%@ include file="../common/footer.jsp"%>
