<%@page import="entity.Brand"%>
<%@page import="dao.BrandDAO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="entity.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String pageActiveStr = request.getParameter("pageActive");
	int pageActive;
	try {
		pageActive = Integer.parseInt(pageActiveStr);
	} catch (Exception e) {
		pageActive = 1;
	}
	ProductDAO dao = new ProductDAO();
	BrandDAO daob = new BrandDAO();
	String brandId = null;
	String search = request.getParameter("search");
	int categoryId = -1;
	Brand brand = new Brand();
	brand.setName(" ");
	brandId = request.getParameter("brandID");
	try {
		brand = daob.selectById(Integer.parseInt(brandId));
		categoryId = Integer.parseInt(request.getParameter("categoryID"));

	} catch (Exception e) {

	}
	%>
	<div class="col-sm-9 padding-right">
		<div class="features_items">
			<!--features_items-->
			<h2 class="title text-center"><%=brand.getName()%>
				PRODUCTS
			</h2>
			<div class="row">
			<%
			if (brandId == null && search == null) {
				for (Product product : dao.selectAll(pageActive, 6)) {
			%>
			<div class="col-4 col-sm-4 col-md-4 col-lg-4">
				<div class="product-image-wrapper">
					<div class="single-products">
						<div class="productinfo text-center">
							<img src="./images/product-details/<%=product.getImage()%>"
								alt="" />
							<h2><%=dao.formatPrice(product.getPrice())%></h2>
							<p><%=product.getName()%></p>
							<a href="detail.jsp?productID=<%=product.getProductId()%>"
								class="btn btn-default add-to-cart"><i
								class="fa fa-shopping-cart"></i>View</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else {
				if(brandId != null && search == null){
			for (Product product : dao.selectByBrandIdCategoryId(Integer.parseInt(brandId), categoryId)) {
			%>
			<div class="col-4 col-sm-4 col-md-4 col-lg-4">
				<div class="product-image-wrapper">
					<div class="single-products">
						<div class="productinfo text-center">
							<img src="./images/product-details/<%=product.getImage()%>"
								alt="" />
							<h2><%=dao.formatPrice(product.getPrice())%></h2>
							<p><%=product.getName()%></p>
							<a href="detail.jsp?productID=<%=product.getProductId()%>"
								class="btn btn-default add-to-cart"><i
								class="fa fa-shopping-cart"></i>View</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else if(brandId == null && search != null) {
				for (Product product : dao.searchByKeyWord(search)) {
			%>
				<div class="col-4 col-sm-4 col-md-4 col-lg-4">
				<div class="product-image-wrapper">
					<div class="single-products">
						<div class="productinfo text-center">
							<img src="./images/product-details/<%=product.getImage()%>"
								alt="" />
							<h2><%=dao.formatPrice(product.getPrice())%></h2>
							<p><%=product.getName()%></p>
							<a href="detail.jsp?productID=<%=product.getProductId()%>"
								class="btn btn-default add-to-cart"><i
								class="fa fa-shopping-cart"></i>View</a>
						</div>
					</div>
				</div>
			</div>
			<% }
				}}
			%>
			</div>
			<div>
				<ul class="pagination justify-content-center">
					<%
					if (pageActive == 1) {
					%>
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1">Previous</a></li>
					<%
					} else {
					%>
					<li class="page-item"><a class="page-link"
						href="index.jsp?pageActive=<%=pageActive - 1%>">Previous</a></li>
					<%
					}
					%>

					<%
					for (int i = 1; i <= (int) dao.selectAll().size() / 6; i++) {
						if (i == pageActive) {
					%>
					<li class="page-item active"><a class="page-link"
						href="index.jsp?pageActive=<%=i%>"><%=i%></a></li>
					<%
					} else {
					%>
					<li class="page-item"><a class="page-link"
						href="index.jsp?pageActive=<%=i%>"><%=i%></a></li>
					<%
					}
					}
					%>

					<%
					if (pageActive == (int) dao.selectAll().size() / 6) {
					%>
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1">Next</a></li>
					<%
					} else {
					%>
					<li class="page-item"><a class="page-link"
						href="index.jsp?pageActive=<%=pageActive + 1%>">Next</a></li>
					<%
					}
					%>

				</ul>
			</div>
		</div>
		<!--features_items-->

		<div class="recommended_items">
			<!--recommended_items-->
			<h2 class="title text-center">recommended items</h2>

			<div id="recommended-item-carousel" class="carousel slide"
				data-ride="carousel">
				<div class="carousel-inner">
					<div class="item active">
						<%
						for (Product product : dao.selectAll(1, 3)) {
						%>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img
											src="./images/product-details/<%=product.getImage()%>"
											alt="" />
										<h2><%=dao.formatPrice(product.getPrice())%></h2>
										<p><%=product.getName()%></p>
										<a href="detail.jsp?productID=<%=product.getProductId()%>"
											class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>View</a>
									</div>

								</div>
							</div>
						</div>
						<%
						}
						%>
					</div>

					<div class="item">
						<%
						for (Product product : dao.selectAll(2, 3)) {
						%>
						<div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
										<img
											src="./images/product-details/<%=product.getImage()%>"
											alt="" />
										<h2><%=dao.formatPrice(product.getPrice())%></h2>
										<p><%=product.getName()%></p>
										<a href="detail.jsp?productID=<%=product.getProductId()%>"
											class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>View</a>
									</div>

								</div>
							</div>
						</div>
						<%
						}
						%>
					</div>
				</div>
				<a class="left recommended-item-control"
					href="#recommended-item-carousel" data-slide="prev"> <i
					class="fa fa-angle-left"></i>
				</a> <a class="right recommended-item-control"
					href="#recommended-item-carousel" data-slide="next"> <i
					class="fa fa-angle-right"></i>
				</a>
			</div>
		</div>
		<!--/recommended_items-->

	</div>
</body>
</html>