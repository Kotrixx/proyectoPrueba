<%@ page import="java.util.ArrayList" %>
<%@ page import="com.games.luchito.luchoarmy.models.manager.beans.Juego" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><!DOCTYPE html>

<%
    ArrayList<Juego> lista = (ArrayList<Juego>) request.getAttribute("lista");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>LuchitoGames</title>
    <jsp:include page="headCSS.jsp"></jsp:include>
</head>
<body>

<jsp:include page="navbarPrincipal.jsp"></jsp:include>
<nav class="navbar navbar-expand-lg ">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class=" nav nav-tabs m-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/AdministradoresServlet">Administradores</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/UsuariosServlet">Usuarios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/JuegosServlet">Juegos
                        <span style = "color:black"> > 5 más vendidos</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- Inicio de filtro -->
<section class="bg-light">
    <div class="container">
        <div class="row">
            <div class="row justify-content-center">
                <div class="col-auto container-fluid mb-4 mb-sm-5 mt-5 ">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4 mx-4">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="1" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Género de juego</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">Shooter</a></li>
                                <li><a class="dropdown-item" href="#!">RPG</a></li>
                                <li><a class="dropdown-item" href="#!">Roguelike</a></li>
                                <li><a class="dropdown-item" href="#!">Indie</a></li>
                                <li><a class="dropdown-item" href="#!">Aventura</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div class="col-auto container-fluid mb-4 mb-sm-5 mt-5">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4 mx-4">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="2" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Consola</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">PC</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Playstation</a></li>
                                <li><a class="dropdown-item" href="#!">Xbox</a></li>
                                <li><a class="dropdown-item" href="#!">Switch</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <div class="col-auto container-fluid mb-4 mb-sm-5 mt-5">
                    <form class="d-flex justify-content" role="search" style="max-width: 250px;">
                        <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Buscar">
                        <button class="btn btn-primary" type="submit">Buscar</button>
                    </form>
                </div>

                <div class="col-auto container-fluid mb-4 mb-sm-5 mt-5">
                    <div class="text-center"><a  style="color: darkgoldenrod " class="btn btn-dark mt-auto" href="<%=request.getContextPath()%>/JuegosServlet?a=vendido">5 MAS VENDIDOS</a></div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Fin de filtro -->

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="80%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>Nombre del Videojuego</th>
                            <th>Unidades Compradas</th>
                            <th>Ganancia Total(Nuevos Soles)</th>
                        </tr>
                        </thead>
                        <tbody>

                        <% for (Juego j : lista){  %>


                        <tr>
                            <td><%=j.getNombreVideojuego()%></td>
                            <td><%=j.getUnidades()%></td>
                            <td><%=j.getGanancia()%></td>

                        </tr>

                        <% }%>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>

<!-- Footer-->
<jsp:include page="../general/footerGeneral.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<jsp:include page="scripts.jsp"></jsp:include>

</body>
