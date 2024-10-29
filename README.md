##저기어때 (jeogi): 🗺️ 숙소 예약부터 실시간 채팅까지, 당신의 여행을 위한 완벽한 동반자

저기어때(joegi)는 국비 지원 교육 프로그램의 파이널 프로젝트로 개발된 여행 정보 공유 및 예약 플랫폼입니다. 

빡빡한 일정 속에서 잠깐의 휴식을 꿈꾸는 당신, 낯선 곳에서의 설렘을 느끼고 싶은 당신, jeogi와 함께라면 여행 계획부터 실행까지 모든 과정이 즐거워집니다. 😉

### ✨ 저기어때(jeogi)가 제공하는 특별한 경험

나만을 위한 맞춤 숙소 찾기:
    * 다양한 검색 필터를 통해 원하는 조건에 딱 맞는 숙소를 찾아보세요. 
    * 가격, 위치, 편의시설 등 상세 정보를 확인하고, 마음에 드는 숙소를 간편하게 예약할 수 있습니다.
생생한 여행 후기 공유:
    * 다른 여행자들이 남긴 생생한 후기를 통해 숨겨진 명소를 발견하고, 여행 꿀팁을 얻어보세요. 
    * 직접 경험한 여행 이야기를 사진과 함께 공유하고, 다른 사용자들과 소통하며 여행의 즐거움을 더하세요.
실시간 채팅으로 여행 친구 만들기: 
    * jeogi의 실시간 채팅 기능을 통해 여행 계획을 함께 세우고, 정보를 공유하며, 새로운 친구를 사귈 수 있습니다. 
    * 여행 중 궁금한 점은 언제든지 다른 사용자들에게 질문하고, 도움을 받을 수 있습니다.

### 🚀 저기어때(jeogi)의 핵심 기능

* **회원 관리:** 회원 가입, 로그인, 회원 정보 수정, 마이페이지
* **숙박 시설 정보:** 숙박 시설 등록, 조회, 검색, 예약
* **여행 정보 공유:** 여행 후기 작성, 조회, 공유, 댓글 기능
* **고객 지원:** FAQ, 챗봇, 1:1 문의
* **실시간 채팅:** WebSocket을 이용한 실시간 채팅 기능
* **커뮤니티:** 여행 정보 공유, 질문/답변

### 🛠️ 기술 스택

* **Backend:** Java 11, Spring Framework (MVC, Security, Boot), MyBatis, MySQL 8.0
* **Frontend:** JSP, JavaScript, HTML5, CSS3, AJAX, jQuery
* **Server:** Tomcat 9.0
* **Tools:** Eclipse, GitHub, Maven

### 🏗️ 시스템 아키텍처

jeogi는 Model-View-Controller (MVC) 아키텍처 패턴을 기반으로 설계되었으며, RESTful API를 통해 데이터를 주고받습니다.

* **Model:** 데이터베이스와 상호 작용하며 비즈니스 로직을 처리합니다. (`com.bitc.jeogi.vo` 패키지 참조)
* **View:** 사용자 인터페이스를 담당하며 JSP를 사용하여 구현되었습니다. (`webapp/WEB-INF/views` 폴더 참조)
* **Controller:** 사용자 요청을 처리하고 Model과 View를 연결합니다. (`com.bitc.jeogi.controller` 패키지 참조)

**데이터베이스 설계:**
<img width="587" alt="database" src="https://github.com/user-attachments/assets/fc2a0794-dfde-4311-b55c-b77af76655a0">


### 💻 개발 내용

* **숙박 시설 예약 기능:** 
    * 사용자는 숙박 시설 정보를 조회하고 예약할 수 있습니다.
    * 예약 시스템은 AJAX를 이용하여 비동기적으로 작동하며, 사용자 경험을 향상시킵니다.
    * 예약 정보는 데이터베이스에 안전하게 저장됩니다.
* **실시간 채팅 기능:**
    * WebSocket을 이용하여 실시간 채팅 기능을 구현했습니다.
    * 사용자는 다른 사용자와 실시간으로 메시지를 주고받으며 여행 정보를 공유하고 친목을 다질 수 있습니다. (`com.bitc.jeogi.chat` 패키지 참조)
* **Spring Security를 이용한 보안:**
    * Spring Security를 이용하여 회원 정보를 안전하게 보호합니다.
    * 비밀번호는 암호화되어 저장되며, 권한 관리를 통해 시스템 보안을 강화했습니다.
* **MyBatis 동적 쿼리 활용:**
    * MyBatis 동적 쿼리를 사용하여 효율적인 데이터베이스 쿼리를 작성했습니다.
    * 다양한 검색 조건에 따라 유연하게 데이터를 조회할 수 있으며, 코드 가독성을 높였습니다.

### 🏃 실행 방법

1. **프로젝트 파일 다운로드:** 
    * GitHub 저장소에서 프로젝트 파일을 다운로드합니다. (링크 첨부)
2. **Eclipse에서 프로젝트 Import:**
    * Eclipse에서 `File` > `Import` > `Maven` > `Existing Maven Projects`를 선택하여 프로젝트를 import 합니다.
3. **Tomcat 서버 설정:**
    * Eclipse에 Tomcat 9.0 서버를 추가하고 프로젝트를 배포합니다.
4. **MySQL DB 설정:**
    * MySQL 8.0 서버를 설치하고 `src/main/resources/prop/db.properties` 파일을 수정하여 데이터베이스 연결 정보를 설정합니다.
    * `src/main/resources/sql/create table.sql` 파일을 실행하여 데이터베이스 테이블을 생성합니다.
    * `src/main/resources/sql/insert into.sql` 파일을 실행하여 샘플 데이터를 추가합니다.
5. **프로젝트 실행:**
    * Tomcat 서버를 실행하여 프로젝트를 실행합니다.
    * 웹 브라우저에서 `localhost:8080/jeogi`에 접속합니다.

### 🎬 시연 영상 및 스크린샷

* **프로젝트 시연 영상:** (YouTube 링크 첨부)
* **주요 기능 스크린샷:**

[Image of jeogi main page with attractive design]

[Image of jeogi accommodation search with various filters]

[Image of jeogi accommodation reservation process]

[Image of jeogi real-time chat interface]


---

**저는 국비 지원 교육 프로그램에서 배운 지식을 바탕으로 저기어때(jeogi)를 개발했습니다.** 

프로젝트를 진행하는 동안 Spring Framework, MyBatis, AJAX 등 다양한 기술을 익히고 적용할 수 있었습니다. 특히 실시간 채팅 기능 구현과 MyBatis 동적 쿼리 활용은 어려운 과제였지만, 문제 해결 과정을 통해 많은 것을 배울 수 있었고, 개발자로서 성장하는 발판이 되었습니다. 💪

**저기어때(jeogi)**는 아직 부족한 점이 많지만, 앞으로 꾸준히 개선하고 발전시켜 나갈 계획입니다. 사용자들의 피드백을 적극적으로 반영하여 더욱 편리하고 유용한 여행 플랫폼을 만들어나가겠습니다. 😊

감사합니다.
