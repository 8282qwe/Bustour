<%--
  Created by IntelliJ IDEA.
  User: jangwoo
  Date: 24. 6. 3.
  Time: 오전 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var = "contextpath" value = "<%=request.getContextPath()%>"/>
<html>
<head>
    <title>창인이와 떠나는 버스 여행</title>
    <link rel="stylesheet" href="${contextpath}<tiles:getAsString name = "css"/>"/>
</head>
<body>
<div class="screen">
    <div class="div">
        <tiles:insertAttribute name="header"/>
        <tiles:insertAttribute name="main"/>
    </div>

</div>
</body>
</html>
