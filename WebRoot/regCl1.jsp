<%@ page language="java" import="java.util.*,com.sh.model.*" pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'regCl1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/mycss.css">
	<link rel="stylesheet" href="css/style1.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <div class="register-container">
     <table width="80%" height="80%" >
  <tr>
    <td>
    
    </td>
  </tr>
  <tr>
    <td width="21%" height="190" align="center" >
 <%   
  //接收用户名和密码，完成对用户的验证

       String u = request.getParameter("username");
       String p = request.getParameter("passwd1");

  // 调用UserBeanCl的方法，完成对用户的验证
       UserBeanCl ubc = new UserBeanCl();
       ubc.getNowId();
       UserBean user = new UserBean(u,p);
       
  //用户名存在
	if (ubc.checkUserName(u)) {
%>           
	<h2 align="center">该用户已经存在</h2>	
	<center><input type="button" name="goback" value="返回" onClick="javascript:window.history.go(-1)"></center>
<% 
    } else {
  //将用户资料保存到数据库  	
    if(ubc.addUser(user)) {
%>
	<h2 align="center">注册成功</h2>	
 	<center><a href="login.jsp" target="_self">现在登录</a>
    </center>
<% 
 
    }  
       
    }
%>		
		
 
    </td>
  </tr>
  
</table>
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
