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

    <!-- Navigation-->
    <jsp:include page="navbarPrincipal.jsp"></jsp:include>
    <!-- Termina navigation-->
    <nav class="navbar navbar-expand-lg ">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="2">
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
                        <div class="collapse navbar-collapse" id="1">
                            <ul class=" nav nav-pills m-auto">
                                <li class="nav-item">
                                    <a class="nav-link active" href="<%=request.getContextPath()%>/AdministradoresServlet?a=inspeccionar&id=<%=administrador.getIdUsuario()%>">Detalles</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/AdministradoresServlet?a=ShowadminPublicaciones&id=<%=administrador.getIdUsuario()%>">Publicaciones</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!--Publicaciones-->
                <div class="col-lg-9 container-fluid mb-4 mb-sm-5 mt-5">
                    <div class="card card-style1 border-0">
                        <div class="card-body p-1-9 p-sm-2-3 p-md-6 p-lg-7">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">Nombre / videojuego</th>
                                    <th scope="col">Precio Compra</th>
                                    <th scope="col">Estado del videojuego</th>
                                    <th scope="col">Stock</th>
                                    <th scope="col">Ganancia</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    EstadosVideojuegos estadosVideojuegos = new EstadosVideojuegos();
                                    for (Juego juego : listaJuegos){
                                %>
                                <tr>
                                    <td><div class="adminletter"><%=juego.getNombreVideojuego()%></div></td>
                                    <td><div class="adminletter">s/.<%=juego.getPrecio()%></div></td>
                                    <td><div class="adminletter"><span class="badge bg-success rounded-pill"><%=estadosVideojuegos.estados(juego.getIdEstadosVideojuegos())%></span></div></td>
                                    <td><div class="adminletter"><%=juego.getStock()%></div></td>
                                    <td><div class="adminletter">s/.<%=juego.getGanancia()%></div></td>
                                </tr>
                                <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
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
