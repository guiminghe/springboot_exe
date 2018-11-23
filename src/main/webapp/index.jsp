<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--                                                                                                                               
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui-lang-zh_CN.js"></script>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/themes/default/easyui.css">
  
  	<script type="text/javascript">
  		$(function(){
//===begin
//===end
  		
  			//展示所有数据===begin
			$("#showUser").datagrid({
				url:"selectByPage.do",
				pagination:true,
				columns:[[
					{checkbox:true},
					{title:"编号",field:"id"},
					{title:"姓名",field:"userName"},
					{title:"密码",field:"password"},
				]],
				title:"用户列表",
				iconCls:"icon-search",
				width:400,
				toolbar:"#myToolbar",

				onDblClickRow:function(rowIndex,rowData){
					$("#updateId").val(rowData.id);
					$("#updateName").val(rowData.userName);
					$("#updatePassword").val(rowData.password);
					
					$("#updateForm").dialog("open");
				}
			});
			//展示所有数据===end
			
			//添加功能===begin
	  		//添加界面===begin
	  		$("#addForm").dialog({
	  			title:"添加对话框",
	  			width:300,
	  			closed:true,
	  		});
	  		//添加界面===end	
	  		
			//添加界面验证用户名===begin
			$("#addName").validatebox({
				required:true,
			});
			//添加界面验证用户名===end	
			
			//添加界面验证密码===begin
			$("#addPassword").validatebox({
				required:true,
			});
			//添加界面验证密码===end
			//添加功能===end	
			
			//修改功能===begin
			//修改界面===begin
	  		$("#updateForm").dialog({
	  			title:"添加对话框",
	  			width:300,
	  			closed:true,
	  		});			
			//修改界面===end	
			
			//修改界面验证用户名===begin
			$("#updateName").validatebox({
				required:true,
			});
			//修改界面验证用户名===end	
			
			//修改界面验证密码===begin
			$("#updatePassword").validatebox({
				required:true,
			});
			//修改界面验证密码===end		
			//修改功能===end					  				
  		});
  		
  			//模糊查询===begin
  			function searchName(){
  				var username = $("#username").val();
  				alert(username);
  				$("#showUser").datagrid("load",{"name":username});
  			}
  			//模糊查询===end
  		
  			//添加功能事件===begin
	 		//展示添加界面===begin
	 		function showAdd(){
	 			$("#addForm").dialog("open");
	 		}
	  		//展示添加界面===end
	  		
	  		//添加数据===begin
			function toAdd(){
			alert(1);
				$("#addForm").form("submit",{
					url:"add.do",
					onSubmit: function(){
						var isOk= $(this).form("validate");
						return isOk;
					},
					success: function(data){
						if(data="true"){
							alert("添加成功");
							$("#addForm").dialog("close");
	  						$("#showUser").datagrid("reload");
						}else{
							alert("添加失败");
						}
					}

				});
			}
			//添加数据===end
			//添加功能事件===end
			
			//修改功能事件===begin
			//提交修改数据===begin
			function toUpdate(){
			alert(1);
				$("#updateForm").form("submit",{
					url:"update.do",
					onSubmit:function(){
						var isOk = $(this).form("validate");
						alert(isOk);
						return isOk;
					},
					success:function(data){
						if(data="true"){
							alert("修改成功");
							$("#updateForm").dialog("close");
	  						$("#showUser").datagrid("reload");
						}else{
							alert("修改失败");
						}
					}
				});
			}
			//提交修改数据===end					
			//修改功能界面===end	
			
			//批量删除功能===begin
			//批量删除事件===begin
			function toMultiDelete(){
				//获取到所有选中的行
				var allSelectedRows=$("#showUser").datagrid("getSelections");
				alert(allSelectedRows.length);
				if(allSelectedRows.length==0){
					alert("请选中要删除的数据");
				}else{
					var isConfirm=confirm("确定吗？");
					if(isConfirm){
					alert(1);
						var ids=new Array(allSelectedRows.length);
						for(var i=0;i<allSelectedRows.length;i++){
							ids[i]=allSelectedRows[i].id;
						}
						alert(2);
						$.ajax({
							url:"multiDelete.do",
							data:"ids="+ids,
							type:"post",
							success:function(data){
								if(data){
									alert("删除成功");
									$("#showUser").datagrid("reload");
								}else{
									alert("删除失败");
								}
							}
						});
					}
				}
			}
			//批量删除事件===end
			//批量删除功能===end		
  	</script>
  </head>
  
  <body>
  <!-- ===begin -->
  <!-- ===end -->
  
  	<!-- 用户名模糊查询===begin -->
	用户名：<input type="text" id="username"/>
	<input type="button" value="查询" onclick="searchName()"/>
  	<!-- 用户名模糊查询===end -->  	
	
	<!-- 工具栏===begin -->
	<div id="myToolbar">
		<a href="JavaScript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="showAdd()">添加</a>
		<a href="JavaScript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" onclick="toMultiDelete()">批量删除</a>
	</div>
	<!-- 工具栏===end -->
	
	<!-- 展示列表===begin -->
	<div id="showUser"></div>
	<!-- 展示列表===end --> 
	
	<!-- 添加界面===begin -->
	<form id="addForm" method="post">
		用户名：<input type="text" name="userName" id="addName"/><br/>
		密码：<input type="text" name="password" id="addPassword"/>
		<a href="JavaScript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="toAdd()">添加</a>
	</form>
	<!-- 添加界面===end -->
	
	<!-- 修改界面===begin -->
	<form id="updateForm" method="post">
		<input type="hidden" name="id" id="updateId"/>
		用户名：<input type="text" name="userName" id="updateName"/><br/>
		密码：<input type="text" name="password" id="updatePassword"/>		
		<a href="JavaScript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="toUpdate()">修改</a>
	</form>
	<!-- 修改界面===end -->
  </body>
</html>
