# 창인이와 함께 떠나는 버스 여행(버스노선 기반 각종 여행지 추)
-------------------
[Spring Boot] Spring Boot+HTML+Jquery+Mybatis를 활용한 2인 프로젝트

1. 📺 프로젝트 소개
   ---------------
   간단한 이동 및 여행 중 주변에 보이는 버스정류장 및 버스 노선에 기반하여 먹거리, 놀거리, 맛집, 카페 등 여러가지를 추천하고 해당 장소를 즐겨찾기할 수 있도록 구성하여
   여행 계획에 좀 더 좋은 선택지를 제공할 수 있도록 구성하였습니다.
   
3. 🕰️ 개발 기간
   ----------------
   + 2024.06.03 ~ 2024.06.05 (2일간)

4. 🧑‍🤝‍🧑 맴버구성
   ----------------
  + 이장우 - 백엔드 및 배포 담당
  + 김창인 - 프론트 및 스타일 담당

4. 🌐 개발 환경
   ----------------
   + Backend 
   <img src="https://img.shields.io/badge/JAVA-007396?style=flat-square&logo=Java&logoColor=white"/> <img src="https://img.shields.io/badge/Spring_Boot-6DB33F?style=flat-square&logo=springboot&logoColor=white"/> <img src="https://img.shields.io/badge/Swagger-85EA2D?style=flat-square&logo=swagger&logoColor=white"/> <img src="https://img.shields.io/badge/MYSQL-4479A1?style=flat-square&logo=mysql&logoColor=white"/> <img src="https://img.shields.io/badge/Naver-4479A1?style=flat-square&logo=naver&logoColor=white"/>
   + Frontend 
   <img src="https://img.shields.io/badge/HTML-E34F26?style=flat-square&logo=html5&logoColor=white"/> <img src="https://img.shields.io/badge/JS-ffff00?style=flat-square&logo=javascript&logoColor=white"/> <img src="https://img.shields.io/badge/Jquery-0769AD?style=flat-square&logo=jquery&logoColor=white"/>
   + Deploy 
    <img src="https://img.shields.io/badge/Jenkins-D24939?style=flat-square&logo=jenkins&logoColor=white"/> <img src="https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white"/> <img src="https://img.shields.io/badge/Git-F05032?style=flat-square&logo=git&logoColor=white"/> <img src="https://img.shields.io/badge/Postman-FF6C37?style=flat-square&logo=postman&logoColor=white"/>
    
6. 📍 주요 기능
   ----------------
   + Login Page
     + Email, Password 기반으로 로그인 여부 판단
       + 로그인 성공 시 : Spring Boot의 Session을 활용하여 User의 name, userindex을 적재
       + 로그인 실패 시 : 로그인 실패 알람 후 홈 페이지로 이동
   
   + Sign in Page
     + ID를 입력 후 중복체크 수행
     + 이름,전화번호, 주소 입력
     + 자신의 프로필 자신을 입력하여 회원가입 실행
       + 프로필 수정을 위해 홈 화면에서 자신의 프로필 사진을 클릭하여 이동한 뒤 수정

   + Forgot Email
     + 이름을 기반으로 자신의 ID에 해당하는 이메일을 찾음
       
   + Forgot password
     + Email을 기반으로 패스워드 찾기를 실행하여 패스워드를 찾음
    
   + Main Page
     + 홈 화면에서 자신이 검색을 하고 싶은 지역 및 버스 노선 번호를 검색
       + 해당 검색은 공공데이터 포털의 버스노선도 API를 활용하여 검색 수행
     + 해당 노선을 클릭하여 상세 페이지로 이동

   + 노선 Detail 페이지
      + 해당 노선에 대한 기점, 종점, 첫차시간, 막차시간 등 여러 다양한 정보를 출력
      + 해당 노선에 대한 각각의 정류장을 출력
        + 노선에 대한 정류장은 공공데이터 포털의 버스 정류소 API를 활용하여 검색 수행
   
   + 정류장 Detail 페이지
     + 해당 정류장의 x,y좌표를 기반으로 정류장의 도로명 주소를 탐색
       + Geolocation API를 활용하여 해당 좌표에 대한 도로명 주소 탐색
     + 주소에 대한 맛집, 놀거리, 카페를 탐색
       + 탐색 과정에 있어서 네이버 검색 API를 활용하여 검색 수행
         

7. 🛑 세부 내용
   ----------------
   + 사용한 API 목록
     + [도로교통부 Geolocation](https://www.data.go.kr/data/15101106/openapi.do)
     + [국토교통부_(TAGO)_버스정류소정보](https://www.data.go.kr/data/15098534/openapi.do)
     + [국토교통부_(TAGO)_버스노선정보](https://www.data.go.kr/data/15098529/openapi.do)
     + Naver 검색 API
   + [실제 배포 주소](http://bustour.midichi.kro.kr/)
   + [REST API DOCS(Use Swagger](http://bustour.midichi.kro.kr/swagger-ui/)
   + [PostMan](https://documenter.getpostman.com/view/18128195/2sA3duHE5z)
     
9. 🖨 실제 발표 자료
   ----------------
   [실제 발표 자료 PDF](https://github.com/user-attachments/files/16047318/default.pdf)
