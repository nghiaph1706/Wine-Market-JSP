<%@page import="dao.UserDAO"%>
<%@page import="utils.CookieUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home | Wine-market</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link rel="shortcut icon" type="image/png" href="images/home/logo.png"/>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/main.js"></script>
</head>
<body>
<% String uname = null;
try{
	uname = CookieUtils.get("username", request);
} catch (Exception exception){
	
}
UserDAO dao = new UserDAO();
if(uname.length() >  0){
	try{
		session.setAttribute("uname", uname);
		session.setAttribute("userID", dao.selectByUsername(uname).getUserId());
		if(dao.selectByUsername(uname).getRole()){
			RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/productAdmin.jsp");
			requestDispatcher.forward(request, response);
		};
	} catch(Exception e){
		
	}
	
} else{
	try{
		uname = ""+session.getAttribute("uname");
		session.setAttribute("userID", dao.selectByUsername(uname).getUserId());
		if(dao.selectByUsername(uname).getRole()){
			RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/productAdmin.jsp");
			requestDispatcher.forward(request, response);
		};
	} catch (Exception e){
		
	}
}%>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="slider.jsp"></jsp:include>
	<section>
		<div class="container">
			<div class="row">
				<jsp:include page="category.jsp"></jsp:include>
				<jsp:include page="product.jsp"></jsp:include>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>