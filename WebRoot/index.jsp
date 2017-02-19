<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
	String path = request.getContextPath();
	System.out.println(path);
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en-gb" class="no-js">
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>


<meta name="description" content="">
<meta name="author" content="WebThemez">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/isotope.css"
	media="screen" />
<link rel="stylesheet" href="js/fancybox/jquery.fancybox.css"
	type="text/css" media="screen" />
<link href="css/animate.css" rel="stylesheet" media="screen">
<!-- Owl Carousel Assets -->
<link href="js/owl-carousel/owl.carousel.css" rel="stylesheet">
<link rel="stylesheet" href="css/styles3.css" />
<!-- Font Awesome -->
<link href="font/css/font-awesome.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/mycss.css">

</head>

<body>
	<header class="header">
	<div class="container">
		<nav class="navbar navbar-inverse" role="navigation">
		<div class="navbar-header">
			<button type="button" id="nav-toggle" class="navbar-toggle"
				data-toggle="collapse" data-target="#main-nav">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="index.jsp"
				class="navbar-brand scroll-top logo  animated bounceInLeft"><b><i>Music<span></span>Rec
				</i></b></a>
		</div>
		<!--/.navbar-header-->
		<div id="main-nav" class="collapse navbar-collapse">
			<ul class="nav navbar-nav" id="mainNav">
				<li class="active" id="firstLink"><a href="#index.jsp"
					class="scroll-link">主页</a></li>
				<li><a href="login.jsp" class="scroll-link">登录</a></li>
				<li><a href="reg.jsp" class="scroll-link">注册</a></li>
				<li><a href="adminLogin.jsp" class="scroll-link">后台</a></li>
			</ul>
		</div>
		<!--/.navbar-collapse--> </nav>
		<!--/.navbar-->
	</div>
	<!--/.container--> </header>
	<!--/.header-->
	<div id="#top"></div>
	<section id="home">
	<div class="banner-container">
		<img src="images/banner-bg.jpg" alt="banner" />
		<div class="container banner-content">
			<div class="hero-text animated fadeInDownBig">
				<h1 class="responsive-headline" style="font-size: 40px;">
					Show Love In MUSIC<br /> Find What You Love
				</h1>
				<!-- <a href="#basics" class="arrow-link"> <i
					class="fa fa-chevron-down"></i>
				</a> -->
			</div>
		</div>
	</div>
	<div class="container hero-text2">
		<h3>
			在这里找寻你爱的音乐<br />
			开启懂你的音乐之旅
		</h3>
	</div>
	</section>
	<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<div class="col">
					<h4>欢迎联系我们</h4>
					<ul>
						<li>CQU</li>
						<li>手机号: 15300000000</li>
						<li>邮箱: <a href="mailto:XXXX@Music.com" title="Email Us">XXXX@Music.com</a></li>
					</ul>
				</div>
			</div>
		</div>

	</div>

	</footer>
	<!--/.page-section-->
	<section class="copyright">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">Copyright</div>
		</div>
		<!-- / .row -->
	</div>
	</section>
	<a href="#top" class="topHome"><i class="fa fa-chevron-up fa-2x"></i></a>

	<!--[if lte IE 8]><script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script><![endif]-->
	<script src="js/modernizr-latest.js"></script>
	<script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/jquery.isotope.min.js" type="text/javascript"></script>
	<script src="js/fancybox/jquery.fancybox.pack.js"
		type="text/javascript"></script>
	<script src="js/jquery.nav.js" type="text/javascript"></script>
	<script src="js/jquery.fittext.js"></script>
	<script src="js/waypoints.js"></script>
	<script src="contact/jqBootstrapValidation.js"></script>
	<script src="contact/contact_me.js"></script>
	<script src="js/custom.js" type="text/javascript"></script>
	<script src="js/owl-carousel/owl.carousel.js"></script>
</body>
</html>

