package com.games.luchito.luchoarmy.controllers;

import com.games.luchito.luchoarmy.models.usuario.beans.Catalogo;
import com.games.luchito.luchoarmy.models.usuario.daos.CatalogoDao;
import com.games.luchito.luchoarmy.models.usuario.daos.CategoriaDao;
import com.games.luchito.luchoarmy.models.usuario.daos.ConsolaDao;
import com.games.luchito.luchoarmy.models.usuario.daos.VideojuegoDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

    @WebServlet(name = "HomeServlet", value = {"/HomeServlet",""})
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("act") == null ? "main" : request.getParameter("act");
        CatalogoDao catalogoDao =new CatalogoDao();
        CategoriaDao categoriaDao = new CategoriaDao();
        ConsolaDao consolaDao = new ConsolaDao();
        request.setAttribute("listaConsola",consolaDao.listarConsolas());
        request.setAttribute("listaCategoria",categoriaDao.listarCategorias());

        switch (action){
            case "main":
                String pageStr = request.getParameter("page") == null ? "1" : request.getParameter("page");
                int page = Integer.parseInt(pageStr);
                int pageSize = 8; // Número de elementos por página
                int size = catalogoDao.listarCatalogo().size();
                request.setAttribute("size",size);
                request.setAttribute("listaCatalogo",catalogoDao.listarCatalogoPagina(page,pageSize));
                //request.setAttribute("listaCatalogo",catalogoDao.listarCatalogo());
                request.getRequestDispatcher("usuario/index.jsp").forward(request, response);
                break;
            case "det":

                String idCatalogo = request.getParameter("id");
                Catalogo catalogo = catalogoDao.obtenerJuegoCat(Integer.parseInt(idCatalogo));
                request.setAttribute("juegoCatalogo",catalogo);
                request.getRequestDispatcher("usuario/detalleVideojuego.jsp").forward(request, response);
                break;
            case "cat":
                pageStr = request.getParameter("page") == null ? "1" : request.getParameter("page");
                page = Integer.parseInt(pageStr);
                pageSize = 8; // Número de elementos por página
                if(request.getParameter("catId")==(null)){

                    size = catalogoDao.listarCatalogo().size();
                    request.setAttribute("size",size);
                    request.setAttribute("listaCatCons",catalogoDao.listarCatalogoPagina(page,pageSize));
                    request.getRequestDispatcher("usuario/listaCatCon.jsp").forward(request, response);
                }
                else {
                    if (request.getParameter("c") == (null)) {
                        String idCategoria = request.getParameter("catId");// == null? "inicio" : request.getParameter("id");
                        size = catalogoDao.listarCatalogoXcategoria(Integer.parseInt(idCategoria)).size();
                        request.setAttribute("size", size);
                        request.setAttribute("listaCatCons", catalogoDao.listarCatalogoXcategoria(Integer.parseInt(idCategoria)));
                        request.getRequestDispatcher("usuario/listaCatCon.jsp").forward(request, response);
                    } else {
                        int cons = Integer.parseInt(request.getParameter("c"));
                        int cat = Integer.parseInt(request.getParameter("catId"));
                        size = catalogoDao.listarCatalogoXcategoriaXconsola(cat, cons).size();
                        request.setAttribute("size", size);
                        request.setAttribute("listaCatCons", catalogoDao.listarCatalogoXcategoriaXconsola(cat, cons));
                        request.getRequestDispatcher("usuario/listaCatCon.jsp").forward(request, response);
                    }
                }
                break;
            case "cart":
                String idCarrrito = request.getParameter("id"); //== null? "inicio" : request.getParameter("id");
                //;request.setAttribute("listaVideojuegoConsola",catalogoDao.listarVideojuegoPorCategoria(idCarrrito));
                //Consola servlet

                //request.setAttribute("listaConsola", consolaDao.listarConsolas());
                //Cat servlet

                request.setAttribute("listaCategoria", categoriaDao.listarCategorias());
                request.getRequestDispatcher("Usuario/filtros.jsp").forward(request, response);
                break;
            case "oferta":
                pageStr = request.getParameter("page") == null ? "1" : request.getParameter("page");
                page = Integer.parseInt(pageStr);
                pageSize = 8; // Número de elementos por página
                size = catalogoDao.listarCatalogo().size();
                request.setAttribute("size",size);
                request.setAttribute("listaCatalogo",catalogoDao.listarCatalogoPagina(page,pageSize));
                //request.setAttribute("listaCatalogo",catalogoDao.listarCatalogo());
                request.getRequestDispatcher("usuario/ofertas.jsp").forward(request, response);;
                break;

            case "add":
                //carritoDao.agregarVideojuego(request.getParameter("id"),request.getParameter("id2"));
                response.sendRedirect(request.getContextPath() + "/UserHome?id=12");
                break;
            case "pop":
                pageStr = request.getParameter("page") == null ? "1" : request.getParameter("page");
                page = Integer.parseInt(pageStr);
                pageSize = 8; // Número de elementos por página
                size = catalogoDao.listarCatalogo().size();
                request.setAttribute("size",size);
                request.setAttribute("listaCatalogo",catalogoDao.listarCatalogoPagina(page,pageSize));
                //request.setAttribute("listaCatalogo",catalogoDao.listarCatalogo());
                request.getRequestDispatcher("usuario/populares.jsp").forward(request, response);;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("act") == null ? "main" : request.getParameter("act");
        CatalogoDao catalogoDao = new CatalogoDao();
        CategoriaDao categoriaDao = new CategoriaDao();
        ConsolaDao consolaDao = new ConsolaDao();
        request.setAttribute("listaConsola",consolaDao.listarConsolas());
        request.setAttribute("listaCategoria",categoriaDao.listarCategorias());
        switch (action){
            case "buscar":
                String textoBuscar = request.getParameter("textoBuscar");
                request.setAttribute("textoBusqueda", textoBuscar);

                String pageStr = request.getParameter("page") == null ? "1" : request.getParameter("page");
                int page = Integer.parseInt(pageStr);
                int pageSize = 8; // Número de elementos por página
                int size = catalogoDao.buscarJuegoXnombre(textoBuscar).size();
                request.setAttribute("size",size);
                request.setAttribute("listaCatalogo",catalogoDao.buscarJuegoXnombre2(textoBuscar,page,pageSize));
                //request.setAttribute("listaCatalogo",catalogoDao.listarCatalogo());
                request.getRequestDispatcher("usuario/index.jsp").forward(request, response);
                break;
        }

    }
}
