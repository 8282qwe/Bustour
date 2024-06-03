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


<!DOCTYPE html>
<html>
<body>
<div class="frame">
    <div class="butten">
        <button class="div-wrapper">
            <div class="text-wrapper-2">로그인</div>
        </button>
    </div>
    <div class="group-2">
        <div class="group-3">
            <input class="frame-2" style="margin-bottom: 20px" placeholder="아이디">
            <input class="frame-2" placeholder="비밀번호">
        </div>
    </div>
    <div class="text-wrapper-4">Login</div>
    <div class="frame-3">
        <a href="./idsearch" class="text-wrapper-5">아이디찾기</a>
        <div class="text-wrapper-6">l</div>
        <a href="./pwsearch" class="text-wrapper-5">비밀번호찾기</a>
        <div class="text-wrapper-6">l</div>
        <a href="./memberinsert" class="text-wrapper-5">회원가입</a>
    </div>
</div>
</body>
</html>
