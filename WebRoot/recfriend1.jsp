<%@ page language="java"
	import="com.sh.model.*,java.util.*,java.util.Map.Entry,com.sh.recommend.*,java.sql.*,com.sh.recommend.*"
	pageEncoding="GB18030"%>
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
			<div id="content" class="span10">
			
			<%
			   
				int userId = Integer.parseInt(request.getParameter("userId"));
			    int itemId = Integer.parseInt(request.getParameter("songId"));
			   
			    UserRec userRec=new UserRec();
				ArrayList<ArrayList<Object>> list=userRec.getRecList(userId, itemId);
				Collections.sort(list, new MyComparator());
			%>
			 
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="mysonglist1.jsp">返回我的歌单</a> 
					<i class="icon-angle-right"></i>
				</li>
			</ul>
			
			<div class="row-fluid sortable">		
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="halflings-icon user"></i><span class="break"></span>推荐好友名单</h2>
					</div>

    			<div class="box-content">
						<table class="table table-striped table-bordered bootstrap-datatable">
						  <thead>
							  <tr>
								  <th>用户名</th>
								  <th>性别</th>
								  <th>邮箱</th>
							  </tr>
						  </thead>  
						  <tbody> 
     <%
				for(int i=0;i<5;i++)
				{
					ArrayList<Object> obj=list.get(i);
					int userID=(int) obj.get(0);
					float score=(float) obj.get(1);	
					UserBeanCl ubc = new UserBeanCl();
					
			    	/* ResultSet rs = ubc.getPersonDetails(userID); */
			    	String name = "";
			    	String male = "";
			    	String Email = "";
			  	 	ResultSet rs = ubc.getPersonDetails(userID);
			    	 if(rs.next()) {
					
			    	name = rs.getString(2);
			    	male = rs.getString(5);
			    	if(male.equals("male")){
			    		male = "男";
			    	}else if(male.equals("female")){
			    		male = "女";
			    	}else{
			    		male = "还未获得资料";	
			    	}
			    	
			    	Email = rs.getString(4);
			    	}
			    	 
			    	        
	 %>
	<tr>
								<td class="center"><%=name%></td>
								<td class="center"><%=male %></td>
								<td class="center"><%=Email%></td>
								
	</tr>
    <%
					 rs.close(); 
    }
    %>
    		  </tbody>
					  </table>            
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
