<%--
  Created by IntelliJ IDEA.
  User: jangwoo
  Date: 24. 5. 23.
  Time: 오후 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<body>
<div class="frame">
    <div class="text-wrapper-2">로그인 후 이용해주세요</div>
    <div class="butten">
        <button class="overlap-group" onclick="location.href='./login'">
            <div class="text-wrapper-3">로그인</div>
        </button>
    </div>
    <div class="navbar">
        <div class="text-wrapper-4">아이디찾기</div>
        <div class="text-wrapper-5">l</div>
        <div class="text-wrapper-4">비밀번호찾기</div>
        <div class="text-wrapper-5">l</div>
        <div class="text-wrapper-4">회원가입</div>
    </div>
</div>
<div class="frame-2">
    <div class="text-wrapper-6">즐겨찾기</div>
    <div class="text-wrapper-7">로그인후 이용이 가능합니다</div>
</div>
<div class="frame-3">
    <select class="form-control" id="citysel">
        <option value="31150">시흥시</option>
        <option value="31090">안산시</option>
    </select>
    <form class="search-box" action="" method="get">
        <input class="search-text" type="text" name="search" placeholder="노선번호를 입력하세요">
        <button class="search-btn" type="submit">
            <img src="https://miniodb.midichi.kro.kr/bustour/static/search.png"/>
        </button>
    </form>
</div>
<div class="frame-4">
    <div class="text-wrapper-9">버스정보</div>
    <div class="text-wrapper-10">로그인후 이용이 가능합니다</div>
</div>
</body>
</html>
