<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.games.luchito.luchoarmy.models.manager.beans.VideojuegosDisponibles" %><%--
  Created by IntelliJ IDEA.
  User: sebas
  Date: 7/06/2023
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<VideojuegosDisponibles> listaVideojuego = (ArrayList<VideojuegosDisponibles>) request.getAttribute("videojuegosDisponibles");%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Shop Homepage - Start Bootstrap Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicon -->
  <link rel="icon" type="image/x-icon" href="manager/img/logo3_title.png" />

  <!-- Google Web Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

  <!-- Icon Font Stylesheet -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

  <!-- Libraries Stylesheet -->
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

  <!-- Customized Bootstrap Stylesheet -->
  <link href="css/bootstrap.min.css" rel="stylesheet">

  <!-- Template Stylesheet -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link href="css/stylesss.css" rel="stylesheet">
  <link href="css/styles.css" rel="stylesheet" />
  <link href="css/mystyles.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>

<body>
<nav class="navbar navbar-expand-lg fondo">
  <div class="container px-4 px-lg-5">
    <a class="navbar-brand" href="<%=request.getContextPath()%>/ServletHome"><img src="img/logo3_1.png" alt="Logo"></a>
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
        <div class="dropdown">
          <button class="btn mt-auto" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="border: 0px " >
            <a class="text-decoration-none" style="color: white" href="index.html"><img src="img/avatar2.png" height="15px" alt="Avatar" class="avatar">Administrador Lucho </a>
          </button>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Editar perfil</a></li>
            <li style="color: darkred!important;"><a class="dropdown-item" href="#" style="color: red!important;"><b>Cerrar Sesión</b></a></li>
          </ul>
        </div>
        <!--carrito-->
        <div style="margin-right: 5px!important;"></div>
        <div class="m-auto">
          <button class="btn btn-outline-light" type="submit" >
            <i class="bi-cart-fill me-1"></i>
            Cart
            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
          </button>
        </div>

      </form>
    </div>

  </div>
</nav>


<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #bfced2!important;">
  <div class="container px-4 px-lg-5">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

      <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Juegos Disponibles</a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">+ Configuración de Videojuegos</a></li>
            <li><a class="dropdown-item" href="#">+ Publicar Nuevo Videojuego</a></li>
            <li><a class="dropdown-item" href="#">+ Agregar Promociones</a></li>
            <!--<li><a class="dropdown-item" href="<%=request.getContextPath()%>/ServletConfiguracionVideojuego?a=agregar">+ Configuración de Videojuegos</a></li>
            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/ServletConfiguracionVideojuego?a=agregar">+ Publicar Nuevo Videojuego</a></li>
            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/ServletConfiguracionVideojuego?a=promocionar">+ Agregar Promociones</a></li>!-->
          </ul>
        </li>

        <li class="nav-item"><a class="nav-link" href="#">Juegos Reservados</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Juegos Comprados</a></li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Juegos a ser Vendidos</a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/ServletGeneral?action=je">+ Listar Videojuegos Existentes</a></li>
            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/ServletGeneral?action=jn">+ Listar Videojuegos Nuevos</a></li>
            </li>
          </ul>
    </div>
  </div>
</nav>

<!-- Header-->
<header class="bg-dark py-5">
  <div class="container px-4 px-lg-5 my-5">
  </div>
</header>
<!-- Section-->
<section class="py-8">
  <div class="container px-4 px-lg-5 mt-5">
    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

      <%for(VideojuegosDisponibles videojuego: listaVideojuego){%>
      <div class="col mb-5">
        <div class="card h-100">
          <!-- Product image-->
          <!--  <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /> -->

          <img class="card-img-top" src="ImagenesVideojuegos/<%=videojuego.getImagen()%>" alt="..." />
          <!-- Product details-->
          <div class="card-body p-4">
            <div class="text-center">
              <!-- Product name-->
              <h5 class="fw-bolder"> <%=videojuego.getNombre()%></h5>
              <!-- Product reviews-->
              <div class="d-flex justify-content-center small text-warning mb-2">
                <div class="bi-star-fill"></div>
                <div class="bi-star-fill"></div>
                <div class="bi-star-fill"></div>
                <div class="bi-star-fill"></div>
                <div class="bi-star-unfill"></div>
              </div>
              <!-- Product price-->
              S/. <%=videojuego.getPrecio()%>
            </div>
          </div>
          <!-- Product actions-->
          <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath()%>/ServletConfiguracionVideojuego?a=detallar&id=<%=videojuego.getCategoria()%>">Ver Detalles</a></div>
            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath()%>/ServletConfiguracionVideojuego?a=editar&id=<%=videojuego.getNombre()%>">Comprar</a></div>
          </div>
        </div>
      </div>
      <%}%>

      <div class="col mb-5">
        <div class="card h-100">
          <!-- Product image-->
          <img class="card-img-top" src="ImagenesVideojuegos/<%=listaVideojuego.get(0).getImagen()%>" alt="..." />
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



  <style>
    .pagination-container {
      margin: 30px;
    }

    .pagination-container .pagination {
      justify-content: flex-end;
      margin-left: auto;
    }

    .pagination-container .page-link {
      font-size: 18px;
      padding: 10px 15px;
    }
  </style>

  <div class="pagination-container">
    <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-end">
        <li class="page-item disabled">
          <a class="page-link">Previous</a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
          <a class="page-link" href="#">Next</a>
        </li>
      </ul>
    </nav>
  </div>



</section>
<!-- Footer-->
<jsp:include page="../general/footerGeneral.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<jsp:include page="scripts.jsp"></jsp:include>

</body>
</html>
