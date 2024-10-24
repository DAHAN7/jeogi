<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
body {
  font-family: 'Spoqa Han Sans Neo', 'sans-serif'; /* 굵고 둥근 폰트 (Spoqa Han Sans Neo 또는 유사한 폰트 사용) */
  background-color: #f5f5f5; /* 밝은 회색 배경 */
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

.review-label {
  font-size: 1.2rem;
  font-weight: 500; /* 약간 굵은 폰트 */
  color: #333;
}

.form-control-plaintext {
  font-size: 1.1rem;
  color: #666;
}

textarea.form-control {
  resize: vertical;
  height: 150px; /* 텍스트 영역 높이 조절 */
}

.review-actions {
  display: flex;
  justify-content: center; /* 버튼 가운데 정렬 */
}

.review-actions .btn {
  margin: 0 10px; /* 버튼 간 간격 */
  font-size: 1.1rem;
  font-weight: 500;
}

.btn-warning {
  background-color: #f0ad4e; /* 여기어때 스타일 노란색 */
  border-color: #f0ad4e;
}

.btn-danger {
  background-color: #d9534f; /* 여기어때 스타일 빨간색 */
  border-color: #d9534f;
}

.btn-secondary {
  background-color: #ccc;
  border-color: #ccc;
}

/* 이미지 스타일 */
.img-fluid {
  max-width: 100%;
  height: auto;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

/* 알림 메시지 스타일 */   
.alert {
  border-radius: 5px;
  font-size: 1.1rem;
}

.alert-danger {
  background-color: #f8d7da;
  border-color: #f5c6cb;
  color: #721c24;
}

</style>
<body>
    <div class="container review-detail-container">
        <h1 class="text-center my-4">리뷰 상세</h1>

        <c:if test="${not empty msg}">
            <p class="alert alert-danger text-center">${msg}</p>
        </c:if>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label review-label text-right">리뷰 ID</label>
            <div class="col-sm-9">
                <p class="form-control-plaintext">${review.review_id}</p>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label review-label text-right">작성자 ID</label>
            <div class="col-sm-9">
                <p class="form-control-plaintext">${review.member_num}</p>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label review-label text-right">평점</label>
               <div class="col-sm-9">
              <div class="star-rating">
                <c:forEach var="i" begin="1" end="5">
                    <c:choose>
                        <c:when test="${i <= review.rating}">
                            <span class="filled">★</span> 
                        </c:when>
                        <c:otherwise>
                            <span>☆</span> 
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
            
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label review-label text-right">내용</label>
            <div class="col-sm-9">
                <textarea class="form-control" rows="5" readonly>${review.content}</textarea>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-sm-3 col-form-label review-label text-right">이미지 URL</label>
            <div class="col-sm-9">
                <img src="${contextPath}/displayFile?fileName=${review.images}" alt="리뷰 이미지" class="img-fluid" />
            </div>
        </div>
        
        

        <div class="review-actions my-4">
            <a href="${pageContext.request.contextPath}/review/update?review_id=${review.review_id}" class="btn btn-warning">수정</a>
            <form action="${pageContext.request.contextPath}/review/delete" method="post" style="display:inline;">
                <input type="hidden" name="review_id" value="${review.review_id}" />
                <input type="submit" value="삭제" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');"/>
            </form>
            <a href="${pageContext.request.contextPath}/review/list" class="btn btn-secondary">목록으로 돌아가기</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>