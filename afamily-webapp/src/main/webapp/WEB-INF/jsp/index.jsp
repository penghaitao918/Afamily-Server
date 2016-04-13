<%--
  Created by IntelliJ IDEA.
  User: tao
  Date: 16-2-28
  Time: 上午1:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Index</title>
    <%@include file="include/common.jsp" %>
</head>
<body class="overflow-hidden">
<div class="wrapper preload">
    <%@include file="include/head.jsp"%>
    <%@include file="include/menu.jsp"%>

    <div class="main-container">
        <div class="padding-md">

            <div class="sidebar-fix-bottom clearfix">
                <div class="user-dropdown dropup pull-left">
                    <i class="fa fa-home"></i>
                    <a href="#"> 首页 </a>
                    <i class="fa fa-angle-right"></i>
                </div>
                <span class="pull-right font-18" id="nowTime"></span>
            </div>


        </div>
    </div>

</div>
</body>
</html>

<script>
    $(function () {
        window.setInterval(setNowTime, 1000);
    });
    function setNowTime() {
        var nowDate = format(new Date(), "yyyy-MM-dd    hh:mm:ss");
        $("#nowTime").html(nowDate)
    }

    function format(date, fmt) {
             var o = {
            "M+": date.getMonth() + 1,                 //月份
            "d+": date.getDate(),                    //日
            "h+": date.getHours(),                   //小时
            "m+": date.getMinutes(),                 //分
            "s+": date.getSeconds()                 //秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
</script>