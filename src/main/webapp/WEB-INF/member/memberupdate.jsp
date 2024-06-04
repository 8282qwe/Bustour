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
<script>
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
        $.ajax({
            url:"/api/v1/searchuser",
            type: "get",
            data:{"id":${sessionScope.id}},
            dataType: "json",
            success : function (data) {
                $("#name").val(data.name)
                $("#pw").val(data.pw)
                $("#ph").val(data.ph)
                $("#address").val(data.address)
            },
            error : function (){
                alert("dddd")
            }
        })
    })
</script>
<body>
        <div class="frame">
            <form action="./membersave" method="post">
                <div class="frame-wrapper">
                    <button class="div-wrapper" type="submit">
                        <div class="text-wrapper-2">수정완료</div>
                    </button>
                </div>
            <div class="group-2">
                <input class="frame-4" type="password" placeholder="비밀번호" name="pw" id="pw" value="">
                <input class="frame-5" placeholder="이름" name="name" id="name" value="">
                <input class="frame-6" placeholder="전화번호" name="ph" id="ph" value="">
                <input class="frame-7" placeholder="주소" name="address" id="address" value="">
            </div>
            </form>
            <div class="text-wrapper-5">회원수정</div>
        </div>
</body>
</html>

