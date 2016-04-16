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
                    <tbody>
                    <tr>
                        <td>Row 1 Data 1</td>
                        <td>Row 1 Data 2</td>
                        <td>Row 1 Data 1</td>
                        <td>Row 1 Data 2</td>
                        <td>Row 1 Data 1</td>
                        <td>Row 1 Data 1</td>
                        <td>Row 1 Data 2</td>
                        <td>Row 1 Data 1</td>
                        <td>Row 1 Data 2</td>
                        <td>Row 1 Data 1</td>
                        <td>Row 1 Data 1</td>
                        <td>Row 1 Data 2</td>
                    </tr>
                    <tr>
                        <td>Row 1 Data 1</td>
                        <td>Row 1 Data 2</td>
                        <td>Row 1 Data 1</td>
                        <td>Row 1 Data 2</td>
                        <td>Row 1 Data 1</td>
                        <td>Row 1 Data 1</td>
                        <td>Row 1 Data 2</td>
                        <td>Row 1 Data 1</td>
                        <td>Row 1 Data 2</td>
                        <td>Row 1 Data 1</td>
                        <td>Row 1 Data 1</td>
                        <td>Row 1 Data 2</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="/pulgins/DataTables-1.10.11/media/js/jquery.dataTables.js"/>"></script>
<script>
    $(function () {
        $("#task-list").DataTable({
            language:{
                "decimal":        "",
                "emptyTable":     "没有数据",
                "info":           "当前为 _START_ 至 _END_ 号记录 , 一共 _TOTAL_ 条记录",
                "infoEmpty":      "当前为 0 至 0 号记录 , 一共 0 条记录",
                "infoFiltered":   "(找到 _MAX_ 条记录)",
                "infoPostFix":    "",
                "thousands":      ",",
                "lengthMenu":     "显示 _MENU_ 条记录",
                "loadingRecords": "加载中...",
                "processing":     "Processing...",
                "search":         "查询:",
                "zeroRecords":    "没有找到匹配记录",
                "paginate": {
                    "first":      "第一页",
                    "last":       "最后一页",
                    "next":       "下一页",
                    "previous":   "上一页"
                }
            }
        });
    })
</script>
</body>
</html>
