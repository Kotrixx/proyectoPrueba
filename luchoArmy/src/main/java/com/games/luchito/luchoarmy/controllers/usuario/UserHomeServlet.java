package com.games.luchito.luchoarmy.controllers.usuario;

import com.games.luchito.luchoarmy.models.usuario.daos.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UserHomeServlet", value = "/UserHome2345")
public class UserHomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConfiguracionVideojuego videojuegos =new ConfiguracionVideojuego();
        VideojuegoDao videojuegoDao = new VideojuegoDao();
        ConsolaDao consolaDao = new ConsolaDao();
        CategoriaDao categoriaDao = new CategoriaDao();
        CarritoDao carritoDao = new CarritoDao();
        request.setAttribute("carrito",carritoDao.obtenerCarrito(request.getParameter("id")));

        UsuarioDao usuarioDao = new UsuarioDao();
        request.setAttribute("videojuegos",videojuegos.listarVideojuegosDisponibles());
        request.setAttribute("listaVideojuegos",videojuegoDao.listarVideojuego());
        //request.setAttribute("videojuegos",consolaDao.listarConsolas());
        request.setAttribute("listaCategoria",categoriaDao.listarCategorias());
        request.setAttribute("user", usuarioDao.obtenerUsuario(Integer.parseInt( request.getParameter("id"))));
        //view= request.getRequestDispatcher("Usuario/index.jsp");
        //view.forward(request,response);

        String action = request.getParameter("act") == null ? "listar" : request.getParameter("act");
        switch (action){
            case "listar":
                request.setAttribute("listaVideojuegos",videojuegoDao.listarVideojuego());
                request.getRequestDispatcher("Usuario/index.jsp").forward(request, response);
                break;
            case "det":
                String idVideojuego = request.getParameter("id2");
                request.setAttribute("videojuego",videojuegoDao.videojuego(idVideojuego));
                request.setAttribute("listaCategoria", categoriaDao.listarCategorias());
                request.getRequestDispatcher("Usuario/detalleVideojuego.jsp").forward(request, response);
                break;
            case "cat":
                String idcategoria = request.getParameter("catId"); //== null? "inicio" : request.getParameter("id");
                request.setAttribute("listaVideojuegoConsola",videojuegoDao.listarVideojuegoPorCategoria(idcategoria));
                //Consola servlet
                request.setAttribute("listaConsola", consolaDao.listarConsolas());
                //Cat servlet
                request.setAttribute("listaCategoria", categoriaDao.listarCategorias());
                request.getRequestDispatcher("Usuario/filtros.jsp").forward(request, response);
                break;
            case "cart":
                String idCarrrito = request.getParameter("id"); //== null? "inicio" : request.getParameter("id");
                request.setAttribute("listaVideojuegoConsola",videojuegoDao.listarVideojuegoPorCategoria(idCarrrito));
                //Consola servlet

                request.setAttribute("listaConsola", consolaDao.listarConsolas());
                //Cat servlet

                request.setAttribute("listaCategoria", categoriaDao.listarCategorias());
                request.getRequestDispatcher("Usuario/filtros.jsp").forward(request, response);
                break;
            case "oferta":
                break;

            case "add":
                carritoDao.agregarVideojuego(request.getParameter("id"),request.getParameter("id2"));
                response.sendRedirect(request.getContextPath() + "/UserHome?id=12");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
