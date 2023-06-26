package com.games.luchito.luchoarmy.controllers.manager;

import com.games.luchito.luchoarmy.models.manager.daos.AdministradorDao;
import com.games.luchito.luchoarmy.models.manager.daos.JuegoDao;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AdministradoresServlet", value = "/AdministradoresServlet")
public class AdministradoresServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        JuegoDao juegoDao = new JuegoDao();
        AdministradorDao administradorDao = new AdministradorDao();
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");

        switch (action) {
            case "listar":   //el default = te mostrara los 8 primeros juegos
                request.setAttribute("lista", administradorDao.listar());
                request.getRequestDispatcher("/manager/listaAdministradores.jsp").forward(request, response);
                break;
            case "listarDespedidos":   //el default = te mostrara los 8 primeros juegos
                request.setAttribute("listaDespedidos", administradorDao.listarDespedidos());
                request.getRequestDispatcher("/manager/listaAdministradoresDespedidos.jsp").forward(request, response);
                break;
            case "inspeccionar":
                String id = request.getParameter("id");
                request.setAttribute("administrador",administradorDao.listar(id));
                request.setAttribute("juegosDelAdmin",administradorDao.listarJuegosAdmin(id));
                request.getRequestDispatcher("/manager/administradorPerfil.jsp").forward(request, response);
                break;
            case "ShowadminPublicaciones":
                String id2 = request.getParameter("id");
                request.setAttribute("administrador",administradorDao.listar(id2));
                request.setAttribute("juegosDelAdmin",administradorDao.listarJuegosAdmin(id2));
                request.getRequestDispatcher("/manager/administradorPublicaciones.jsp").forward(request, response);
                break;
            case "adminJuegoInspeccion":
                String id3 = request.getParameter("id");
                request.setAttribute("juego",administradorDao.listarJuego(id3));
                request.getRequestDispatcher("/manager/adminJuego.jsp").forward(request, response);
                break;
            case "recontratar":
                String id5 = request.getParameter("id");
                AdministradorDao.recontratar(id5);
                request.setAttribute("listaDespedidos", administradorDao.listarDespedidos());
                request.getRequestDispatcher("/manager/listaAdministradoresDespedidos.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("p") == null ? "crear" : request.getParameter("p");
        AdministradorDao administradorDao = new AdministradorDao();
        switch (action) {
            case "crear":
                request.setAttribute("lista", administradorDao.listar());
                request.getRequestDispatcher("/manager/listaAdministradores.jsp").forward(request, response);
                break;

            case "despedir":
                String id4 = request.getParameter("id");
                String motivoDespido = request.getParameter("motivoDespido");
                AdministradorDao.despedir(id4, motivoDespido);
                response.sendRedirect(request.getContextPath() + "/AdministradoresServlet");
                break;
        }
    }

}

