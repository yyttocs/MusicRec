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
  //�����û��������룬��ɶ��û�����֤

       String u = request.getParameter("username");
       String p = request.getParameter("passwd1");

  // ����UserBeanCl�ķ�������ɶ��û�����֤
       UserBeanCl ubc = new UserBeanCl();
       ubc.getNowId();
       UserBean user = new UserBean(u,p);
       
  //�û�������
	if (ubc.checkUserName(u)) {
%>           
	<h2 align="center">���û��Ѿ�����</h2>	
	<center><input type="button" name="goback" value="����" onClick="javascript:window.history.go(-1)"></center>
<% 
    } else {
  //���û����ϱ��浽���ݿ�  	
    if(ubc.addUser(user)) {
%>
	<h2 align="center">ע��ɹ�</h2>	
 	<center><a href="login.jsp" target="_self">���ڵ�¼</a>
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
<!--����ͼƬ�Զ�����-->
<script src="js/supersized.3.2.7.min.js"></script>
<script src="js/supersized-init.js"></script>
<!--����֤-->
<script src="js/jquery.validate.min.js?var1.14.0"></script>
</html>
