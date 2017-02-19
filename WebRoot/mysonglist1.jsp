<%@ page language="java" import="java.util.*,com.sh.model.*,java.sql.*" pageEncoding="GB18030"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'Wel.jsp' starting page</title>

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
	<link id="bootstrap-style" href="t/css/bootstrap.min.css" rel="stylesheet">
	<link href="t/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="t/css/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="t/css/style-responsive.css" rel="stylesheet">
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
			<div id="content" >
			
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="mysonglist1.jsp">我的歌曲列表</a> 
					<i class="icon-angle-right"></i>
				</li>
				
			</ul>	
			
			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon user"></i><span class="break"></span>我的歌单</h2>
					</div>
					
   <%
    
    
    ItemRatingCl irc = new ItemRatingCl();
    String s = (String) session.getAttribute("MyName");
    ResultSet rs = irc.recommended1(s);
	if(!rs.next()) {
	%>
	    <div class="box span12">
	    <h2 align="center"><a href="search1.jsp">没有歌单，请进行评价先</a>></h2>
	    <center><input type="button" name="goback" value="返回" onClick="javascript:window.history.go(-1)"></center>
	   	</div>
    <% 
      irc.close();
	}
	else {
	//rs.last();
	
	
	
	
	
    int i = 0;
    //循环显示表中的数据pageSize
    //rs.isAfterLast()游标是否在最后一行之后，说明后面已经没记录
    %>
    <div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
								  <th>歌曲名</th>
								  <th>评分值</th>
								  <th>推荐好友</th>
							  </tr>
						  </thead>  
						  <tbody> 
    <% 
	while (!rs.isAfterLast()){
	int s1 = Integer.parseInt(rs.getString(2));
		ItemBeanCl itc = new ItemBeanCl();
		String s2 = itc.getItemName(s1);
		String MusicName =itc.getMusicName(s2);
		String a1 = rs.getString(3);
	%>
	<tr>
								<td class="center"><%out.println("<a href=\"songlist1.jsp?songId="+rs.getString(2)+"&songName="+s2+"\">" + MusicName + "</a><br>");%></td>
								<td class="center"><%=a1 %></td>
								<td class="center"><%out.println("<a href=\"recfriend1.jsp?userId="+rs.getInt(1)+"&songId="+rs.getInt(2)+"\">" + "点击找好友" + "</a><br>");%></td>
								
	</tr>
    <%
		
		rs.next();
		i++;
    }
    %>
    		  </tbody>
					  </table>            
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
    <% 
	irc.close();
	}
    %>    
    
  		</div><!--/.fluid-container-->
	
			<!-- end: Content -->
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

		<script src="t/js/jquery-1.9.1.min.js"></script>
	<script src="t/js/jquery-migrate-1.0.0.min.js"></script>
	
		<script src="t/js/jquery-ui-1.10.0.custom.min.js"></script>
	
		<script src="t/js/jquery.ui.touch-punch.js"></script>
	
		<script src="t/js/modernizr.js"></script>
	
		<script src="t/js/bootstrap.min.js"></script>
	
		<script src="t/js/jquery.cookie.js"></script>
	
		<script src="t/js/fullcalendar.min.js"></script>
	
		<script src="t/js/jquery.dataTables.min.js"></script>

		<script src="t/js/excanvas.js"></script>
	<script src="t/js/jquery.flot.js"></script>
	<script src="t/js/jquery.flot.pie.js"></script>
	<script src="t/js/jquery.flot.stack.js"></script>
	<!-- <script src="t/js/jquery.flot.resize.min.js"></script> -->
	
		<script src="t/js/jquery.chosen.min.js"></script>
	
		<script src="t/js/jquery.uniform.min.js"></script>
		
		<script src="t/js/jquery.cleditor.min.js"></script>
	
		<script src="t/js/jquery.noty.js"></script>
	
		<script src="t/js/jquery.elfinder.min.js"></script>
	
		<script src="t/js/jquery.raty.min.js"></script>
	
		<script src="t/js/jquery.iphone.toggle.js"></script>
	
		<script src="t/js/jquery.uploadify-3.1.min.js"></script>
	
		<script src="t/js/jquery.gritter.min.js"></script>
	
		<script src="t/js/jquery.imagesloaded.js"></script>
	
		<script src="t/js/jquery.masonry.min.js"></script>
	
		<script src="t/js/jquery.knob.modified.js"></script>
	
		<script src="t/js/jquery.sparkline.min.js"></script>
	
		<script src="t/js/counter.js"></script>
	
		<script src="t/js/retina.js"></script>

		<script src="t/js/custom.js"></script>
	<!-- end: JavaScript-->
	
</body>

</html>

