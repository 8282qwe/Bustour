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
<c:set var="root" value="${pageContext.request.contextPath}"/>
<body>
<div class="nav-bar">
    <ul class="nav nav-tab justify-content-end">
        <li class="nav-item">
            <a href="${root}/" class="nav-link" aria-current="page">홈</a>
        </li>
        <li class="nav-item">
            <a href="${root}/member/form" class="nav-link">회원 가입</a>
        </li>
        <li class="nav-item">
            <a href="${root}/member/list" class="nav-link">회원 목록</a>
        </li>
        <li class="nav-item">
            <a href="${root}/board/list" class="nav-link">게시판</a>
        </li>
        <li class="nav-item">
            <a href="${root}/guest/list" class="nav-link">방명록</a>
        </li>
        <li class="nav-item">
            <c:if test="${sessionScope.loginid == null}">
                <button class="nav-link" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions"
                        aria-controls="offcanvasWithBothOptions">로그인
                </button>
            </c:if>
            <c:if test="${sessionScope.loginid !=null}">
                <b style="font-size: 20px;">
                        ${sessionScope.loginid}님</b>

                <button type="button" id="btnlogout"
                        style="margin-left: 20px;"
                        class="btn btn-success" onclick="location.href='${root}/member/logout'">로그아웃
                </button>
            </c:if>
        </li>
    </ul>
</div>

<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions"
     aria-labelledby="offcanvasWithBothOptionsLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">로그인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <form id="formid" method="post">
            <table class="table table-bordered">
                <tr>
                    <th class="table-success" width="80">아이디</th>
                    <td>
                        <input type="text" name="myid" id="myid" class="form-control"
                               required="required"
                               value="${sessionScope.saveid==null or sessionScope.saveid=="no"?"":sessionScope.loginid}">
                    </td>
                </tr>
                <tr>
                    <th class="table-success" width="80">비밀번호</th>
                    <td>
                        <input type="password" name="mypw" id="mypw" class="form-control"
                               required="required">
                    </td>
                </tr>
                <caption>
                    <label>
                        <input type="checkbox"
                               name="saveid" ${sessionScope.saveid==null or sessionScope.saveid=="no"?"":"checked"} >&nbsp;아이디저장
                    </label>
                </caption>
            </table>
            <button type="submit" class="btn btn-sm btn-danger"
                    id="btnmemberlogin">로그인
            </button>
        </form>
    </div>
</div>
<script>
    $("#formid").on("submit", function (e) {
        e.preventDefault();

        $.ajax({
            type: "post",
            dataType: "json",
            url: `${root}/member/login`,
            data: $(this).serialize(),
            success: function (data) {
                if (data.status === 'success') {
                    $("#mypw").val("")
                    location.reload();
                } else {
                    alert("ID or PW가 올바르지 않습니다.")
                    $("#mypw").val("");
                }
            },
        })
    })
</script>
</body>
</html>
