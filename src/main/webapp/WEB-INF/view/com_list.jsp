<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'com_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">


  </head>
  
  <body>
    <div id="cc" class="easyui-layout" style="width:600px;height:400px;" data-options = "fit:true">   
	    <div data-options="region:'west',title:'用户树'" style="width:350px;">

	    	<ul id="userTree"></ul>  
	    </div>   
	    <div data-options="region:'east',title:'权限树'" style="width:350px;">
	    	<ul id = "quanTree"></ul>
	    	<a id="quan" href="javascript:adduseridAnquanid()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">赋予权限</a>  
	    </div>   
	    <div data-options="region:'center',title:'角色树'" >
	    	<ul id="roleTree"></ul>  
	    	<a id="btn" href="javascript:adduseridAndroleid()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">赋予角色</a>  
	    </div>   
	</div>  
	
	<script type="text/javascript">
		$(function(){
		 	userTree();
			})
 		function userTree(){
			 $('#userTree').tree({  
	                url:'<%=request.getContextPath()%>/Power/queryuser',
	                parentField:'pid',
	                onClick: function(node){
	               	 $('#roleTree').tree({  
	               		 
	 	                url:'<%=path%>/Power/queryrole?userid='+node.id,
	 	                parentField:'pid',
	 	                checkbox:true,
	 	                lines:true,
	 	                onClick:function(node){
	 	                	 $('#quanTree').tree({ 
	 	                	   url:'<%=path%>/Power/querypower?roleid='+node.id +'&userid='+node.id,
	 	    	                parentField:'pid',
	 	    	                checkbox:true,
	 	    	         });
	 	                }
	 	               });
	            	}

	         });  
		}
		
		
		function adduseridAndroleid(){
			var userids =   $('#userTree').tree('getSelected').id;
			var roleidarr = $('#roleTree').tree('getChecked');
			var role = "";
			for (var i = 0; i < roleidarr.length; i++) {
				role+= "," + roleidarr[i].id;
			}
			var roleids = role.substr(1);
		
			 $.ajax({
				url:'<%=path%>/Power/adduseridAndroleid.do',
				type:'post',
				data:{"userids":userids,"roleids":roleids},
				success:function(data){
					if(data==1){
						alert("请求成功");
					}
				},
				error:function(){
					alert("请求失败");
				}
			})  
		}
		
		function adduseridAnquanid(){
			//获取角色的id
			var roleids  =  $('#roleTree').tree('getSelected').id;
			//获取权限的id数组
			var quanarr = $('#quanTree').tree('getChecked');
			var quanids  = "";
		    for (var i = 0; i < quanarr.length; i++) {
		    	quanids += "," + quanarr[i].id;
			}
		   var  quanids =  quanids.substr(1);
		  
		   $.ajax({
		    	 url:'<%=path%>/Power/addroleidandquanxian.do',
		    	 type:'post',
		    	 data:{"roleids":roleids,"quanids":quanids},
		    	 success:function(result){
		    		 if(result=="1"){
		    			 alert("操作成功")
		    		 }
		    	 },
		    	 error:function(){
						alert("请求失败");
					}
		    }) 
		}
	</script>
  </body>
</html>
