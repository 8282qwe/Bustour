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
<div class="row">
    <div class="col">
        <img class="img-thumbnail img-fluid" src="http://miniodb.midichi.kro.kr/bustour/6.png"  alt="..." >
    </div>
    <div class="col">
        <img class="img-thumbnail img-fluid" src="${root}/image/shop/2.jpg"  alt="..." >
    </div>
</div>
<div class="row">
    <div class="col">
        <img class="img-thumbnail img-fluid" src="${root}/image/shop/3.jpg"  alt="..." >
    </div>
    <div class="col">
        <img class="img-thumbnail img-fluid" src="${root}/image/shop/4.jpg"  alt="..." >
    </div>
</div>
</body>
</html>
