<%--
  Created by IntelliJ IDEA.
  User: tao
  Date: 16-2-28
  Time: 上午1:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>首页</title>
    <%@include file="include/common.jsp" %>
    <style>
        body{
            overflow: hidden;
        }
        .main-container{
            height: 100%;
            overflow: auto;
        }

        .padding-md {
            height: 100%;
        }

        .container {
            padding: 0;
        }

        .two-dimensional{
            display: table;
            height: 100%;
            width: 100%;
            text-align: center;
        }

        .two-dimensional > .thumbnail {
            background: transparent;
            border: none;
            text-align: center;
            display: table-cell;
            vertical-align: middle;
        }
    </style>
</head>
<body class="overflow-hidden">
<div class="wrapper preload">
    <%@include file="include/head.jsp" %>
    <%@include file="include/menu.jsp" %>

    <div class="main-container">
        <div class="padding-md">

            <div class="sidebar-fix-bottom clearfix">
                <div class="pull-left font-16">
                    <i class="fa fa-home fa-lg"></i>
                    <a href="#">&nbsp; 首页</a>
                    <i class="fa fa-angle-right"></i>
                </div>
                <span class="pull-right font-18" id="nowTime"></span>
            </div>

            <div class="container">
                <div class="two-dimensional">
                    <div class="thumbnail">
                        <img alt="320x320" width="320px" height="320px">
                        <div class="caption">
                            <h3>扫描二维码</h3>

                            <p id="countdown">离下一次刷新还有10s</p>

                            <p id="refreshCode"></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<script>
    //  初始化倒计时时长
    var countdownTime = 10;
    $(function () {
        setCode();
        window.setInterval(setNowTime, 1000);
        window.setInterval(setCode, countdownTime * 1000);
    });
    function setNowTime() {
        var nowDate = format(new Date(), "yyyy-MM-dd    hh:mm:ss");
        $("#nowTime").html(nowDate);
        var nowCountdown = "离下一次刷新还有 " + setCountdown() + " s";
        $("#countdown").html(nowCountdown);
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

    var chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
    function setCode() {
        var res = "";
        for (var i = 0; i < 6; i++) {
            var id = parseInt(62 * Math.random());
            res += chars[id];
        }
        $("#refreshCode").html(res)
    }

    //  初始化当前计时
    var nowCountdown = countdownTime - 1;
    function setCountdown() {
        if (nowCountdown == 0) {
            nowCountdown = countdownTime;
        }
        return nowCountdown--;
    }

</script>