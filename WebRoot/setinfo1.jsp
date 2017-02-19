<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'Wel.jsp' starting page</title>
<script language="javaScript">
    
    function chkEmail(str) {
    	return str.search(/[\w\-]{1,}@[\w\-]{1,}\.[\w\-]{1,}/)==0?true:false
    }
    
    function check_info() {
    	if(form1.Email.value ==""){
    		alert("请填写邮箱");
    		return false;
    	} else if(!chkEmail(form1.Email.value)){
    		alert("请填写有效的Email地址");
    		return false;
    	} else {
    	return true;}   	
    }
    
    function check_password() {
    	if(form2.OldUserPassword.value=="") {
		   	alert("请填写旧密码");
		   	return false;
    	}
    	else if(form2.UserPassword.value=="") {
    		alert("请填写新密码");
		   	return false;
    	}
    	else if(form2.UserPassword.value != form2.CUserPassword.value) {
    		alert("确认密码与新密码不一致");
		   	return false;
    	}
        else {
    	return true;}
    }
    </script>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="description" content="Bootstrap Metro Dashboard">
<link rel="stylesheet" type="text/css" href="css/mycss.css">
<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- end: Mobile Specific -->

<!-- start: CSS -->
	<link id="bootstrap-style" href="css/bootstrap1.min.css" rel="stylesheet">
	<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="css/style4.css" rel="stylesheet">
	<link id="base-style-responsive" href="css/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
<!-- end: CSS -->
<!-- start: Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico">
<!-- end: Favicon -->
</head>
<body>
		            <!-- start: Header -->
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container-fluid">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a class="brand" href="wel1.jsp"><span>音乐推荐社交系统</span></a>
                                
                <!-- start: Header Menu -->
                <div class="nav-no-collapse header-nav">
                    <ul class="nav pull-right">
                        <!-- start: User Dropdown -->
                        <li class="dropdown">
                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                                <i class="halflings-icon white user"></i> <%=(String)session.getAttribute("MyName")%>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-menu-title">
                                    <span>账户设置</span>
                                </li>
                                <li><a href="setinfo1.jsp"><i class="halflings-icon user"></i>个人信息</a></li>
                                <li><a href="login.jsp"><i class="halflings-icon off"></i>退出</a></li>
                            </ul>
                        </li>
                        <!-- end: User Dropdown -->
                    </ul>
                </div>
                <!-- end: Header Menu -->
                
            </div>
        </div>
    </div>
    <!-- start: Header -->
    
        <div class="container-fluid-full">
        <div class="row-fluid">
                
            <!-- start: Main Menu -->
            <div id="sidebar-left" class="span2">
                <div class="nav-collapse sidebar-nav">
                    <ul class="nav nav-tabs nav-stacked main-menu">
                        <li><a href="wel1.jsp"><i class="icon-bar-chart"></i><span class="hidden-tablet"> 系统介绍</span></a></li> 
                        <li><a href="mysonglist1.jsp"><i class="icon-tasks"></i><span class="hidden-tablet"> 我的歌单及好友推荐</span></a></li>
                        <li><a href="recsonglist1.jsp"><i class="icon-tint"></i><span class="hidden-tablet"> 歌曲推荐</span></a></li>
                        <li><a href="search2.jsp"><i class="icon-search"></i><span class="hidden-tablet">查询歌曲</span></a></li>   
                        <li><a href="setinfo1.jsp"><i class="icon-list-alt"></i><span class="hidden-tablet">用户信息完善</span></a></li>
                        <li><a href="login.jsp"><i class="icon-lock"></i><span class="hidden-tablet">退出登录</span></a></li>
                    </ul>
                </div>
            </div>
            <!-- end: Main Menu -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<!-- start: Content -->
			<div id="content" class="span10">
							  
			
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="setinfo1.jsp">设置个人信息</a> 
					<i class="icon-angle-right"></i>
				</li>
				
			</ul>
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon edit"></i><span class="break"></span>修改密码</h2>
					</div>
					<div class="box-content">
						<form class="form-horizontal" name="form2" action="modify_password1.jsp?uName=<%=session.getAttribute("MyName")%>" method="post" onSubmit="return check_password()">
							<fieldset>
							  <div class="control-group warning">
								<label class="control-label" for="inputWarning">输入旧密码</label>
								<div class="controls">
								  <input type="password" name="OldUserPassword">
								  
								</div>
							  </div>
							  <div class="control-group error">
								<label class="control-label" for="inputError">输入新密码</label>
								<div class="controls">
								  <input type="password" name="UserPassword">
								</div>
							  </div>
							  <div class="control-group success">
								<label class="control-label" for="inputSuccess">确认新密码</label>
								<div class="controls">
								  <input type="password" name="CUserPassword">
								</div>
							  </div>
							  <div class="form-actions">
								<button type="submit" name="Sub2" class="btn btn-primary">确认设置</button>
								<button name="res2" class="btn">取消</button>
							  </div>
							</fieldset>
						  </form>
					</div>
				</div><!--/span-->
				
			
			</div><!--/row-->	
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon edit"></i><span class="break"></span>完善用户信息</h2>
					</div>
					<div class="box-content">
                        <form class="form-horizontal" name="form1" action="modify_info1.jsp?uid=<%=session.getAttribute("MyId")%>" method="post" onSubmit="return check_info()">
							<fieldset>
							  <div class="control-group">
								<label class="control-label">性别</label>
								<div class="controls">
								  <label class="radio">
									<input type="radio" name="Sex" id="optionsRadios1" value="male" checked="">
									男
								  </label>
								  <div style="clear:both"></div>
								  <label class="radio">
									<input type="radio" name="Sex" id="optionsRadios2" value="female">
									女
								  </label>
								</div>
							  </div>
                              <div class="control-group success">
                                <label class="control-label" for="inputSuccess">邮箱</label>
                                <div class="controls">
                                  <input type="text" name="Email" id="inputSuccess">
                                </div>
                              </div>
							  <div class="form-actions">
								<button type="submit" name="Sub1" class="btn btn-primary">保存更改</button>
								<button class="btn" name="res1">取消</button>
							  </div>
							</fieldset>
						</form>
					</div>
				</div><!--/span-->

			</div><!--/row-->
			</div>
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>Settings</h3>
		</div>
		<div class="modal-body">
			<p>Here settings can be configured...</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a>
			<a href="#" class="btn btn-primary">Save changes</a>
		</div>
	</div>
	
	<div class="clearfix"></div>
	
	<footer>

		<p>
			<span style="text-align:left;float:left">&copy; 2016 <a href="#" alt="Bootstrap_Metro_Dashboard">Music Recommendation</a></span>
			
		</p>

	</footer>
	
	<!-- start: JavaScript-->

		<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/jquery-migrate-1.0.0.min.js"></script>
	
		<script src="js/jquery-ui-1.10.0.custom.min.js"></script>
	
		<script src="js/jquery.ui.touch-punch.js"></script>
	
		<script src="js/modernizr.js"></script>
	
		<script src="js/bootstrap1.min.js"></script>
	
		<script src="js/jquery.cookie.js"></script>
	
		<script src='js/fullcalendar.min.js'></script>
	
		<script src='js/jquery.dataTables.min.js'></script>

		<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.js"></script>
	<script src="js/jquery.flot.pie.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<!-- <script src="js/jquery.flot.resize.min.js"></script> -->
	
		<script src="js/jquery.chosen.min.js"></script>
	
		<script src="js/jquery.uniform.min.js"></script>
		
		<script src="js/jquery.cleditor.min.js"></script>
	
		<script src="js/jquery.noty.js"></script>
	
		<script src="js/jquery.elfinder.min.js"></script>
	
		<script src="js/jquery.raty.min.js"></script>
	
		<script src="js/jquery.iphone.toggle.js"></script>
	
		<script src="js/jquery.uploadify-3.1.min.js"></script>
	
		<script src="js/jquery.gritter.min.js"></script>
	
		<script src="js/jquery.imagesloaded.js"></script>
	
		<script src="js/jquery.masonry.min.js"></script>
	
		<script src="js/jquery.knob.modified.js"></script>
	
		<script src="js/jquery.sparkline.min.js"></script>
	
		<script src="js/counter.js"></script>
	
		<script src="js/retina.js"></script>

		<script src="js/custom.js"></script>
	<!-- end: JavaScript-->
	
</body>

</html>

