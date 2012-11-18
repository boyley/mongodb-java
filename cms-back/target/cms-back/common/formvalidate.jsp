<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/formvalidate/formValidator-4.1.3.js"></script>
<script type="text/javascript" src="<%=basePath%>/formvalidate/formValidatorRegex.js"></script>
<style type="text/css" media="all">
    tr{height:30px;}
    .STYLE1 {
        font-size: 12px;
        font-weight: bold;
    }
    legend {
        color:#06c;
        font-weight:800;
        background:#fff;
        border:#b6b6b6 solid 1px;
        padding:6px 6px;
    }
</style>
<script type="text/javascript">
    $(function(){
//       $.formValidator.initConfig({formID:"form1",theme:'ArrowSolidBox',mode:'AutoTip',onError:function(msg){alert(msg)},inIframe:true});
       /* $.formValidator.initConfig({theme:"126",submitOnce:true,formID:"form1",
            onError:function(msg){alert(msg);},
            submitAfterAjaxPrompt : '有数据正在异步验证，请稍等...'
        });*/

    });
</script>
