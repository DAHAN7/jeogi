<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/header.jsp"%>
    <title>회원정보</title>
</head>
<style>
/* Google Font - Noto Sans KR */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;600&display=swap');

body {
  font-family: 'Noto Sans KR', sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f8f9fa;
  flex-direction: column; /* 컨텐츠를 세로로 정렬 */
  gap: 10px; /* 요소 사이 간격 */
}

.container {
  background-color: #fff;
  padding: 40px;
  border-radius: 12px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  width: 500px; /* 폼 너비 조정 */
  text-align: center;
}

h2 {
  margin-bottom: 30px;
  font-weight: 600;
  color: #333;
}

.form-group {
  margin-bottom: 20px;
  text-align: left; /* 레이블 왼쪽 정렬 */
}

label {
  display: block;
  margin-bottom: 8px;
  font-weight: 600;
  color: #555;
}

input[type="text"],
input[type="email"],
input[type="date"] {
  width: 100%;
  padding: 12px;
  border: 2px solid #ddd;
  border-radius: 6px;
  box-sizing: border-box;
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

input:focus {
  border-color: #007bff;
  outline: none;
  box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.25);
}

input[readonly] { /* 읽기 전용 input 스타일 */
  background-color: #e9ecef;
  opacity: 0.8;
}

a {
  display: inline-block; /* 링크 스타일 */
  padding: 10px 20px;
  background-color: #007bff;
  color: #fff;
  text-decoration: none;
  border-radius: 6px;
  transition: background-color 0.3s ease;
  margin-top: 10px;
}

a:hover {
  background-color: #0069d9;
}

/* 반응형 디자인 */
@media (max-width: 600px) {
  .container {
    width: 90%;
    padding: 30px;
  }
}
</style>
<body>
<h2>회원정보</h2>
    <c:if test="${not empty member}">
    <form action="${pageContext.request.contextPath}/member/profile" method="post">
                   <input type="hidden" name="member_num" value="${member.member_num}">
            <div>
                <label for="id">사용자 ID:</label>
                <input type="text" id="id" name="member_id" value="${member.member_id}" readonly>
            </div>
            <div>
                <label for="email">이메일:</label>
                <input type="email" id="email" name="member_email" value="${member.member_email}" required>
            </div>
           
            <div>
                <label for="name">이름:</label>
                <input type="text" id="name" name="member_name" value="${member.member_name}" required>
            </div>
            <div>
                <label for="phone">전화번호:</label>
                <input type="text" id="phone" name="member_phone" value="${member.member_phone}" required>
            </div>
              <div>
            <label for="phone">생년월일:</label>
            <input type="date" id="date" name="member_birth" value="${member.member_birth}"  required>
        	</div>
    </form>
    </c:if>
             <a href="${pageContext.request.contextPath}/member/updateProfile">회원정보 수정</a>
             
    <c:if test="${empty member}">
        <p>Please <a href="${pageContext.request.contextPath}/member/login">login</a> 회원정보를 보여주세요</p>
    </c:if>
</body>
</html>

