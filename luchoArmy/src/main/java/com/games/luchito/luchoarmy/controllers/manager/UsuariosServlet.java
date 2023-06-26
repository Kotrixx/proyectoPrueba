package com.games.luchito.luchoarmy.controllers.manager;

import com.games.luchito.luchoarmy.models.manager.daos.AdministradorDao;
import com.games.luchito.luchoarmy.models.manager.daos.UsuarioDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UsuariosServlet", value = "/UsuariosServlet")
public class UsuariosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        UsuarioDao usuarioDao = new UsuarioDao();
        AdministradorDao administradorDao = new AdministradorDao();
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");

        switch (action) {
            case "listar":   //el default = te mostrara los 8 primeros juegos
                request.setAttribute("lista", usuarioDao.listar());
                request.getRequestDispatcher("/manager/listaUsuarios.jsp").forward(request, response);
                break;
            case "listarBaneados":   //el default = te mostrara los 8 primeros juegos
                request.setAttribute("listaBaneados", usuarioDao.listarBaneados());
                request.getRequestDispatcher("/manager/listaUsuariosBaneados.jsp").forward(request, response);
                break;
            case "inspeccionar":
                String id = request.getParameter("id");
                request.setAttribute("usuario",usuarioDao.listar(id));
                request.setAttribute("juegosDeUser",usuarioDao.listarJuegosUser(id));
                request.getRequestDispatcher("/manager/userPerfil.jsp").forward(request, response);
                break;
                /*
            case "ShowadminPublicaciones":
                String id2 = request.getParameter("id");
                request.setAttribute("administrador",usuarioDao.listar(id2));
                request.setAttribute("juegosDelAdmin",usuarioDao.listarJuegosUser(id2));
                request.getRequestDispatcher("/administradorPublicaciones.jsp").forward(request, response);
                break;*/
            case "adminJuegoInspeccion":
                String id3 = request.getParameter("id");
                request.setAttribute("juego",usuarioDao.listar(id3));
                request.getRequestDispatcher("/manager/adminJuego.jsp").forward(request, response);
                break;
            case "banear":
                String id4 = request.getParameter("id");
                usuarioDao.banear(id4);
                response.sendRedirect(request.getContextPath() + "/UsuariosServlet");
                break;
            case "desbanear":
                String id5 = request.getParameter("id");
                usuarioDao.desbanear(id5);
                response.sendRedirect(request.getContextPath() + "/UsuariosServlet");
                break;
        }
    }

}

