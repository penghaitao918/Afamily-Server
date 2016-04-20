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
    <title>发布任务</title>
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
                    <i class="fa fa-tags fa-lg"></i>
                    <a href="#">&nbsp;发布任务</a>
                    <i class="fa fa-angle-right"></i>
                </div>
                <span class="pull-right font-18" id="nowTime"></span>
            </div>

            <div class="container-fluid">
                <form class="form-horizontal" id="task-list">
                    <div class="form-group task-item">
                        <label class="col-md-2 control-label text-right font-18">1.</label>

                        <div class="col-md-8">
                            <input type="text" id="task1" class="form-control task-content" placeholder="任务">
                        </div>
                        <div class="col-md-2">
                            <button type="button" class="btn btn-danger delete-task">删除</button>
                        </div>
                    </div>
                    <div class="form-group text-center task-form-action">
                        <button type="button" class="btn btn-success margin-md" id="add-tack">添加</button>
                        <button type="button" class="btn btn-warning margin-md" id="publish-task">发布</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    var maxTaskNum = 1;
    var array = [];

    var Publish_Task_Module = function () {
    };

    Publish_Task_Module.prototype.createItem = function (data) {
        var item = $('<div class="form-group task-item"></div>'),
                num, content;
        if (typeof data !== 'object') {
            num = $('#task-list > .task-item').size() + 1;
            content = '';
        } else {
            num = data.number;
            content = data.content;6
        }
        maxTaskNum = num;
        item.append('<label class="col-md-2 control-label text-right font-18">' + num + '.</label>');
        item.append('<div class="col-md-8">' +
                '<input type="text" class="form-control task-content" placeholder="任务" id="task' + num +'"> ' +
                '</div> ' +
                '<div class="col-md-2"> ' +
                '<button class="btn btn-danger delete-task" value="123">删除</button>' +
                ' </div>');
        return item;
    };

    Publish_Task_Module.prototype.init = function(){
        var module = this;
        //任务删除事件委托
        $("#task-list").on('click',function (e){
            var $target = $(e.target);
            if ($target.hasClass('delete-task')){
                $target.closest('.task-item').remove();
            }
        });

        $("#add-tack").on('click',function (e){
            e.stopPropagation();
            $("#task-list > .task-form-action").before(module.createItem());
        });

        $("#publish-task").on('click',function (e){
            for(var i = 1; i <= maxTaskNum; ++ i) {
                array.push($("#task"+i).val())
            }
            publish();
            e.stopPropagation();
        });
    };

    $(function () {
        var module = new Publish_Task_Module();
        module.init();
    });

    function publish(){
        $.ajax({
            url: basePath + "publish/taskDo",
            data: {
                "array" : array
            },
            dataType: "json",
            type: "POST",
            async:false,
            traditional: true,
            success: function (data) {
                array = [];
                alert("任务发布成功");
            },
            error: function(){
                alert("错误")
            }
        });
    }

</script>
</body>
</html>