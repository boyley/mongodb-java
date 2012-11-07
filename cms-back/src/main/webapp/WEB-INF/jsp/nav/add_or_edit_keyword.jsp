<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>添加修改导航关键字</title>
        <%@ include file="/common/formvalidate.jsp"%>
        <script type="text/javascript">
            $(document).ready(function(){
                $.formValidator.initConfig({theme:"126",submitOnce:true,formID:"form1",
                    onError:function(msg){alert(msg);},
                    submitAfterAjaxPrompt : '有数据正在异步验证，请稍等...'
                });
                $("#keywordName").formValidator({onShowFixText:$("#keywordNameFixTip").text(),onShowText:"请输入导航关键字名称",onShow:"输入正确的名称",onCorrect:"输入正确"}).inputValidator({min:2,max:50,onError:"输入的关键字名称不合法"});
                $("#url").formValidator({onShowFixText:$("#urlFixTip").text(),onShowText:"请输入url",onShow:"输入正确url",onCorrect:"输入正确"}).inputValidator({min:1,onError:"输入的url不能为空"});
                $("#color").formValidator({onShowFixText:$("#urlFixTip").text()});
                });
        </script>

    </head>
    <body>
    <fieldset >
        <legend>导航关键字</legend>
    <form action="" method="post" name="form1" id="form1">
        <table border="0px" style="font-size:12px" width="630px">

            <tr>
                <td align="right">* 导航关键字名称:</td>
                <td><input type="text" id="keywordName" name="keywordName" style="width:160px" /></td>
                <td><div id="keywordNameTip" style="width:280px"></div></td>
            </tr>
            <tr>
                <td align="right">&nbsp;</td>
                <td colspan="2" valign="top"><div id="keywordNameFixTip">可以输入2~50个汉字和数字字母以及下划线的组合</div></td>
            </tr>

            <tr>
                <td align="right">* 链接地址:</td>
                <td><input type="text" id="url" name="url" style="width:160px" value="#" /></td>
                <td><div id="urlTip" style="width:280px"></div></td>
            </tr>
            <tr>
                <td align="right">&nbsp;</td>
                <td colspan="2" valign="top"><div id="urlFixTip">请输入正确的url地址,如果是类别，请输入"#"</div></td>
            </tr>
            <tr>
                <td align="right">导航文字颜色:</td>
                <td><input type="text" id="color" name="color" style="width:160px" value="" /></td>
                <td><div id="colorTip" style="width:280px"></div></td>
            </tr>
            <tr>
                <td align="right">&nbsp;</td>
                <td colspan="2" valign="top"><div id="colorFixTip">此属性用来设置前台显示的颜色</div></td>
            </tr>


        </table>
        <input type="submit" name="button" id="button" value="提交" />
    </form>
    </fieldset>
    <div id="output"></div>
    </body>
</html>