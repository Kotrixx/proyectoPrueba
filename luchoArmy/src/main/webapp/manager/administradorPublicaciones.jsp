<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.games.luchito.luchoarmy.models.manager.beans.Administrador"%>
<%@ page import="com.games.luchito.luchoarmy.models.manager.beans.Juego" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.games.luchito.luchoarmy.models.manager.beans.EstadosVideojuegos" %>
<%
  ArrayList<Juego> listaJuegos = (ArrayList<Juego>) request.getAttribute("juegosDelAdmin");
%>
<jsp:useBean id="administrador" scope="request" type="com.games.luchito.luchoarmy.models.manager.beans.Administrador"/>
<!DOCTYPE html>
<html lang="es">
<head>
  <title>LuchitoGames</title>
  <jsp:include page="headCSS.jsp"></jsp:include>
</head>
<body>
</script>
<!-- Navigation-->
<jsp:include page="navbarPrincipal.jsp"></jsp:include>
<!-- Segundo Menu -->
<nav class="navbar navbar-expand-lg ">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="1">
      <ul class=" nav nav-tabs m-auto">
        <li class="nav-item">
          <a class="nav-link active" href="<%=request.getContextPath()%>/AdministradoresServlet">Administradores</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<%=request.getContextPath()%>/UsuariosServlet">Usuarios</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/JuegosServlet">Juegos</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- Termina Segundo Menu -->
<!-- Va contenido -->
<section class="bg-light">
  <div class="container">
    <div class="row">
      <div class="col-lg-9 container-fluid mb-4 mb-sm-5 mt-5">
        <div class="card card-style1 border-0">
          <div class="card-body p-1-9 p-sm-2-3 p-md-6 p-lg-7">
            <div class="row">
              <div class="col-lg-6 mb-4 mb-lg-0">
                <div class="d-flex justify-content-center mt-4"><img class="rounded-circle" src="https://mdbootstrap.com/img/new/avatars/8.jpg" height="150" alt="..."></div>
              </div>
              <div class="col-lg-6 px-xl-10">
                <h3 class="h2 text-bolt-black mb-3"><%=administrador.getNombre()%> <%=administrador.getApellido()%></h3>
                <span class="h4 text-primary display-28 mb-5">Administrador</span>
                <ul class="list-unstyled mb-1-9">
                  <li class="mb-2 mt-3 mb-xl-3 display-28"><span class="display-22 text-secondary me-2 font-weight-600">Ultimo acceso:</span> <%=administrador.getUltimoAcceso()%></li>
                  <li class="mb-2 mb-xl-3 display-28"><span class="display-22 text-secondary me-2 font-weight-600">Email:</span> <%=administrador.getCorreo()%></li>
                  <li class="display-28"><span class="display-22 text-secondary me-2 font-weight-600">Celular:</span> <%=administrador.getTelefono()%></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- menu detalles y publicaciones-->
      <nav class="navbar navbar-expand-lg ">
        <div class="container-fluid">
          <div class="collapse navbar-collapse" id="2">
            <ul class=" nav nav-pills m-auto">
              <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/AdministradoresServlet?a=inspeccionar&id=<%=administrador.getIdUsuario()%>">Detalles</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/AdministradoresServlet?a=ShowadminPublicaciones&id=<%=administrador.getIdUsuario()%>">Publicaciones</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!--Publicaciones-->
      <section class="py-8 col-lg-9 container-fluid ">
        <div class="px-4 px-lg-5 mt-5">
          <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center">
            <%
              for (Juego juego : listaJuegos){
            %>
            <div class="col mb-5">
              <div class="card h-100">
                <!-- Product image-->
                <img class="card-img-top" src="https://store.playstation.com/store/api/chihiro/00_09_000/container/US/en/999/UP0700-CUSA14655_00-DBZKDELUXEED0000/1594340534000/image?w=300&h=300" alt="..." />

                <!-- Product details-->
                <div class="card-body p-4">
                  <div class="text-center">
                    <!-- Product name-->
                    <h5 class="fw-bolder"> <a style="text-decoration: none;" href="<%=request.getContextPath()%>/AdministradoresServlet?a=adminJuegoInspeccion&id=<%=juego.getIdVideojuegoGeneral()%>" class="ProductName"><%=juego.getNombreVideojuego()%>
                    </a></h5>
                    <!-- Product price-->
                    <h3>s/.<%=juego.getPrecio()%></h3>
                    <h5>Oferta : <%=juego.getOferta()%></h5>
                  </div>
                </div>
                <!-- Product actions-->
                <div class="card-footer  pt-0 border-top-0 bg-transparent">
                  <div class="text-center"><a class="btn btn-outline-success mt-auto" href="<%=request.getContextPath()%>/AdministradoresServlet?a=adminJuegoInspeccion&id=<%=juego.getIdVideojuegoGeneral()%>">Inspeccionar</a></div>
                </div>

                <div class="card-footer pt-1 br-3 border-top-0">
                  <div class="d-flex justify-content-center">
                    <div class="text-center">
                      <a onclick="return confirm('Estas seguro de eliminar el videojuego :( ?')" class="btn btn-danger"
                         href="<%=request.getContextPath()%>/JuegosServlet?a=borrar&id=<%=juego.getIdVideojuego()%>">Eliminar</a></div>
                    </div>
                  </div>
              </div>
            </div>
            <% } %>
          </div>
        </div>
      </section>
    </div>
  </div>
</section>

<!-- Footer-->
<jsp:include page="../general/footerGeneral.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<jsp:include page="scripts.jsp"></jsp:include>
</body>
</html>
