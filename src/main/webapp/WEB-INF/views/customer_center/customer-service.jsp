<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/header.jsp"%>
<head>
    <title>고객상담센터</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
                 padding-top: 100px; 
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        .contact-info {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            font-size: 16px;
            line-height: 1.6;
        }
        .contact-info p {
            margin: 10px 0;
            display: flex;
            align-items: center;
        }
        .contact-info p strong {
            flex: 0 0 120px;
            font-weight: bold;
            color: #333;
        }
        .contact-info p span {
            color: #555;
        }
        .contact-info .email, .contact-info .phone {
            color: #007bff;
        }
        .contact-info .email:hover, .contact-info .phone:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>고객 상담 센터</h1>
    <div class="contact-info">
        <p><strong>전화번호:</strong> <span class="phone">123-456-7890</span></p>
        <p><strong>이메일:</strong> <a href="mailto:joegi@example.com" class="email">joegi@example.com</a></p>
        <p><strong>운영시간:</strong> <span>365일 오전 9시 - 익일 오전 3시</span></p>
    </div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>