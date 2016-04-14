<%--
  Created by IntelliJ IDEA.
  User: tao
  Date: 2016/4/13
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<aside class="sidebar-menu fixed">
    <div class="sidebar-inner scrollable-sidebar">
        <div class="main-menu">
            <ul class="accordion">
                <%--主页跳转--%>
                <li class="bg-palette1">
                    <a href="<%=basePath%>">
                        <span class="menu-content block">
                            <span class="menu-icon"><i class="block fa fa-home fa-lg"></i></span>
                            <span class="text m-left-sm">主页</span>
                        </span>
                        <span class="menu-content-hover block">主页</span>
                    </a>
                </li>
                <%--发布通知--%>
                <li class="bg-palette2">
                    <a href="#">
                        <span class="menu-content block">
                            <span class="menu-icon"><i class="block fa fa-bell fa-lg"></i></span>
                            <span class="text m-left-sm">发布通知</span>
                        </span>
                        <span class="menu-content-hover block">发布通知</span>
                    </a>
                </li>
                <%--发布任务--%>
                <li class="bg-palette3">
                    <a href="#">
                        <span class="menu-content block">
                            <span class="menu-icon"><i class="block fa fa-tags fa-lg"></i></span>
                            <span class="text m-left-sm">发布任务</span>
                        </span>
                        <span class="menu-content-hover block">发布任务</span>
                    </a>
                </li>
                <%--任务一览--%>
                <li class="bg-palette4">
                    <a href="#">
                        <span class="menu-content block">
                            <span class="menu-icon"><i class="block fa fa-desktop fa-lg"></i></span>
                            <span class="text m-left-sm">任务一览</span>
                        </span>
                        <span class="menu-content-hover block">任务一览</span>
                    </a>
                </li>
                <%--意见反馈--%>
                <li class="bg-palette4">
                    <a href="#">
                        <span class="menu-content block">
                            <span class="menu-icon"><i class="block fa fa-envelope fa-lg"></i></span>
                            <span class="text m-left-sm">意见收集</span>
                        </span>
                        <span class="menu-content-hover block">意见收集</span>
                    </a>
                </li>
            </ul>
        </div>
    </div><!-- sidebar-inner -->

    <%@ include file="foot.jsp" %>

</aside>
