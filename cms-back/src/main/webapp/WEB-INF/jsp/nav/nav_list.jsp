<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>导航管理</title>
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
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#dg').edatagrid('destroyRow')">Destroy</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg').edatagrid('saveRow')">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">Cancel</a>
</div>
<script type="text/javascript">
    function formatterUpdate(value ,row){
        if(value != null && $.trim(value) != ''){
            return "<a href='javascript:void(0)' >编辑</a> ";
        }else{
            return "";
        }
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
   /* $(function(){
        var p = $('#dg').datagrid('getPager');
        $(p).pagination({
            pageSize: 50,//每页显示的记录条数，默认为10
//            pageList: [50],//可以设置每页记录条数的列表
            beforePageText: '第',//页数文本框前显示的汉字
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
            *//*onBeforeRefresh:function(){
             $(this).pagination('loading');
             alert('before refresh');
             $(this).pagination('loaded');
             }*//*
        });
    });*/
</script>
</body>
</html>