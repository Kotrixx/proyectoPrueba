<%@ page import="com.games.luchito.luchoarmy.models.usuario.beans.Categoria" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Kots
  Date: 6/19/2023
  Time: 2:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% ArrayList<Categoria> listaCategoria = (ArrayList<Categoria>) request.getAttribute("listaCategoria"); %>
<jsp:useBean id="usuarioLog" scope="session" type="com.games.luchito.luchoarmy.models.usuario.beans.Usuario" class="com.games.luchito.luchoarmy.models.usuario.beans.Usuario"/>


<%if(usuarioLog.getNombre()==(null)){%>
<nav class="navbar navbar-expand-lg fondo">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="<%=request.getContextPath()%>"><img src="includes/img/logo3_1.png" alt="Logo"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent2">
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
                    <a type="button" class="btn btn-outline-light" href="<%=request.getContextPath()%>/LoginServlet">Iniciar sesion </a>


                </div>
                <!--carrito-->
                <div style="margin-right: 5px!important;"></div>
                <div class="m-auto">
                    <a class="btn btn-outline-light" href="<%=request.getContextPath()%>/LoginServlet" >
                        <i class="bi-cart-fill me-1"></i>
                        Cart
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
        <div class="collapse navbar-collapse" id="navbarSupportedContent3">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Populares</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Ofertas</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown4" href="" role="button" data-bs-toggle="dropdown" aria-expanded="false">Categorias</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown5">
                        <%for(Categoria cat: listaCategoria){%>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/UserHome?act=cat&catId=<%=cat.getIdCategoria()%>"><%=cat.getNombre()%></a></li>
                        <%}%>
                    </ul>
                </li>
            </ul>


            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="<%=request.getContextPath()%>/LoginServlet" ><b>Vender un videojuego</b></a>
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


<%}else{%>

<nav class="navbar navbar-expand-lg fondo">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="<%=request.getContextPath()%>"><img src="../includes/img/logo3_1.png" alt="Logo"></a>
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
                        <a class="text-decoration-none" style="color: white" href="index.html"><img src="../includes/img/avatar2.png" height="15px" alt="Avatar" class="avatar"><%="Hola! "+usuarioLog.getNombre()+" "+usuarioLog.getApellido()%></a>
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
        <div class="collapse navbar-collapse" id="navbarSupportedContent1">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/UserHome?id=12">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Populares</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Ofertas</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown1" href="" role="button" data-bs-toggle="dropdown" aria-expanded="false">Categorias</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <%for(Categoria cat: listaCategoria){%>
                        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/UserHome?act=cat&catId=<%=cat.getIdCategoria()%>"><%=cat.getNombre()%></a></li>
                        <%}%>
                    </ul>
                </li>
            </ul>


            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown2" href="pages/login.html" ><b>Vender un videojuego</b></a>
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


<%}%>



