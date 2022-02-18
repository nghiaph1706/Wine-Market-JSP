<%@page import="entity.Cart"%>
<%@page import="entity.Product"%>
<%@page import="dao.CartDAO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart | Wine-market</title>
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
<%CartDAO daoc = new CartDAO(); 
daoc.removeEmpty();
ProductDAO daop = new ProductDAO();%>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="slider.jsp"></jsp:include>
	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td></td>
							<td class="description">Item</td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
					<%for(Cart cart:daoc.selectByUserId((int)session.getAttribute("userID"))){  
					Product product = daop.selectById(cart.getProductId());%>
						<tr>
							<td></td>
							<td class="cart_description">
								<h4>
									<%=product.getName() %>
								</h4>
								<p>Product ID: <%=product.getProductId() %></p>
							</td>
							<td class="cart_price">
								<p><%=daop.formatPrice(product.getPrice()) %></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href="CartServlet?command=plus&productID=<%=product.getProductId()%>"> + </a> <input
										class="cart_quantity_input" type="text" name="quantity"
										value="<%=cart.getQuantity() %>"> <a
										class="cart_quantity_down" href="CartServlet?command=remove&productID=<%=product.getProductId()%>"> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price"><%=daop.formatPrice(product.getPrice()*cart.getQuantity()) %></p>
							</td>
							<td class="cart_delete"><a class="cart_quantity_delete"
								href="CartServlet?command=delete&productID=<%=product.getProductId()%>"><i class="fa fa-times"></i></a></td>
						</tr>
						<%} %>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<!--/#cart_items-->
	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>What would you like to do next?</h3>
				<p>Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost.</p>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<div class="total_area">
						<ul>
							<li>Cart Sub Total <span><%=daop.formatPrice(daoc.totalCart(daoc.selectByUserId((int)session.getAttribute("userID")))) %></span></li>
							<li>Shipping Cost <span>Free</span></li>
							<li>Total <span><%=daop.formatPrice(daoc.totalCart(daoc.selectByUserId((int)session.getAttribute("userID")))) %></span></li>
						</ul>
							<a class="btn btn-default check_out" href="CartServlet?command=payment">Payment</a>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>