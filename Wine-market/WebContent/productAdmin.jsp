<%@page import="entity.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="entity.Category"%>
<%@page import="dao.BrandDAO"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="entity.Brand"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet" href="css/stylesAdmin.css" />
<link rel="shortcut icon" type="image/png" href="images/home/logo.png"/>
<title>Admin | Wine-market</title>
</head>

<body>
	<%
	BrandDAO daob = new BrandDAO();
	CategoryDAO daoc = new CategoryDAO();
	ProductDAO daop = new ProductDAO();
	UserDAO dao = new UserDAO(); 
	try{
		if(!dao.selectByUsername(""+session.getAttribute("uname")).getRole()){
			response.sendRedirect("/Wine-market/login.jsp");
		};
	} catch (Exception e) {
		response.sendRedirect("/Wine-market/login.jsp");
	}
	%>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar -->
		<div class="bg-white" id="sidebar-wrapper">
			<div
				class="sidebar-heading text-center py-4 primary-text fs-4 fw-bold text-uppercase border-bottom">
				<i class="fas fa-wine-glass-alt"></i> Wine-Market
			</div>
			<div class="list-group list-group-flush my-3">
				<a href="#"
					class="list-group-item list-group-item-action bg-transparent second-text active"><i
					class="fas fa-gift me-2"></i>Products</a> <a href="customerAdmin.jsp"
					class="list-group-item list-group-item-action bg-transparent second-text fw-bold">
					<i class="fas fa-user-alt"></i>Customer
				</a> <a href="LoginServlet?command=logout"
					class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
					class="fas fa-power-off me-2"></i>Logout</a>
			</div>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<nav
				class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
				<div class="d-flex align-items-center">
					<i class="fas fa-align-left primary-text fs-4 me-3"
						id="menu-toggle"></i>
					<h2 class="fs-2 m-0">Products</h2>
				</div>

				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item dropdown"><a
							class="nav-link  second-text fw-bold" href="#"> <i
								class="fas fa-user me-2"></i><%=session.getAttribute("uname")%>
						</a></li>
					</ul>
				</div>
			</nav>

			<div class="row my-5">
				<h3 class="fs-4 mb-3">Details Product</h3>
				<div class="col">
					<%
					if (session.getAttribute("productEditId") == null) {
					%>
					<form class="bg-white rounded shadow-sm" action="ProductServlet" method="post" enctype="multipart/form-data">
						<div class="form-group py-1 mx-5">
							<label for="name">Product:</label> <input type="text" name="name"
								id="name" class="form-control" />
						</div>
						<div class="form-group py-1 mx-5">
							<label for="image">Image:</label> 
							<input type="text" name="image" id="image" class="form-control" />
						</div>
						
						<div class="form-group py-1 mx-5">
    						<input type="file" class="form-control-file" name="photo_file">
						</div>
						
						<div class="form-group py-1 mx-5">
							<label for="alcohol">Alcohol:</label> <input type="text"
								name="alcohol" id="alcohol" class="form-control" />
						</div>
						<div class="form-group py-1 mx-5">
							<label for="volume">Volume:</label> <input type="text"
								name="volume" id="volume" class="form-control" />
						</div>
						<div class="form-group py-1 mx-5">
							<label for="origin">Origin:</label> <input type="text"
								name="origin" id="origin" class="form-control" />
						</div>
						<div class="form-group py-1 mx-5">
							<label for="orugin">Brand:</label> <select class="form-select" name="brandId" id="brandId">
								<%
								for (Brand b : daob.selectAll()) {
								%>
								<option value="<%=b.getBrandId()%>"><%=b.getName()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="form-group py-1 mx-5">
							<label for="category">Category:</label> <select
								class="form-select" name="categoryId" id="categoryId">
								<%
								for (Category c : daoc.selectAll()) {
								%>
								<option value="<%=c.getCategoryId()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>
						</div>
						<div class="form-group py-1 mx-5">
							<label for="price">Price:</label> <input type="text" name="price"
								id="price" class="form-control" />
						</div>
						<div class="form-group py-2 mx-5">
							<button class="btn btn-outline-dark mx-2" formaction="ProductServlet/create">Create</button>
							<button class="btn btn-outline-dark mx-2" formaction="ProductServlet/update">Update</button>
							<button class="btn btn-outline-dark mx-2" formaction="ProductServlet/reset">Reset</button>
						</div>
					</form>
					<%
					} else {
					Product product = daop.selectById((int) session.getAttribute("productEditId"));
					%>
					<form class="bg-white rounded shadow-sm"  action="ProductServlet" method="post" enctype="multipart/form-data">
						<div class="form-group py-1 mx-5">
							<label for="name">Product:</label> <input type="text" name="name"
								id="name" class="form-control" value="<%=product.getName()%>" />
						</div>
						<div class="form-group py-1 mx-5">
							<label for="image">Image:</label> <input type="text" name="image"
								id="image" class="form-control" value="<%=product.getImage()%>" />
						</div>
						
						<div class="form-group py-1 mx-5">
    						<input type="file" class="form-control-file" name="photo_file">
						</div>
						
						<div class="form-group py-1 mx-5">
							<label for="alcohol">Alcohol:</label> <input type="text"
								name="alcohol" id="alcohol" class="form-control"
								value="<%=product.getAlcohol()%>" />
						</div>
						<div class="form-group py-1 mx-5">
							<label for="volume">Volume:</label> <input type="text"
								name="volume" id="volume" class="form-control"
								value="<%=product.getVolume()%>" />
						</div>
						<div class="form-group py-1 mx-5">
							<label for="orugin">Origin:</label> <input type="text"
								name="origin" id="origin" class="form-control"
								value="<%=product.getOrigin()%>" />
						</div>
						<div class="form-group py-1 mx-5">
							<label for="origin">Brand:</label> <select class="form-select" name="brandId" id="brandId" >
								<%
								for (Brand b : daob.selectAll()) {
									if (b.getBrandId() == product.getBrandId()) {
								%>
								<option selected value="<%=b.getBrandId()%>"><%=b.getName()%></option>
								<%
								} else {
								%>
								<option value="<%=b.getBrandId()%>"><%=b.getName()%></option>
								<%
								}
								}
								%>
							</select>
						</div>
						<div class="form-group py-1 mx-5" action="ProductServlet" method="post">
							<label for="category">Category:</label> <select
								class="form-select" name="categoryId" id="categoryId">
								<%
								for (Category c : daoc.selectAll()) {
									if (c.getCategoryId() == product.getCategoryId()) {
								%>
								<option selected value="<%=c.getCategoryId()%>"><%=c.getName()%></option>
								<%
								} else {
								%>
								<option value="<%=c.getCategoryId()%>"><%=c.getName()%></option>
								<%
								}
								}
								%>
							</select>
						</div>
						<div class="form-group py-1 mx-5">
							<label for="price">Price:</label> <input type="text" name="price"
								id="price" class="form-control"
								value="<%=product.getPrice()%>" />
						</div>
						<div class="form-group py-2 mx-5">
							<button class="btn btn-outline-dark mx-2" formaction="ProductServlet/create">Create</button>
							<button class="btn btn-outline-dark mx-2" formaction="ProductServlet/update">Update</button>
							<button class="btn btn-outline-dark mx-2" formaction="ProductServlet/reset">Reset</button>
						</div>
					</form>
					<%
					}
					%>
				</div>
			</div>
			<div class="row my-5">
				<h3 class="fs-4 mb-3">Products</h3>
				<div class="col" id="table-scroll">
					<table class="table bg-white rounded shadow-sm  table-hover">
						<thead>
							<tr>
								<th scope="col" width="50">ID</th>
								<th scope="col">Product</th>
								<th scope="col">Image</th>
								<th scope="col">Alcohol</th>
								<th scope="col">Volume</th>
								<th scope="col">Origin</th>
								<th scope="col">Brand</th>
								<th scope="col">Category</th>
								<th scope="col">Price</th>
								<th scope="col" width="100"></th>
							</tr>
						</thead>
						<tbody>
							<%
							for (Product p : daop.selectAll()) {
							%>
							<tr>
								<th scope="row"><%=p.getProductId()%></th>
								<td><%=p.getName()%></td>
								<td><%=p.getImage()%></td>
								<td><%=p.getAlcohol()%> %</td>
								<td><%=p.getVolume()%> ml</td>
								<td><%=p.getOrigin()%></td>
								<td><%=daob.selectById(p.getBrandId()).getName()%></td>
								<td><%=daoc.selectById(p.getCategoryId()).getName()%></td>
								<td><%=p.getPrice()%></td>
								<td><a
									href="ProductServlet?command=edit&productID=<%=p.getProductId()%>">Edit</a>
									<a
									href="ProductServlet?command=delete&productID=<%=p.getProductId()%>">Delete</a>
								</td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>
	<!-- /#page-content-wrapper -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		var el = document.getElementById("wrapper");
		var toggleButton = document.getElementById("menu-toggle");

		toggleButton.onclick = function() {
			el.classList.toggle("toggled");
		};
	</script>
</body>

</html>