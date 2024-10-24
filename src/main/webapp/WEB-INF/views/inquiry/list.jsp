<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f5f7fa;
        margin: 0;
        padding: 0;
        color: #333;
        line-height: 1.6;
    }
    .container {
        max-width: 900px;
        margin: 30px auto;
        background-color: #ffffff;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
        padding: 30px;
        overflow: hidden;
        transition: transform 0.3s;
    }
    .container:hover {
        transform: translateY(-2px);
    }
    hr {
        border: none;
        height: 2px;
        background-color: #e0e0e0;
        margin: 30px 0;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        padding: 15px;
        text-align: center;
        border: 1px solid #e0e0e0;
    }
    th {
        background-color: #4CAF50;
        color: white;
        font-weight: bold;
        text-transform: uppercase;
    }
    a {
        text-decoration: none;
        color: #007BFF;
        transition: color 0.3s, text-shadow 0.3s;
    }
    a:hover {
        color: #0056b3;
        text-decoration: underline;
        text-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
    }
    form {
        margin-bottom: 30px;
        display: flex;
        gap: 10px;
    }
    input[type="text"], select {
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 6px;
        width: 100%;
        box-sizing: border-box;
        transition: border-color 0.3s;
    }
    input[type="text"]:focus, select:focus {
        border-color: #4CAF50;
        outline: none;
    }
    input[type="submit"] {
        padding: 12px 20px;
        border: none;
        border-radius: 6px;
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
        font-size: 16px;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
        transform: translateY(-1px);
    }
    .pagination {
        margin-top: 20px;
        text-align: center;
    }
    .pagination a {
        margin: 0 5px;
        padding: 10px 15px;
        border: 1px solid #ddd;
        border-radius: 6px;
        background-color: #f1f1f1;
        transition: background-color 0.3s, transform 0.2s;
    }
    .pagination a:hover {
        background-color: #ddd;
        transform: translateY(-1px);
    }
    .no-data {
        text-align: center;
        font-size: 1.2em;
        color: #777;
    }
</style>

<div class="container">
    <br/>
    <hr/>
    <!-- 검색 폼 -->
    <form action="${path}/inquiry/list">
        <input type="text" name="keyword" placeholder="검색할 키워드를 작성해주세요."/>
        <input type="submit" value="검색"/>
        <select name="perPageNum" onchange="this.form.submit();">
            <c:forEach var="i" begin="5" end="30" step="5">
                <option value="${i}" ${i == pm.cri.perPageNum ? 'selected' : ''}>${i}개씩 보기</option>
            </c:forEach>
        </select>
    </form>

    <!-- 문의 등록 버튼 (로그인한 사용자에게만 표시) -->
    <c:if test="${!empty member}">
        <form action="${path}/inquiry/register">
            <input type="submit" value="문의 등록"/>
        </form>
    </c:if>
    <hr/>

    <!-- 문의 목록 테이블 -->
    <table>
        <tr>
            <th>ID</th>
            <th>TITLE</th>
            <th>USER</th>
            <th>CREATED AT</th>
            <th>STATUS</th>
        </tr>
        <c:choose>
            <c:when test="${!empty list}">
                <!-- 문의 목록 출력 -->
                <c:forEach var="inquiry" items="${list}">
                    <tr>
                        <td>${inquiry.inquiry_id}</td>
                        <td><a href="${path}/inquiry/read?inquiry_id=${inquiry.inquiry_id}">${inquiry.title}</a></td>
                        <td>${inquiry.member_id}</td>
                        <td>${inquiry.created_at}</td>
                        <td>${inquiry.status}</td>
                    </tr>
                </c:forEach>

                <!-- 페이징 블럭 출력 -->
                <tr>
                    <td colspan="5" class="pagination">
                        <c:if test="${pm.first}">
                            <a href="${pm.makeQuery(1)}">[처음]</a>
                        </c:if>
                        <c:if test="${pm.prev}">
                            <a href="${pm.makeQuery(pm.prevPage)}">[이전]</a>
                        </c:if>
                        <c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
                            <a href="${pm.makeQuery(i)}">[${i}]</a>
                        </c:forEach>
                        <c:if test="${pm.next}">
                            <a href="${pm.makeQuery(pm.nextPage)}">[다음]</a>
                        </c:if>
                        <c:if test="${pm.last}">
                            <a href="${pm.makeQuery(pm.maxPage)}">[마지막]</a>
                        </c:if>
                    </td>
                </tr>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="5">등록된 문의가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>
</div>
</body>
</html>
