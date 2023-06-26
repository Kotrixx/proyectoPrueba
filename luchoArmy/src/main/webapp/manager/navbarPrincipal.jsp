<jsp:useBean id="usuarioLog" scope="session" type="com.games.luchito.luchoarmy.models.manager.beans.Usuario" class="com.games.luchito.luchoarmy.models.manager.beans.Usuario"/>

<nav class="navbar navbar-expand-lg" style="background: #360033;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #0b8793, #360033);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #0b8793, #360033); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
">
  <div class="container px-4 px-lg-5">
    <a class="navbar-brand" href="<%=request.getContextPath()%>/AdministradoresServlet"><img src="manager/img/logo3_1.png" alt="Logo"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav m-auto mb-2">
        <div class="input-group ml-40">

        </div>
      </ul>
      <form class="d-flex">
        <div class="dropdown">
          <!--
                    x<% if (usuarioLog.getIdUsuario() > 0) { //esto logueado %>
                    <span style="color: white"><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%></span><a
                    href="<%=request.getContextPath()%>/LoginServlet?action=logout">(Cerrar sesión)</a>
                    <% } else { //no estoy loggedIn %>
                    <a class="nav-link" style="color: #007bff;" href="<%=request.getContextPath()%>/login">
                    (Iniciar Sesión)
                    </a>
                    <% } %>-->

          <% if (usuarioLog.getIdUsuario() > 0) { //esto logueado %>
          <button class="btn" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="border: 0px " >
            <a class="navbar-brand" style="color: white" href="#"><%=usuarioLog.getNombre() + " " + usuarioLog.getApellido()%>  <img src="manager/img/avatar3.png" alt="Avatar" class="avatar"> </a></button>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Editar perfil</a></li>
            <li style="color: darkred!important;"><a class="dropdown-item" href="<%=request.getContextPath()%>/LoginServlet?action=logout" style="color: red!important;"><b>Cerrar Sesion</b></a></li>
          </ul>
          <% }  %>
        </div>
      </form>
    </div>
  </div>
</nav>