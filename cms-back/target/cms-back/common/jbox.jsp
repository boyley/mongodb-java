<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--jbox-->
<link id="skin" rel="stylesheet" href="<%=basePath%>jbox/Skins/Default/jbox.css" />
<script type="text/javascript" src="<%=basePath%>jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>jbox/i18n/jquery.jBox-zh-CN.js"></script>
