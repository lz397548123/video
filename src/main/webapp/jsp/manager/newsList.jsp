<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="expires" content="0">
<head>
    <title>新闻管理</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/plugins/layui/css/layui.css"  media="all">
    <script src="static/plugins/layui/layui.js"></script>
    <script src="static/plugins/jquery/jquery.js"></script>
    <style type="text/css">
        .layui-layout-admin .layui-body {bottom:0}

        .title{line-height: 60px;color: #d0cbc1;margin-left: 20px;}
        .searchDiv{height: 50px;background: #e0e0e0;font-size: 20px;color: #696969;line-height: 50px;border-radius: 5px;}
        .searchDiv span{margin-left:10px;}
        .searchDiv label{display: inline-block;vertical-align: middle;padding-left: 8px; margin-left: 20px;text-align: center; height: 30px;line-height: 30px;box-sizing:border-box;border: #95918a solid 1px;border-radius: 5px; font-size: 15px;color: black;background: #f8f8f8;}
        .searchDiv input{padding-left: 12px; vertical-align: middle;height: 30px;border: #95918a solid 1px;border-radius: 5px;font-size: 15px;color: black;background: #f8f8f8;box-sizing:border-box;}
        .searchDiv input:last-child{vertical-align: middle;height: 30px;font-size: 15px;width: 80px;color: #fff;margin-left: 15px; border-radius: 5px;background: #4EBBF9;border: #d9d4c9 1px solid;padding-left: 0;cursor: pointer;}
        .layui-form-select{width: 190px;height: 30px;display: inline-block;font-size: 15px;color: black;}

        .operateBtn{color: #1d1d1d; margin-right: 20px;width: 50px;box-sizing: border-box; background: #fff;padding: 5px 10px;border: #c4bfb5 solid 1px;border-radius: 5px;cursor: pointer;}
        .operateBtn:hover{color: #1d1d1d}
        .operateBtn:last-child{background: #ff5833;color: #fff}
        .operateBtn:last-child:hover{color: #fff}

    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">视频后台管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <a class="layui-layout-left title" style="">
            分类列表
        </a>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <c:if test="${sessionScope.admin == null}">
                        <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                        未登录
                    </c:if>
                    <c:if test="${sessionScope.admin != null}">
                        <img src="${sessionScope.admin.img}" class="layui-nav-img">
                        ${sessionScope.admin.name}
                    </c:if>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item">
                    <a href="jsp/manager/index.jsp">首页</a>
                </li>
                <li class="layui-nav-item" onclick="">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">用户列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">视频管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="manager/video/list">视频列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">视频分类管理</a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this"><a href="manager/category/list">视频分类列表</a></dd>
                        <dd><a href="manager/category/add">添加分类</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-this">
                    <a href="manager/news/list">新闻列表</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div style="border: #beb9b0 solid 1px;margin-top: 20px;border-radius: 5px;">
                <div style="border-bottom: #beb9b0 solid 1px;height:40px;">
                    <h2 style="margin:10px 0 10px 15px;">新闻列表</h2>
                </div>
                <div style="padding:20px;">
                    <table id="demo" lay-filter="demo">
                        <thead>
                        <tr>
                            <th lay-data="{type:'checkbox', width:60}">全选</th>
                            <th lay-data="{type:'numbers', width:60}">序号</th>
                            <th lay-data="{field:'name',minWidth: 80}">名字</th>
                            <th lay-data="{field:'type', width:150}">图片</th>
                            <th lay-data="{field:'operate',width:222}">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${news}" var="obj">
                            <tr>
                                <td></td>
                                <td></td>
                                <td>${obj.name}</td>
                                <td><img src="${obj.img}" alt=""></td>
                                <td>
                                    <a class="operateBtn" lay-event="update" objId="${obj.id}">编辑</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div style="display: none" id="updateForm" >
    <form class="layui-form newsUpdateForm" style="width: 500px;" method="post" action="manager/news/updateForNews">
        <input type="hidden" value="" name="id">

        <div class="layui-form-item">
            <label class="layui-form-label">新闻名称：</label>
            <div class="layui-input-block">
                <input id="updateNewsName" type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入新闻名称" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">上传新闻海报：</label>
            <div class="layui-input-block" style="display: inline-block;vertical-align: middle;margin-left: 0;">
                <button type="button" class="layui-btn layui-btn-normal" id="imgNewsButton">选择文件</button>
                <span style="display: inline-block;margin-left: 16px;" id="NewsFileName"></span><%--
                --%><span style="display: inline-block;margin-left: 10px;" id="NewsFileSize"></span>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block" style="margin-top: 50px;">
                <button type="submit" id="updateNewsSubmit" class="layui-btn" style="margin-right: 60px;" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    $(".layui-nav-itemed").trigger('mouseenter');
    $(".layui-nav-item").click(function () {
        $(".layui-nav-item").not(this).removeClass('layui-nav-itemed');
        $(".layui-nav-bar").css({top: $(this).position().top + 'px'})
    });

    //JavaScript代码区域
    layui.use(['element', 'table', 'layer', 'jquery', 'form', 'laydate', 'upload'], function () {
        var element = layui.element
            , table = layui.table
            , layer = layui.layer
            , $ = layui.jquery
            , form = layui.form
            , laydate = layui.laydate
            , upload = layui.upload;

        /**
         * 表格渲染
         */
        table.init('demo', {
            limit: 10 //注意：请务必确保 limit 参数（默认：10）是与你服务端限定的数据条数一致
            , page: true //开启分页
            , toolbar: '#toolbarLeft'
            //支持所有基础参数
        });

        //判断是否采用表单提交，上传图片时不使用表单提交
        var updateImgFlag = true;
        $("#updateForm").submit(function () {
            return updateImgFlag;
        });
        //表格行操作按钮点击事件
        table.on('tool(demo)', function (obj) {
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）

            //编辑视频信息
            if (layEvent == 'update') {
                //选中行的id
                var id = $(this).attr("objId");

                layer.open({
                    type: 1
                    , title: '修改新闻信息'
                    , area: ['700px', '720px']
                    , content: $("#updateForm")
                    , success: function () {
                        var layerForm = layui.form.render('select');

                        $.ajax({
                            url: 'manager/news/getNewsById'
                            , type: 'post'
                            , data: {id: id}
                            , success: function (result) {
                                $("input[type='hidden']").val(id);
                                $("#updateNewsName").val(result.name);
                                layui.form.render('select');
                            }
                        });
                    }
                });
            }
        });

        /**
         * 编辑新闻信息的文件上传
         */
        var uploadUpd = upload.render({
            elem: '#imgNewsButton'
            , url: 'manager/news/update'
            , auto: false //选择文件后不自动上传
            , bindAction: '#updateNewsSubmit' //指向一个按钮触发上传
            , multiple: false
            , data: {
                id: function () {
                    return $("input[type='hidden']").val();
                }
                , name: function () {
                    return $("#updateNewsName").val();
                }
            }
            , choose: function (obj) {
                updateImgFlag = false;
                //预读本地文件
                obj.preview(function (index, file, result) {
                    imgFlag = true;
                    $("#NewsFileName").html(file.name);
                    $("#NewsFileSize").html((file.size / 1024).toFixed(1) + 'kb');
                });
            }
            , before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                layer.load(1); //上传loading
            }
            , done: function (res, index, upload) {
                if (res.code == 1) {
                    layer.closeAll('loading'); //关闭loading
                    layer.msg("修改新闻成功！");
                    layer.close();
                    location.reload();
                    window.location.reload()
                } else if (res.code == 0) {
                    layer.closeAll('loading'); //关闭loading
                    layer.msg("修改新闻失败！");
                }
            }
        });
    })
</script>
</html>
