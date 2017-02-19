<%@ page language="java" import="java.util.*,com.sh.model.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'reg.jsp' starting page</title>
    <script language="javaScript">
    function IsDigit(cCheck) {
    	return (('0'<=cCheck) && (cCheck<='9'));
    }
    
    function IsAlpha(cCheck) {
    	return ((('a'<=cCheck) && (cCheck<='z')) || (('A'<=cCheck) && (cCheck<='Z')));
    }
    
    function IsValid() {
    	var struserName = reg.username.value;
    	for (nIndex=0; nIndex<struserName.length; nIndex++) {
    		cCheck = struserName.charAt(nIndex);
    		if(!(IsDigit(cCheck) || IsAlpha(cCheck))) {
    			return false;
    		}
    	}
    	return true;
    }
    
    function docheck() {
    	if(reg.username.value=="") {
    		alert("请填写用户名");
    		return false;
    	}
    	else if(!IsValid()) {
    		alert("用户名只能使用字母和数字");
    		return false;
    	}
    	else if(reg.passwd1.value=="") {
    		alert("请填写密码");
    		return false;
    	}
    	else if(reg.passwd1.value != reg.passwd2.value) {
    		alert("两次密码不一致");
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

<div class="register-container">
	<h1>音乐推荐社交平台</h1>

	
	<form action="regCl1.jsp" name="reg" method="post" id="registerForm" onSubmit="return docheck()">
		<div>
			<input type="text" name="username" class="username" placeholder="您的用户名" autocomplete="off"/>
		</div>
		<div>
			<input type="password" name="passwd1" class="password" placeholder="输入密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<div>
			<input type="password" name="passwd2" class="password" placeholder="再次输入密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<button id="submit" type="submit" value="立即注册">注 册</button>
	</form>
	<a href="login.jsp">
		<button type="button" class="register-tis">已经有账号？</button>
	</a>

</div>

</body>
<script src="js/jquery.min.js"></script>
<script src="js/common.js"></script>
<!--背景图片自动更换-->
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<!--表单验证-->
<script src="js/jquery.validate.min.js?var1.14.0"></script>
</html>
