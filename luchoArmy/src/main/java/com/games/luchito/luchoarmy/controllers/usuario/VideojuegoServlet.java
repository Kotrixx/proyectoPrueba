/*
package com.games.luchito.luchoarmy.controllers.usuario;
import com.games.luchito.luchitov1.models.beans.Categoria;
import com.games.luchito.luchitov1.models.beans.Consola;
import com.games.luchito.luchitov1.models.beans.Videojuego;
import com.games.luchito.luchitov1.models.daos.CategoriaDao;
import com.games.luchito.luchitov1.models.daos.ConsolaDao;
import com.games.luchito.luchitov1.models.daos.VideojuegoDao;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

//@WebServlet(name = "VideojuegoServlet", value = "/index")
@WebServlet(name = "VideojuegoServlet", value = {"/home","","/index"})
public class VideojuegoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");


        VideojuegoDao videojuegoDao = new VideojuegoDao();
        ConsolaDao consolaDao = new ConsolaDao();
        CategoriaDao categoriaDao = new CategoriaDao();

        //Consola servlet
        request.setAttribute("listaConsola", consolaDao.listarConsolas());
        //Cat servlet
        request.setAttribute("listaCategoria", categoriaDao.listarCategorias());
        request.setAttribute("listaVideojuego",videojuegoDao.listarVideojuego());
        request.getRequestDispatcher("index.jsp").forward(request, response);







        //RequestDispatcher view;
        //view = request.getRequestDispatcher("index.jsp");
        //view.forward(request, response);

        String action = request.getParameter("act") == null ? "home" : request.getParameter("act");
        switch (action){
            case "home":
                request.setAttribute("listaVideojuego",videojuegoDao.listarVideojuego());

                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;

            case "cat":
                String idcategoria = request.getParameter("id"); //== null? "inicio" : request.getParameter("id");
                request.setAttribute("listaVideojuegoConsola",videojuegoDao.listarVideojuegoPorCategoria(idcategoria));
                //Consola servlet
                request.setAttribute("listaConsola", consolaDao.listarConsolas());
                //Cat servlet
                request.setAttribute("listaCategoria", categoriaDao.listarCategorias());
                request.getRequestDispatcher("src/main/webapp/Usuario/filtros.jsp").forward(request, response);
                break;
            case "det":
                String idGame = request.getParameter("g");
                request.setAttribute("videojuego",videojuegoDao.detalleVideojuego(idGame));

                request.getRequestDispatcher("Usuario/detalleVideojuego.jsp").forward(request, response);
                break;
        }



    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public void destroy() {
    }
}

 */



