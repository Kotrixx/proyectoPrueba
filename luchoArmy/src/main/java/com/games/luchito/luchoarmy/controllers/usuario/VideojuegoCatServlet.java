/*package com.games.luchito.luchoarmy.controllers.usuario;
import com.games.luchito.luchoarmy.models.usuario.daos.CategoriaDao;
import com.games.luchito.luchoarmy.models.usuario.daos.ConsolaDao;
import com.games.luchito.luchoarmy.models.usuario.daos.VideojuegoDao;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "VideojuegoCatServlet", value = {"/videojuegosCat","/videojuegos"})
public class VideojuegoCatServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        VideojuegoDao videojuegoDao = new VideojuegoDao();
        ConsolaDao consolaDao = new ConsolaDao();
        CategoriaDao categoriaDao = new CategoriaDao();
        //request.setAttribute("listaVideojuego",videojuegoDao.listarVideojuego());
        //Consola
        request.setAttribute("listaConsola", consolaDao.listarConsolas());
        //Cat
        request.setAttribute("listaCategoria", categoriaDao.listarCategorias());
        RequestDispatcher view;

        String cat = request.getParameter("cat");
        String c   = request.getParameter("c");

        if(c == null){
            request.setAttribute("listaCatCons", videojuegoDao.listarVideojuegoPorCategoria(cat));
        }
        else{
            request.setAttribute("listaCatCons", videojuegoDao.listarVideojuegoPorCategoriaConsola(cat,c));
        }
        //request.setAttribute("listaVideojuegoCat",videojuegoDao.listarVideojuegoPorCategoria(cat));

        if(c==null || c == null) {
            String g = request.getParameter("g");
            request.setAttribute("g", videojuegoDao.detalleVideojuego(g));
            view = request.getRequestDispatcher("Usuario/detalleVideojuego.jsp");
        }
        view = request.getRequestDispatcher("Usuario/filtros.jsp");
        view.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    public void destroy() {
    }
}
*/

