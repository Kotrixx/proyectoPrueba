package com.games.luchito.luchoarmy.models.manager.daos;

import com.games.luchito.luchoarmy.models.manager.beans.Juego;


import java.sql.*;
import java.util.ArrayList;

public class JuegoDao {


    //listará los juegos y devolverá la lista que lista_juegos.jsp utilizará para mostrar
    public ArrayList<Juego> listar(){

        //hacemos una lista de juegos
        ArrayList<Juego> lista = new ArrayList<>();


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql ="SELECT v.idVideojuego, g.idVideojuegoGeneral,g.NombreVideojuego, g.stock, v.precio, g.descripcion, g.imagen\n" +
                "from videojuegos v inner join videojuegogeneral g on (v.idVideojuegoGeneral = g.idVideojuegoGeneral)\n";
        String url = "jdbc:mysql://localhost:3306/mydb";

        //me conecto a la db
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Juego juego = new Juego();

                juego.setIdVideojuego(resultSet.getInt(1));
                juego.setIdVideojuegoGeneral(resultSet.getInt(2));
                juego.setNombreVideojuego(resultSet.getString(3));
                juego.setStock(resultSet.getInt(4));
                juego.setPrecio(resultSet.getDouble(5));
                juego.setDescripcion(resultSet.getString(6));
                juego.setImagen(resultSet.getString(7));

                //le saco todos los valores del resultset que retorna en cada linea de querie y
                //lo almaceno a la lista


                lista.add(juego);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }


    public ArrayList<Juego> listar_mas_vendidos(){

        //hacemos una lista de juegos MAS VENDIDO que solo tienen 3 atributos (name, cantidad y ganancia
        ArrayList<Juego> lista = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql ="select vg.NombreVideojuego, count(*),sum(c.precioTotal) from compras c\n" +
                "inner join videojuegos v on (c.idCompra = v.idCompra)\n" +
                "inner join videojuegogeneral vg on (vg.idVideojuegoGeneral = v.idVideojuegoGeneral)\n" +
                "group by vg.NombreVideojuego\n" +
                "order by count(*) desc, sum(c.precioTotal)\n" +
                "limit 5"; //lo q esto hará es mostrarme el name del juego, la cantidad de unidades vendidas y la plata

        String url = "jdbc:mysql://localhost:3306/mydb";

        //me conecto a la db
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {

                Juego juego = new Juego();

                //le saco todos los valores del resultset que retorna en cada linea de querie y
                //lo almaceno a la lista
                juego.setNombreVideojuego(resultSet.getString(1));
                juego.setUnidades(resultSet.getInt(2));
                juego.setGanancia(resultSet.getDouble(3));


                lista.add(juego); //ahora lista tendra 5 valores de los juegos mas vendidos en orden de cantidad vendida
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;

    }




    //a esta funcion le metes una idVideojuego y te devuelve el objeto juego con todos sus atributos
    public Juego listar(String id){

        Juego juego = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "SELECT v.idVideojuego, g.idVideojuegoGeneral,g.NombreVideojuego, g.stock, v.precio, g.descripcion, g.imagen\n" +
                "from videojuegos v inner join videojuegogeneral g on (v.idVideojuegoGeneral = g.idVideojuegoGeneral) where v.idVideojuego = ?\n";
        String url = "jdbc:mysql://localhost:3306/mydb";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, id); //para que el id de videojuego coincida

            //aca no hay bucle while porque solo sacamos 1 dato nms
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    juego = new Juego();

                    juego.setIdVideojuego(resultSet.getInt(1));
                    juego.setIdVideojuegoGeneral(resultSet.getInt(2));
                    juego.setNombreVideojuego(resultSet.getString(3));
                    juego.setStock(resultSet.getInt(4));
                    juego.setPrecio(resultSet.getDouble(5));
                    juego.setDescripcion(resultSet.getString(6));
                    juego.setImagen(resultSet.getString(7));
                    //le saco todos los valores del resultset que retorna en cada linea de querie y

                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return juego;


    }

    public void borrar(String id) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        String sql = "DELETE FROM videojuegos WHERE idVideojuego = ?";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, id);//para que el id del videojuego coincida con el que se metio como dato

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    //aca le metes un titulo de jeugo y te lo busca
    public ArrayList<Juego> buscarPorTitle(String title) {
        ArrayList<Juego> lista = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "SELECT v.idVideojuego, g.idVideojuegoGeneral,g.NombreVideojuego, g.stock, v.precio, g.descripcion, g.imagen\n" +
                "from videojuegos v inner join videojuegogeneral g on (v.idVideojuegoGeneral = g.idVideojuegoGeneral) where g.NombreVideojuego like ?";
        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, "%" + title + "%"); //si contiene el string en su name toncs se muestra

            try (ResultSet resultSet = preparedStatement.executeQuery()) {

                while (resultSet.next()) {
                    Juego juego = new Juego();
                    juego.setIdVideojuego(resultSet.getInt(1));
                    juego.setIdVideojuegoGeneral(resultSet.getInt(2));
                    juego.setNombreVideojuego(resultSet.getString(3));
                    juego.setStock(resultSet.getInt(4));
                    juego.setPrecio(resultSet.getDouble(5));
                    juego.setDescripcion(resultSet.getString(6));
                    juego.setImagen(resultSet.getString(7));
                    //le saco todos los valores del resultset que retorna en cada linea de querie y
                    //lo almaceno a la lista
                    lista.add(juego);
                }
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }




}

