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
    <c:if test="${sessionScope.loginok==null}">
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
    </c:if>
    <c:if test="${sessionScope.loginok!=null}">
        <div class="text-wrapper-2">
            <img class="profilephoto" src="https://miniodb.midichi.kro.kr/bustour/profile/${sessionScope.photo}"
                 onclick="location.href='./profileupdate'">
            <p class="profiletext-1">${sessionScope.nickname}</p>
            <p class="profiletext-2">회원님</p>
            <button type="button" class="profilebtn-1" onclick="location.href='./memberupdate'">
                <div class="btntext-1">정보수정</div>
            </button>
            <button class="profilebtn-2" type="button" id="btnlogout">
                <div class="btntext-1">로그아웃</div>
            </button>
        </div>
    </c:if>
</div>
<div class="frame-2">
    <div class="text-wrapper-6">즐겨찾기</div>
    <div class="stars" id="stars" style="position:absolute; top: 70px; left:10px;height: 380px;width: 345px;">
    </div>
    <div class="text-wrapper-7">로그인후 이용이 가능합니다</div>
</div>
<div class="frame-3">
    <select class="form-control" id="citysel"></select>
    <form class="search-box" action="" method="get">
        <input class="search-text" type="text" name="search" placeholder="노선번호를 입력하세요" id="search">
        <button class="search-btn" type="button">
            <img src="https://miniodb.midichi.kro.kr/bustour/static/search.png"
                 onclick="searchLine()"/>
        </button>
    </form>
</div>
<div class="frame-4">
    <div>
        <div class="row">
            <div class="col-md-10 cap" style="margin-left: 30px;margin-top: 10px">버스정보</div>
        </div>
        <div class="row" id="allLine">
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

    function renderingCity(data) {
        let sel = $("#citysel");
        data.forEach(function (el, index) {
            sel.append($(`<option value="\${el.citycode}">\${el.cityname}</option>`))
        });
    }

    function renderingBusLine(data) {
        let board = $("#allLine").empty();
        data.forEach(function (item, index) {
            $(`<div class="row-md-5" style="margin-left: 30px;margin-top: 10px"></div`)
                .append($(`<div class="row">\${item.routeno}</div>`))
                .append($(`<div class="row">첫차 : \${item.startvehicletime} 막차 : \${item.endvehicletime}</div>`))
                .append($(`<div class="row">배차간격 : \${item.intervaltime}</div>`))
                .append($(`<div class="row">출발지 : \${item.startnodenm} ~ 종점 : \${item.endnodenm}</div>`))
                .appendTo(board);
        })
    }

    function searchLine() {
        let citycode = $("#citysel").val();
        let routeno = $("#search").val();
        $.ajax({
            url: "/api/v1/buslist",
            type: "get",
            dataType: "json",
            data: {"citycode": citycode, "routeno": routeno},
            success: function (data) {
                let line = $("#allLine").empty()
                data.forEach(function (item, idx) {
                    line.append($(`<div class="row-md-5" style="margin-left: 30px;margin-top: 10px" onclick="location.href='/busnosun?cityCode=\${citycode}&routeId=\${item.routeid}&routeno=\${item.routeno}&startnodenm=\${item.startnodenm}&endnodenm=\${item.endnodenm}&startvehicletime=\${item.startvehicletime}&endvehicletime=\${item.endvehicletime}&routetp=\${item.routetp}'"></div>`)
                        .append($(`<div class="row">\${item.routeno}</div>`))
                        .append($(`<div class="row">첫차 \${item.startvehicletime} 막차 \${item.endvehicletime}</div>`))
                        .append($(`<div class="row">출발지 : \${item.startnodenm} ~ 종점 : \${item.endnodenm}</div>`)))
                })
            },
            error: function () {
                alert("검색 결과가 없습니다.")
            }
        })
    }

    $(function () {
        $.ajax({
            url: "/api/v1/getCityCode",
            dataType: "json",
            type: "get",
            success: function (data) {
                renderingCity(data);
            }
        })
        $("#btnlogout").click(function () {
            $.ajax({
                type: "get",
                dataType: "text",
                url: 'member/logout',
                success: function () {
                    //새로고침
                    location.reload();
                }
            })
        })
    })
</script>
<c:if test="${sessionScope.id!=null}">
    <script>
        $(function () {
            favorite();
        })

        function favorite(){
            $.ajax({
                url: "/api/v1/favorite",
                type: "get",
                dataType: "json",
                success: function (data) {
                    let star = $("#stars").empty()
                    data.forEach(function (item, idx) {
                        $(`<div class="row border-bottom"></div>`)
                            .append($(`<div class="col-1 align-content-center" style="float: none; margin:0 auto">
                        <span style="font-size: 10px">\${idx+1}</span>
                    </div>`))
                            .append($(`<div class="col-10">
                        <p style="font-size: 1.0em;margin-bottom: 0px">\${item.title}</p>
                        <p style="font-size: 0.9em;margin-bottom: 0px"><a href="\${item.link}">\${item.link}<a></p>
                        <p style="font-size: 0.8em;margin-bottom: 0px">\${item.address}</p>
                        <p style="font-size: 0.4em;margin-bottom: 0px">\${item.roadaddress}</p>
                        <p style="font-size: 0.3em;margin-bottom: 0px">\${item.category}</p>
                    </div>`)).append($(`<div class="col-1">
                        <input type="checkbox" class="star" onclick="favoritedel('\${item.title}','\${item.link}','\${item.category}','\${item.address}','\${item.roadAddress}')">
                    </div>`))
                            .appendTo(star);
                    })
                }
            })
        }

        function favoritedel(title,link,category,address,roadaddress){
            $.ajax({
                url:"/api/v1/deletefavorite",
                type:"post",
                dataType:"text",
                headers : {"content-type":"application/json"},
                data:JSON.stringify({"title":title,"link":link,"category":category,"address":address,"roadaddress":roadaddress,"id":"1234"}),
                success : function (){
                    alert("삭제완료!")
                    favorite();
                }
            })
        }
    </script>
</c:if>
</body>
</html>
