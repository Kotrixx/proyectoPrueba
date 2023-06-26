<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
  <title>Registro</title>
  <jsp:include page="resources/headCSS.jsp"></jsp:include>
  <style>
    button {
      --green: #1BFD9C;
      font-size: 15px;
      padding: 0.3em;
      letter-spacing: 0.06em;
      position: relative;
      font-family: inherit;
      border-radius: 0.6em;
      overflow: hidden;
      transition: all 0.3s;
      line-height: 1.4em;
      border: 2px solid var(--green);
      background: linear-gradient(to right, rgba(27, 253, 156, 0.1) 1%, transparent 40%,transparent 60% , rgba(27, 253, 156, 0.1) 100%);
      color: var(--green);
      box-shadow: inset 0 0 10px rgba(27, 253, 156, 0.4), 0 0 9px 3px rgba(27, 253, 156, 0.1);
    }

    button:hover {
      color: #82ffc9;
      box-shadow: inset 0 0 10px rgba(27, 253, 156, 0.6), 0 0 9px 3px rgba(27, 253, 156, 0.2);
    }

    button:before {
      content: "";
      position: absolute;
      left: -4em;
      width: 4em;
      height: 100%;
      top: 0;
      transition: transform .4s ease-in-out;
      background: linear-gradient(to right, transparent 1%, rgba(27, 253, 156, 0.1) 40%,rgba(27, 253, 156, 0.1) 60% , transparent 100%);
    }

    button:hover:before {
      transform: translateX(15em);
    }

  </style>
</head>

<body>
<section style="background-image: linear-gradient(to top, #5f72bd 0%, #9b23ea 100%); height: 800px;">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0 " >
            <div class="col-md-6 col-lg-5 d-flex align-items-center justify-content-center">
              <img src="general/img/boy.png" alt="login form" class="img-fluid rounded-start" />
            </div>

            <div class="col-md-6 col-lg-7 d-flex align-items-center justify-content-center" >
              <div class="card-body p-4 p-lg-5 text-black" style="background-color: #0c0e12;border-radius: 0 1rem 1rem 0;">
                <div class="align-items-center pb-4 d-flex">
                  <img src="general/img/logo3_1.png" height="55px" alt="">
                </div>

                <h5 class="fw-normal mb-2 pb-2" style="letter-spacing: 1px; color: #02DAD9">REGISTRO</h5>
                <form method="POST" action="<%=request.getContextPath()%>/RegistroServlet">


                  <div class="pt-1 d-flex" style="justify-content: space-between;">
                    <div class="form-group mb-3 w-75">
                      <label for="nombre" style="color: white">Nombres</label>
                      <input type="text" id="nombre" class="form-control form-control-sm" name="nombre" required>
                    </div>
                    <div class="form-group mb-3 w-75" style="margin-left: 10px">
                      <label for="apellido" style="color: white">Apellidos</label>
                      <input type="text" id="apellido" class="form-control form-control-sm" name="apellido" required>
                    </div>
                  </div>

                  <div class="form-group mb-3">
                    <label for="correo" style="color: white">Correo Electrónico</label>
                    <input type="email" id="correo" class="form-control form-control-sm" name="correo"  required>
                  </div>

                  <div class="pt-1 d-flex" style="justify-content: space-between;">
                    <div class="form-group mb-3 w-75">
                      <label for="telefono" style="color: white">Telefono</label>
                      <input type="text" id="telefono" class="form-control form-control-sm" name="telefono"  required>
                    </div>

                    <div class="form-group mb-3 w-75" style="margin-left: 10px">
                      <label for="dni" style="color: white">Dni</label>
                      <input type="text" id="dni" class="form-control form-control-sm" name="dni"  required>
                    </div>
                  </div>

                  <div class="form-group mb-3">
                    <label for="contrasena" style="color: white">Contraseña</label>
                    <input type="password" id="contrasena" class="form-control form-control-sm" name="contrasena"  required>
                  </div>

                  <div class="form-group mb-3">
                    <label for="confirmarContrasena" style="color: white">Confirmar Contraseña</label>
                    <input type="password" id="confirmarContrasena" class="form-control form-control-sm" name="confirmarContrasena" required>
                  </div>

                  <div class="pt-1 mb-4 d-flex" style="justify-content: space-between;">

                    <button type="submit" style="padding-left: 1.5rem; padding-right: 1.5rem; font-size: 18px" >Guardar</button>

                    <div type="button" class="btn btn-danger cancel-button" onclick="window.location.href='<%=request.getContextPath()%>/RegistroServlet?action=regresar'">Cancelar</div>
                  </div>

                </form>
                <a href="#!" class="mb-2 pb-lg-2 text-decoration-none" style="color:#4d5154 ">Politica y privacidad</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer-->
<jsp:include page="resources/footer.jsp"></jsp:include>
<!-- Bootstrap core JS-->
</body>
</html>
