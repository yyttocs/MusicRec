
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
	<link id="bootstrap-style" href="css/bootstrap1.min.css" rel="stylesheet">
	<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="css/style4.css" rel="stylesheet">
	<link id="base-style-responsive" href="t/css/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
<!-- end: CSS -->
<!-- start: Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico">
	<link rel="stylesheet" type="text/css" href="css/mycss.css">
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
                <a class="brand" href="wel1.jsp"><span>�����Ƽ��罻ϵͳ</span></a>
                                
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
                                    <span>�˻�����</span>
                                </li>
                                <li><a href="setinfo1.jsp"><i class="halflings-icon user"></i>������Ϣ</a></li>
                                <li><a href="login.jsp"><i class="halflings-icon off"></i>�˳�</a></li>
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
                        <li><a href="wel1.jsp"><i class="icon-bar-chart"></i><span class="hidden-tablet"> ϵͳ����</span></a></li> 
                        <li><a href="mysonglist1.jsp"><i class="icon-tasks"></i><span class="hidden-tablet"> �ҵĸ赥�������Ƽ�</span></a></li>
                        <li><a href="recsonglist1.jsp"><i class="icon-tint"></i><span class="hidden-tablet"> �����Ƽ�</span></a></li>
                        <li><a href="search2.jsp"><i class="icon-search"></i><span class="hidden-tablet">��ѯ����</span></a></li>   
                        <li><a href="setinfo1.jsp"><i class="icon-list-alt"></i><span class="hidden-tablet">�û���Ϣ����</span></a></li>
                        <li><a href="login.jsp"><i class="icon-lock"></i><span class="hidden-tablet">�˳���¼</span></a></li>
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
			<div id="content" align="center" >
			
			
 
    <div align="center">
    <% String songName = request.getParameter("songName");
       songName = new String(songName.getBytes("ISO-8859-1"),"GB18030");
       ItemBeanCl itb = new ItemBeanCl();
       String ItemSong = itb.getItemSong(songName);
       String MusicName = itb.getMusicName(songName);
   	   String Singer = itb.getSinger(songName);
       /* System.out.println(ItemSong); */
    %>
    ������<%=MusicName%><br>
 
    <embed src="http://www.xiami.com/song/<%=ItemSong%>" autostart=true loop="2" width="60%" height="40%">
    
    </embed>
    </div>
    <br>
    <div align="center">
    ��Ϊ���������ĸ�������:<br>
    
    <form name="song" action="setrating1.jsp?userId=<%=session.getAttribute("MyId")%>&songId=<%=request.getParameter("songId")%>" method="post">
 <fieldset>
							  <div class="control-group">
							<!--  -->
								<div class="controls">
								  <label class="radio">
									<input type="radio" name="c" id="optionsRadios1" value="1" checked="">
									1�֣���ϲ��
								  </label>
								  <div style="clear:both"></div>
								  <label class="radio">
									<input type="radio" name="c" id="optionsRadios2" value="2">
									2�֣�û��Ȥ
								  </label>
								  <div style="clear:both"></div>
								  <label class="radio">
									<input type="radio" name="c" id="optionsRadios3" value="3">
									3�֣�һ���
								  </label>
								  <div style="clear:both"></div>
								  <label class="radio">
									<input type="radio" name="c" id="optionsRadios4" value="4">
									4�֣�ϲ����
								  </label>
								   <div style="clear:both"></div>
								  <label class="radio">
									<input type="radio" name="c" id="optionsRadios4" value="4">
									5�֣�������
								  </label>
								</div>
							  </div>
                              
							  
							</fieldset>
 

 
    <input type="submit" value="��������">
    </form>
 
    </div>

  
  
			
			
			
			</div> <!-- start: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">��</button>
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
	
		<script src="js/bootstrap1.min.js"></script>
	
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

