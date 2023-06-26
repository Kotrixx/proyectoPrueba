<%@ page import="java.util.ArrayList" %>
<%@ page import="com.games.luchito.luchoarmy.models.manager.beans.Usuario"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Usuario> lista = (ArrayList<Usuario>) request.getAttribute("lista");
%>
<!DOCTYPE html>
<html lang="es">
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
                    <a class="nav-link active" href="<%=request.getContextPath()%>/UsuariosServlet">Usuarios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/JuegosServlet">Juegos</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- tabla de administradores-->
<div class="contenedorTabla">
    <div class="container-fluid px-4">
        <h3 class="mt-4">Lista de usuarios</h3>

        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                Tabla
            </div>
            <div class="card-body">
                <table id="datatablesSimple" >
                    <thead>
                    <tr>
                        <th >Nombre / Apellido</th>
                        <th>Accion</th>
                        <th>Rol</th>
                        <th>Último acceso</th>
                        <th>Ganancia</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Nombre / Apellido</th>
                        <th>Accion</th>
                        <th>Rol</th>
                        <th>Último acceso</th>
                        <th>Ganancia</th>
                    </tr>
                    </tfoot>
                    <tbody>

                    <tr>
                        <%
                            for (Usuario usuario : lista){
                        %>
                        <td>
                            <div class="d-flex align-items-center">
                                <img src="https://mdbootstrap.com/img/new/avatars/6.jpg" class="rounded-circle" alt="" style="width: 45px; height: 45px">
                                <div class="ms-3">
                                    <p class="fw-bold mb-1"><a style="text-decoration: none" href="<%=request.getContextPath()%>/UsuariosServlet?a=inspeccionar&id=<%=usuario.getIdUsuario()%>"><%=usuario.getNombre()%> <%=usuario.getApellido()%></a></p>
                                    <p class="text-muted mb-0"><%=usuario.getCorreo()%></p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex justify-content-center">
                                <div>
                                    <a onclick="return confirm('Estas seguro de banear al usuario? :( ?')" class="btn btn-danger"
                                       href="<%=request.getContextPath()%>/UsuariosServlet?a=banear&id=<%=usuario.getIdUsuario()%>">Banear</a>
                                </div>
                            </div>
                        </td>




                        <!-- Modal -->

                        <td><div class="adminletter">Usuario</div></td>
                        <td><div class="adminletter"><%=usuario.getUltimoAcceso()%></div></td>
                        <td><div class="adminletter">$45.00</div></td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-center p-3">
        <button type="button" class="btn btn-primary"><a style="text-decoration: none; color: white" href="<%=request.getContextPath()%>/UsuariosServlet?a=listarBaneados">Lista de baneados</a></button>
    </div>
</div>
<!-- Footer-->
<jsp:include page="../general/footerGeneral.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<jsp:include page="scripts.jsp"></jsp:include>

</body>
</html>

