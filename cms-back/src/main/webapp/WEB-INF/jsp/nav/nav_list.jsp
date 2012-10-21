<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>导航管理</title>
    <%@ include file="/common/easyui.jsp"%>
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css" />
    <script type="text/javascript" src="<%=basePath%>js/plugins/jquery.edatagrid.js"></script>
    <script type="text/javascript">
        var data = [
            {"label":"是","value":"1"},
            {"label":"否","value":"0"}
        ];
    </script>

</head>
<body style="padding-bottom:0px;">
<table id="dg" title="导航列表"   class="easyui-datagrid"     style="margin:10px;"
       toolbar="#toolbar" pagination="true" idField="id"   fit="true"
       rownumbers="true" fitColumns="true" singleSelect="true"   data-options="
                rowStyler: function(index,row){
                    if (row.deleteflag == 0){
                        return 'background-color:#ffffff;color:#dddddd;';
                    }
                }
            ">
    <thead>
    <tr>
        <th field="navigationName" width="20" editor="{type:'validatebox',options:{required:true}}">导航名称</th>
        <th field="url" width="20" editor="{type:'validatebox',options:{required:true}}">链接地址</th>
        <th field="navigationNo" width="20" editor="{type:'validatebox',options:{required:true}}">导航编号</th>
        <th data-options="field:'deleteflag',width:20,
                        formatter:function(value,row){
                            if( row.deleteflag ==1)
                            return '是';
                            else return '否';
                        },
                        editor:{
                            type:'combobox',
                            options:{
                                valueField:'value',
                                textField:'label',
                                data: data  ,
                                required:true
                            }
                        }">是否启用</th>
        <th field="orderSn" width="20" editor="{type:'validatebox',options:{required:true}}">排序</th>
        <th field="hasChild" width="20" editor="{type:'validatebox',options:{required:true}}">是否有子导航</th>
        <th field="createTime" width="20" editor="{type:'validatebox',options:{required:true}}">创建时间</th>
        <th field="linkOpenType" width="20" editor="{type:'validatebox',options:{required:true}}">打开类型</th>
        <th field="color" width="20" editor="{type:'validatebox',options:{required:false}}">导航文本颜色RGB值</th>
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
        //设置分页控件
        var p = $('#dg').datagrid('getPager');
        $(p).pagination({
            pageSize: 10,//每页显示的记录条数，默认为10
            pageList: [5,10,15],//可以设置每页记录条数的列表
            beforePageText: '第',//页数文本框前显示的汉字
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
            /*onBeforeRefresh:function(){
             $(this).pagination('loading');
             alert('before refresh');
             $(this).pagination('loaded');
             }*/
        });
    });
</script>

</body>
</html>