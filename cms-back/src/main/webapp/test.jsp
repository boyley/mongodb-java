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
</body>
</html>