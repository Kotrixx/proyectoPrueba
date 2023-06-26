<%@ page import="com.games.luchito.luchoarmy.models.usuario.beans.Categoria" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.games.luchito.luchoarmy.models.usuario.beans.Videojuego" %>
<%@ page import="com.games.luchito.luchoarmy.models.usuario.beans.Usuario" %>
<%@ page import="com.games.luchito.luchoarmy.models.usuario.beans.Catalogo" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: Kots
  Date: 5/31/2023
  Time: 1:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="usuarioLog" scope="session" type="com.games.luchito.luchoarmy.models.usuario.beans.Usuario" class="com.games.luchito.luchoarmy.models.usuario.beans.Usuario"/>
<% ArrayList<Categoria> listaCategoria = (ArrayList<Categoria>) request.getAttribute("listaCategoria"); %>
<%  Catalogo juegoCatalogo = (Catalogo) request.getAttribute("juegoCatalogo"); %>
<% Usuario user = (Usuario) request.getAttribute("user");%>

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
<jsp:include page="resources/navbar.jsp"/>
<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Viendo detalles</h1>
            <p class="lead fw-normal text-white-50 mb-0"></p>
        </div>
    </div>
</header>
<%--
    <%byte[] imagenBytes = juegoCatalogo.getImagen();%>
    <%String imagenBase64 = Base64.getEncoder().encodeToString(imagenBytes);%>
    --%>
    <!-- Product section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">
                <div class="col-md-6">
                    <%byte[] imagenBytes = juegoCatalogo.getImagen();%>
                    <%String imagenBase64 = Base64.getEncoder().encodeToString(imagenBytes);%>
                    <img class="card-img-top mb-5 mb-md-0" src="data:image/jpg;base64,<%= imagenBase64 %>" />
                </div>
                <div class="col-md-6">
                    <h1 class="display-5 fw-bolder"><%=juegoCatalogo.getNombre()%></h1>
                    <div class="small mb-1"><%=juegoCatalogo.getConsola().getNombre()%></div>
                    <div class="fs-5 mb-5">
                        <%if(juegoCatalogo.getOferta() != 0){%>
                        <span class="text-decoration-line-through">S/. <%=juegoCatalogo.getPrecio()%></span>
                        <%}%>
                        <span>S/. <%=juegoCatalogo.getPrecio()*juegoCatalogo.getOferta()%></span>
                    </div>
                    <p class="lead"><%=juegoCatalogo.getDescripcion()%></p>
                    <div class="d-flex">
                        <input class="form-control text-center me-3" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                        <a class="btn btn-outline-dark flex-shrink-0" type="button" href="<%=request.getContextPath()%>/UserHome?act=add&id=<%=juegoCatalogo.getIdCatalogo()%>">
                            <i class="bi-cart-fill me-1"></i>
                            Añadir al carrito
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br><br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
    </section>

    <!-- Footer-->
<jsp:include page="resources/footer.jsp"/>
</body>
</html>
