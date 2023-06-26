
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
  <title>Inicio de sesion</title>
  <jsp:include page="../general/headCSSGeneral.jsp"></jsp:include>
  <style>
    button {
      --green: #1BFD9C;
      font-size: 15px;
      padding: 0.7em 2.7em;
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
<section class="vh-100" style="background-image: linear-gradient(to top, #5f72bd 0%, #9b23ea 100%);">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0 " >
            <div class="col-md-6 col-lg-5 d-flex align-items-center justify-content-center">
              <img src="general/img/boy2.png" alt="login form" class="img-fluid rounded-start" />
            </div>

            <div class="col-md-6 col-lg-7 d-flex align-items-center justify-content-center" >
              <div class="card-body p-4 p-lg-5 text-black" style="background-color: #0c0e12;border-radius: 0 1rem 1rem 0;">
                <form class="form-signin" method="POST" action="<%=request.getContextPath()%>/LoginServlet">
                  <div class="align-items-center pb-4 d-flex">
                    <img src="general/img/logo3_1.png" height="55px" alt="">
                  </div>

                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px; color: white">Accede a tu cuenta</h5>

                  <!-- Email input -->
                  <div class="form-floating mb-4">
                    <input type="text" name="inputEmail" class="form-control form-control-lg"  placeholder="Ingresa correo" />
                    <label class="form-label">Email</label>
                  </div>

                  <!-- Password input -->
                  <div class="form-floating mb-3">
                    <input type="password" name="inputPassword" class="form-control form-control-lg" placeholder="Ingresa contraseña" />
                    <label class="form-label" >Contraseña</label>
                  </div>
                  <!-- Mensaje de alerta -->
                  <% if (request.getAttribute("error") != null) { %>
                  <div class="text-danger mb-2">Error en usuario o contraseña</div>
                  <% } %>

                  <div class="pt-1 mb-4">
                    <button style="padding-left: 2.5rem; padding-right: 2.5rem; font-size: 18px" type="submit">Log in</button>
                  </div>

                  <a href="#!"  class="mb-2 pb-lg-2" style="color: #393f81; text-decoration: none">¿Olvidaste tu contraseña?</a>
                  <p class="mb-2 pb-lg-2" style="color: #393f81;">¿No tienes una cuenta? <a href="<%=request.getContextPath()%>/RegistroServlet"  style="color: #393f81;">Registrate aquí</a></p>
                  <a href="#!" class="mb-2 pb-lg-2 text-decoration-none" style="color:#4d5154 ">Politica y privacidad</a>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer-->
<jsp:include page="../general/footerGeneral.jsp"></jsp:include>
<!-- Bootstrap core JS-->
<jsp:include page="../manager/includes/scripts.jsp"></jsp:include>
</body>
</html>
