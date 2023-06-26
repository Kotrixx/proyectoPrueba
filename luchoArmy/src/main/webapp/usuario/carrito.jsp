<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.games.luchito.luchoarmy.models.usuario.daos.beans.*" %>
<%@ page import="com.games.luchito.luchoarmy.models.usuario.beans.Videojuego" %>
<%@ page import="com.games.luchito.luchoarmy.models.usuario.beans.Categoria" %>
<%@ page import="com.games.luchito.luchoarmy.models.usuario.beans.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: sebas
  Date: 7/06/2023
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="carrito" type="com.games.luchito.luchoarmy.models.usuario.beans.Carrito" scope="request"/>
<% Usuario user = (Usuario) request.getAttribute("user");%>
<% double precioTotal = (double) request.getAttribute("precioTotal");%>
<% ArrayList<Videojuego> listaVideojuegos = (ArrayList<Videojuego>) request.getAttribute("listaVideojuegos"); %>
<% ArrayList<Categoria> listaCategoria = (ArrayList<Categoria>) request.getAttribute("listaCategoria"); %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Shop Homepage - Start Bootstrap Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="img/logo3_title.png" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link href="css/stylesss.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/mystyles.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg fondo">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="index.html"><img src="img/logo3_1.png" alt="Logo"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!--Buscado-->
            <ul class="navbar-nav m-auto">
                <div class="input-group ml-40">
                    <input class="form-control" type="text" placeholder="Buscar videojuego..." aria-label="Search for..." aria-describedby="btnNavbarSearch">
                    <button class="btn btn-outline-light" type="submit"><i class="bi-search me-1"></i></button>
                </div>
            </ul>

            <form class="d-flex">
                <!--boton registrar-->
                <div class="dropdown">
                    <button class="btn mt-auto" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="border: 0px " >
                        <a class="text-decoration-none" style="color: white" href="index.html"><img src="img/avatar2.png" height="15px" alt="Avatar" class="avatar"><%="Hola! "+user.getNombre()+" "+user.getApellido()%></a>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Editar perfil</a></li>
                        <li><a class="dropdown-item" href="#">Ver compras</a></li>
                        <li><a class="dropdown-item" href="#">Ver ventas</a></li>
                        <li style="color: darkred!important;"><a class="dropdown-item" href="<%=request.getContextPath()%>/" style="color: red!important;"><b>Cerrar Sesión</b></a></li>
                    </ul>
                </div>
                <!--carrito-->
                <div style="margin-right: 5px!important;"></div>
                <div class="m-auto">
                    <a class="btn btn-outline-light" type="submit" href="<%=request.getContextPath()%>/CarritoServlet?id=12">
                        <i class="bi-cart-fill me-1"></i>
                        Carrito
                        <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                    </a>
                </div>

            </form>
        </div>

    </div>
</nav>


<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #ebf2f3!important;">
    <div class="container px-4 px-lg-5">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/UserHome?id=12">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Populares</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Ofertas</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="" role="button" data-bs-toggle="dropdown" aria-expanded="false">Categorias</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <%for(Categoria cat: listaCategoria){%>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/UserHome?id=12&act=cat&catId=<%=cat.getIdCategoria()%>"><%=cat.getNombre()%></a></li>
                        <%}%>
                    </ul>
                </li>
            </ul>


            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="pages/login.html" ><b>Vender un videojuego</b></a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="estadoVideojuegos.html">Estado de videojuegos por vender</a></li>
                        <li><a class="dropdown-item" href="venderVideojuego.html">Vender un videojuego</a></li>
                        <li><a class="dropdown-item" href="misCompras.html">Ver mis compras</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- Section-->
<div class="container">
    <div class="row" >
        <div class="col-sm-8">
            <!-- Contenido de la sección izquierda -->
            <br>
            <h3 class="text-center text-lg-left">Videojuegos a comprar<br><br></h3>
            <table class="table table-hover" >
                <tr>
                    <th colspan="2">Productos</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                </tr>
                <%for(Videojuego videojuego: carrito.getVideojuegos()){%>
                <tr>
                    <%System.out.println(videojuego.getNombre());%>
                    <td><img class="card-img-top" width="50px" height="50px" src="ImagenesVideojuegos/<%=videojuego.getImagen()%>" alt="..." /></td>
                    <td><%=videojuego.getNombre()%></td>
                    <td><%=videojuego.getPrecio()%></td>
                    <td>1</td>
                </tr>
                <%}%>

            </table>
            <br><br><br><br>


        </div>
        <div class="col-sm-4">
            <!-- Contenido de la sección derecha -->
            <br>
            <h3 class="text-center text-lg-left">Resumen<br><br></h3>
            <table class="table table-hover">
                <tr>
                    <th>Productos</th>
                    <th>Precio</th>
                </tr>

                <tr>
                    <td>Total</td>
                    <td>S/. <%=precioTotal%></td>
                </tr>
            </table>

            <a href="<%=request.getContextPath()%>/UserHome?id=<%=user.getIdUsuario()%>&act=add"
               class="btn btn-outline-dark " style="display: block;margin: 0 auto;">Continuar</a>
        </div>

        <div style="display: flex;justify-content: center;">
            <div><a type="button" class="btn btn-secondary btn-lg" href="<%=request.getContextPath()%>/CarritoServlet?id=12">Actualizar carrito</a>
                <a type="button" class="btn btn-secondary btn-lg" href="<%=request.getContextPath()%>/UserHome?id=12">Seguir comprando</a>

            </div>

            <br><br><br><br><br><br><br><br><br><br><br>
        </div>

    </div>
</div>



<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
