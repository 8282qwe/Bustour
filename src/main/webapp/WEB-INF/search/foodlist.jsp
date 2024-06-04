<%--
  Created by IntelliJ IDEA.
  User: qhal5
  Date: 2024-06-04
  Time: 오전 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<body>
<script>
    function favoriteadd(title,link,category,address,roadaddress){
        $.ajax({
            url:"/api/v1/insertfavorite",
            type:"post",
            dataType:"text",
            headers : {"content-type":"application/json"},
            data:JSON.stringify({"title":title,"link":link,"category":category,"address":address,"roadaddress":roadaddress,"id":"1234"}),
            success : function (){
                alert("즐겨찾기 완료")
            }
        })
    }
</script>
        <div class="frame">
            <button type="button" class="butten" onclick="rendering($('.text-wrapper-2').text())"><div class="text-wrapper-2">카페</div></button>
            <button type="button" class="div-wrapper" onclick="rendering($('.text-wrapper-3').text())"><div class="text-wrapper-3">놀거리</div></button>
            <button type="button" class="butten-2" onclick="rendering($('.text-wrapper-4').text())"><div class="text-wrapper-4">맛집</div></button>
        </div>
        <div id="view" style="position: absolute; top: 400px;left: 280px;height: 550px;margin-left: 30px;width: 850px;overflow: auto">
            <div class="row border-bottom">
                <div class="col-1 align-content-center" style="float: none; margin:0 auto">
                    <span style="font-size: 25px">1</span>
                </div>
                <div class="col-3">
                    이미지
                </div>
                <div class="col-6">
                    <p>이름</p>
                    <p>위치</p>
                    <p>가게 주소 링크</p>
                    <p>가게 주소</p>
                    <p>가게 카테고리</p>
                </div>
                <div class="col-1">
                    <input type="checkbox" class="star" value="1">
                </div>
            </div>
        </div>
        <button type="button" class="butten-3"><div class="text-wrapper-10">로그아웃</div></button>
        <div class="group-2">
            <div class="text-wrapper-11">김창인</div>
            <div class="text-wrapper-12">회원님</div>
        </div>
        <img class="ellipse" src="img/ellipse-1.png" />

<script>
    function rendering(keyword){
        let photo = "https://miniodb.midichi.kro.kr/bustour/static/";
        if (keyword ==="맛집") photo+="food.png"
        else if (keyword==="놀거리") photo += "tour.png"
        else photo += "coffee.png"
        let url = window.location.href
        const url_par = new URL(url);

        $.ajax({
            url:"/api/v1/search",
            dataType : "json",
            type : "Get",
            data : {"x":url_par.searchParams.get("y"),"y":url_par.searchParams.get("x"),"keyword":keyword},
            success : function (data) {
                let view = $("#view").empty();
                data.forEach(function (item,idx){
                    $(`<div class="row border-bottom"></div>`)
                        .append($(`<div class="col-1 align-content-center" style="float: none; margin:0 auto">
                        <span style="font-size: 25px">\${idx+1}</span>
                    </div>`))
                        .append($(`<div class="col-3">
                        <img class="previewimg" src="\${photo}">
                    </div>`))
                        .append($(`<div class="col-6">
                        <p style="font-size: 1.5em">\${item.title}</p>
                        <p style="font-size: 1.1em"><a href="\${item.link}">\${item.link}<a></p>
                        <p style="font-size: 1.2em">\${item.address}</p>
                        <p style="font-size: 0.8em">\${item.roadAddress}</p>
                        <p style="font-size: 0.7em">\${item.category}</p>
                    </div>`)).append($(`<div class="col-1">
                        <input type="checkbox" class="star" onclick="favoriteadd('\${item.title}','\${item.link}','\${item.category}','\${item.address}','\${item.roadAddress}')">
                    </div>`))
                    .appendTo(view);
                })
            }
        })
    }

    $(function (){
        rendering("맛집")
    })

</script>
</body>
</html>