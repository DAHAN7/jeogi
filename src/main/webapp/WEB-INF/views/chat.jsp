<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <title>Chat Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            padding-top:100px
            
        }
        h1 {
            text-align: center;
            color: #333;
        }
        #chat-container {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
        }
        #data {
            width: 100%;
            height: 300px;
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 10px;
            overflow-y: auto;
            background: #fafafa;
            font-size: 14px;
        }
        #message {
            width: calc(100% - 80px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
        }
        #sendBtn {
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        #sendBtn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div id="chat-container">
        <h1>Chat Page</h1>
        <textarea id="data" readonly></textarea>
        <br/>
        <input type="text" id="message" placeholder="Type your message..." aria-label="Message input" />
        <button id="sendBtn">SEND</button>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script>
        var sock = new SockJS('${path}/chatHandler');

        sock.onopen = function() {
            console.log('Connection opened');
        };

        sock.onmessage = function(message) {
            let msg = message.data;
            console.log('Received message:', msg);
            $("#data").append(msg + "\n");
            $("#data").scrollTop($("#data")[0].scrollHeight); // Auto-scroll to the bottom
        };

        sock.onclose = function() {
            console.log('Connection closed');
        };

        function sendMessage() {
            let msg = $("#message").val();
            if (msg.trim()) { // Prevent sending empty messages
                sock.send(msg);
                $("#message").val("");
                $("#message").focus();
            }
        }

        $("#sendBtn").click(function() {
            sendMessage();
        });

        $("#message").keydown(function(e) {
            if (e.key === 'Enter') {
                e.preventDefault(); // Prevent newline character
                sendMessage();
            }
        });
    </script>
</body>
</html>
