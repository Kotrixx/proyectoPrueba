/*package com.games.luchito.luchoarmy.models.manager.daos;
import com.games.luchito.luchoarmy.models.manager.beans.*;

import java.sql.*;
import java.util.ArrayList;

public class VideojuegoDao {

    public ArrayList<Videojuegos> listarVideojuego() {
        ArrayList<Videojuegos> lista = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select * from Videojuegos " +
                "order by idVideojuego desc;";
        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Videojuegos game = new Videojuegos();
                game.setIdVideojuego(resultSet.getInt(1));
                game.setNombre(resultSet.getString(2));
                game.setDescripcion(resultSet.getString(3));
                game.setPrecio(resultSet.getDouble(4));
                game.setImagen(resultSet.getString(5));
                game.setIdCategoria(resultSet.getInt(7));
                game.setIdConsola(resultSet.getInt(8));
                game.setIdEstadosVideojuego(resultSet.getInt(9));
                lista.add(game);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public ArrayList<Videojuegos> listarVideojuegoPorCategoria(String idCategoria) {
        ArrayList<Videojuegos> lista = new ArrayList<>();
        String sql = "select * from Videojuegos \n" +
                "where idCategoria = " + idCategoria + ";";
        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Videojuegos game = new Videojuegos();
                game.setIdVideojuego(resultSet.getInt(1));
                game.setNombre(resultSet.getString(2));
                game.setDescripcion(resultSet.getString(3));
                game.setPrecio(resultSet.getDouble(4));
                game.setImagen(resultSet.getString(5));
                game.setIdCategoria(resultSet.getInt(7));
                game.setIdConsola(resultSet.getInt(8));
                game.setIdEstadosVideojuego(resultSet.getInt(9));
                lista.add(game);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }


    public ArrayList<Videojuegos> listarVideojuegoPorCategoriaConsola(String idCategoria, String idConsola) {
        ArrayList<Videojuegos> lista = new ArrayList<>();
        String sql = "select * from Videojuegos " +
                "where idCategoria = " + idCategoria + " and idConsola = "+ idConsola +";";
        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Videojuegos game = new Videojuegos();
                game.setIdVideojuego(resultSet.getInt(1));
                game.setNombre(resultSet.getString(2));
                //game.setDescripcion(resultSet.getString(3));
                game.setPrecio(resultSet.getDouble(4));
                game.setImagen(resultSet.getString(5));
                game.setIdCategoria(resultSet.getInt(7));
                game.setIdConsola(resultSet.getInt(8));
                //game.setIdEstadosVideojuego(resultSet.getInt(9));
                lista.add(game);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }

    public Videojuegos detalleVideojuego(String idVideojuego) {
        Videojuegos game = new Videojuegos();
        String sql = "select * from Videojuegos " +
                "where idVideojuego = " + idVideojuego +";";
        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {

                game.setIdVideojuego(resultSet.getInt(1));
                game.setNombre(resultSet.getString(2));
                game.setDescripcion(resultSet.getString(3));
                game.setPrecio(resultSet.getDouble(4));
                game.setImagen(resultSet.getString(5));
                game.setIdCategoria(resultSet.getInt(7));
                game.setIdConsola(resultSet.getInt(8));
                //game.setIdEstadosVideojuego(resultSet.getInt(9));

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return game;
    }

}
 */
