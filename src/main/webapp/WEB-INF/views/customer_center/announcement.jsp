<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항</title>
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
            margin-bottom: 20px;
        }
        .announcement-list {
            list-style-type: none;
            padding: 0;
            max-width: 900px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .announcement-list li {
            border-bottom: 1px solid #ddd;
            padding: 15px 20px;
            transition: background-color 0.3s;
        }
        .announcement-list li:last-child {
            border-bottom: none;
        }
        .announcement-list a {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
            display: block;
        }
        .announcement-list a:hover {
            text-decoration: underline;
        }
        .announcement-list .date {
            font-size: 0.9em;
            color: #666;
            margin-left: 10px;
        }
        .announcement-list .description {
            margin-top: 10px;
            color: #555;
        }
        .announcement-list .view-more {
            display: inline-block;
            margin-top: 10px;
            font-size: 0.9em;
            color: #007BFF;
            text-decoration: none;
        }
        .announcement-list .view-more:hover {
            text-decoration: underline;
        }
        .announcement-list .read-more {
            color: #007BFF;
            font-size: 0.9em;
            text-decoration: none;
        }
        .announcement-list .read-more:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>공지사항</h1>
    <ul class="announcement-list">
        <li>
            <a href="#">저기어때 앱 10.1 업데이트 안내</a>
            <span class="date">- 2024-10-09</span>
            <p class="description">더욱 빨라진 검색 놀라운 속도와 개선된 사용자 인터페이스를 경험해보세요!</p>
        </li>
        <li>
            <a href="#">할로윈 기념 특별 이벤트</a>
            <span class="date">- 2024-10-05</span>
            <p class="description">할로윈 테마 숙소 최대 70% 할인! 호박 챌린지 참여하고 쿠폰 받으세요!</p>
        </li>
        <li>
            <a href="#">10월 10일 서비스 점검 안내</a>
            <span class="date">- 2024-10-01</span>
            <p class="description">더 나은 서비스 제공을 위해 10월 10일(수) 01:00 ~ 05:00 서비스 점검이 진행됩니다.</p>
        </li>
        <li>
            <a href="#">인기 숙소 "OO호텔" 정보 변경 안내</a>
            <span class="date">- 2024-09-28</span>
            <p class="description">OO호텔의 부대시설 및 운영 시간 정보가 변경되었습니다. 예약 전 확인 부탁드립니다.</p>
        </li>
        <li>
            <a href="#">새로운 제휴 서비스 "OO렌터카" 오픈</a>
            <span class="date">- 2024-09-25</span>
            <p class="description">여기어때에서 렌터카 예약까지 한 번에! OO렌터카 제휴 기념 특가 혜택을 놓치지 마세요.</p>
        </li>
        <li>
            <a href="#">여기어때 이용약관 개정 안내</a>
            <span class="date">- 2024-09-20</span>
            <p class="description">2024년 10월 1일부터 저기어때 이용약관이 개정됩니다. 자세한 내용은 공지사항을 확인해주세요.</p>
        </li>
        <li>
            <a href="#">결제 오류 관련 안내</a>
            <span class="date">- 2024-09-15</span>
            <p class="description">9월 14일 발생한 결제 오류가 복구되었습니다. 이용에 불편을 드려 죄송합니다.</p>
        </li>
        <li>
            <a href="#">[당첨자 발표] 가을 여행 후기 이벤트 당첨자 안내</a>
            <span class="date">- 2024-09-10</span>
            <p class="description">가을 여행 후기 이벤트 당첨자를 발표합니다! 당첨되신 분들께는 개별 연락드립니다.</p>
        </li>
        <li>
            <a href="#">추석 연휴 숙소 예약 마감 임박 안내</a>
            <span class="date">- 2024-08-30</span>
            <p class="description">추석 연휴 숙소 예약이 마감되고 있습니다. 서둘러 예약하세요!</p>
        </li>
        <li>
            <a href="#">저기어때 고객센터 운영 안내</a>
            <span class="date">- 2024-08-25</span>
            <p class="description">추석 연휴 기간 동안 고객센터 운영 시간이 변경됩니다. 자세한 내용은 공지사항을 확인해주세요.</p>
        </li>
    </ul>
</body>
</html>