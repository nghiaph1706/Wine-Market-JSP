<%@page import="dao.ProductDAO"%>
<%@page import="entity.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail | Wine-market</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="shortcut icon" type="image/png" href="images/home/logo.png"/>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/main.js"></script>
</head>
<body>
<% ProductDAO dao = new ProductDAO();
	String productID = request.getParameter("productID");
	Product product = dao.selectById(Integer.parseInt(productID)); %>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="slider.jsp"></jsp:include>
	<section>
		<div class="container">
			<div class="row">
				<jsp:include page="category.jsp"></jsp:include>
				<div class="col-sm-9 padding-right">
					<div class="product-details">
						<!--product-details-->
						<div class="col-sm-5">
							<div class="view-product">
								<img src="images/product-details/<%=product.getImage() %>" alt="" />
							</div>
						</div>
						<div class="col-sm-7">
							<div class="product-information">
								<!--/product-information-->
								<img src="images/product-details/new.jpg" class="newarrival"
									alt="" />
								<h2><%=product.getName() %></h2>
								<p>Product ID: <%=productID %></p>
								<img src="images/product-details/rating.png" alt="" /> <br> <span>
									<span><%=dao.formatPrice(product.getPrice()) %></span>
									<%if(session.getAttribute("uname") != null){ %>
									<a href="CartServlet?command=insert&productID=<%=productID %>" type="button" class="btn btn-fefault cart">
										<i class="fa fa-shopping-cart"></i> Add to cart
									</a>
									<%} else { %>
									<a href="login.jsp" type="button" class="btn btn-fefault cart">
										<i class="fa fa-shopping-cart"></i> Add to cart
									</a>
									<%} %>
								</span>
								<p>
									<b>Availability:</b> In Stock
								</p>
								<p>
									<b>Alcohol:</b> <%=product.getAlcohol() %> %
								</p>
								<p>
									<b>Volume:</b> <%=product.getVolume() %> ml
								</p>
								<p>
									<b>Origin:</b> <%=product.getOrigin() %>
								</p>
							</div>
							<!--/product-information-->
						</div>
					</div>
					<!--/product-details-->
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>