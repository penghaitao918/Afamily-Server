<%--
  Created by IntelliJ IDEA.
  User: tao
  Date: 2016/4/14
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>任务一览</title>
    <link rel="stylesheet" href="<c:url value="/pulgins/DataTables-1.10.11/media/css/jquery.dataTables.min.css"/>">
    <%@include file="../include/common.jsp" %>
</head>
<body class="overflow-hidden">
<div class="wrapper preload">
    <%@include file="../include/head.jsp" %>
    <%@include file="../include/menu.jsp" %>

    <div class="main-container">
        <div class="padding-md">

            <div class="sidebar-fix-bottom clearfix">
                <div class="pull-left font-16">
                    <i class="fa fa-desktop fa-lg"></i>
                    <a href="#">&nbsp;任务一览</a>
                    <i class="fa fa-angle-right"></i>
                </div>
                <span class="pull-right font-18" id="nowTime"></span>
            </div>

            <div class="container-fluid margin-md">
                <table id="task-list" class="table table-responsive table-hover table-bordered">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>姓名</th>
                        <th>A</th>
                        <th>B</th>
                        <th>C</th>
                        <th>D</th>
                        <th>E</th>
                        <th>F</th>
                        <th>G</th>
                        <th>H</th>
                        <th>I</th>
                        <th>J</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="/pulgins/DataTables-1.10.11/media/js/jquery.dataTables.js"/>"></script>
<script>
    $(function () {
        $("#task-list").DataTable({
                    "autoWidth": true,   // enable/disable fixed width and enable fluid table
                    "processing": true, // enable/disable display message box on record load
                    "ajax": function (data, fnCallback) {
                        $.ajax({
                            "url": basePath + "task/findAllTaskInfo",
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
                        { data: "account" },{ data: "task0" },{ data: "task1" },{ data: "task2" },{ data: "task3" },{ data: "task4" },
                        { data: "task5" },{ data: "task6" }, { data: "task7" },{ data: "task8" },{ data: "task9" }
                    ],
                    "language":{
                        "decimal":        "",
                        "emptyTable":     "没有数据",
                        "info":           "当前为 _START_ 至 _END_ 号记录 , 找到 _TOTAL_ 条记录",
                        "infoEmpty":      "当前为 0 至 0 号记录 , 一共 0 条记录",
                        "infoFiltered":   "(一共 _MAX_ 条记录)",
                        "infoPostFix":    "",
                        "thousands":      ",",
                        "lengthMenu":     "显示 _MENU_ 条记录",
                        "loadingRecords": "加载中...",
                        "processing":     "Processing...",
                        "search":         "查询:",
                        "zeroRecords":    "没有找到匹配记录",
                        "ajaxRequestGeneralError": "请求失败，请检查您的网络连接",
                        "paginate": {
                            "first":      "第一页",
                            "last":       "最后一页",
                            "next":       "下一页",
                            "previous":   "上一页"
                        }
                    }
                }
        );
    });

</script>
</body>
</html>
