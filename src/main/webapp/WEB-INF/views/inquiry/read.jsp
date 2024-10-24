<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f2f4f6;
        margin: 0;
        padding: 20px;
        color: #333;
    }
    .container {
        max-width: 800px;
        margin: 0 auto;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        padding: 20px;
    }
    h1 {
        font-size: 24px;
        margin-bottom: 20px;
        color: #4CAF50;
        text-align: center;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 12px;
        border: 1px solid #ccc;
        vertical-align: top;
    }
    th {
        background-color: #f4f4f4;
        text-align: left;
        font-weight: bold;
    }
    textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        resize: vertical;
        box-sizing: border-box;
    }
    .btn {
        display: inline-block;
        padding: 10px 15px;
        margin: 10px 5px 0 0;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        transition: background-color 0.3s, transform 0.2s;
    }
    .btn:hover {
        background-color: #45a049;
        transform: translateY(-1px);
    }
    button {
        padding: 10px 15px;
        background-color: #f44336;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
    }
    button:hover {
        background-color: #d32f2f;
        transform: translateY(-1px);
    }
</style>
<div class="container">
    <h1>문의 상세보기</h1>
    <table>
        <tr>
            <th>제목</th>
            <td>${inquiry.title}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${inquiry.member_id}</td>
        </tr>
        <tr>
            <th>작성일</th>
            <td>${inquiry.created_at}</td>
        </tr>
        <tr>
            <th>상태</th>
            <td>${inquiry.status}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${inquiry.content}</td>
        </tr>
        <tr>
             <td colspan="2" style="text-align: center;">
                <form action="${path}/inquiry/modify" method="GET" style="display: inline;">
                    <input type="hidden" name="inquiry_id" value="${inquiry.inquiry_id}" />
                    <button type="submit" class="btn">수정</button>
                </form>
                <form action="${path}/inquiry/delete" method="POST" style="display: inline;" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                    <input type="hidden" name="inquiry_id" value="${inquiry.inquiry_id}" />
                    <button type="submit">삭제</button>
                </form>
                <a href="${path}/inquiry/list" class="btn">목록으로</a>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
