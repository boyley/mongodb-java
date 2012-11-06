
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>关键字管理</title>
    <%@ include file="/common/easyui.jsp"%>
    <link type="text/css" href="/css/demo.css">



</head>
<body>
<table id="dg" title="设置【${navigation.navigationName}】自导航" class="easyui-treegrid" style="height: 560px;"
       toolbar="#toolbar"      data-options="url:'<%=basePath%>nav/keywords.sc?navId=${navigation.id}',idField:'id',treeField:'keywordName',iconCls:'icon-edit',
					rownumbers:true,pagination:false,fitColumns:true,autoRowHeight:false">
    <thead>
    <tr>
        <th data-options="field:'keywordName',editor:'text'"   width="150">导航关键字名称</th>
        <th data-options="field:'url',editor:'text'" width="200">链接地址</th>
        <th data-options="field:'color',editor:'text'" width="50">导航文字颜色</th>
        <th data-options="field:'keywordType',editor:'text'" width="50">关键字类型</th>
        <th data-options="field:'linkOpenType',editor:'text'" width="50">打开方式</th>
        <th data-options="field:'createTime',editor:'text'" width="50">创建时间</th>
        <th data-options="field:'display',editor:'text'" width="50">是否显示</th>
        <th data-options="field:'orderSn',editor:'text'" width="50">排序</th>
        <th data-options="field:'id',formatter:formatterUpdate" width="50">操作</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <%--<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="openWin()">新增</a>--%>
    <%--<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#dg').edatagrid('destroyRow')">Destroy</a>--%>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="saveChanges()">Save</a>
    <%--<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">Cancel</a>--%>
</div>
<script type="text/javascript">
    function formatterUpdate(rowIndex, rowData){
//        return "<a href='javascript:void(0)' style='display: block;' id='"+rowIndex+"' onclick='showUpdateForm(\""+rowIndex+"\")'>编辑</a>"+ "|<a href='javascript:void(0)' style='display: block;' id='"+rowIndex+"' onclick='saveChanges()'>保存</a>";
    return "<a href='javascript:void(0)' id='"+rowIndex+"' onclick='showUpdateForm(\""+rowIndex+"\")'>编辑</a><a href='javascript:void(0)' onclick='saveChanges(\""+rowData+rowIndex+"\")' style='display: block;'>保存</a> ";
    }
    var editIndex = undefined;
    function endEditing(){
        if (editIndex == undefined){return true}
        if ($('#dg').datagrid('validateRow', editIndex)){
            var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'productid'});
            var productname = $(ed.target).combobox('getText');
            $('#dg').datagrid('getRows')[editIndex]['productname'] = productname;
            $('#dg').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }
    function saveChanges(rowData,id){
        $('#dg').datagrid('endEdit', id);
            $('#dg').datagrid('acceptChanges');


        var rows = $('#dg').datagrid('getChanges');
        alert(rows.length+' rows are changed!');
    }
    var data = [
        {"label":"是","value":"1"},
        {"label":"否","value":"0"}
    ];
    var target_data = [
        {"label":"新窗口","value":"0"},
        {"label":"原窗口","value":"1"}
    ];
    function showUpdateForm(id)   {
//        alert($('#_'+id).attr("display"));
        document.getElementById(id).style.display='none';
        $('#dg').datagrid('beginEdit', id);

    }
    $(function(){
        var lastIndex;
        $('#dg').datagrid({
            onDblClickRow: function(rowIndex, rowData){
                if (lastIndex != rowIndex){
                    $('#dg').datagrid('endEdit', lastIndex);
                    $('#dg').datagrid('beginEdit', rowIndex);
                    $('#upbt_'+rowIndex).attr('dispaly',"bolck");
                }
                lastIndex = rowIndex;

             //   $('#dg').treegrid('beginEdit',rowData.id);
            }
        });
    });
</script>

</body>
</html>
