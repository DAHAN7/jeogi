<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의 수정</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/css/style.css"> 
</head>
<body>
    <div class="container">
        <h2>문의 수정</h2>
        <form action="${path}/inquiry/modify" method="post" role="form">
            <input type="hidden" name="inquiry_id" value="${inquiry.inquiry_id}">
            <div class="form-group">
                <label for="title">제목:</label>
                <input type="text" id="title" name="title" class="form-control" value="${inquiry.title}" required aria-label="문의 제목">
            </div>
            <div class="form-group">
                <label for="content">내용:</label>
                <textarea id="content" name="content" class="form-control" rows="10" required aria-label="문의 내용">${inquiry.content}</textarea>
            </div>
            <div class="form-group">
                <label for="status">상태:</label>
                <select id="status" name="status" class="form-control">
                    <option value="답변 대기" ${inquiry.status == '답변 대기' ? 'selected' : ''}>답변 대기</option>
                    <option value="답변 완료" ${inquiry.status == '답변 완료' ? 'selected' : ''}>답변 완료</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">수정 완료</button>
            <button type="button" class="btn btn-secondary" onclick="history.back()">취소</button> 
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="${path}/js/script.js"></script> 
</body>
</html>