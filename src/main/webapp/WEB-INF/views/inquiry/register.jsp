<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
<head>
    <title>게시글 등록</title>
     <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
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
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            vertical-align: top;
        }
        th {
            width: 100px;
            text-align: left;
            background-color: #f5f5f5;
            font-weight: bold;
        }
        input[type="text"],
        textarea {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus,
        textarea:focus {
            border-color: #4CAF50;
            outline: none;
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }
        button:hover {
            background-color: #45a049;
            transform: translateY(-1px);
        }
    </style>
</head>
<body>
<div class="container">
    <h1>게시글 등록</h1>
    <form action="${pageContext.request.contextPath}/inquiry/register" method="POST">
        <input type="hidden" name="member_id" value="${sessionScope.member.member_id}" />
        <table>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" required/></td>
            </tr>
            <tr>
                <th>작성자</th>
                    <td>${sessionScope.member.member_id}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" rows="10" cols="50" required></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <button type="submit">게시글 등록</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
