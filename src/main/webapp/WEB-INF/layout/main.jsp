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
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="globals.css" />
    <link rel="stylesheet" href="styleguide.css" />
    <link rel="stylesheet" href="style.css" />
</head>
<style>
    :root {
        --variable-collection-1: rgba(22, 210, 252, 1);
        --variable-collection: rgba(148, 148, 148, 0.87);
    }

    .screen {
        background-color: #ffffff;
        display: flex;
        flex-direction: row;
        justify-content: center;
        width: 100%;
    }

    .screen .div {
        background-color: #ffffff;
        width: 1440px;
        height: 1024px;
        position: relative;
    }

    .screen .overlap {
        position: absolute;
        width: 320px;
        height: 112px;
        top: 85px;
        left: 144px;
    }

    .screen .mdi-bus {
        position: absolute;
        width: 112px;
        height: 112px;
        top: 0;
        left: 0;
    }

    .screen .text-wrapper {
        position: absolute;
        top: 17px;
        left: 95px;
        font-family: "Inter-ExtraBold Italic", Helvetica;
        font-weight: 800;
        font-style: italic;
        color: #000000;
        font-size: 64px;
        letter-spacing: 0;
        line-height: normal;
    }

    .screen .frame {
        width: 367px;
        height: 215px;
        top: 254px;
        left: 929px;
        background-color: #ffffff;
        border-radius: 20px;
        position: absolute;
        overflow: hidden;
        border: 1px solid #dddddd;
        box-shadow: 0px 2px 4px #00000040;
    }

    .screen .text-wrapper-2 {
        top: 31px;
        left: 27px;
        font-family: "Inter-Thin", Helvetica;
        font-weight: 100;
        color: #000000;
        font-size: 30px;
        position: absolute;
        letter-spacing: 0;
        line-height: normal;
    }

    .screen .butten {
        position: absolute;
        width: 310px;
        height: 65px;
        top: 85px;
        left: 32px;
    }

    .screen .overlap-group {
        position: relative;
        width: 308px;
        height: 65px;
        background-color: var(--variable-collection-1);
        border-radius: 20px;
        border: 1px solid #dddddd;
    }

    .screen .text-wrapper-3 {
        top: 13px;
        left: 107px;
        font-family: "Inter-ExtraBold", Helvetica;
        font-weight: 800;
        color: #ffffff;
        font-size: 32px;
        position: absolute;
        letter-spacing: 0;
        line-height: normal;
    }

    .screen .navbar {
        display: inline-flex;
        align-items: flex-start;
        gap: 3px;
        position: absolute;
        top: 164px;
        left: 27px;
    }

    .screen .text-wrapper-4 {
        color: var(--variable-collection);
        position: relative;
        width: fit-content;
        margin-top: -1px;
        font-family: "Inter-Thin", Helvetica;
        font-weight: 100;
        font-size: 20px;
        letter-spacing: 0;
        line-height: normal;
        white-space: nowrap;
    }

    .screen .text-wrapper-5 {
        color: var(--variable-collection);
        position: relative;
        width: fit-content;
        margin-top: 2px;
        font-family: "Inter-Thin", Helvetica;
        font-weight: 100;
        font-size: 20px;
        letter-spacing: 0;
        line-height: normal;
        white-space: nowrap;
    }

    .screen .frame-2 {
        width: 367px;
        height: 477px;
        top: 499px;
        left: 929px;
        background-color: #ffffff;
        border-radius: 20px;
        position: absolute;
        overflow: hidden;
        border: 1px solid #dddddd;
        box-shadow: 0px 2px 4px #00000040;
    }

    .screen .text-wrapper-6 {
        top: 26px;
        left: 25px;
        font-family: "Inter-Thin", Helvetica;
        font-weight: 100;
        color: #000000;
        font-size: 24px;
        position: absolute;
        letter-spacing: 0;
        line-height: normal;
    }

    .screen .text-wrapper-7 {
        top: 226px;
        left: 44px;
        font-family: "Inter-Thin", Helvetica;
        font-weight: 100;
        color: var(--variable-collection);
        font-size: 24px;
        position: absolute;
        letter-spacing: 0;
        line-height: normal;
    }

    .screen .frame-3 {
        width: 722px;
        height: 50px;
        top: 254px;
        left: 144px;
        border-radius: 16px;
        position: absolute;
        overflow: hidden;
        border: 1px solid #dddddd;
        box-shadow: 0px 2px 4px #00000040;
    }

    .screen .vector {
        position: absolute;
        width: 20px;
        height: 20px;
        top: 15px;
        left: 690px;
    }

    .screen .text-wrapper-8 {
        top: 12px;
        left: 414px;
        font-family: "Inter-Thin", Helvetica;
        font-weight: 100;
        color: var(--variable-collection);
        font-size: 20px;
        white-space: nowrap;
        position: absolute;
        letter-spacing: 0;
        line-height: normal;
    }

    .screen .frame-4 {
        width: 722px;
        height: 642px;
        top: 334px;
        left: 144px;
        border-radius: 16px;
        position: absolute;
        overflow: hidden;
        border: 1px solid #dddddd;
        box-shadow: 0px 2px 4px #00000040;
    }

    .screen .text-wrapper-9 {
        top: 18px;
        left: 22px;
        font-family: "Inter-Thin", Helvetica;
        font-weight: 100;
        color: #000000;
        font-size: 24px;
        position: absolute;
        letter-spacing: 0;
        line-height: normal;
    }

    .screen .text-wrapper-10 {
        top: 305px;
        left: 222px;
        font-family: "Inter-Thin", Helvetica;
        font-weight: 100;
        color: var(--variable-collection);
        font-size: 24px;
        position: absolute;
        letter-spacing: 0;
        line-height: normal;
    }
</style>
<body>
<div class="screen">
    <div class="div">
        <div class="overlap">
            <img class="mdi-bus" src="../image/mdi-bus.jpg" />
            <div class="text-wrapper">BUSDA</div>
        </div>
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
            <img class="vector" src="../image/vector.jpg" />
            <div class="text-wrapper-8">버스 및 정거장을 검색해주세요</div>
        </div>
        <div class="frame-4">
            <div class="text-wrapper-9">버스정보</div>
            <div class="text-wrapper-10">로그인후 이용이 가능합니다</div>
        </div>
    </div>
</div>
</body>
</html>
</html>
