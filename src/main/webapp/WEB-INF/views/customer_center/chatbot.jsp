<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../common/header.jsp"%>
<title>챗봇 상담</title>
<style>
body {
	font-family: 'Spoqa Han Sans Neo', sans-serif;
	margin: 0;
	padding: 20px;
	background-color: #f8f9fa;
	     padding-top: 100px; 
}

h1 {
	color: #222;
	text-align: center;
	margin-bottom: 20px;
	font-weight: 600;
}

.chat-container {
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
	border-radius: 12px;
	background-color: #fff;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.chat-box {
	height: 350px;
	overflow-y: auto;
	padding: 15px;
	background-color: #f9f9f9;
	border-radius: 8px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
}

.chat-box p {
	margin: 5px 0;
	padding: 10px;
	border-radius: 8px;
}

.chat-box .bot-message {
	background-color: #e9ecef;
	color: #343a40;
	text-align: left;
}

.chat-box .user-message {
	background-color: #007bff;
	color: #fff;
	text-align: right;
}

.chat-input-container {
	display: flex;
	align-items: center;
}

.chat-input {
	flex: 1;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 25px;
	margin-right: 10px;
}

.send-button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 15px;
	border-radius: 25px;
	cursor: pointer;
}

.send-button:hover {
	background-color: #0056b3;
}

.chat-button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 8px 15px;
	border-radius: 25px;
	cursor: pointer;
	margin-top: 5px;
	text-decoration: none;
}

.chat-button:hover {
	background-color: #0056b3;
}

.message-time {
	font-size: 0.8em;
	color: #999;
	text-align: right;
}
</style>
</head>
<body>
	<h1>챗봇 상담</h1>
	<div class="chat-container">
		<div class="chat-box" id="chatBox">
			<p class="bot-message">챗봇: 안녕하세요! 여기어때 챗봇입니다. 무엇을 도와드릴까요?</p>
		</div>
		<div class="chat-input-container">
			<input type="text" class="chat-input" id="chatInput"
				placeholder="메시지를 입력하세요..."
				onkeydown="if(event.key === 'Enter') sendMessage()">
			<button class="send-button" onclick="sendMessage()">전송</button>
		</div>
	</div>

	<script>
		const knowledgeBase = {
			예약 : "예약 관련 문의는 여기어때 고객센터 1588-3792로 연락주세요. (24시간 운영)",
			숙소추천 : "어떤 지역의 숙소를 찾으시나요? (예: 부산 해운대)",
			이벤트 : "진행 중인 이벤트를 확인해 보세요! <br> <a href='#' class='chat-button'>이벤트 보러 가기</a>",
			여행정보 : "어떤 여행지의 정보가 필요하신가요? (예: 제주도, 강릉 등)",
			고객지원 : "고객 지원 관련 문의는 여기에 남겨주세요.",
			기본 : "죄송합니다. 아직 이해하지 못하는 질문입니다. 곧 더 많은 질문을 이해할 수 있도록 학습하겠습니다."
		};

		function sendMessage() {
			const input = document.getElementById('chatInput');
			const chatBox = document.getElementById('chatBox');
			const userMessage = input.value.trim();
			const timestamp = new Date().toLocaleTimeString([], {
				hour : '2-digit',
				minute : '2-digit'
			});

			if (userMessage) {
				chatBox.innerHTML += `<p class="user-message">사용자: ${userMessage} <span class="message-time">${timestamp}</span></p>`;
				input.value = '';

				const botMessage = generateResponse(userMessage);
				chatBox.innerHTML += `<p class="bot-message">챗봇: ${botMessage} <span class="message-time">${timestamp}</span></p>`;
				chatBox.scrollTop = chatBox.scrollHeight;
			}
		}

		function generateResponse(message) {
			const lowerCaseMessage = message.toLowerCase();
			if (lowerCaseMessage.includes("예약")) {
				return knowledgeBase.예약;
			} else if (lowerCaseMessage.includes("숙소 추천")) {
				return knowledgeBase.숙소추천;
			} else if (lowerCaseMessage.includes("이벤트")) {
				return knowledgeBase.이벤트;
			} else if (lowerCaseMessage.includes("여행 정보")) {
				return knowledgeBase.여행정보;
			} else if (lowerCaseMessage.includes("고객 지원")) {
				return knowledgeBase.고객지원;
			} else {
				return knowledgeBase.기본;
			}
		}
	</script>
</body>
</html>
<%@ include file="../common/footer.jsp"%>