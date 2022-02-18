<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header id="header">
		<!--header-->
		<div class="header_top">
			<!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="#"><i class="fa fa-phone"></i> +84 999 999 999</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i>
										winemarket@gmail.com</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="https://fb.watch/a_c_M_RReE/"><i class="fa fa-facebook"></i></a></li>
								<li><a href="https://fb.watch/a_d1foiCqA/"><i class="fa fa-twitter"></i></a></li>
								<li><a href="https://fb.watch/a_d4nOrQI4/"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="https://fb.watch/a_d6b6tknA/"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="https://fb.watch/a_ddqWwSi7/"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header_top-->

		<div class="header-middle">
			<!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="index.jsp"><img src="images/home/logo.png" alt="" /></a>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
								<%if(session.getAttribute("uname") != null){ %>
								<li><a href="account.jsp"><i class="fa fa-user"></i> Hello <%=session.getAttribute("uname") %></a></li>
								<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i>
										Cart</a></li>
								<li><a href="LoginServlet?command=logout"><i class="fa fa-lock"></i>
										Logout</a></li>
								<%} else { %>
								<li><a href="login.jsp"><i class="fa fa-user"></i> Account</a></li>
								<li><a href="login.jsp"><i class="fa fa-shopping-cart"></i>
										Cart</a></li>
								<li><a href="login.jsp"><i class="fa fa-lock"></i>
										Login</a></li>
								<%} %>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header-middle-->

		<div class="header-bottom">
			<!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.jsp" class="active">Home</a></li>
								<li class="dropdown"><a href="#">Shop<i
										class="fa fa-angle-down"></i></a>
									<ul role="menu" class="sub-menu">
										<li><a href="index.jsp">Products</a></li>
										<li><a href="cart.jsp">Cart</a></li>
									</ul></li>
								<li><a href="contact.jsp">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<form class="form-inline" action="ProductServlet" method="post">
							<input type="search" class="form-group rounded" id="search" name="search" placeholder="Search"/>
  							<button formaction="ProductServlet/search" class="btn btn-outline-primary"><i class="fa fa-search" aria-hidden="true"></i></button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!--/header-bottom-->
	</header>
	<!--/header-->
</body>
</html>