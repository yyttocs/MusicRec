<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> -->
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'Wel.jsp' starting page</title>


    
    <title>My JSP 'Wel.jsp' starting page</title>
    <meta name="description" content="Bootstrap Metro Dashboard">
    <meta name="author" content="Dennis Ji">
    <meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <!-- end: Meta -->
    
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
    

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <link id="ie-style" href="css/ie.css" rel="stylesheet">
    <![endif]-->
    
    <!--[if IE 9]>
        <link id="ie9style" href="css/ie9.css" rel="stylesheet">
    <![endif]-->
        
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
                <a class="brand" href="wel1.jsp"><span>后台管理系统</span></a>
                                
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
                                <li><a href="adminLogin.jsp"><i class="halflings-icon off"></i>退出</a></li>
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
                        <li><a href=" adminMusic.jsp"><i class="icon-bar-chart"></i><span class="hidden-tablet"> 音乐添加</span></a></li> 
                        <li><a href="adminMusicDelete.jsp"><i class="icon-bar-chart"></i><span class="hidden-tablet"> 音乐删除</span></a></li> 
                        <li><a href="adminUserDelete.jsp"><i class="icon-tasks"></i><span class="hidden-tablet"> 用户删除</span></a></li>
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
                    <a href="adminMain.jsp">后台管理</a> 
                    <i class="icon-angle-right"></i>
                </li>
                
            </ul>

           
         
           

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
      <!--   <script src="t/js/jquery.flot.resize.min.js"></script> -->
    
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

