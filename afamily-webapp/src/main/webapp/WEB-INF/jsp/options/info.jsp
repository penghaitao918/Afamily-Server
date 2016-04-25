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
                        <th style="width: 175px;">操作</th>
                    </tr>
                    </thead>
                    <tbody></tbody>
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
                        <td><b>姓名</b></td>
                        <td class="author"></td>
                    </tr>
                    <tr>
                        <td><b>时间</b></td>
                        <td class="time"></td>
                    </tr>
                    <tr>
                        <td><b>内容</b></td>
                        <td class="content"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="">关闭</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<!-- /.modal -->
<script src="<c:url value="/pulgins/DataTables-1.10.11/media/js/jquery.dataTables.js"/>"></script>
<script>
    var table = $("#advice-list").DataTable({
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
                "url": basePath + "options/findAllOption",
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
            { data: "title" },
            { data: "name" },
            { data: "time" },
            { data: 'operate',
                render: function (data, type, full) {
                    var returnValue = '<button class="btn btn-primary advice-detail" value="' + full.id + '" onclick="getInfo(' + full.id + ')">查阅</button>'
                    returnValue += '<button class="pull-right btn btn-danger advice-remove" value="' + full.id + '" onclick="del('+full.id+')">删除</button>'
                    return returnValue
                }
            }
        ]
    });
    table.on( 'order.dt search.dt', function () {
        table.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
            cell.innerHTML = i+1;
        } );
    } ).draw();

    function del(id) {
        $.ajax({
            type:"POST",
            url:basePath + "options/deleteById",
            dataType:"json",
            data: {
                id: id
            },
            success:function(data) {
                table.ajax.reload();
            },
            error:function(){
                alert("Fail to acquire data");
            }
        });
    }

    function getInfo(id) {
        var modal = $('#advice-detail');
        $.ajax({
            type:"POST",
            url:basePath + "options/findOptionByID",
            dataType:"json",
            data: {
                id: id
            },
            success:function(data) {
                $('.modal-title', modal).html(data.title);
                $('.author', modal).html(data.name);
                $('.time', modal).html(data.time);
                $('.content', modal).html(data.body);
                modal.modal('show');
            },
            error:function(){
                alert("Fail to acquire data");
            }
        });
    }

</script>
</body>
</html>
