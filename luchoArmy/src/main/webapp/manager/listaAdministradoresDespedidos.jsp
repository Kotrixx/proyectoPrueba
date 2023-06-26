<%@ page import="java.util.ArrayList" %>
<%@ page import="com.games.luchito.luchoarmy.models.manager.beans.Administrador"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  ArrayList<Administrador> lista = (ArrayList<Administrador>) request.getAttribute("listaDespedidos");
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
            <th>Motivo de despido</th>
          </tr>
          </thead>
          <tfoot>
          <tr>
            <th>Nombre / Apellido</th>
            <th>Accion</th>
            <th>Rol</th>
            <th>Motivo de despido</th>
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
              <div class="d-flex justify-content-center">
                  <div>
                    <a onclick="return confirm('Estas seguro de recontratar este administrador?')" class="btn btn-outline-success"
                       href="<%=request.getContextPath()%>/AdministradoresServlet?a=recontratar&id=<%=administrador.getIdUsuario()%>">Recontratar</a>
                  </div>
              </div>
            </td>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">¿Seguro que desea recontratar a este administrador(a)?</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="input-group mb-3">
                      <span class="input-group-text" id="inputGroup-sizing-default">Ingresa motivo</span>
                      <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary">Continuar</button>
                  </div>
                </div>
              </div>
            </div>
            <td><div class="adminletter">Administrador</div></td>
            <td><div class="adminletter"><%=administrador.getMotivoRechazo()%></div></td>
          </tr>
          <% } %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<div class="d-flex justify-content-center p-3">
  <button type="button" class="btn btn-secondary"><a style="text-decoration: none; color: white" href="<%=request.getContextPath()%>/AdministradoresServlet"><i class="bi bi-arrow-left"></i>Regresar</a></button>
</div>

<!-- Footer-->
<jsp:include page="../general/footerGeneral.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<jsp:include page="scripts.jsp"></jsp:include>

</body>
</html>

