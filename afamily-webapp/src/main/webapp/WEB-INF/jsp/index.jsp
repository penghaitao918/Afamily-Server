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
    <link rel="stylesheet" href="<c:url value="/pulgins/DataTables-1.10.11/media/css/jquery.dataTables.min.css"/>">
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

            <div class="container-fluid margin-md">
                <table id="check-list" class="table table-responsive table-hover table-bordered">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>学号</th>
                        <th>地址</th>
                        <th>端口</th>
                        <th>时间</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>

        </div>
    </div>
</div>
</body>
</html>

<script src="<c:url value="/pulgins/DataTables-1.10.11/media/js/jquery.dataTables.js"/>"></script>
<script>
    $(function () {
        window.setInterval(setNowTime, 1000);
        var table = $("#check-list").DataTable({
            "bStateSave": true,
            "order": [[ 1, 'asc' ]],
            "autoWidth": true,   // enable/disable fixed width and enable fluid table
            "processing": true, // enable/disable display message box on record load
            "language": {
                "decimal": "",
                "emptyTable": "没有数据",
                "info": "当前为 _START_ 至 _END_ 号记录 , 一共 _TOTAL_ 条记录",
                "infoEmpty": "当前为 0 至 0 号记录 , 一共 0 条记录",
                "infoFiltered": "(找到 _MAX_ 条记录)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "显示 _MENU_ 条记录",
                "loadingRecords": "加载中...",
                "processing": "Processing...",
                "search": "查询:",
                "zeroRecords": "没有找到匹配记录",
                "paginate": {
                    "first": "第一页",
                    "last": "最后一页",
                    "next": "下一页",
                    "previous": "上一页"
                }
            },
            "ajax": function (data, fnCallback) {
                $.ajax({
                    "url": basePath + "checkIn/findAllInfoList",
                    "dataType": 'json',
                    "type": "POST",
                    "success": function (result) {
                        result.data = result.resultList;
                        fnCallback(result);

                    },
                    "error": function () {
                    }
                });
            },
            "columns": [
                { data: "id" },
                { data: "account" },
                { data: "address" },
                { data: "port" },
                { data: 'checkTime'}
            ]
        });
        table.on( 'order.dt search.dt', function () {
            table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
                cell.innerHTML = i+1;
            } );
        } ).draw();
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
</script>