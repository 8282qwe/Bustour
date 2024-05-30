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
<div class="card" style="width: 12rem;">
    <img src="${pageContext.request.contextPath}/image/보짱.jpg" class="card-img-top" alt="...">
    <div class="card-body">
        <h5 class="card-title">귀여운보짱</h5>
        <p class="card-text">701대표 귀요미 보짱</p>
    </div>
    <ul class="list-group list-group-flush">
        <li class="list-group-item">나이: 23세</li>
        <li class="list-group-item">몸무게: 110KG</li>
        <li class="list-group-item">키: 170cm</li>
    </ul>
</div>
</body>
</html>
