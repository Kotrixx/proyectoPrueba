<%@ page import="java.util.ArrayList" %>
<%@ page import="com.games.luchito.luchoarmy.models.manager.beans.Juego" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
          <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/JuegosServlet">Juegos</a>
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
                <form method="POST" class="d-flex justify-content" role="search" style="max-width: 250px;" action="<%=request.getContextPath()%>/JuegosServlet?p=buscar">
                  <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Buscar" name="textoBuscar">
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
<!-- Section-->

<div>

</div>

<section class="py-8">
  <div class="container px-4 px-lg-5 mt-5">
    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
      <!--aca empieza a mostrar los juegos-->
      <%
        int i = 0;
        for (Juego juego : lista){
        //para que se muestren solo los 8 primeros usare un contador
        i++;
        if (i>=9){
          break;
        }
      %>

      <div class="col mb-5">
        <div class="card h-100">
          <!-- Product image-->
          <img class="card-img-top" src="<%=juego.getImagen()%>" />
          <!-- Product details-->
          <div class="card-body p-4">
            <div class="text-center">
              <!-- Product name-->
              <h5 class="fw-bolder"> <a style="text-decoration: none" href="<%=request.getContextPath()%>/JuegosServlet?a=inspeccionar&id=<%=juego.getIdVideojuego()%>" class="ProductName"><%=juego.getNombreVideojuego()%>
              </a></h5>
              <!-- Product price-->
              s/. <%=juego.getPrecio()%>
            </div>
          </div>
          <!-- Product actions-->
          <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath()%>/JuegosServlet?a=inspeccionar&id=<%=juego.getIdVideojuego()%>">Inspeccionar</a></div>
          </div>
        </div>
      </div>
      <% } %>

    </div>
  </div>
</section>
<!-- Footer-->
<jsp:include page="../general/footerGeneral.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<jsp:include page="scripts.jsp"></jsp:include>

</body>
</html>
