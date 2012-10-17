<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>导航管理</title>
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
    <script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.edatagrid.js"></script>
</head>
<body>
<table id="dg" title="导航列表"
       toolbar="#toolbar" pagination="true" idField="id"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="navigationName" width="20" editor="{type:'validatebox',options:{required:true}}">导航名称</th>
        <th field="url" width="20" editor="{type:'validatebox',options:{required:true}}">链接地址</th>
        <th field="navigationNo" width="20" editor="{type:'validatebox',options:{required:true}}">导航编号</th>
        <th field="deleteflag" width="20" editor="{type:'validatebox',options:{required:true}}">是否启用</th>
        <th field="orderSn" width="20" editor="{type:'validatebox',options:{required:true}}">排序</th>
        <th field="hasChild" width="20" editor="{type:'validatebox',options:{required:true}}">是否有子导航</th>
        <th field="createTime" width="20" editor="{type:'validatebox',options:{required:true}}">创建时间</th>
        <th field="linkOpenType" width="20" editor="{type:'validatebox',options:{required:true}}">打开类型</th>
        <th field="color" width="20" editor="{type:'validatebox',options:{required:true}}">导航文本颜色RGB值</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:$('#dg').edatagrid('addRow')">New</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#dg').edatagrid('destroyRow')">Destroy</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg').edatagrid('saveRow')">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">Cancel</a>
</div>
<script type="text/javascript">
    $(function(){
        $('#dg').edatagrid({
            url: '/nav/navs.sc',
            saveUrl: 'save_user.php',
            updateUrl: 'update_user.php',
            destroyUrl: 'destroy_user.php'
        });
    });
</script>

</body>
</html>