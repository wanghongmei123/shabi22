<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<!-- 引入EasyUI的样式文件-->
<link rel="stylesheet"
      href="<%=request.getContextPath() %>/EasyUI/themes/default/easyui.css" type="text/css"/>

<!-- 引入EasyUI的图标样式文件-->
<link rel="stylesheet"
      href="<%=request.getContextPath() %>/EasyUI/themes/icon.css" type="text/css"/>


</head>
<body>
 
<div id="cc" class="easyui-layout" data-options="fit:true">   
    <div data-options="region:'north',title:'North Title',split:true" style="height:100px;">
    
    </div>   
    <div data-options="region:'west',title:'West',split:true" style="width:200px;">
    
     <a href="javascript:addtabs('权限管理','index/userinfo')">权限列表</a><br>
     
    	
    	
    	<br>
    	<ul id="treesss"></ul>  
    	
    </div>   
    <div data-options="region:'center',title:'center title'" >
    
    	<div id="ss" class="easyui-tabs" data-options="fit:true" >   
		    <div title="首页" >   
		        tab1    
		    </div>   
		</div>  
    
    </div>   
</div>  
<!-- 引入JQuery -->
<script type="text/javascript"
                 src="<%=request.getContextPath() %>/EasyUI/jquery.min.js"></script>

<!-- 引入EasyUI -->
<script type="text/javascript"
                 src="<%=request.getContextPath() %>/EasyUI/jquery.easyui.min.js"></script>

<!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
<script type="text/javascript"
                 src="<%=request.getContextPath() %>/EasyUI/locale/easyui-lang-zh_CN.js"></script>
<!--树-->
<script type="text/javascript"
                 src="<%=request.getContextPath() %>/EasyUI/util-js.js"></script>
                 




<script type="text/javascript">

	function addtabs(titleStr,urlStr){
// 		exists：判断某选项卡面板是否已经打开
		if($("#ss").tabs('exists',titleStr)){
//	 		select：选中该选项卡面板
			$("#ss").tabs('select',titleStr);
		}else{
//	 		add：添加选项卡面板
			$("#ss").tabs('add',{
				title:titleStr,
				href:"<%=request.getContextPath() %>/"+urlStr,
				closable:true
				
			})
		}

	}


</script>

</body>
</html>