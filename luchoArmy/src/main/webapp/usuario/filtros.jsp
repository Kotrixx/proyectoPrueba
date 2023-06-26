<%@ page import="java.util.ArrayList" %>
<%@ page import="com.games.luchito.luchoarmy.models.usuario.beans.Categoria" %>
<%@ page import="com.games.luchito.luchoarmy.models.usuario.beans.Consola" %>
<%@ page import="com.games.luchito.luchoarmy.models.usuario.beans.Catalogo" %>
<%@ page import="java.util.Base64" %>

<%--
  Created by IntelliJ IDEA.
  User: Kots
  Date: 5/27/2023
  Time: 3:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioLog" scope="session" type="com.games.luchito.luchoarmy.models.usuario.beans.Usuario" class="com.games.luchito.luchoarmy.models.usuario.beans.Usuario"/>
<% ArrayList<Catalogo> listaVideojuegos = (ArrayList<Catalogo>) request.getAttribute("listaCatCons"); %>
<% ArrayList<Consola> listaConsola = (ArrayList<Consola>) request.getAttribute("listaConsola"); %>
<% ArrayList<Categoria> listaCategoria = (ArrayList<Categoria>) request.getAttribute("listaCategoria"); %>
<html>
<head>
  <jsp:include page="resources/headCSS.jsp"/>
  <link rel="icon" type="image/x-icon" href="includes/img/logo3_title.png" />
  <link href="includes/css/mystyles.css" rel="stylesheet" />
  <link href="../includes/css/stylesss.css" rel="stylesheet">
  <link href="../includes/css/styles.css" rel="stylesheet" />
  <link href="../includes/css/mystyles.css" rel="stylesheet" />
</head>

<body>


<!-- Navigation-->
<%if(usuarioLog.getNombre()==(null)){%>
<jsp:include page="resources/navbar.jsp"/>
<%}else{%>
<jsp:include page="resources/navbarLoggged.jsp"/>
<%}%>
<!-- Header-->
<header class="bg-dark py-5">
  <div class="container px-4 px-lg-5 my-5">
    <div class="text-center text-white">
      <h1 class="display-4 fw-bolder">Mostrando videojuegos de</h1>
      <p class="lead fw-normal text-white-50 mb-0"></p>
    </div>
  </div>
</header>
<!-- Section-->
<section class="py-8">

    <div class="container">
      <div class="row">
        <div class="col-md-2">
          <!-- Sección izquierda pequeña -->
          <div class="p-4">
            <ul class="sidebar-nav" id="sidebar-nav">

              <li class="nav-item">
                  <a class="nav-link collapsed custom-link" href="<%=request.getContextPath()%>/HomeServlet?act=cat&cat=<%=request.getParameter("catId")%>">
                    <i style="font-size: 15px"class="bi bi-grid"></i>
                    <span style="font-size: 25px"><b>Consola</b></span></a>


              </li>
              <%for(Consola con: listaConsola){%>


              <li class="nav-item">
                <a class="nav-link collapsed custom-link" <%if(request.getParameter("c") != (null)){
                  if(con.getIdConsola()==Integer.parseInt(request.getParameter("c"))){%>style="color:red" <%}}%>
                   href="<%=request.getContextPath()%>/HomeServlet?act=cat&catId=<%=request.getParameter("catId")%>&c=<%=con.getIdConsola()%>">
                  <span style="font-size: 20px"><i><%=con.getNombre()%></i></span>
                </a>
              </li>
              <%}%>

            </ul>
          </div>
        </div>
        <div class="col-md-10">
          <!-- Sección derecha más grande -->
          <div class="p-4">
            <div class="container px-4 px-lg-5 mt-5">
              <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                <%for(Catalogo catalogo: listaVideojuegos){%>
                <%--<%byte[] imagenBytes = catalogo.getImagen();%>
                <%String imagenBase64 = Base64.getEncoder().encodeToString(imagenBytes);%>--%>
                <div class="col mb-5">
                  <div class="card h-100">
                    <!-- Product image-->
                    <!--  <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /> -->

                    <%--<img class="card-img-top" src="data:image/jpg;base64,<%= imagenBase64 %>" alt="..." />
                    --%>
                    <!-- Product details-->
                    <div class="card-body p-4">
                      <div class="text-center">
                        <!-- Product name-->
                        <h5 class="fw-bolder"> <%=catalogo.getNombre()%></h5>

                        <!-- Product reviews-->
                        <div class="d-flex justify-content-center small text-warning mb-2">
                          <div class="bi-star-fill"></div>
                          <div class="bi-star-fill"></div>
                          <div class="bi-star-fill"></div>
                          <div class="bi-star-fill"></div>
                          <div class="bi-star-fill"></div>
                        </div>
                        <!-- Product price-->
                        S/. <%=catalogo.getPrecio()%>
                      </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                      <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath()%>/HomeServlet?act=det&id=<%=catalogo.getIdCatalogo()%>">View options</a></div>
                    </div>
                  </div>
                </div>
                <%}%>

           </div>
         </div>
        </div>
      </div>
      </div>
    </div>

    <style>
      .pagination-container {
        margin: 30px;
      }

      .pagination-container .pagination {
        justify-content: flex-end;
        margin-left: auto;
      }

      .pagination-container .page-link {
        font-size: 18px;
        padding: 10px 15px;
      }
      .custom-link:hover {
        color: darkblue; /* Cambia el color del texto al pasar el cursor por encima */
      }
    </style>

    <div class="pagination-container">
      <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-end">
          <li class="page-item disabled">
            <a class="page-link">Previous</a>
          </li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#">Next</a>
          </li>
        </ul>
      </nav>
    </div>
</section>
<!-- Footer-->
<jsp:include page="resources/footer.jsp"/>
</body>
</html>
