package com.games.luchito.luchoarmy.controllers;


import com.games.luchito.luchoarmy.models.usuario.beans.Usuario;
import com.games.luchito.luchoarmy.models.usuario.daos.UsuarioDao;
import jakarta.servlet.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class    LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        //ALGO EN LOAS COOKIES PARA UQE NO REGRESE

        String action = req.getParameter("action") != null ? req.getParameter("action") : "login";
        if (action.equals("login")) {
            //RequestDispatcher dispatcher = req.getRequestDispatcher("usuario/loginPage.jsp");
            //dispatcher.forward(req, resp);
            HttpSession session = req.getSession();
            System.out.println(    ((Usuario)session.getAttribute("usuarioLog")).getNombre()    );
            System.out.println(    ((Usuario)session.getAttribute("usuarioLog")).getIdUsuario()    );
            //session.invalidate();
            if (session != null && session.getAttribute("usuarioLog") != null && ((Usuario) session.getAttribute("usuarioLog")).getIdUsuario()!=0) {

                // El usuario ya está logueado, redireccionar a la página principal
                System.out.println("Existe sesion");
                resp.sendRedirect(req.getContextPath() + "/UserHome");
            } else {
                System.out.println("No existe y deberia ir al login");
                //resp.sendRedirect(req.getContextPath() + "/HomeServlet");
                //El usuario no está logueado, mostrar el formulario de inicio de sesión
                RequestDispatcher dispatcher = req.getRequestDispatcher("usuario/loginPage.jsp");
                dispatcher.forward(req, resp);
            }
        }else{ //logout
            System.out.println("cerrar sesion");
            HttpSession session = req.getSession();
            session.invalidate();
            resp.sendRedirect(req.getContextPath()+"/HomeServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("inputEmail");
        String pass = req.getParameter("inputPassword");

        UsuarioDao usuarioDao = new UsuarioDao();
        Usuario usuario = usuarioDao.validateUsernameAndPassword(email, pass);

        if (usuario != null) { //usuario y password correctos

            HttpSession session = req.getSession();
            session.setAttribute("usuarioLog",usuario);
            //session.setAttribute("usuario",usuario);
            session.setMaxInactiveInterval(300*3);

            if(usuario.getRol().getIdRol() == 3){
                resp.sendRedirect(req.getContextPath()+"/UserHome");
                System.out.println("LLEGOOO ");
            }else if(usuario.getRol().getIdRol() == 2){
                resp.sendRedirect(req.getContextPath()+"/ServletHome");
            }else{
                resp.sendRedirect(req.getContextPath()+"/AdministradoresServlet");
            }

        } else { //usuario o password incorrectos
            req.setAttribute("error", "Usuario o password incorrectos");
            req.getRequestDispatcher("usuario/loginPage.jsp").forward(req, resp);
        }
    }
}
