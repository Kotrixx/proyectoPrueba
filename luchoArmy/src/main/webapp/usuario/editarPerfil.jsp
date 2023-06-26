<%@ page import="com.games.luchito.luchoarmy.models.usuario.beans.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: sebas
  Date: 6/22/2023
  Time: 5:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Usuario user = (Usuario) request.getAttribute("user");%>

<!DOCTYPE html>
<html lang="en">
<head>
  <jsp:include page="resources/headCSS.jsp"></jsp:include>
  <style>
    /* Estilos personalizados para los botones */
    .boton_barbaro {
      color: white;
      background-color: red;
      border-color: red;
      margin-top: 16px;
      margin-bottom: 16px;
    }

    .boton_barbaro:hover {
      background-color: #990000;
      border-color: #990000;
    }

    .botoncito_gozu {
      color: white;
      background-color: black;
      border-color: black;
      margin-top: 32px;
    }

    .botoncito_gozu:hover {
      background-color: #333;
      border-color: #333;
    }

    .boton-primario {
      background-color: #007bff;
      border-color: #007bff;
    }

    .boton-primario:hover {
      background-color: #0056b3;
      border-color: #0056b3;
    }
  </style>
</head>
<body>
<!-- Navigation-->
<jsp:include page="resources/navbar.jsp"></jsp:include>
<header class="bg-dark py-5">
  <div class="container px-4 px-lg-5">
    <div class="text-center text-white">
      <p class="lead fw-normal text-white-50 mb-0"></p>
    </div>
  </div>
</header>

<br><br>

<!-- Section-->
<div class="container" >
  <div class="row">
    <div class="col-lg-4">
      <h2 class="mb-4">Opciones</h2>
      <div class="list-group m-lg-4" id="list-tab" role="tablist">
        <a class="list-group-item list-group-item-action rounded-0" id="list-profile-list" data-bs-toggle="list" href="#list-profile" role="tab" aria-controls="list-profile">Mi perfil</a>
        <a class="list-group-item list-group-item-action rounded-0" id="list-messages-list" data-bs-toggle="list" href="#list-messages" role="tab" aria-controls="list-messages">Mi avatar</a>
        <a class="list-group-item list-group-item-action rounded-0" id="list-messages-list" data-bs-toggle="list" href="#list-messages" role="tab" aria-controls="list-messages">Mis direcciones</a>
      </div>
    </div>
    <div class="col-lg-8">
      <h2 class="mb-4">Editar Perfil</h2>
      <form class="row g-3">
        <div class="col-md-6">
          <label for="inputEmail4" class="form-label">Nombres</label>
          <input type="text" class="form-control" id="inputEmail4">
        </div>
        <div class="col-md-6">
          <label for="inputPassword4" class="form-label">Apellidos</label>
          <input type="text" class="form-control" id="inputPassword4">
        </div>
        <div class="col-md-6">
          <label for="inputEmail4" class="form-label">Teléfono</label>
          <input type="number" class="form-control" id="inputEmail4">
        </div>
        <div class="col-md-6">
          <label for="inputPassword4" class="form-label">DNI</label>
          <input type="number" class="form-control" id="inputPassword4">
        </div>
        <div class="col-12">
          <label for="inputAddress" class="form-label">Correo electrónico</label>
          <input type="email" class="form-control" id="inputAddress" placeholder="1234 Main St">
        </div>
        <div class="col-md-6">
          <label for="inputCity" class="form-label">Contraseña</label>
          <input type="password" class="form-control" id="inputCity">
        </div>

        <div class="col-md-6">
          <div class="input-group">
            <button type="submit" class="btn btn-primary botoncito_gozu">Cambiar contraseña</button>
          </div>
        </div>

        <!--
        <div class="col-md-4">
          <label for="inputState" class="form-label">State</label>
          <select id="inputState" class="form-select">
            <option selected>Choose...</option>
            <option>...</option>
          </select>
        <div class="col-md-4">
          <label for="inputState" class="form-label">State</label>
          <select id="inputState" class="form-select">
            <option selected>Choose...</option>
            <option>...</option>
          </select>
        Este es un comentario en HTML -->

        <!--
        <div class="col-md-2">
          <label for="inputZip" class="form-label">Zip</label>
          <input type="text" class="form-control" id="inputZip">
        </div>
        Este es un comentario en HTML -->

        <!--
        <div class="col-12">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="gridCheck">
            <label class="form-check-label" for="gridCheck">
              Check me out
            </label>
          </div>
        </div>
        -->
        <div class="col-12">
          <button type="submit" class="btn btn-primary boton-primario">Guardar cambios</button>
        </div>
      </form>
    </div>
    <div class="col-lg-4 align-self-center">
      <button class="btn btn-danger boton_barbaro mt-3" type="button">Cerrar Sesión</button>
    </div>
  </div>
  <br><br><br><br>
</div>


<jsp:include page="resources/footer.jsp"></jsp:include>
</body>
</html>
