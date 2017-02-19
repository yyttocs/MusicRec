
<%@ page language="java" import="java.util.*,com.sh.model.*,java.sql.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
    <title>Bootstrap Metro Dashboard by Dennis Ji for ARM demo</title>
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
                    <p>
                        You need to have <a href="http://en.wikipedia.org/wiki/JavaScript"
                            target="_blank">JavaScript</a> enabled to use this site.
                    </p>
                </div>
            </noscript>

            <!-- start: Content -->
            <div id="content" class="span10">


                <ul class="breadcrumb">
                    <li><i class="icon-home"></i> <a href="search2.jsp">查询歌曲</a> <i class="icon-angle-right"></i></li>
                </ul>
                <%
                    request.setCharacterEncoding("UTF-8");
                    String itemN = request.getParameter("keyword");
                    System.out.println(itemN);
                    if (itemN == null) {
                %>
                <div align="center">
                    <form method="post" action="search1.jsp">
                        <a href="search2.jsp">按曲风表查看歌曲</a><br>
                        <br> 搜索你想您听的歌曲 <input type="hidden" id="smode" name="type"
                            value="" /> <input type="text" id="sb" name="keyword"
                            style="font-size:14px;width:285px;padding-left:3px;margin-right:10px;margin-top:0;"
                            value="" /> <input type="submit" value="Search"
                            style="margin-top:-5px;" />
                    </form>

                    <%
                        } else {
                    %>

                 
                    <div align="center">
                        <form method="post" action="search1.jsp">
                           <!--  <a href="search2.jsp">按曲风查看歌曲</a><br> -->
                            <br> 搜索你想您听的歌曲 <input type="hidden" id="smode" name="type"
                                value="" /> <input type="text" id="sb" name="keyword"
                                style="font-size:14px;width:285px;padding-left:3px;margin-right:10px;margin-top:0;"
                                value="" /> <input type="submit" value="搜索"
                                style="margin-top:-5px;" />
                        </form>
                        <div class="box-content">
                            <table
                                class="table table-striped table-bordered bootstrap-datatable datatable">
                                <%
                                    TypeBeanCl tbc = new TypeBeanCl();
                                        ResultSet rs = tbc.search_music(itemN);
                                        if (!rs.next()) {
                                %>
                                <tr>
                                    <td>
                                        <h2 align="center">找不到你要的歌曲！</h2>
                                        <center>
                                            <input type="button" name="goback" value="返回"
                                                onClick="javascript:window.history.go(-1)">
                                        </center>
                                    </td>
                                </tr>
                                <%
                                    tbc.close();
                                        } else {
                                            ItemBeanCl itb = new ItemBeanCl();
                                %>
                                <thead>
                                    <tr>
                                        <th>根据您信息搜索得到的歌曲</th>
                                        <th>歌手</th>
                                        <th>曲风</th>　
                                    </tr>
                                </thead>
			
                                <tbody>
                                    <%
                                        while (!rs.isAfterLast()) {
                                        	int a = rs.getInt(1);
                                        	TypeBeanCl tbc1 = new TypeBeanCl();
                                        	String typename = tbc1.getTypeChiNameByItemId(a);
                                    %>

                                    <tr>
                                        <td class="center">
                                            <%
                                                out.println("<a href=\"songlist1.jsp?songId="
                                                                    + rs.getInt(1) + "&songName=" + rs.getString(2)
                                                                    + "\">" + rs.getString(4) + "</a><br>");
                                            %>
                                        </td>
                                        <td class="center"><%=rs.getString(5)%></td>
                                        <td class="center"><%=typename%></td>
	
                                    </tr>
                                    <%
                                        rs.next();
                                                }
                                    %>
                                </tbody>
                                <%
                                    }
                                %>
                                <%
                                    tbc.close();
                                %>

                            </table>
                        </div>
                      
                    </div>

                    <%
}
 %>
                </div>
             
            </div>
        </div>
        <!--/#content.span10-->
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
   <!--  <script src="t/js/jquery.flot.resize.min.js"></script> -->
    
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

