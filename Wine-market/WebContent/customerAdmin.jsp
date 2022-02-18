<%@page import="entity.User"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link rel="stylesheet" href="css/stylesAdmin.css" />
<link rel="shortcut icon" type="image/png" href="images/home/logo.png"/>
    <title>Admin | Wine-market</title>
</head>

<body>
<%UserDAO dao = new UserDAO(); 
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
            <div class="sidebar-heading text-center py-4 primary-text fs-4 fw-bold text-uppercase border-bottom"><i class="fas fa-wine-glass-alt"></i> Wine-Market</div>
            <div class="list-group list-group-flush my-3">
                <a href="productAdmin.jsp" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"><i
                        class="fas fa-gift me-2"></i>Products</a>
                <a href="#" class="list-group-item list-group-item-action bg-transparent second-text active">
                    <i class="fas fa-user-alt"></i>Customer</a>
                <a href="LoginServlet?command=logout" class="list-group-item list-group-item-action bg-transparent text-danger fw-bold"><i
                        class="fas fa-power-off me-2"></i>Logout</a>
            </div>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                <div class="d-flex align-items-center">
                    <i class="fas fa-align-left primary-text fs-4 me-3" id="menu-toggle"></i>
                    <h2 class="fs-2 m-0">Customer</h2>
                </div>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link  second-text fw-bold" href="#">
                                <i class="fas fa-user me-2"></i><%=session.getAttribute("uname") %>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="row my-5">
                <h3 class="fs-4 mb-3">Customer</h3>
                <div class="col" id="table-scroll">
                    <table class="table bg-white rounded shadow-sm  table-hover">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Username</th>
                                <th scope="col">Email</th>
                                <th scope="col">Admin</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                        <%for(User u:dao.selectAll()){ %>
                            <tr>
                                <th scope="row"><%=u.getUserId() %></th>
                                <td><%=u.getUsername() %></td>
                                <td><%=u.getEmail() %></td>
                                <td><%=u.getRole() %></td>
                                <td>
                                <%if (u.getRole()){ %>
                                    <a href="CustomerServlet?command=delete&userID=<%=u.getUserId() %>"></a>
                                <%} else { %>
                                    <a href="CustomerServlet?command=delete&userID=<%=u.getUserId() %>">Delete</a>
                                <%} %>
                                </td>
                            </tr>
                            <%} %>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        var el = document.getElementById("wrapper");
        var toggleButton = document.getElementById("menu-toggle");

        toggleButton.onclick = function() {
            el.classList.toggle("toggled");
        };
    </script>
</body>

</html>