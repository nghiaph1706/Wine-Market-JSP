<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login | Wine-market</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/main.js"></script>
<link rel="shortcut icon" type="image/png" href="images/home/logo.png"/>
</head>
<body>
	<%
	String username_err = "", password_err = "", email_err = "", username="", err="";
	if(request.getAttribute("username_err") != null){
		username_err = (String) request.getAttribute("username_err");
	}
	if(request.getAttribute("password_err") != null){
		password_err = (String) request.getAttribute("password_err");
	}
	if(request.getAttribute("email_err") != null){
		email_err = (String) request.getAttribute("email_err");
	}
	if(request.getAttribute("username") != null){
		username = (String) request.getAttribute("username");
	}
	if(request.getAttribute("err") != null){
		err = (String) request.getAttribute("err");
	}
	%>
	<jsp:include page="header.jsp"></jsp:include>

	<section id="form">
		<!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form">
						<!--login form-->
						<h2>Login to your account</h2>
						<form action="LoginServlet" method="post"> 
							<p style="color: red"><%=err %></p>
							<input type="text" placeholder="Username" name="username"/> <input
								type="password" placeholder="Password" name="password"/> <span> <input
								type="checkbox" class="checkbox" name="remember"> Keep me signed in
							</span>
							<button type="submit" class="btn btn-default">Login</button>
						</form>
					</div>
					<!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form">
						<!--sign up form-->
						<h2>New User Signup!</h2>
						<form action="SignUpServlet" method="post">
						<p style="color: red"><%=username_err %></p>
							<input type="text" placeholder="Username" name="username" value="<%=username%>"/> 
							<p style="color: red"><%=email_err %></p>
							<input type="email" placeholder="Email Address" name="email" /> 
							<p style="color: red"><%=password_err %></p>
							<input type="password" placeholder="Password" name="password" />
							<button type="submit" class="btn btn-default">Signup</button>
						</form>
					</div>
					<!--/sign up form-->
				</div>
			</div>
		</div>
	</section>
	<!--/form-->

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>