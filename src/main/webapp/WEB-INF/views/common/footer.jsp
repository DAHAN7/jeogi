<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>저기어때 푸터</title>
    <style>
        .container {
            padding: 20px;
            background-color: #f8f9fa; /* 배경색 추가 */
        }

        h3 {
            margin-bottom: 15px;
            font-weight: bold;
            color: black;
        }

        .styled-list {
            list-style: none; /* 기본 불릿 제거 */
            padding: 0; /* 패딩 제거 */
        }

        .styled-list li {
            margin: 10px 0;
            color : black;
        }

        .styled-list a {
            text-decoration: none; /* 밑줄 제거 */
            color: #007bff; /* 링크 색상 */
            transition: color 0.3s; /* 색상 변화 애니메이션 */
        }

        .styled-list a:hover {
            color: #0056b3; /* hover 시 색상 변화 */
        }

        .text-center {
            margin-top: 20px;
            color: #6c757d; 
        }
    </style>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        var msg = '${msg}';
        if (msg !== '') alert(msg);
    </script>
</head>
<body>
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h3>저기어때</h3>
                    <ul class="styled-list">
                        <li><a href="#">회사소개</a></li>
                        <li><a href="#">인재채용</a></li>
                        <li><a href="#">이용약관</a></li>
                        <li><a href="#">개인정보처리방침</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h3>제휴문의</h3>
                    <ul class="styled-list">
                        <li>제휴문의: <a href="mailto:partner@jeogieottae.com">partner@jeogieottae.com</a></li>
                        <li>광고문의: <a href="mailto:ad@jeogieottae.com">ad@jeogieottae.com</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h3>소셜 미디어</h3>
                    <ul class="styled-list">
                        <li><a href="#"><i class="fab fa-facebook"></i> 페이스북</a></li>
                        <li><a href="#"><i class="fab fa-instagram"></i> 인스타그램</a></li>
                        <li><a href="#"><i class="fab fa-twitter"></i> 트위터</a></li>
                        <li><a href="#"><i class="fab fa-youtube"></i> 유튜브</a></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <p>&copy; 2024 저기어때. All rights reserved.</p>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>
