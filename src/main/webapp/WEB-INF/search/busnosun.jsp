<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: qhal5
  Date: 2024-06-03
  Time: 오후 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<body>
        <div class="frame">
            <div class="overlap">
                <div class="frame-2" style="overflow: hidden">
                    <div class="overlap-group">
                        <div class="text-wrapper-2">3200</div>
                        <div class="frame-3">
                            <div class="text-wrapper-3">첫차 09:00, 막차 24:00</div>
                            <div class="text-wrapper-4">포동차고지 - 강남역</div>
                            <div class="text-wrapper-5">운행시간</div>
                        </div>
                    </div>
                    <div class="text-wrapper-7" id="stopinfo"><p style="font-size: 25px">정류장 상세정보<p></p></div>
                </div>
            </div>
        </div>
        <div class="text-wrapper-8" style="overflow: auto">
            <ul class="drawline" id="draw">
            </ul>
        </div>

        <div class="frame-4">
<c:if test="${sessionScope.loginok==null}">
    <div class="profiletext-1">로그인을 해주세요</div>
        <button class="profilebtn" onclick="location.href='./login'">로그인
        </button>
</c:if>
<c:if test="${sessionScope.loginok!=null}">
            <button type="button" class="butten" id="btnlogout"><div class="text-wrapper-9">로그아웃</div></button>
            <div class="group">
                <p class="text-wrapper-10">${sessionScope.nickname}</p>
                <p class="text-wrapper-11">회원님</p>
            </div>
            <img class="profilephoto" src="https://miniodb.midichi.kro.kr/bustour/profile/${sessionScope.photo}"
    onclick="location.href='./profileupdate'">
</c:if>
        </div>
<script>
    function loadStopInfo(nodenm,nodeid,gpslati,gpslong){
        $.ajax({
            url: "/api/v1/getLocation",
            type:"get",
            data:{"x":gpslati,"y":gpslong},
            dataType: "json",
            success : function (data){
                $("#stopinfo").empty()
                    .append($(`<div class="info_block" style="position:absolute;width: 500px;"></div>`)
                        .append($(`<img src="https://miniodb.midichi.kro.kr/bustour/static/busstop.png" class="busstop">`) )
                        .append($(`<p style="font-size: 25px">\${nodenm}</p>`))
                        .append($(`<p style="font-size: 20px;font-weight: lighter">\${nodeid}</p>`))
                        .append($(`<p style="font-size: 15px">\${data.location}</p>`))
                        .append($(`<button class="btn1" type="button" onclick="location.href='/shoplist?x=\${gpslati}&y=\${gpslong}'">상세보기</button>`)))
            }
        })
    }

    $(function (){
        let url = new URL(window.location.href)

        $.ajax({
            url:"/api/v1/getBusStopList",
            type:"post",
            dataType:"json",
            data:JSON.stringify({"cityCode":url.searchParams.get("cityCode"),"routeId":url.searchParams.get("routeId")}),
            headers : {"content-type":"application/json"},
            success : function (data) {
                let draw = $("#draw").empty();
                data.forEach(function (item, idx) {
                    $(`<li class="item_route active"></li>`)
                        .append($(`<button type="button" class="link_route has_panorama" onclick="loadStopInfo('\${item.nodenm}','\${item.nodeid}','\${item.gpslati}','\${item.gpslong}')"></button>`)
                            .append($(`<span class="icon_route"></span>`))
                            .append($(`<strong class="route_name">\${item.nodenm}</strong>`))
                            .append($(`<div class="route_box">
                                <span class="route_id" style="font-weight: lighter">\${item.nodeid}</span>
                            </div>`))).appendTo(draw);
                })
                $(".text-wrapper-2").empty().text(url.searchParams.get("routeno"));
                $(".text-wrapper-3").empty().text("첫차: "+url.searchParams.get("startvehicletime") +" 막차 : "+url.searchParams.get("endvehicletime"));
                $(".text-wrapper-4").empty().text(url.searchParams.get("startnodenm") +" - "+url.searchParams.get("endnodenm"));
                $(".text-wrapper-5").empty().text(url.searchParams.get("routetp"));
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
</body>
</html>

