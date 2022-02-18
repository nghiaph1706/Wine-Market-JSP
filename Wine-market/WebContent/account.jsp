<%@page import="dao.UserDAO"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account | Wine-market</title>
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
	UserDAO dao = new UserDAO();
	String uname = null;
	String err = "";
	User user = new User();
	try{
		uname = ""+session.getAttribute("uname");
		user = dao.selectByUsername(uname);
	} catch (Exception e) {
		
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
						<h2>Update to your account</h2>
						<form action="CustomerServlet" method="post"> 
							<input type="text" placeholder="Username" name="username" id="username" value="<%=user.getUsername() %>" readonly> 
							<input type="email" placeholder="Email" name="email" id="email" value="<%=user.getEmail() %>"/>
							<input type="password" placeholder="Password" name="password" id="password"  value="<%=user.getPassword() %>"/>
							<input type="password" placeholder="Re-Password" name="repassword" id="repassword"/>
							<div class="btn-group">
								<button type="submit" class="btn btn-default ">Update</button>
							</div>
							<div class="btn-group">
								<button class="btn btn-default " formaction="CustomerServlet/cancel">Cancel</button>
							</div>
						</form>
						<p style="color: red"><%=err %></p>
					</div>
					<!--/login form-->
				</div>
			</div>
		</div>
	</section>
	<!--/form-->

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>