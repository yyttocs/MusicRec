<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'loginCl.jsp' starting page</title>
    <script language="javaScript">
    function IsDigit(cCheck) {
    	return (('0'<=cCheck) && (cCheck<='9'));
    }
    
    function IsAlpha(cCheck) {
    	return ((('a'<=cCheck) && (cCheck<='z')) || (('A'<=cCheck) && (cCheck<='Z')));
    }
    
    function IsValid() {
    	var struserName = login.username.value;
    	for (nIndex=0; nIndex<struserName.length; nIndex++) {
    		cCheck = struserName.charAt(nIndex);
    		if(!(IsDigit(cCheck) || IsAlpha(cCheck))) {
    			return false;
    		}
    	}
    	return true;
    }
    var flag=0;
    function func()
    {
    	flag=1;
    }
    function docheck() {
    	if(flag==1)
    	{
    		flag=0;
    		get();
    		return false;
    	}
    	if(login.username.value=="") {
    		alert("请填写用户名");
    		return false;
    	}
    	else if(!IsValid()) {
    		alert("用户名只能使用字母和数字");
    		return false;
    	}
    	else if(login.passwd.value=="") {
    		alert("请填写密码");
    		return false;
    	}
    	else {
    		return true;
    	}
    }
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/mycss.css">
	<link rel="stylesheet" href="css/style1.css">
  </head>


<body>

<div class="login-container">
	<h1>音乐推荐社交平台</h1>
	
	
	<form action="LoginClServlet" name="login" method="post" id="loginForm" onSubmit="return docheck()">
		<div>
			<input type="text" id="username" name="username" class="username" placeholder="用户名" autocomplete="off"/>
		</div>
		<div>
			<input type="password" name="passwd" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<button id="submit" type="submit" value="登录">登 录</button>
		<button onclick="func()">找回密码</button>
	</form>
	

	<a href="reg.jsp">
	    
		<button type="button" class="register-tis">还有没有账号？</button>
	</a>

</div>

<script src="t/t.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/common.js"></script>
<!--背景图片自动更换-->
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<!--表单验证-->
<script src="js/jquery.validate.min.js?var1.14.0"></script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
</div>
</body>
</html>
