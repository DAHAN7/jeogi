<!--accommodationreview -->
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
 #reviews {
    list-style: none;
    padding: 0;
  }

  #reviews li {
    border: 1px solid #ccc;
    margin-bottom: 20px;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
  }

  #reviews li .review-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
  }

  #reviews li .review-header .author {
    font-weight: bold;
  }

  #reviews li .review-header .created-at {
    font-size: 0.8em;
    color: #777;
  }

  #reviews li .review-content {
    margin-bottom: 10px;
  }

  #reviews li .review-image {
    max-width: 100%;
    height: auto;
    margin-bottom: 10px;
  }

  #reviews li .review-actions {
    display: flex;
    justify-content: flex-end;
  }

  #reviews li .review-actions button {
    margin-left: 10px;
    padding: 5px 10px;
    border: none;
    border-radius: 3px;
    background-color: #eee;
    cursor: pointer;
  }

  #reviews li .review-actions button:hover {
    background-color: #ddd;
  }

  #modDiv {
    border: 1px solid #ccc;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
    display: none;
    position: fixed; /* 수정 폼을 화면에 고정 */
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    z-index: 1000; /* 다른 요소 위에 표시 */
  }
</style>

<div id="modDiv">
    <!-- 리뷰 수정창 -->
    <h1>리뷰 수정</h1>
    <div id="modRno"></div>
    <div>
     <input type="text" id="modAuth" name="author" placeholder="작성자"/>
    </div>
   
    <div>
       <textarea id="modText" name="content" placeholder="리뷰 내용"></textarea>
    </div>    
    <div>
        <button id="modBtn">수정</button>
        <button id="delBtn">삭제</button>
        <button id="closeBtn">닫기</button>
    </div>
</div>

<hr/>

<!-- 리뷰 목록 출력 -->
<div>
    <ul id="reviews"></ul>
</div>

<br/><br/>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    // accommodation_num 변수가 JSP에서 정확히 전달되었는지 확인
    var accommodation_num = '${accommodation.accommodation_num}' || 0; // 값이 없을 경우 기본값 0 설정
    console.log("accommodation_num : "+accommodation_num);
    // 리뷰 목록 가져오기
    function listReviews() {
        let url = "${path}/reviews/accommodation/" + accommodation_num;
        console.log("listReviews url : " + url);
        $.getJSON(url, function(data) {
	        console.log(data[0]);
            printReviews(data);
        }).fail(function(res) {
            console.log("Error loading reviews:", res); // 에러 처리
        });
    }

    // 리뷰 목록을 HTML에 출력하는 함수
     function printReviews(data) {
    let str = "";
    $(data).each(function() {
      let rno = this.accommodation_num; 
      let rAuth = this.member_num; // 작성자
      let rText = this.content; // 리뷰 내용
      let created_at = this.created_at;
      let rating = this.rating;
      let images = this.images;

      str += "<li>";
      str += '<div class="review-header">';
      str += '<span class="author">' + rAuth + '</span>';
      str += '<span class="created-at">' + created_at + '</span>';
      str += '</div>';
      str += '<div class="review-content">' + rText + '</div>';
      if (images) {
        str += '<img src="${path}/displayFile?fileName='+images+'" alt="숙소 이미지" class="review-image" />';
      }
      str += '<div class="review-rating">';
      for (var i = 0; i < rating; i++) {
        str += "★";
      }
      str += '</div>';
      str += '<div class="review-actions">';
      str += '<button onclick="modDiv(this,' + rno + ', \'' + rAuth + '\', \'' + rText + '\');">수정</button>';
      str += '</div>';
      str += "</li>";
    });
    $("#reviews").html(str);
  }


    // 수정창 열기
    function modDiv(el, accommodation_num, member_num, content) {
        $("#modRno").html(accommodation_num);
        $("#modText").val(content);
        $("#modAuth").val(member_num);
        
        $("#modDiv").css("display", "none");
        $(el).parent().after($("#modDiv"));
        $("#modDiv").slideDown("slow");
    }

    // 수정 버튼 클릭
    $("#modBtn").click(function() {
        let rno = $("#modRno").text();
        let member_num = $("#modAuth").val();
        let content = $("#modText").val();
        if (!member_num || !content) {
            alert("작성자와 내용을 모두 입력해주세요!");
            return;
        };
		console.log("${path}/reviews/" + rno);	
        $.ajax({
            type: "POST",
            url: "${path}/reviews/" + rno,
            data:{
                content: content,
                member_num: member_num
            },	
            dataType: "text",
            success: function(result) {
                alert(result);
                $("#modDiv").slideUp("slow");
                listReviews(); // 리뷰 목록 새로 고침
            },
            error: function(res) {
                console.log("리뷰수정 오류:", res);
            }
        });
    });

    // 삭제 버튼 클릭
 // 삭제 버튼 클릭
$("#delBtn").click(function() {
    let review_id = $("#modRno").text();
    console.log("Deleting review with ID:", review_id); // 로그 추가

    $.ajax({
        type: "DELETE",
        url: "${path}/reviews/" + review_id,
        dataType: "text",
        success: function(result) {
            alert(result); // 서버에서 반환한 메시지 표시
            listReviews(); // 리뷰 목록 새로 고침
            $("#modDiv").fadeOut('slow'); // 수정 창 닫기
        },
        error: function(res) {
            console.log("리뷰 삭제 오류:", res); // 오류 로그
            alert("삭제 실패: " + res.responseText); // 사용자에게 오류 메시지 표시
        }
    });
});

    // 닫기 버튼 클릭
    $("#closeBtn").click(function() {
        $("#modDiv").fadeOut('slow');
    });

    // 페이지 로드 시 리뷰 목록 가져오기
    $(document).ready(function() {
        listReviews();
    });
</script>
