<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
        <head>
            <title>test</title>
            <script type="text/javascript" src="<%=basePath%>js/jquery-1.8.0.min.js"></script>

            <!--jbox-->
            <link id="skin" rel="stylesheet" href="<%=basePath%>jbox/Skins/Default/jbox.css" />
            <script type="text/javascript" src="<%=basePath%>jbox/jquery.jBox-2.3.min.js"></script>
            <script type="text/javascript" src="<%=basePath%>jbox/i18n/jquery.jBox-zh-CN.js"></script>
</head>
        <script type="text/javascript">

            function iframe(){
                $.jBox("iframe:http://www.baidu.com", {
                    title: "百度一下",
                    width: 800,
                    height: 350,
                    buttons: {  }
                });
            }
            function norm(){
                $.jBox('id:content',{top: '30%', /* 窗口离顶部的距离,可以是百分比或像素(如 '100px') */buttons: { }, /* 窗口的按钮 */
                    closed: function () { window.location.reload(); } /* 窗口关闭后执行的函数 */});
            }
        </script>
<body style="height: 900px;">
    <button onclick="iframe()">iframe</button>
    <button onclick="norm()">norm</button>
    <div id="content">
        <br/>
     this. is a tae
    </div>

    <form id="ff" method="post" action="<%=basePath%>/nav/save_nav.sc">
        <table>
            <tr>
                <td>导航名称:</td>
                <td><input class="easyui-validatebox" type="text" required="true" name="navigationName" data-options="validType:'minLength[1]'" missingMessage="必填内容" /></td>
            </tr>
            <tr>
                <td>链接地址:</td>
                <td><input class="easyui-validatebox" type="text" name="url" data-options="required:true,validType:'url'" invalidMessage="请填写有效的Url地址"  missingMessage="必填内容"/></td>
            </tr>
            <tr>
                <td>导航编号:</td>
                <td><input class="easyui-validatebox" type="text" name="navigationNo" data-options="required:true,validType:'text'" data-options="validType:'minLength[2]'" missingMessage="必填内容"/></td>
            </tr>
            <tr>
                <td>排序:</td>
                <td><input class="easyui-numberspinner" type="text" value="0" name="orderSn" data-options="required:true,min:0,editable:true"/></td>
            </tr>
            <tr>
                <td>链接打开方式:</td>
                <td> <select class="easyui-combobox" name="linkOpenType"><option value="1">原窗口</option><option value="0">新窗口</option></select></td>
            </tr>
            <tr>
                <td>导航文本颜色RGB值:</td>
                <td><input class="easyui-validatebox" type="text" name="color" data-options="required:true,validType:'text'"/></td>
            </tr>
            <tr>
                <td>是否启用:</td>
                <td> <select class="easyui-combobox" name="deleteflag"><option value="1">启用</option><option value="0">禁用</option></select></td>

            </tr>
            <tr>
                <td>是否有子导航:</td>
                <td> <select class="easyui-combobox" name="hasChild"><option value=true>有子导航</option><option value=false>无子导航</option></select></td>
            </tr>
        </table>
        <input type="submit" value="go">
    </form>
</body>
</html>