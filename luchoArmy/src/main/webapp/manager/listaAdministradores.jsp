<%@ page import="java.util.ArrayList" %>
<%@ page import="com.games.luchito.luchoarmy.models.manager.beans.Administrador"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioLog" scope="session" type="com.games.luchito.luchoarmy.models.manager.beans.Usuario" class="com.games.luchito.luchoarmy.models.manager.beans.Usuario"/>

<%
    ArrayList<Administrador> lista = (ArrayList<Administrador>) request.getAttribute("lista");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>LuchitoGames</title>
    <jsp:include page="headCSS.jsp"></jsp:include>
</head>
<body>

<!-- Navigation-->
<jsp:include page="navbarPrincipal.jsp"></jsp:include>

<nav class="navbar navbar-expand-lg ">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarText">
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

<!-- tabla de administradores-->
<div class="contenedorTabla">
    <div class="container-fluid px-4">
        <h3 class="mt-4">Lista de administradores</h3>

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
                            for (Administrador administrador : lista){
                        %>
                        <td>
                            <div class="d-flex align-items-center">
                                <img src="https://mdbootstrap.com/img/new/avatars/6.jpg" class="rounded-circle" alt="" style="width: 45px; height: 45px">
                                <div class="ms-3">
                                    <p class="fw-bold mb-1"><a style="text-decoration: none" href="<%=request.getContextPath()%>/AdministradoresServlet?a=inspeccionar&id=<%=administrador.getIdUsuario()%>"><%=administrador.getNombre()%> <%=administrador.getApellido()%></a></p>
                                    <p class="text-muted mb-0"><%=administrador.getCorreo()%></p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="text-center">
                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">Despedir</button>
                            </div>
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Despido</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form method="POST" action="<%=request.getContextPath()%>/AdministradoresServlet?p=despedir&id=<%=administrador.getIdUsuario()%>">
                                                <div class="mb-3">
                                                    <label for="motivoDespido">Ingrese motivo de despido</label>
                                                    <input type="text" class="form-control" name="motivoDespido" id="motivoDespido">
                                                </div>
                                                <a class="btn btn-danger" href="<%=request.getContextPath()%>/AdministradoresServlet">Cancelar</a>
                                                <button type="submit" class="btn btn-primary">Continuar</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </td>
                        <td><div class="adminletter">Administrador</div></td>
                        <td><div class="adminletter"><%=administrador.getUltimoAcceso()%></div></td>
                        <td><div class="adminletter">s/.45.00</div></td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-center p-3">
        <button type="button" class="btn btn-primary"><a style="text-decoration: none; color: white" href="<%=request.getContextPath()%>/AdministradoresServlet?a=listarDespedidos">Lista de despedidos</a></button>
    </div>
</div>
<!-- Footer-->
<jsp:include page="../general/footerGeneral.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<jsp:include page="scripts.jsp"></jsp:include>
</body>
</html>