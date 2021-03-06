<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>后台登录页</title>
<link href="Easyui/themes/default/easyui.css" rel="stylesheet"
	type="text/css" />
<link href="Easyui/themes/icon.css" rel="stylesheet" type="text/css" />
<link href="Easyui/demo.css" rel="stylesheet" type="text/css" />
<script src="Easyui/jquery.min.js" type="text/javascript"></script>
<script src="Easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="Easyui/easyui-lang-zh_CN.js" type="text/javascript"></script>
</head>

<body>
	<script type="text/javascript">
		function clearForm() {
			$('#adminLoginForm').form('clear');
		}

		function convertArray(o) { //主要是推荐这个函数。它将jquery系列化后的值转为name:value的形式。 
			var v = {};
			for ( var i in o) {
				if (typeof (v[o[i].name]) == 'undefined')
					v[o[i].name] = o[i].value;
				else
					v[o[i].name] += "," + o[i].value;
			}
			return v;
		}

		function checkLogin() {
			$("#adminLoginForm").form("submit", {
				url : 'doAdminLogin',
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.success == 'true') {
						window.location.href = 'bookmanager.jsp';
						$("#adminLoginDlg").dialog("close");
					} else {
						$.messager.show({
							title : "提示信息",
							msg : result.message
						});
					}
				}
			});
		}
	</script>
	<div id="adminLoginDlg" class="easyui-dialog" style="top: 250;left: 250;width: 250;height: 200"
		data-options="title:'后台登录',buttons:'#bb',modal:true">
		<form id="adminLoginForm" method="post">
			<table>
				<tr>
					<th>用户名</th>
					<td><input class="easyui-textbox" type="text" id="ai.name"
						name="ai.name" data-options="required:true"></input></td>
				</tr>
				<tr>
					<th>密码</th>
					<td><input class="easyui-textbox" type="password" id="ai.pwd"
						name="ai.pwd" data-options="required:true"></input></td>
				</tr>
				<tr>
					<td><a href="list">返回主页</a></input></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="bb">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			onclick="checkLogin()">登录</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" onclick="clearForm();">重置</a>
	</div>

</body>
</html>
