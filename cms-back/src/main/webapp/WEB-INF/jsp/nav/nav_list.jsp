<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>导航管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ include file="/common/easyui.jsp"%>
    <script type="text/javascript">
        var data = [
            {"label":"是","value":"1"},
            {"label":"否","value":"0"}
        ];
        var target_data = [
            {"label":"新窗口","value":"0"},
            {"label":"原窗口","value":"1"}
        ];

        //停用或者启用导航
        function updateNavStatus(id,status){
            var url ='<%=basePath%>nav/change_del_flag.sc';
            var data = {
                id:id,
                deleteFlag:status
            };
            $.getJSON(url,data,function(rs){
                 if(rs.result == 'success'){
                     alert('操作成功');
                     window.location.reload();
                 }
            });
        }

        function deleteById(id){
            var url ='<%=basePath%>nav/delete.sc';
            var data={id:id};
            $.getJSON(url,data,function(rs){
                alert(rs.msg);
                if(rs.result == 'success'){
                    window.location.reload();
                }

            });
        }
    </script>

</head>
<body style="padding-bottom:0px;">
<table id="dg" title="导航列表"   class="easyui-datagrid"   url="/nav/navs.sc"    style="margin:10px 0;"  toolbar="#toolbar"
      pagination="false" idField="id"   fit="true"
       rownumbers="true" fitColumns="true" singleSelect="true"   data-options="
                rowStyler: function(index,row){
                    if (row.deleteflag == 0){
                        return 'background-color:#ffffff;color:#dddddd;';
                    }
                }
            ">
    <thead>
    <tr>
        <th  field="navigationName" width="20" editor="{type:'validatebox',options:{required:true}}" rowspan="2">导航名称</th>
        <th field="url" width="40" editor="{type:'validatebox',options:{required:true}}" rowspan="2">链接地址</th>
        <th align="center" field="navigationNo" width="20" editor="{type:'validatebox',options:{required:true}}" rowspan="2">导航编号</th>
        <th align="center" field="orderSn" width="10" editor="{type:'validatebox',options:{required:true}}" rowspan="2">排序</th>
        <th align="center" rowspan="2" data-options="field:'linkOpenType',width:15,formatter:function(value){if(value==0)return '新窗口';else return '原窗口';}">链接打开方式</th>
        <th align="center"  rowspan="2" data-options="field:'createTime',width:25,formatter:function(date){ if(date !=null && date != '')return new Date(date).format('yyyy-MM-dd hh:mm:ss');else{return '';} }">创建时间</th>
        <th field="color" rowspan="2" width="22" editor="{type:'validatebox',options:{required:false}}">导航文本颜色RGB值</th>
        <th colspan="4">功能操作</th>
    </tr>
    <tr>
        <th align="center" data-options="field:'deleteflag',formatter:formatterDeleteFlag">是否启用</th>
        <th  align="center" data-options="field:'id',formatter:formatterUpdate">编辑</th>
        <th  align="center" data-options="field:'hasChild',formatter:formatterChild">设置子导航</th>
        <th  align="center" data-options="field:'dd',formatter:formatterDel">删除</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="openWin()">新增</a>
 <%--   <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#dg').edatagrid('destroyRow')">Destroy</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg').edatagrid('saveRow')">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">Cancel</a>
--%></div>
<div id="form_win" class="easyui-window" title="Modal Window" data-options="modal:true,closed:true,iconCls:'icon-save'">
    <div style="margin:10px">
        <form id="ff" method="post" action="<%=basePath%>/nav/save_nav.sc">
            <input type="hidden" name="id">
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
                    <td><input class="easyui-validatebox" type="text" name="color" /></td>
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
        </form>
    </div>
    <div style="background:#f0f0f0;text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" style="color:#ff0000;"  onclick="submitForm()">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="closeWin()">关闭</a>
    </div>
</div>
<script type="text/javascript">
    var $win;
    $win = $('#form_win').window({
        title:'添加导航',
        width: 450,
        height: 318,
        top:($(window).height() - 400) * 0.5,
        left:($(window).width() - 500) * 0.5,
        shadow: true,
        modal:true,
        iconCls:'icon-add',
        closed:true,
        minimizable:false,
        maximizable:false,
        collapsible:false
    });
    $.extend($.fn.validatebox.defaults.rules, {
        minLength: {
            validator: function(value, param){
                var input_value = $.trim(value);
                return input_value.length >= param[0];
            },
            message: '请输入至少{0}个字符.'
        }

    });
    function formatterUpdate(value ,row){
        if(value != null && $.trim(value) != ''){
            return "<a href='javascript:void(0)' onclick='showUpdateForm(\""+row.id+"\")'>编辑</a> ";
        }else{
            return "";
        }
    }
    function showUpdateForm(id){
       /* $.getJSON("<%=basePath%>nav/getById.sc?id="+id,function(rs){
        });*/
        $win.window('open');
        $('#ff').form('load', '<%=basePath%>nav/getById.sc?id='+id);
    }
    function formatterDel(value ,row){
        value = row.id;
        if(value != null && $.trim(value) != ''){
            return "<a href='javascript:void(0)'onclick='deleteById(\""+row.id+"\")'>删除</a> ";
        }else{
            return "";
        }
    }
    function formatterDeleteFlag(value,row){
        if( row.deleteflag ==1) {
            return "<a href='javascript:void(0);' onclick='updateNavStatus(\""+row.id+"\",0)' style='color:#ff0000;text-decoration: none' title='点击停用当前导航'>停用</a>";
        }else{
            return "<a href='javascript:void(0);' onclick='updateNavStatus(\""+row.id+"\",1)' style='color:#00ff00;text-decoration: none' title='点击启用当前导航'>启用</a>";
        }
    }

    function formatterChild (value,row){
        if(row.hasChild) {
            return "<a href='javascript:void(0);' onclick='alert(\"设置子导航\")' >设置子导航</a>"
        } else{
            return "无子导航";
        }
    }
    $(function(){
    $('#dg').datagrid({
        onDblClickRow: function(rowIndex, rowData){
           alert(rowIndex+"------>"+rowData.id+"-"+rowData.navigationName);
            console.log(rowData);
        }
    });
    });
    function openWin(){
        $win.window('open');
    }
    function closeWin(){ $("#form_win").window('close');}
    function  submitForm(){
        $.messager.progress();	// display the progress bar

        $('#ff').form('submit', {
            url:'<%=basePath%>nav/save_nav.sc',
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
</script>
</body>
</html>