<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <title>로그인</title>
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&display=swap');

body {
  font-family: 'Open Sans', sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: #f4f4f4; /* 부드러운 배경색 */
  flex-direction: column; /* 컨텐츠를 세로로 정렬 */
  gap: 10px; /* 요소 사이 간격 */
}

.container {
  background-color: #fff;
  padding: 40px;
  border-radius: 12px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  width: 400px;
  text-align: center; /* 컨텐츠 가운데 정렬 */
}

h2 {
  margin-bottom: 30px;
  font-weight: 600;
  color: #333; /* 진한 글씨 색상 */
}

.form-group {
  margin-bottom: 20px;
}

label {
  display: block;
  margin-bottom: 8px;
  text-align: left; /* 레이블 왼쪽 정렬 */
  font-weight: 600;
  color: #555;
}

input[type="text"],
input[type="password"] {
  width: 100%;
  padding: 12px;
  border: 2px solid #ddd; /* 뚜렷한 테두리 */
  border-radius: 6px;
  box-sizing: border-box;
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

input[type="text"]:focus,
input[type="password"]:focus {
  border-color: #007bff;
  outline: none;
  box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.25); /* 넓은 포커스 효과 */
}

.error-message {
  color: #dc3545; /* 에러 메시지 색상 */
  font-size: 0.9em;
  margin-top: 5px;
}

button[type="submit"] {
  background-color: #007bff;
  color: #fff;
  padding: 12px 20px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  width: 100%;
  font-weight: 600;
  transition: background-color 0.3s ease;
}

button[type="submit"]:hover {
  background-color: #0069d9;
}

.register {
  margin-top: 20px;
}

.register a {
  color: #555;
  text-decoration: none;
  transition: color 0.3s ease;
}

.register a:hover {
  color: #007bff;
}

/* 반응형 디자인 */
@media (max-width: 500px) {
  .container {
    width: 90%;
    padding: 30px;
  }
}
</style>
<body>
    <h2>로그인</h2>
    <form action="${pageContext.request.contextPath}/member/login" method="post">
        <div>
            <label for="id">아이디:</label>
            <input type="text" id="id" name="id" required>
        </div>
        <div>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <button type="submit">로그인</button>
        </div>
    </form>
    <div>
        <p>계정이 없으신가요? <a href="${pageContext.request.contextPath}/member/register">계정 등록</a>을 진행하세요.</p>
    </div>
</body>
</html>
