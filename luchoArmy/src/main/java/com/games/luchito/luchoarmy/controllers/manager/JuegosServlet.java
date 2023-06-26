package com.games.luchito.luchoarmy.controllers.manager;
import com.games.luchito.luchoarmy.models.manager.daos.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


import java.io.IOException;

@WebServlet(name = "JuegosServlet", value = {"/JuegosServlet", "/ManagerJuegos", "/managerjuegos"})
public class JuegosServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        JuegoDao juegoDao = new JuegoDao();

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");

        switch (action) {
            case "listar":   //el default = te mostrara los 8 primeros juegos
                request.setAttribute("lista", juegoDao.listar());
                request.getRequestDispatcher("/manager/lista_juegos.jsp").forward(request, response);
                break;
            case "inspeccionar": //inspeccionar va a ser como el editar de la clase 10, esto debido a que necesita el id del juego

                String id = request.getParameter("id");
                //ahora que tengo su id usare el dao para obtener el objeto Juego con esa id
                request.setAttribute("juego",juegoDao.listar(id));

                //se mostrará un jsp para cada uno
                request.getRequestDispatcher("/manager/juego.jsp").forward(request, response);
                break;
            case "vendido":    //esto es parecido a listar, pero tiene otr formato y solo muestra 5 y son los q mas vendieeron
                request.setAttribute("lista", juegoDao.listar_mas_vendidos());
                request.getRequestDispatcher("/manager/vendido.jsp").forward(request, response);
                break;

            case "borrar":
                String id2 = request.getParameter("id");

                //corro el metodo borrar que buscara el juego con id y ejecutara un borrado d la bd de este
                juegoDao.borrar(id2);
                response.sendRedirect(request.getContextPath() + "/JuegosServlet");
                break;


        }




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("p") == null ? "crear" : request.getParameter("p");

        JuegoDao juegoDao = new JuegoDao();

        switch (action) {
            case "buscar":
                String textoBuscar = request.getParameter("textoBuscar");
                request.setAttribute("lista", juegoDao.buscarPorTitle(textoBuscar));
                request.getRequestDispatcher("/manager/lista_juegos.jsp").forward(request, response);
                break;
        }

    }


}