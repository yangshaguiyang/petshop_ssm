<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Dashboard | Klorofil - Free Bootstrap Dashboard Template</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/Public/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/Public/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/Public/vendor/linearicons/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/Public/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/Public/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/Public/css/demo.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath }/Public/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="${pageContext.request.contextPath }/Public/img/favicon.png">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/Public/css/bootstrap-treeview.min.css">
<!-- Javascript -->
<script src="${pageContext.request.contextPath }/Public/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath }/Public/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/Public/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath }/Public/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="${pageContext.request.contextPath }/Public/vendor/chartist/js/chartist.min.js"></script>
<script src="${pageContext.request.contextPath }/Public/scripts/klorofil-common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/Public/js/bootstrap-treeview.js"></script>
</head>
<script>
	if (!navigator.cookieEnabled) {//如果cookie被禁用,终止应用
		location = "cookieEnable.jsp";
	}
	if (window.top !== window.self) {
		window.top.location = window.location
	};
	
	   $(function(){
		   $.get("${pageContext.request.contextPath}/Resource/getMenu",{},function(data){
			   
			   
			   $('#system-menu').treeview({
     		       data:data,

		        });
		        
		        $('#system-menu').on('nodeSelected', function(event, data) {  
		              

		              $("#main_frame")[0].src="${pageContext.request.contextPath}"+data.href;
				   
				       }); 
		   })
	   })
	
</script>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="#"><img src="Public/images/logo.png" alt="小小宠物店"
					class="img-responsive logo"></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth">
						<i class="lnr lnr-arrow-left-circle"></i>
					</button>
				</div>
				<form class="navbar-form navbar-left">
					<div class="input-group">
						<input type="text" value="" class="form-control"
							placeholder="Search dashboard..."> <span
							class="input-group-btn"><button type="button"
								class="btn btn-primary">Go</button></span>
					</div>
				</form>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class=""></i> <span>当前网站访问信息</span>
								<i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#">当前访问人数：</a></li>
								<li><a href="Admin/visitorList.jsp">访问者信息表</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="lnr lnr-question-circle"></i>
								<span>帮助</span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#">Basic Use</a></li>
								<li><a href="#">Working With Data</a></li>
								<li><a href="#">Security</a></li>
								<li><a href="#">Troubleshooting</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><img src="Public/images/user.png"
								class="img-circle" alt="Avatar"> <span></span> <i
								class="icon-submenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="lnr lnr-user"></i> <span>My
											Profile</span></a></li>
								<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>
								<li><a href="#"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li>
								<li><a href="${pageContext.request.contextPath }/logout"><i
										class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav id="system-menu">
					<ul class="nav">
						
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">

			<iframe src="" id="main_frame" name="main_frame" width="100%" height="680px"
				frameborder="0" src="" style="overflow: auto;"></iframe>

		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">&copy; 2018 All Rights Reserved.</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->

</body>

</html>