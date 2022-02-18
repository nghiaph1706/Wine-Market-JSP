<%@page import="dao.BrandDAO"%>
<%@page import="entity.Category"%>
<%@page import="entity.Brand"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% CategoryDAO dao = new CategoryDAO(); 
List<Category> list = dao.selectAll();%>
	<div class="col-sm-3">
		<div class="left-sidebar">
			<h2>Category</h2>
			<div class="panel-group category-products" id="accordian">
				<!--category-productsr-->
				<% for(int i = 0; i < list.size(); i++){ 
				Category c = list.get(i);%>
				<div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordian" href="#<%=list.get(i).getCategoryId() %>">
                                            <span class="badge pull-right"><i class="fa fa-plus"></i></span><%=list.get(i).getName() %></a>
                                    </h4>
                                </div>
                                <div id="<%=list.get(i).getCategoryId() %>" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <ul>
							<% BrandDAO bdao = new BrandDAO();
							List<Brand> listb = bdao.selectByCategoryId(i+1);
							for(int j = 0; j< listb.size(); j++){%>
								<li><a href="index.jsp?brandID=<%=listb.get(j).getBrandId()%>&categoryID=<%=list.get(i).getCategoryId()%>"><%=listb.get(j).getName() %> </a></li>
							<%}%>
							</ul>
						</div>
					</div>
				</div>
				<%} %>
			</div>	 
			<!--/category-products-->

		</div>
	</div>
</body>
</html>