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
        <a class="text-wrapper-4" onclick="searchID()">아이디찾기</a>
        <div class="text-wrapper-5">l</div>
        <a class="text-wrapper-4" onclick="searchPW()">비밀번호찾기</a>
        <div class="text-wrapper-5">l</div>
        <a href="./memberinsert" class="text-wrapper-4">회원가입</a>
    </div>
</div>
<div class="frame-2">
    <div class="text-wrapper-6">즐겨찾기</div>
    <div class="text-wrapper-7">로그인후 이용이 가능합니다</div>
</div>
<div class="frame-3">
    <select class="form-control" id="citysel"></select>
    <form class="search-box" action="" method="get">
        <input class="search-text" type="text" name="search" placeholder="노선번호를 입력하세요">
        <button class="search-btn" type="submit">
            <img src="https://miniodb.midichi.kro.kr/bustour/static/search.png"/>
        </button>
    </form>
</div>
<div class="frame-4">
    <div>
        <div class="row">
            <div class="col-md-10 cap" style="margin-left: 30px;margin-top: 10px">버스정보</div>
        </div>
        <div class="row" id="allLine">
            <div class="row-md-5" style="margin-left: 30px;margin-top: 10px">
                <div class="row">3200</div>
                <div class="row">첫차 09:00 막차24:00</div>
                <div class="row">출발지 : 포동 ~ 종점 : 강남역</div>
            </div>
        </div>
    </div>
</div>
<script>
    function searchID() {
        Swal.fire({
            title: '이름을 입력해 주세요',
            input: 'text',
            inputAttributes: {
                autocapitalize: 'off'
            },
            showCancelButton: true,
            confirmButtonText: '검색',
            showLoaderOnConfirm: true,
            preConfirm: (login) => {
                return fetch(`/api/v1/searchID?name=\${login}`)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error(response.statusText)
                        }
                        return response.json()
                    })
                    .catch(error => {
                        Swal.showValidationMessage(
                            `Request failed: \${error}`
                        )
                    })
            },
            allowOutsideClick: () => !Swal.isLoading()
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: `ID: \${result.value.id}`
                })
            }
        });
    }
    function searchPW() {
        Swal.fire({
            title: 'ID를 입력해 주세요',
            input: 'text',
            inputAttributes: {
                autocapitalize: 'off'
            },
            showCancelButton: true,
            confirmButtonText: '검색',
            showLoaderOnConfirm: true,
            preConfirm: (login) => {
                return fetch(`/api/v1/searchPW?id=\${login}`)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error(response.statusText)
                        }
                        return response.json()
                    })
                    .catch(error => {
                        Swal.showValidationMessage(
                            `Request failed: \${error}`
                        )
                    })
            },
            allowOutsideClick: () => !Swal.isLoading()
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: `PW: \${result.value.pw}`
                })
            }
        });
    }

    function renderingCity(data){
        let sel = $("#citysel");
        data.forEach (function (el, index) {
            sel.append($(`<option value="\${el.citycode}">\${el.cityname}</option>`))
        });
    }

    function renderingBusLine(data){
        let board = $("#allLine").empty();
        data.forEach(function (item,index){
            $(`<div class="row-md-5" style="margin-left: 30px;margin-top: 10px"></div`)
                .append($(`<div class="row">\${item.routeno}</div>`))
                .append($(`<div class="row">첫차 : \${item.startvehicletime} 막차 : \${item.endvehicletime}</div>`))
                .append($(`<div class="row">배차간격 : \${item.intervaltime}</div>`))
                .append($(`<div class="row">출발지 : \${item.startnodenm} ~ 종점 : \${item.endnodenm}</div>`))
                .appendTo(board);
        })
    }

    $(function (){
        $.ajax({
            url:"/api/v1/getCityCode",
            dataType:"json",
            type:"get",
            success : function (data){
                renderingCity(data);
            }
        })
    })
</script>
</body>
</html>
