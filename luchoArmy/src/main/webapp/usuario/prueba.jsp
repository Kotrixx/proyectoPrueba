<%@ page import="com.games.luchito.luchitov1.models.beans.*" %>
<%@ page import="java.util.ArrayList" %>

<%--
  Created by IntelliJ IDEA.
  User: Kots
  Date: 5/27/2023
  Time: 3:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<Videojuego> listaVideojuegos = (ArrayList<Videojuego>) request.getAttribute("listaVideojuego"); %>
<% ArrayList<Consola> listaConsola = (ArrayList<Consola>) request.getAttribute("listaConsola"); %>
<% ArrayList<Categoria> listaCategoria = (ArrayList<Categoria>) request.getAttribute("listaCategoria"); %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>LuchitoGames</title>
  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="img/logo3_title.png" />
  <!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link href="css/styles.css" rel="stylesheet" />
  <link href="css/mystyles.css" rel="stylesheet" />
</head>

<body>


<!-- Navigation-->
<nav class="navbar navbar-expand-lg fondo">
  <div class="container px-4 px-lg-5">
    <a class="navbar-brand" href="index.html"><img src="img/logo3_1.png" alt="Logo"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <!--Buscado-->
      <ul class="navbar-nav m-auto">
        <div class="input-group ml-40">
          <input class="form-control" type="text" placeholder="Buscar videojuego..." aria-label="Search for..." aria-describedby="btnNavbarSearch">
          <button class="btn btn-outline-light" type="submit"><i class="bi-search me-1"></i></button>
        </div>
      </ul>

      <form class="d-flex">
        <!--boton registrar-->
        <div class="m-auto">
          <a class="text-decoration-none" style="color: white" href="./pages/login.html">Iniciar sesion </a>

        </div>
        <!--carrito-->
        <div style="margin-right: 5px!important;"></div>
        <div class="m-auto">
          <a class="btn btn-outline-light" href="pages/login.html" >
            <i class="bi-cart-fill me-1"></i>
            Cart
            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
          </a>
        </div>

      </form>
    </div>

  </div>
</nav>
<!--Navegacion 2-->
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #ebf2f3!important;">
  <div class="container px-4 px-lg-5">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
        <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.html">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="#!">Populares</a></li>
        <li class="nav-item"><a class="nav-link" href="#!">Ofertas</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Categorias</a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <%for(Categoria cat: listaCategoria){%>
            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/videojuegosCat?cat=<%=cat.getIdCategoria()%>"><%=cat.getNombre()%></a></li>
            <%}%>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Consolas</a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <%for(Consola con: listaConsola){%>
            <li><a class="dropdown-item" href="#!"><%=con.getNombre()%></a></li>
            <%}%>
          </ul>
        </li>
      </ul>


      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarDropdown" href="pages/login.html" ><b>Vender un videojuego</b></a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="estadoVideojuegos.html">Estado de videojuegos por vender</a></li>
            <li><a class="dropdown-item" href="venderVideojuego.html">Vender un videojuego</a></li>
            <li><a class="dropdown-item" href="misCompras.html">Ver mis compras</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- Header-->
<header class="bg-dark py-5">
  <div class="container px-4 px-lg-5 my-5">
    <div class="text-center text-white">
      <h1 class="display-4 fw-bolder">Bienvenidos a LuchitoGames</h1>
      <p class="lead fw-normal text-white-50 mb-0"></p>
    </div>
  </div>
</header>
<!-- Section-->
<section class="py-8">
  <div class="container px-4 px-lg-5 mt-5">
    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

      <%for(Videojuego game: listaVideojuegos){%>
      <div class="col mb-5">
        <div class="card h-100">
          <!-- Product image-->
          <!--  <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /> -->

          <img class="card-img-top" src="ImagenesVideojuegos/<%=game.getImagen()%>" alt="..." />
          <!-- Product details-->
          <div class="card-body p-4">
            <div class="text-center">
              <!-- Product name-->
              <h5 class="fw-bolder"> <%=game.getNombre()%></h5>
              <!-- Product price-->
              <%=game.getPrecio()%>
            </div>
          </div>
          <!-- Product actions-->
          <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="descripcion_sinlogin.html">View options</a></div>
          </div>
        </div>
      </div>
      <%}%>

      <div class="col mb-5">
        <div class="card h-100">
          <!-- Product image-->
          <img class="card-img-top" src="ImagenesVideojuegos/<%=listaVideojuegos.get(0).getImagen()%>" alt="..." />
          <!-- Product details-->
          <div class="card-body p-4">
            <div class="text-center">
              <!-- Product name-->
              <h5 class="fw-bolder">Popular Item</h5>
              <!-- Product reviews-->
              <div class="d-flex justify-content-center small text-warning mb-2">
                <div class="bi-star-fill"></div>
                <div class="bi-star-fill"></div>
                <div class="bi-star-fill"></div>
                <div class="bi-star-fill"></div>
                <div class="bi-star-fill"></div>
              </div>
              <!-- Product price-->
              $40.00
            </div>
          </div>
          <!-- Product actions-->
          <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Footer-->
<footer class="py-5 bg-dark">
  <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
