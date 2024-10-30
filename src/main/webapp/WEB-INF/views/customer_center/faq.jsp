<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .search-container {
            text-align: center;
            margin-bottom: 20px;
        }
        .search-container input {
            padding: 10px;
            width: 80%;
            max-width: 400px;
        }
        .faq-category {
            margin-bottom: 20px;
        }
        .faq-list {
            list-style-type: none;
            padding: 0;
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .faq-list li {
            margin-bottom: 15px;
            border-bottom: 1px solid #ddd;
        }
        .faq-list li:last-child {
            border-bottom: none;
        }
        .faq-list h2 {
            margin: 0;
            cursor: pointer;
            color: #007BFF;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 8px 8px 0 0;
            transition: background-color 0.3s;
        }
        .faq-list h2:hover {
            background-color: #e9ecef;
            text-decoration: underline;
        }
        .faq-list p {
            margin: 0;
            display: none;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 0 0 8px 8px;
        }
        .feedback {
            text-align: center;
            margin-top: 20px;
        }
    </style>
    <script>
        function toggleAnswer(index) {
            var answers = document.querySelectorAll('.faq-list p');
            var answer = answers[index];
            var isVisible = answer.style.display === 'block';

            // Update aria-expanded attributes
            var headings = document.querySelectorAll('.faq-list h2');
            headings[index].setAttribute('aria-expanded', !isVisible);

            answers.forEach(function(p) {
                p.style.display = 'none';
            });
            
            answer.style.display = isVisible ? 'none' : 'block';
        }

        function handleKeyPress(event, index) {
            if (event.key === 'Enter') {
                toggleAnswer(index);
            }
        }

        function searchFAQs() {
            var input = document.getElementById('search-input').value.toLowerCase();
            var items = document.querySelectorAll('.faq-list li');
            items.forEach(function(item) {
                var question = item.querySelector('h2').innerText.toLowerCase();
                item.style.display = question.includes(input) ? '' : 'none';
            });
        }
    </script>
</head>
<body>
    <h1>자주 묻는 질문</h1>
    <div class="search-container">
        <input type="text" id="search-input" placeholder="검색..." oninput="searchFAQs()">
    </div>

    <div class="faq-category">
        <h2>예약 관련</h2>
        <ul class="faq-list">
            <li>
                <h2 onclick="toggleAnswer(0)" onkeypress="handleKeyPress(event, 0)" tabindex="0" role="button" aria-expanded="false">예약을 취소하고 싶어요.</h2>
                <p>예약을 취소하려면 고객 센터로 연락하시거나, 온라인 계정에서 취소 절차를 진행하시면 됩니다.</p>
            </li>
            <li>
                <h2 onclick="toggleAnswer(1)" onkeypress="handleKeyPress(event, 1)" tabindex="0" role="button" aria-expanded="false">천재지변/감염병으로 인한 예약 취소는 어떻게 하나요?</h2>
                <p>천재지변이나 감염병으로 인한 예약 취소는 해당 사항을 증명할 수 있는 서류를 제출하신 후, 고객 센터를 통해 진행하실 수 있습니다.</p>
            </li>
        </ul>
    </div>

    <div class="faq-category">
        <h2>환불 및 결제 관련</h2>
        <ul class="faq-list">
            <li>
                <h2 onclick="toggleAnswer(2)" onkeypress="handleKeyPress(event, 2)" tabindex="0" role="button" aria-expanded="false">환불은 어떻게 받을 수 있나요?</h2>
                <p>환불은 구매하신 제품 또는 서비스의 정책에 따라 다르며, 고객 센터에 문의하시거나 온라인 계정에서 환불 절차를 확인하실 수 있습니다.</p>
            </li>
        </ul>
    </div>

    <div class="faq-category">
        <h2>배송 관련</h2>
        <ul class="faq-list">
            <li>
                <h2 onclick="toggleAnswer(3)" onkeypress="handleKeyPress(event, 3)" tabindex="0" role="button" aria-expanded="false">배송 기간은 얼마나 걸리나요?</h2>
                <p>배송 기간은 주문하신 상품의 종류와 배송지에 따라 다르며, 일반적으로 3~7일 이내에 배송됩니다. 정확한 배송 기간은 주문 확인 시 안내됩니다.</p>
            </li>
        </ul>
    </div>

    <div class="faq-category">
        <h2>회원 정보</h2>
        <ul class="faq-list">
            <li>
                <h2 onclick="toggleAnswer(4)" onkeypress="handleKeyPress(event, 4)" tabindex="0" role="button" aria-expanded="false">회원 가입은 어떻게 하나요?</h2>
                <p>회원 가입은 웹사이트의 '회원 가입' 페이지에서 진행하실 수 있으며, 이메일 주소와 비밀번호를 입력하여 계정을 생성하시면 됩니다.</p>
            </li>
        </ul>
    </div>

    <div class="feedback">
        <h3>피드백을 주실 수 있습니다!</h3>
        <p>FAQ 내용에 대한 피드백은 <a href="${path}/inquiry/list">여기</a>를 클릭하여 제공해 주세요.</p>
    </div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>