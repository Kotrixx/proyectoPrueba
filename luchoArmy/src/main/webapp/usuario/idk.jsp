<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Shop Homepage - Start Bootstrap Template</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="img/logo3_title.png" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <link href="css/mystyles.css" rel="stylesheet" />
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
                        <a class="text-decoration-none" style="color: white" href="index.html"><img src="img/avatar2.png" height="15px" alt="Avatar" class="avatar">Iniciar sesion </a>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Editar perfil</a></li>
                        <li><a class="dropdown-item" href="#">Ver compras</a></li>
                        <li><a class="dropdown-item" href="#">Ver ventas</a></li>
                        <li style="color: darkred!important;"><a class="dropdown-item" href="#" style="color: red!important;"><b>Cerrar Sesión</b></a></li>
                    </ul>
                </div>
                <!--carrito-->
                <div style="margin-right: 5px!important;"></div>
                <div class="m-auto">

                    <!--
                    <button class="btn btn-outline-light" type="submit" >
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                    </button>
                    -->

                    <a href="carrito_definitivo.html" class="btn btn-outline-light " style="display: block;margin: 0 auto;"><i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill">0</span></a>
                </div>

            </form>
        </div>

    </div>
</nav>
<!--Navegacion 2-->
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #ebf2f3!important;">
    <div class="container px-4 px-lg-5">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="index.html">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Populares</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">Ofertas</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Categorias</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Accion</a></li>
                        <li><a class="dropdown-item" href="#!">Aventura</a></li>
                        <li><a class="dropdown-item" href="#!">Estrategia</a></li>
                    </ul>
                </li>

            </ul>


            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><b>Vender un videojuego</b></a>
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
        <div class="col-sm-12">
            <!-- Contenido de la sección izquierda -->
            <br>
            <h3 class="text-center text-lg-left">Videojuegos a ser vendidos<br><br></h3>
            <table class="table table-hover" >
                <tr>
                    <th colspan="2">Productos</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                    <th>Estado</th>
                </tr>
                <tr>
                    <td><a class="navbar-brand" href="index.html"><img src="img/logo3_1.png" alt="Logo"></a></td>
                    <td>Nombre del videojuego</td>
                    <td>S/. 500</td>
                    <td>1</td>
                    <td>Aceptado</td>

                </tr>
                <tr>
                    <td><a class="navbar-brand" href="index.html"><img src="img/logo3_1.png" alt="Logo"></a></td>
                    <td>Nombre del videojuego</td>
                    <td>S/. 500</td>
                    <td>1</td>
                    <td>Rechazado</td>
                    <td><a href="direcciones_carrito.html" class="btn btn-outline-dark " style="display: block;margin: 0 auto;">Ver motivo de rechazo</a></td>
                </tr>
                <tr>
                    <td><a class="navbar-brand" href="index.html"><img src="img/logo3_1.png" alt="Logo"></a></td>
                    <td>Nombre del videojuego</td>
                    <td>S/. 500</td>
                    <td>1</td>
                    <td>Pendiente</td>
                    <td><a href="direcciones_carrito.html" class="btn btn-outline-dark " style="display: block;margin: 0 auto;">Eliminar</a></td>
                </tr>
                <tr>
                    <td><a class="navbar-brand" href="index.html"><img src="img/logo3_1.png" alt="Logo"></a></td>
                    <td>Nombre del videojuego</td>
                    <td>S/. 500</td>
                    <td>1</td>
                    <td>No aceptado</td>
                    <td><a href="direcciones_carrito.html" class="btn btn-outline-dark " style="display: block;margin: 0 auto;">Modificar precio</a></td>
                </tr>

            </table>
            <br><br><br><br>


        </div>










        <div style="display: flex;justify-content: center;">
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
