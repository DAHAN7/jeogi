<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>고객센터</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }
        .customer-center {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            border-bottom: 1px solid #ddd;
            background-color: #fff;
        }
        .customer-center a {
            text-decoration: none;
            color: #333;
            width: 100%;
            max-width: 120px;
            text-align: center;
        }
        .customer-center div {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .customer-center img {
            width: 50px;
            height: 50px;
            margin-bottom: 10px;
            object-fit: cover;
        }
        .customer-center p {
            margin: 0;
            font-size: 14px;
            color: #333;
        }
        .customer-center .info {
            font-size: 12px;
            color: #888;
        }
        @media (max-width: 768px) {
            .customer-center {
                flex-direction: column;
                align-items: stretch;
            }
            .customer-center a {
                margin-bottom: 15px;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="customer-center">
        <a href="${pageContext.request.contextPath}/customer-center/announcement">
            <div>
                <img src="${pageContext.request.contextPath}/images/announcement-icon.png" alt="공지사항">
                <p>공지사항</p>
            </div>
        </a>
        <a href="${pageContext.request.contextPath}/customer-center/faq">
            <div>
                <img src="${pageContext.request.contextPath}/images/faq-icon.png" alt="자주 묻는 질문">
                <p>자주 묻는 질문</p>
            </div>
        </a>
        <a href="${pageContext.request.contextPath}/customer-center/chatbot">
            <div>
                <img src="${pageContext.request.contextPath}/images/chatbot-icon.png" alt="챗봇상담">
                <p>챗봇상담</p>
            </div>
        </a>
        <a href="${pageContext.request.contextPath}/customer-center/customer_service">
            <div>
                <img src="${pageContext.request.contextPath}/images/customer-service-icon.png" alt="고객상담센터">
                <p>고객상담센터</p>
            </div>
        </a>
    </div>
</body>
</html>
