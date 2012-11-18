<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加修改导航关键字</title>
    <%@ include file="/common/formvalidate.jsp" %>
    <script type="text/javascript">
        $(document).ready(function () {
            $.formValidator.initConfig({theme:"126", submitOnce:true, formID:"form1",
                onError:function (msg) {
                    alert(msg);
                },
                submitAfterAjaxPrompt:'有数据正在异步验证，请稍等...'
            });
            $("#keywordName").formValidator({onShowFixText:$("#keywordNameFixTip").text(), onShowText:"请输入导航关键字名称", onShow:"输入正确的名称", onCorrect:"输入正确"}).inputValidator({min:2, max:50, onError:"输入的关键字名称不合法"});
            $("#url").formValidator({onShowFixText:$("#urlFixTip").text(), onShowText:"请输入url", onShow:"输入正确url", onCorrect:"输入正确"}).inputValidator({min:1, onError:"输入的url不能为空"});
            $("#color").formValidator({onShowFixText:$("#colorFixTip").text()});
            $("#orderSn").formValidator({onShow:"请输入正整数", onCorrect:"排序号输入正确"}).regexValidator({regExp:"intege1", dataType:"enum", onError:"排序号只能输入正整数"});
            $("#keywordType").formValidator({onShow:"请选择类型",onFocus:"类型必须选择",onCorrect:"正确",defaultValue:"1"}).inputValidator({min:1,onError: "请选择学历"}).defaultPassed();

        });
        function hiddenCate(){
            var keyType = $("#keywordType").val();
            if(keyType == 0){
                $("#pidtr").css("display","none");
            }else if(keyType ==1){
                $("#pidtr").removeAttr("style");
            }

        }
    </script>

</head>
<body>
<fieldset>
    <legend>导航关键字</legend>
    <form action="save_keyword.sc" method="post" name="form1" id="form1">
        <input type="hidden" name="navigation.id" value="${navId}">
        <table border="0px" style="font-size:12px" width="630px">
            <tr>
                <td align="right">* 导航关键字名称:</td>
                <td><input type="text" id="keywordName" name="keywordName" style="width:160px"/></td>
                <td>
                    <div id="keywordNameTip" style="width:280px"></div>
                </td>
            </tr>
            <tr>
                <td align="right">&nbsp;</td>
                <td colspan="2" valign="top">
                    <div id="keywordNameFixTip">可以输入2~50个汉字和数字字母以及下划线的组合</div>
                </td>
            </tr>

            <tr>
                <td align="right">* 链接地址:</td>
                <td><input type="text" id="url" name="url" style="width:160px" value="#"/></td>
                <td>
                    <div id="urlTip" style="width:280px"></div>
                </td>
            </tr>
            <tr>
                <td align="right">&nbsp;</td>
                <td colspan="2" valign="top">
                    <div id="urlFixTip">请输入正确的url地址,如果是类别，请输入"#"</div>
                </td>
            </tr>
            <tr>
                <td align="right">导航文字颜色:</td>
                <td><input type="text" id="color" name="color" style="width:160px" value=""/></td>
                <td>
                    <div id="colorTip" style="width:280px"></div>
                </td>
            </tr>
            <tr>
                <td align="right">&nbsp;</td>
                <td colspan="2" valign="top">
                    <div id="colorFixTip">此属性用来设置前台显示的颜色</div>
                </td>
            </tr>
            <tr>
                <td align="right">排序号:</td>
                <td><input type="text" id="orderSn" name="orderSn" style="width:160px" value=""/></td>
                <td>
                    <div id="orderSnTip" style="width:280px"></div>
                </td>
            </tr>
            <tr>
                <td align="right">链接打开方式:</td>
                <td><input type="radio" id="linkOpenType_new" value="1" name="linkOpenType" checked="true"/>
                    原窗口&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" id="linkOpenType_org" value="2" name="linkOpenType" />
                    新窗口</td>
                <td>
                    <div id="linkOpenTypeTip" style="width:280px"></div>
                </td>
            </tr>
            <tr>
                <td align="right">类型:</td>
                <td >
                    <select  name="keywordType"  id="keywordType" style="width: 150px;height:22px;vertical-align: middle;" onchange="hiddenCate()">
                        <option value="">选择类型</option>
                        <option value="1">关键字</option><option value="0">类别</option></select>
                </td>
                <td>
                    <div id="keywordTypeTip" style="width:280px"></div>
                </td>
            </tr>
            <tr>
                <td align="right">是否显示:</td>
                <td> <select name="display"   style="width: 150px;height:22px;vertical-align: middle;"><option value="1">显示</option><option value="0">不显示</option></select></td>
                <td>
                    <div id="displayTypeTip" style="width:280px"></div>
                </td>
            </tr>
            <tr id="pidtr">
                <td align="right">父类别选择:</td>
                <td>
                    <select name="parentKeyword.id" id="pid"  style="width: 150px;height:22px;vertical-align: middle;">
                        <option value="" >选择父类别</option>
                        <c:forEach var="cate" items="${cateList}">
                            <option value="${cate.id}">${cate.keywordName}</option>
                         </c:forEach>
                    </select>
                </td>
                <td>
                    <div id="pidTip" style="width:280px"></div>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" name="button" id="button" value="提交"/> &nbsp;  &nbsp;  &nbsp;  &nbsp; <input type="reset" name="button" id="rst" value="重置"/>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </form>
</fieldset>

</body>
</html>