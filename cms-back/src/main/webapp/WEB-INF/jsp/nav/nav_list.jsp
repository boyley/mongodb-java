<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>导航管理</title>
    <%@ include file="/common/easyui.jsp"%>
    <jsp:include page="/common/jbox.jsp"/>
    <style type="text/css">
        *{
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
        }
    </style>
    <script type="text/javascript" src="<%=basePath%>js/plugins/jquery.edatagrid.js"></script>
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
        <th data-options="field:'hasChild',width:20,formatter:function(value){if(value)return '是';else return '否';}">是否有子导航</th>
        <th data-options="field:'createTime',width:20,formatter:function(date){ if(date !=null && date != '')return new Date(date).format('yyyy-MM-dd hh:mm:ss');else{return '';} }">创建时间</th>
        <th data-options="field:'linkOpenType',width:20,formatter:function(value){if(value==0)return '新窗口';else return '原窗口';},editor:{
                            type:'combobox',
                            options:{
                                valueField:'value',
                                textField:'label',
                                data: target_data  ,
                                required:true  }
                            }">打开类型</th>
        <th field="color" width="20" editor="{type:'validatebox',options:{required:false}}">导航文本颜色RGB值</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="openWin()">新增</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:$('#dg').edatagrid('destroyRow')">Destroy</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg').edatagrid('saveRow')">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">Cancel</a>
</div>
<div id="form_win" class="easyui-window" title="Modal Window" data-options="modal:true,closed:true,iconCls:'icon-save'">
        <div style="margin:10px">
            <form id="ff" method="post">
                <table>
                    <tr>
                        <td>Name:</td>
                        <td><input class="easyui-validatebox" type="text" name="name" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input class="easyui-validatebox" type="text" name="email" data-options="required:true,validType:'email'"></input></td>
                    </tr>
                    <tr>
                        <td>Subject:</td>
                        <td><input class="easyui-validatebox" type="text" name="subject" data-options="required:true"></input></td>
                    </tr>
                    <tr>
                        <td>Message:</td>
                        <td><textarea name="message" style="height:60px;"></textarea></td>
                    </tr>
                    <tr>
                        <td>Language:</td>
                        <td>
                            <select class="easyui-combobox" name="language"><option value="ar">Arabic</option><option value="bg">Bulgarian</option><option value="ca">Catalan</option><option value="zh-cht">Chinese Traditional</option><option value="cs">Czech</option><option value="da">Danish</option><option value="nl">Dutch</option><option value="en" selected="selected">English</option><option value="et">Estonian</option><option value="fi">Finnish</option><option value="fr">French</option><option value="de">German</option><option value="el">Greek</option><option value="ht">Haitian Creole</option><option value="he">Hebrew</option><option value="hi">Hindi</option><option value="mww">Hmong Daw</option><option value="hu">Hungarian</option><option value="id">Indonesian</option><option value="it">Italian</option><option value="ja">Japanese</option><option value="ko">Korean</option><option value="lv">Latvian</option><option value="lt">Lithuanian</option><option value="no">Norwegian</option><option value="fa">Persian</option><option value="pl">Polish</option><option value="pt">Portuguese</option><option value="ro">Romanian</option><option value="ru">Russian</option><option value="sk">Slovak</option><option value="sl">Slovenian</option><option value="es">Spanish</option><option value="sv">Swedish</option><option value="th">Thai</option><option value="tr">Turkish</option><option value="uk">Ukrainian</option><option value="vi">Vietnamese</option></select>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div style="background:#fafafa;text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
        </div>
</div>
<script type="text/javascript">
    function openWin(){
        var $win;
        $win = $('#form_win').window({
            title:'添加导航',
            width: 500,
            height: 400,
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

        $win.window('open');
    }
    function addForm(){
        $.jBox('id:form_win',{top: '30%', /* 窗口离顶部的距离,可以是百分比或像素(如 '100px') */buttons: { }, /* 窗口的按钮 */
            closed: function () { window.location.reload(); } /* 窗口关闭后执行的函数 */});
    }
    $(function(){
        $('#dg').edatagrid({
            url: '/nav/navs.sc',
            saveUrl: 'save_user.php',
            updateUrl: '/nav/update_nav.sc',
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