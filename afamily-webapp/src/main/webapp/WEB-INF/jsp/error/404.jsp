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

    <link rel="stylesheet" type="text/css" media="screen, projection" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" type="text/css" media="all" href="<c:url value="/css/tipsy.css"/>">
    <!--[if lt IE 9]>
    <link rel="stylesheet" type="text/css" href="href="<c:url value="/css/ie8.css"/>"/>
    <![endif]-->

    <script src="<c:url value="/js/plugins/jquery-1.7.2.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/error404.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/js/jquery.tipsy.js"/>" type="text/javascript"></script>

    <script type="text/javascript">

        $(document).ready(function(){

            universalPreloader();

        });

        $(window).load(function(){

            //remove Universal Preloader
            universalPreloaderRemove();

            rotate();
            dogRun();
            dogTalk();

            //Tipsy implementation
            $('.with-tooltip').tipsy({gravity: $.fn.tipsy.autoNS});

        });

    </script>


    <title>404 - Not found</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>

<div id="wrapper">
    <!-- 404 graphic -->
    <div class="graphic"></div>
    <!-- 404 graphic -->

    <!-- Not found text -->
    <div class="not-found-text">
        <h1 class="not-found-text">页面未找到!</h1>
    </div>
    <!-- Not found text -->

    <div class="dog-wrapper">
        <div class="dog"></div>
        <div class="dog-bubble"></div>
        <div class="bubble-options">
            <p class="dog-bubble">
                <br /> 汪! 汪!
            </p>
            <p class="dog-bubble">
                <br /> 不用担心！我就可以了！
            </p>
            <p class="dog-bubble">
                <br /> 我希望我有一个饼干<br /><img style="margin-top:8px" src="images/cookie.png" alt="cookie" />
            </p>
            <p class="dog-bubble">
                <br /> 我在越来越接近？
            </p>
            <p class="dog-bubble">
                <br /> 还是我只是在绕圈子？呜~~~
            </p>
            <p class="dog-bubble">
                <br /> OK，我现在正式失去了...T_T
            </p>
            <p class="dog-bubble">
                <br /> I think I saw a <br /><img style="margin-top:8px" src="images/cat.png" alt="cat" />
            </p>
            <p class="dog-bubble">
                <br /> 我们应该去哪里寻找捏~ @_@
            </p>
        </div>
    </div>

    <!-- planet at the bottom -->
    <div class="planet"></div>
    <!-- planet at the bottom -->
</div>
</body>
</html>