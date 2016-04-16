<%--
  Created by IntelliJ IDEA.
  User: tao
  Date: 2016/4/14
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>意见收集</title>
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
                    <i class="fa fa-envelope fa-lg"></i>
                    <a href="#">&nbsp;意见收集</a>
                    <i class="fa fa-angle-right"></i>
                </div>
                <span class="pull-right font-18" id="nowTime"></span>
            </div>

            <div class="container-fluid margin-md">
                <table id="advice-list" class="table table-responsive table-hover table-bordered">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>标题</th>
                        <th>姓名</th>
                        <th>时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="num">Row 1 Data 1</td>
                        <td class="title">Row 1 Data 2</td>
                        <td class="author">Row 1 Data 1</td>
                        <td class="time">Row 1 Data 2</td>
                        <td>
                            <button class="btn btn-primary advice-detail">查阅</button>
                            <button class="btn btn-danger advice-remove">删除</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="num">Row 2 Data 1</td>
                        <td class="title">Row 1 Data 2</td>
                        <td class="author">Row 1 Data 1</td>
                        <td class="time">Row 1 Data 2</td>
                        <td>
                            <button class="btn btn-primary advice-detail">查阅</button>
                            <button class="btn btn-danger advice-remove">删除</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="advice-detail">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="关闭"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title text-center"></h4>
            </div>
            <div class="modal-body">
                <table class="table table-responsive">
                    <tbody>
                    <tr>
                        <td>姓名</td>
                        <td class="author"></td>
                    </tr>
                    <tr>
                        <td>时间</td>
                        <td class="time"></td>
                    </tr>
                    <tr>
                        <td>内容</td>
                        <td class="content"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<!-- /.modal -->
<script src="<c:url value="/pulgins/DataTables-1.10.11/media/js/jquery.dataTables.js"/>"></script>
<script>
    $(function () {

        var table = (function () {
            return $("#advice-list").DataTable({
                language: {
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
                }
            });
        })();


        (function (table) {
            var modal = $('#advice-detail');

            function _setModalData(data) {
                $('.modal-title', modal).html(data.title);
                $('.author', modal).html(data.author);
                $('.time', modal).html(data.time);
                $('.content', modal).html(data.content);
            }

            $('#advice-list').on('click', function (e) {
                var $btn = $(e.target);
                var $tr = $btn.closest('tr');
                if ($btn.hasClass('advice-detail')) {
                    var data = {
                        num: $tr.children('.num').html(),
                        title: $tr.children('.title').html(),
                        author: $tr.children('.author').html(),
                        time: $tr.children('.time').html()
                    };

                    _setModalData(data);

                    modal.modal('show');
                    return;
                }
                if ($btn.hasClass('advice-remove')) {
                    $tr.remove();
                }
            })
        })(table);
    })
</script>
</body>
</html>
