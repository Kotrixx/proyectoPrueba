<%@ page import="com.games.luchito.luchoarmy.models.manager.beans.Juego" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="juego" scope="request" type="com.games.luchito.luchoarmy.models.manager.beans.Juego"/>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>LuchitoGames</title>
  <jsp:include page="headCSS.jsp"></jsp:include>
</head>
<body>

<!-- Navigation-->
<jsp:include page="navbarPrincipal.jsp"></jsp:include>
<!-- Segundo Menu -->
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
            <span style = "color:black"> > <%=juego.getNombreVideojuego()%></span>
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- Termina Segundo Menu -->

<!-- Product section-->
<section class="py-5">
  <div class="container px-4 px-lg-5 my-5">
    <div class="row gx-4 gx-lg-5 align-items-center">
      <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="https://cdn.vox-cdn.com/uploads/chorus_asset/file/23600504/EAS_MADDEN23_GEN4_SE_KeyArt.jpg" alt="..." /></div>
      <div class="col-md-6">
        <h1 class="display-5 fw-bolder"><%=juego.getNombreVideojuego()%></h1>
        <div class="fs-5 mb-5">
          <span>$<%=juego.getPrecio()%></span>
        </div>
        <p class="lead"><%=juego.getDescripcion()%>
        </p>
        <div class="text-center">
          <a onclick="return confirm('Estas seguro de eliminar el videojuego :( ?')" class="btn btn-danger"
             href="<%=request.getContextPath()%>/JuegosServlet?a=borrar&id=<%=juego.getIdVideojuego()%>">Eliminar</a></div>
      </div>
    </div>
  </div>
</section>

<!-- Footer-->
<jsp:include page="../general/footerGeneral.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<jsp:include page="scripts.jsp"></jsp:include>
</body>
</html>
