package com.games.luchito.luchoarmy.controllers.usuario;

import com.games.luchito.luchoarmy.models.usuario.daos.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UserServlet", value = {"/UserServlet","/UserEdit"})
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CarritoDao carritoDao = new CarritoDao();

        String action = request.getParameter("act") == null ? "edit" : request.getParameter("act");
        switch (action){
            case "edit":
                request.getRequestDispatcher("usuario/editarPerfil.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
