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
<c:set var="root" value="<%=request.getContextPath()%>"/>
<body>
<script>
    $(function () {
        $("#btnlogin").click(function () {
            //폼안의 입력값 읽기
            let fdata=$("#loginform").serialize();
            $.ajax({
                type:"get",
                dataType:"json",
                url:'/member/login',
                data:fdata,
                success:function (data) {
                    if (data.status==="success"){
                        //페이지 새로고침
                        location.href="/"
                    }else {
                        alert("아이디 또는 비밀번호가 맞지 않아용~");
                    }
                },
                error : function (){
                    alert("전송오류")
                }
            })
        })
    })
</script>
<div class="frame">
    <form id="loginform" method="post">
    <div class="butten">
        <button type="button" class="div-wrapper" id="btnlogin">
            <div class="text-wrapper-2">로그인</div>
        </button>
    </div>
    <div class="group-2">
        <div class="group-3">
            <input class="frame-2" style="margin-bottom: 20px" placeholder="아이디" name="id">
            <input class="frame-2" placeholder="비밀번호" name="pw">
        </div>
    </div>
    </form>
    <div class="text-wrapper-4">Login</div>
    <div class="frame-3">
        <a class="text-wrapper-5" onclick="searchID()">아이디찾기</a>
        <div class="text-wrapper-6">l</div>
        <a class="text-wrapper-5" onclick="searchPW()">비밀번호찾기</a>
        <div class="text-wrapper-6">l</div>
        <a href="./memberinsert" class="text-wrapper-5">회원가입</a>
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
</script>
</body>
</html>
