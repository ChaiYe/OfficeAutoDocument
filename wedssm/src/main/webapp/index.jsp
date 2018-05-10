<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- <link rel="stylesheet" href="//res.layui.com/layui/dist/css/layui.css"  media="all">-->
    <link rel="stylesheet" href="css/layui/css/layui.css">
    <script src="js/jquery-1.11.1.min.js">

    </script>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<button onclick="fun()">按钮</button>
<table class="layui-hide" id="test"></table>
<div id="jsonTip"></div>

<!--<script src="//res.layui.com/layui/dist/layui.js" charset="utf-8"></script>-->
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script src="css/layui/layui.js"></script>
<script>

    function fun() {
        alert("nihao");
        $.getJSON("userinfo.json", function (data) {
            var $jsontip = $("#jsonTip");
            var strHtml = "123";//存储数据的变量
            $jsontip.empty();//清空内容
            $.each(data, function (infoIndex, info) {
                strHtml += "姓名：" + info["name"] + "<br>";
                strHtml += "性别：" + info["sex"] + "<br>";
                strHtml += "邮箱：" + info["email"] + "<br>";
                strHtml += "<hr>"
            })
            $jsontip.html(strHtml);//显示处理后的数据
        })
    }


    layui.use('table', function(){
        var table = layui.table;

        table.render({
            elem: '#test'
            ,url:'use.json'
            ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {field:'id', width:80, title: 'ID', sort: true}
                ,{field:'username', width:80, title: '用户名'}
                ,{field:'sex', width:80, title: '性别', sort: true}
                ,{field:'city', width:80, title: '城市'}
                ,{field:'sign', title: '签名', width: '30%', minWidth: 100} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                ,{field:'experience', title: '积分', sort: true}
                ,{field:'score', title: '评分', sort: true}
                ,{field:'classify', title: '职业'}
                ,{field:'wealth', width:137, title: '财富', sort: true}
            ]]
        });
    });
</script>

</body>
</html>