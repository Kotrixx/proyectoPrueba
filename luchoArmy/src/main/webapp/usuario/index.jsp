<%@ page import="com.games.luchito.luchoarmy.models.usuario.beans.Categoria" %>
<%@ page import="com.games.luchito.luchoarmy.models.usuario.beans.Catalogo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.games.luchito.luchoarmy.models.usuario.beans.Usuario" %>
<%@ page import="java.util.Base64" %>
<%@ page import="com.games.luchito.luchoarmy.models.usuario.beans.Consola" %>
<%@ page import="com.games.luchito.luchoarmy.controllers.HomeServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioLog" scope="session" type="com.games.luchito.luchoarmy.models.usuario.beans.Usuario" class="com.games.luchito.luchoarmy.models.usuario.beans.Usuario"/>
<% ArrayList<Categoria> listaCategoria = (ArrayList<Categoria>) request.getAttribute("listaCategoria"); %>
<% ArrayList<Catalogo> listaCatalogo = (ArrayList<Catalogo>) request.getAttribute("listaCatalogo"); %>
<% ArrayList<Consola> listaConsola = (ArrayList<Consola>) request.getAttribute("listaConsola"); %>
<% Usuario user = (Usuario) request.getAttribute("user");%>
<jsp:useBean id="textoBusqueda" scope="request" type="java.lang.String" class="java.lang.String"/>
<%int size = (int) request.getAttribute("size");%>
<!DOCTYPE html>
<html lang="en">


<head>

  <jsp:include page="resources/headCSS.jsp"/>

</head>

<body>

<jsp:include page="resources/navbar.jsp">
  <jsp:param name="textoBusqueda" value="<%=textoBusqueda%>"/>
</jsp:include>
<div class="wrapper784">
  <div class="neon-wrapper784">
    <span class="txt784" >Bienvenido a LuchitoGames</span>
    <span class="gradient784"></span>
    <span class="dodge784"></span>
  </div>
</div>


<div id="layoutSidenav">
  <div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" >
      <div class="sb-sidenav-menu">


        <div class="nav">
          <div class="sb-sidenav-menu-heading">Filtros</div>
          <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
            Categorías
            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
          </a>
          <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav">
              <%for(Categoria cat: listaCategoria){%>
              <a class="dropdown-item" href="<%=request.getContextPath()%>/HomeServlet?act=cat&catId=<%=cat.getIdCategoria()%>"><%=cat.getNombre()%></a>
              <%}%>
            </nav>
          </div>

          <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
            <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
            Consolas
            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
          </a>
          <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
              <%for(Consola consola: listaConsola){%>
              <a class="dropdown-item" href="<%=request.getContextPath()%>/HomeServlet?act=cat&catId=<%=consola.getIdConsola()%>"><%=consola.getNombre()%></a>
              <%}%>
            </nav>
          </div>

          <div class="sb-sidenav-menu-heading">Extras</div>
          <a class="nav-link" href="tables.html">
            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
            algoo
          </a>

        </div>
      </div>
    </nav>
  </div>


  <div class="container px-4 px-lg-5 mt-5 justify-content-center">
    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
      <%for(Catalogo catalogo: listaCatalogo){%>
      <%byte[] imagenBytes = catalogo.getImagen();%>
      <%String imagenBase64 = Base64.getEncoder().encodeToString(imagenBytes);%>
      <div class="col mb-5">
        <div class="card h-100">
          <!-- Product image-->
          <!--  <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /> -->

          <img class="card-img-top" src="data:image/jpg;base64,<%= imagenBase64 %>" alt="..." />
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
                <div class="bi-star-unfill"></div>
              </div>
              <!-- Product price-->
              S/. <%=catalogo.getPrecio()%>
            </div>
          </div>
          <!-- Product actions-->
          <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath()%>/HomeServlet?act=det&id=<%=catalogo.getIdCatalogo()%>">Ver más detalles</a></div>
            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath()%>/HomeServlet?act=add&id=<%=catalogo.getIdCatalogo()%>">Agregar al carrito</a></div>

          </div>
        </div>
      </div>
      <%}%>
    </div>

    <style>
      .pagination-container {margin: 30px;}
      .pagination-container .pagination {justify-content: flex-end;margin-left: auto;}
      .pagination-container .page-link {font-size: 18px;padding: 10px 15px;}
    </style>
    <%
      int numPags1 = (size)/8;
      int numPags = numPags1 + 1;
    %>
    <div class="pagination-container">
      <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-end">
          <%String str = request.getParameter("page") == null? "1": request.getParameter("page");%>

          <%if(str.equals("1")){%>
          <li class="page-item disabled">
              <%}else{%>
          <li class="page-item">
            <%}%>
            <a class="page-link"  href="<%=request.getContextPath()%>/HomeServlet?page=<%=Integer.parseInt(str)-1%>">Anterior</a>
          </li>
          <%for(int i=1;i<=numPags;i++){%>
          <%if(i==Integer.parseInt(str)){%>
          <li class="page-item disabled"
          <%}else{%>
          <li class="page-item"
                  <%}%>
          ><a class="page-link" href="<%=request.getContextPath()%>/HomeServlet?page=<%=i%>"><%=i%></a></li>
          <%}%>

          <%if(Integer.parseInt(str)==numPags){%>
          <li class="page-item disabled">
              <%}else{%>
          <li class="page-item ">
            <%}%>
            <a class="page-link"  href="<%=request.getContextPath()%>/HomeServlet?page=<%=Integer.parseInt(str)+1%>">Siguiente</a>
          </li>

        </ul>
      </nav>
    </div>


  </div>
</div>
</div>


<jsp:include page="resources/footer.jsp"/>
</body>

</html>