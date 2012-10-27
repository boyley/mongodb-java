<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>导航管理</title>
    <%@ include file="/common/easyui.jsp"%>
    <style type="text/css">
      /*  *{
            font-size:12px;
        }
        body {
            font-family:helvetica,tahoma,verdana,sans-serif;
            padding:20px;
            font-size:13px;
            margin:0;
        }
        h2 {
            font-size:18px;
            color:#333;
            font-weight:bold;
            margin:0;
            margin-bottom:15px;
        }
        .demo-info{
            background:#FFFEE6;
            color:#8F5700;
            padding:12px;
        }
        .demo-tip{
            width:16px;
            height:16px;
            margin-right:8px;
            float:left;
        }*/
    </style>
    <script type="text/javascript">
        var data = [
            {"label":"是","value":"1"},
            {"label":"否","value":"0"}
        ];
        var target_data = [
            {"label":"新窗口","value":"0"},
            {"label":"原窗口","value":"1"}
        ];
    </script>

</head>
<body style="padding-bottom:0px;">
<table id="dg" title="导航列表"   class="easyui-datagrid"   url="/nav/navs.sc"    style="margin:10px 0;"  toolbar="#toolbar"
      pagination="true" idField="id"   fit="true"
       rownumbers="true" fitColumns="true" singleSelect="true"   data-options="
                rowStyler: function(index,row){
                    if (row.deleteflag == 0){
                        return 'background-color:#ffffff;color:#dddddd;';
                    }
                }
            ">
    <thead>
    <tr>
        <th  field="navigationName" width="20" editor="{type:'validatebox',options:{required:true}}">导航名称</th>
        <th field="url" width="80" editor="{type:'validatebox',options:{required:true}}">链接地址</th>
        <th align="center" field="navigationNo" width="20" editor="{type:'validatebox',options:{required:true}}">导航编号</th>
        <th align="center" data-options="field:'deleteflag',width:10,
                        formatter:function(value,row){
                            if( row.deleteflag ==1)
                            return '<button>是</button>';
                            else return '否';
                        }">是否启用</th>
        <th align="center" field="orderSn" width="10" editor="{type:'validatebox',options:{required:true}}">排序</th>
        <th  align="center" data-options="field:'hasChild',width:20,formatter:function(value){if(value)return '<a>设置自导航</a>';else return '否';}">是否有子导航</th>
        <th align="center" data-options="field:'createTime',width:25,formatter:function(date){ if(date !=null && date != '')return new Date(date).format('yyyy-MM-dd hh:mm:ss');else{return '';} }">创建时间</th>
        <th align="center" data-options="field:'linkOpenType',width:15,formatter:function(value){if(value==0)return '新窗口';else return '原窗口';}">打开类型</th>
        <th field="color" width="22" editor="{type:'validatebox',options:{required:false}}">导航文本颜色RGB值</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="openWin()">新增</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#dg').edatagrid('destroyRow')">Destroy</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg').edatagrid('saveRow')">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">Cancel</a>
</div>
<script type="text/javascript">
    $(function(){
    $('#dg').datagrid({
        onDblClickRow: function(rowIndex, rowData){
           alert(rowIndex+"------>"+rowData.id+"-"+rowData.navigationName);
            console.log(rowData);
        }
    });
    });
</script>
</body>
</html>