<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

    <title>회원 가입</title>
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
  flex-direction: column;
  gap: 10px;
}

.container {
  background-color: #fff;
  padding: 40px;
  border-radius: 12px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  width: 500px;
  text-align: center;
}

h2 {
  margin-bottom: 30px;
  font-weight: 600;
  color: #333;
}

.form-group {
  margin-bottom: 20px;
  text-align: left;
}

label {
  display: block;
  margin-bottom: 8px;
  font-weight: 600;
  color: #555;
}

input[type="text"],
input[type="email"],
input[type="password"],
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

.login-link {
  margin-top: 20px;
}

.login-link a {
  color: #555;
  text-decoration: none;
  transition: color 0.3s ease;
}

.login-link a:hover {
  color: #007bff;
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
    <h2>회원 가입</h2>
    <form action="${pageContext.request.contextPath}/member/register" method="post">
        <div>
            <label for="id">아이디:</label>
            <input type="text" id="id" name="member_id" required>
        </div>
        <div>
            <label for="email">이메일:</label>
            <input type="email" id="email" name="member_email" required>
        </div>
        <div>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="member_pw" required>
        </div>
        <div>
            <label for="name">이름:</label>
            <input type="text" id="name" name="member_name" required>
        </div>
        <div>
            <label for="phone">전화번호:</label>
            <input type="text" id="phone" name="member_phone" required>
        </div>
 		<div>
            <label for="phone">생년월일:</label>
            <input type="date" id="date" name="member_birth" required>
        </div>	       
        <div>
            <button type="submit">등록</button>
        </div>
    </form>
    <div>
        <p>계정을 가지고 계신가요? <a href="${pageContext.request.contextPath}/member/login">로그인</a>하세요.</p>
    </div>
</body>
</html>
<%@ include file="../common/footer.jsp" %>