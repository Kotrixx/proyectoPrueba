package com.games.luchito.luchoarmy.controllers.usuario;

import com.games.luchito.luchoarmy.models.usuario.daos.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "CarritoServlet", value = "/CarritoServlet")
public class CarritoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VideojuegoDao videojuegoDao = new VideojuegoDao();
        CategoriaDao categoriaDao = new CategoriaDao();
        UsuarioDao usuarioDao = new UsuarioDao();
        CarritoDao carritoDao = new CarritoDao();

        //request.setAttribute("videojuegos",consolaDao.listarConsolas());
        request.setAttribute("listaCategoria",categoriaDao.listarCategorias());

        request.setAttribute("carrito",carritoDao.obtenerCarrito(request.getParameter("id")));
        request.setAttribute("user", usuarioDao.obtenerUsuario(Integer.parseInt( request.getParameter("id"))));
        request.setAttribute("precioTotal", carritoDao.obtenerPrecioTotal(request.getParameter("id")));
        request.getRequestDispatcher("Usuario/carrito.jsp").forward(request,response);

        //String action = request.getParameter("act") == null ? "listar" : request.getParameter("act");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
