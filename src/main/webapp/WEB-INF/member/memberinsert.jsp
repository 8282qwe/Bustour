<%--
  Created by IntelliJ IDEA.
  User: qhal5
  Date: 2024-06-03
  Time: 오전 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="globals.css" />
    <link rel="stylesheet" href="styleguide.css" />
    <link rel="stylesheet" href="style.css" />
</head>
<script type="text/javascript">
    let jungbok=false;

    $(function (){
        $(".frame-3").click(function () {
            if ($("#id").val()==''){
                alert("가입할 아이디를 입력해주세여");
                return;
            }
            $.ajax({
                type:"get",
                dataType:"json",
                url:"./idcheck",
                data:{"searchid":$("#id").val()},
                success:function (data) {
                    if (data.isCheck!==true){
                        alert("가입이 가능한 아이디입니다");
                        jungbok=true;
                    }else {
                        alert("이미 가입되어있는 아이디 입니다");
                        jungbok=false;
                        $("#id").val("");
                    }
                }
            })
        })
    })
</script>
<body>
        <div class="frame">
            <form action="./memberinsert" method="post">
                <div class="frame-wrapper">
                    <button class="div-wrapper" type="submit">
                        <div class="text-wrapper-2">다 음</div>
                    </button>
                </div>
            <div class="group-2">
                <input class="frame-2" placeholder="아이디" name="id" id="id">
                    <div class="group-wrapper">
                        <div class="group-3">
                            <button type="button" class="frame-3">
                                <div class="text-wrapper-4">중복체크</div>
                            </button>
                        </div>
                    </div>
                <input class="frame-4" placeholder="비밀번호" name="pw">
                <input class="frame-5" placeholder="이름" name="name">
                <input class="frame-6" placeholder="전화번호" name="ph">
                <input class="frame-7" placeholder="주소" name="address">
            </div>
            </form>
            <div class="text-wrapper-5">회원가입</div>
        </div>
</body>
</html>

