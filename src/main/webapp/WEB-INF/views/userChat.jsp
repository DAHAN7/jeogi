<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>여기어때 회원 문의 채팅페이지</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        
        h1 {
            text-align: center;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .chatBox {
            height: 300px;
            overflow-y: auto;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            padding: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .chatWrap {
            margin: 5px 0;
            display: flex;
            align-items: center;
        }

        .chatWrap img {
            width: 40px;
            height: 40px;
            border-radius: 20px;
            border: 1px solid black;
            margin-right: 10px;
        }

        .messageInput {
            display: flex;
            align-items: center;
        }

        input[type="text"] {
            flex-grow: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
            outline: none;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus {
            border-color: #4CAF50;
        }

        input[type="button"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="button"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div>
    <h1>여기어때 회원 문의 채팅페이지  ${userInfo.u_name}</h1>
    <div class="chatBox" id="data">
        <!-- 채팅 내용 출력 -->
    </div>
    <div class="messageInput">
        <input type="text" id="message" placeholder="메세지를 입력하세요..." />
        <input type="button" id="sendBtn" value="SEND" />
    </div>
</div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    var webSocket = new WebSocket("${path}/sobangCha");
    
    webSocket.onopen = function(){
        console.log("연결완료");
    }
    
    webSocket.onclose = function(){
        console.log("server 와 연결 끊김");
        webSocket.close();
    };
    
    webSocket.onmessage = function(msgData){
        console.log(msgData);
        let message = msgData.data;
        let msgObj = JSON.parse(message);
        
        let str = "<div class='chatWrap'>";
        if (msgObj.u_profile != null && msgObj.u_profile != '') {
            str += "<img src='${path}/displayFile?fileName=" + msgObj.u_profile + "'/>";
        } else {
            str += "<img src='${path}/resources/img/profile.jpg'/>";
        }
        str += "<span><strong>" + msgObj.u_name + ":</strong> " + msgObj.message + "</span>";
        str += "</div>";
        
        $("#data").append(str);    
        let scrollHeight = $("#data").prop("scrollHeight");
        $("#data").scrollTop(scrollHeight);
        $("#message").focus();
    }
    
    function sendMessage() {
        let msg = $("#message").val();
        
        let msgObj = {
            u_id: '${userInfo.u_id}',
            u_name: '${userInfo.u_name}',
            u_profile: '${userInfo.u_profile}',
            message: msg
        };
        
        webSocket.send(JSON.stringify(msgObj));
        $("#message").val("");
        $("#message").focus();
    }
    
    // send 버튼 클릭시 작성된 메세지 전송
    $("#sendBtn").click(function() {
        sendMessage();
    });
    
    // message 입력필드에 Enter가 눌러지면 메세지 전송
    $("#message").keydown(function(e) {
        if (e.keyCode == 13) {
            sendMessage();		
        }
    });
</script>
</body>
</html>
