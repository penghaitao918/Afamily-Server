<%--
  Created by IntelliJ IDEA.
  User: tao
  Date: 2016/4/14
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>发布通知</title>
    <%@include file="../include/common.jsp" %>
</head>
<body class="overflow-hidden">
<div class="wrapper preload">
    <%@include file="../include/head.jsp"%>
    <%@include file="../include/menu.jsp"%>

    <div class="main-container">
        <div class="padding-md">

            <div class="sidebar-fix-bottom clearfix">
                <div class="pull-left font-16" >
                    <i class="fa fa-bell fa-lg"></i>
                    <a href="#">&nbsp;发布通知</a>
                    <i class="fa fa-angle-right"></i>
                </div>
                <span class="pull-right font-18" id="nowTime"></span>
            </div>

            <div class="container-fluid">
                <form class="form-horizontal" style="border: 1px solid gainsboro; margin: 25px auto; padding: 25px;">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">标题</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" placeholder="请输入标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">内容</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="12" style="resize: vertical"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-8">
                            <button type="submit" class="btn btn-success">提交</button>
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>

</div>
</body>
</html>