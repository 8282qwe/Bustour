<%--
  Created by IntelliJ IDEA.
  User: qhal5
  Date: 2024-06-03
  Time: 오후 1:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <style>
        body * {
            font-family: 'Jua';
        }
    </style>
</head>
<body>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="globals.css"/>
    <link rel="stylesheet" href="styleguide.css"/>
    <link rel="stylesheet" href="style.css"/>
</head>
<c:set var="stpath" value="https://miniodb.midichi.kro.kr/bustour/profile"/>
<script type="text/javascript">
    let jungbok = false;

    $(function () {
        $(".frame-3").click(function () {
            if ($("#nickname").val() == '') {
                alert("닉네임을 입력해주세여");
                return;
            }
            $.ajax({
                type: "get",
                dataType: "json",
                url: "./nickcheck",
                data: {"searchnick": $("#nickname").val()},
                success: function (data) {
                    if (data.isCheck !== true) {
                        alert("가능한 닉네임입니다");
                        jungbok = true;
                    } else {
                        alert("이미 사용중인 닉네임입니다");
                        jungbok = false;
                        $("#nickname").val("");
                    }
                }
            })
        })
        //사진변경 이벤트
        $("#photoupload").change(function () {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    $(".frame-4").attr("src", e.target.result);
                }
                reader.readAsDataURL(file);
            }
        })
    })
</script>
<body>
<div class="frame">
    <form action="./profileinsert" method="post" enctype="multipart/form-data">
        <div class="frame-wrapper">
            <button class="div-wrapper" type="submit">
                <div class="text-wrapper-2">작성완료</div>
            </button>
        </div>
        <div class="group-2">
            <input class="frame-2" value="#{dto.nickname}" name="nickname" id="nickname">
            <div class="group-wrapper">
                <div class="group-3">
                    <button type="button" class="frame-3">
                        <div class="text-wrapper-3">중복체크</div>
                    </button>
                </div>
            </div>
        </div>
        <div class="text-wrapper-5">프로필 작성</div>
        <div>
            <img class="frame-4" style="width: 114px;height: 114px;"
                 src="https://miniodb.midichi.kro.kr/bustour/static/default.jpeg"
                 onclick="$('#photoupload').trigger('click')"/>
            <input name="profile" type="file" id="photoupload" style="display: none;">
        </div>
    </form>
</div>
</body>
</html>
</body>
</html>
