
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
    <a href="/nav/to_add_or_edit_form.sc" class="easyui-linkbutton" iconCls="icon-add" plain="true"  >新增</a>
    <%--<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="saveChanges()">Save</a>--%>
</div>
<div id="form_win" class="easyui-window" title="Modal Window" data-options="modal:true,closed:true,iconCls:'icon-save'">
    <div style="margin:10px">
        <form id="ff" method="post" action="">
            <input type="hidden" name="id">
            <table>
                <tr>
                    <td>关键字名称:</td>
                    <td><input class="easyui-validatebox" type="text" required="true" name="keywordName" data-options="validType:'minLength[1]'" missingMessage="必填内容" /></td>
                </tr>
                <tr>
                    <td>链接地址:</td>
                    <td><input class="easyui-validatebox" type="text" name="url" data-options="required:true,validType:'text'" invalidMessage="请填写有效的Url地址"  missingMessage="必填内容"/></td>
                </tr>
                <tr>
                    <td>导航文字颜色:</td>
                    <td><input class="easyui-validatebox" type="text" name="color"  /></td>
                </tr>
                <tr>
                    <td>排序:</td>
                    <td><input class="easyui-numberspinner" type="text" value="0" name="orderSn" data-options="required:true,min:0,editable:true"/></td>
                </tr>
                <tr>
                    <td>链接打开方式:</td>
                    <td> <select class="easyui-combobox" name="linkOpenType"><option value="1"  data-options="panelHeight: 'auto' ">原窗口</option><option value="0">新窗口</option></select></td>
                </tr>
                <tr>
                    <td>类型:</td>
                    <td> <select class="easyui-combobox" name="keywordType"  data-options="panelHeight: 'auto' "><option value="1">关键字</option><option value="0">类别</option></select></td>
                </tr>
                <tr>
                    <td>是否启用:</td>
                    <td> <select class="easyui-combobox" name="display" data-options="panelHeight: 'auto' "><option value="1">显示</option><option value="0">不显示</option></select></td>
                </tr>
                <tr>
                    <td>类别选择:</td>
                    <td> <input class="easyui-combobox" id="parentKeyword_id" name="parentKeyword.id"
                                data-options="valueField:'id',textField:'keywordName', panelHeight: 'auto' ">
                        </td>
                </tr>
            </table>
        </form>
    </div>
    <div style="background:#f0f0f0;text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" style="color:#ff0000;"  onclick="submitForm()">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#form_win').window('close');">关闭</a>
    </div>
</div>
<script type="text/javascript">
    function initFormData(obj){
        var url ='<%=basePath%>nav/getAllKeywordCate.sc?navId=${navigation.id}';
           $("#parentKeyword_id").combobox('reload',url);
        alert(obj.id);
    }
    function  submitForm(){
        $.messager.progress();	// display the progress bar

        $('#ff').form('submit', {
            url:'<%=basePath%>nav/save_keyword.sc',
            onSubmit: function(){
                var isValid = $(this).form('validate');
                if (!isValid){
                    $.messager.progress('close');	// hide progress bar while the form is invalid
                }
                return isValid;	// return false will stop the form submission
            },
            success: function(data){
                var rs = eval('('+data+')');
                if(rs.result=="success"){
                    $.messager.progress('close');	// hide progress bar while submit successfully
                    window.location.reload();
                }
            }
        });
    }
    var $win;
    $win = $('#form_win').window({
        title:'添加导航',
        width: 450,
        height: 300,
        top:($(window).height() - 650) * 0.5,
        left:($(window).width() - 500) * 0.5,
        shadow: true,
        modal:true,
        iconCls:'icon-add',
        closed:true,
        minimizable:false,
        maximizable:false,
        collapsible:false
    });
    function formatterUpdate(rowIndex, rowData){
        var o = rowData;
        return "<a href='javascript:void(0)' id='"+rowIndex+"' onclick='javascript:$win.window(\"open\");initFormData("+ o.id+");'>编辑</a><a href='javascript:void(0)' onclick='saveChanges(\""+rowData+rowIndex+"\")' style='display: block;'>保存</a> ";
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

    }

</script>

</body>
</html>
