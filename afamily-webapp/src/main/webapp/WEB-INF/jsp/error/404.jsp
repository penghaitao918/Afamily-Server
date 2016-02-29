<%--
  Created by IntelliJ IDEA.
  User: tao
  Date: 16-2-28
  Time: 上午1:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="css/main.css" type="text/css" media="screen, projection" /> <!-- main stylesheet -->
    <link rel="stylesheet" type="text/css" media="all" href="css/tipsy.css" /> <!-- Tipsy implementation -->
    <!--[if lt IE 9]>
    <link rel="stylesheet" type="text/css" href="css/ie8.css" />
    <![endif]-->
    <title>404 - File Not found</title>
</head>
<body>
<div id="wrapper">
    <div class="graphic"></div>
    <div class="not-found-text">
        <h1 class="not-found-text">页面未找到!</h1>
    </div>
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
    <div class="planet"></div>
</div>

<script type="text/javascript" src="js/plugins/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/error404.js"></script>
<script type="text/javascript" src="js/jquery.tipsy.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        universalPreloader();
    });
    $(window).load(function(){
        universalPreloaderRemove();
        rotate();
        dogRun();
        dogTalk();
        $('.with-tooltip').tipsy({gravity: $.fn.tipsy.autoNS});
    });
</script>

</body>
</html>