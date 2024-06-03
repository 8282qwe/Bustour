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

    .screen .group {
        position: absolute;
        width: 339px;
        height: 112px;
        top: 85px;
        left: 552px;
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
        top: 18px;
        left: 112px;
        font-family: "Inter-ExtraBold Italic", Helvetica;
        font-weight: 800;
        font-style: italic;
        color: #000000;
        font-size: 64px;
        letter-spacing: 0;
        line-height: normal;
    }

    .screen .frame {
        position: absolute;
        width: 760px;
        height: 724px;
        top: 215px;
        left: 340px;
        background-color: #ffffff;
        border-radius: 20px;
        overflow: hidden;
        border: 1px solid #ddd;
        box-shadow: 0px 2px 4px #00000040;
    }

    .screen .butten {
        position: absolute;
        width: 564px;
        height: 65px;
        top: 342px;
        left: 98px;
    }


    .screen .div-wrapper {
        position: relative;
        width: 564px;
        height: 65px;
        background-color: var(--variable-collection-1);
        border: 1px solid #ddd;
        border-radius: 16px;
    }

    .screen .text-wrapper-2 {
        position: absolute;
        top: 12px;
        left: 237px;
        font-family: "Inter-ExtraBold", Helvetica;
        font-weight: 800;
        color: #ffffff;
        font-size: 32px;
        letter-spacing: 0;
        line-height: normal;
    }

    .screen .group-2 {
        position: absolute;
        width: 564px;
        height: 150px;
        top: 172px;
        left: 98px;
    }

    .screen .group-3 {
        position: absolute;
        width: 564px;
        height: 65px;
        top: 0;
        left: 0;
    }

    .screen .frame-2 {
        position: relative;
        width: 560px;
        height: 65px;
        background-color: #ffffff;
        border-radius: 16px;
        border: 1px solid #ddd;
        font-family: "Inter-ExtraBold", Helvetica;
        font-weight: 800;
        font-style: var(--variable-collection);
        font-size: 32px;
    }



    .screen .group-4 {
        position: absolute;
        width: 564px;
        height: 65px;
        top: 85px;
        left: 0;
    }

    .screen .text-wrapper-4 {
        position: absolute;
        top: 69px;
        left: 304px;
        font-family: "Inter-ExtraBold", Helvetica;
        font-weight: 800;
        color: #000000;
        font-size: 48px;
        letter-spacing: 4.8px;
        line-height: normal;
    }

    .screen .frame-3 {
        display: inline-flex;
        align-items: flex-start;
        gap: 10px;
        position: absolute;
        top: 451px;
        left: 206px;
    }

    .screen .text-wrapper-5 {
        position: relative;
        width: fit-content;
        margin-top: -1px;
        font-family: "Inter-Thin", Helvetica;
        font-weight: 100;
        color: var(--variable-collection);
        font-size: 20px;
        letter-spacing: 0;
        line-height: normal;
        white-space: nowrap;
    }

    .screen .text-wrapper-6 {
        position: relative;
        width: fit-content;
        margin-top: 1px;
        font-family: "Inter-Thin", Helvetica;
        font-weight: 100;
        color: var(--variable-collection);
        font-size: 20px;
        letter-spacing: 0;
        line-height: normal;
        white-space: nowrap;
    }

</style>
<body>
<div class="screen">
    <div class="div">
        <div class="group">
            <img class="mdi-bus" src="img/mdi-bus.svg" />
            <div class="text-wrapper">BUSDA</div>
        </div>
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
                <div class="text-wrapper-5">아이디찾기</div>
                <div class="text-wrapper-6">l</div>
                <div class="text-wrapper-5">비밀번호찾기</div>
                <div class="text-wrapper-6">l</div>
                <div class="text-wrapper-5">회원가입</div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
