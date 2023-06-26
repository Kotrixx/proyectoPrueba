package com.games.luchito.luchoarmy.models.usuario.daos;
import com.games.luchito.luchoarmy.models.usuario.beans.Categoria;
import com.games.luchito.luchoarmy.models.usuario.beans.Consola;
import com.games.luchito.luchoarmy.models.usuario.beans.Videojuego;
import com.games.luchito.luchoarmy.models.usuario.beans.VideojuegosDisponibles;

import java.sql.*;
import java.util.ArrayList;

public class VideojuegoDao extends BaseDao {

    public ArrayList<VideojuegosDisponibles> listarVideojuegoSimple() {
        ArrayList<VideojuegosDisponibles> lista = new ArrayList<>();

        String sql = "select * from videojuegos v\n" +
                "inner join videojuegogeneral vg on v.idVideojuegoGeneral = vg.idVideojuegoGeneral;";
        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                VideojuegosDisponibles game = new VideojuegosDisponibles();
                game.setIdVideoDisponible(resultSet.getInt(1));
                game.setPrecio(resultSet.getInt(2));
                game.setImagen(resultSet.getString("imagen"));
                game.setNombre(resultSet.getString("NombreVideojuego"));
                lista.add(game);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public ArrayList<Videojuego> listarVideojuego() {
        ArrayList<Videojuego> lista = new ArrayList<>();

        String sql = "select * from videojuegos v\n" +
                "inner join videojuegogeneral vg on v.idVideojuegoGeneral = vg.idVideojuegoGeneral\n" +
                "inner join consola c on v.idConsola = c.idConsola\n" +
                "inner join categoria cat on cat.idCategoria = v.idCategoria;";
        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Videojuego game = new Videojuego();
                game.setIdVideojuego(resultSet.getInt(1));
                game.setNombre(resultSet.getString("NombreVideojuego"));
                game.setDescripcion(resultSet.getString("descripcion"));
                game.setPrecio(resultSet.getDouble("precio"));
                game.setImagen(resultSet.getString("imagen"));

                Categoria categoria = new Categoria(resultSet.getInt("idCategoria"),resultSet.getString("cat.nombre"));
                game.setCategoria(categoria);
                Consola consola = new Consola(resultSet.getString("c.nombre"),resultSet.getInt("idConsola"));
                game.setConsola(consola);
                game.setIdEstadosVideojuego(resultSet.getInt("idEstadosVideojuego"));
                game.setIdVideojuego(resultSet.getInt("idVideojuego"));
                lista.add(game);
            }

        } catch (SQLException e) {
            System.out.println("No se pudo conectar");
            throw new RuntimeException(e);
        }
        return lista;
    }

    public Videojuego videojuego(String id) {
        Videojuego game = new Videojuego();
        String sql = "select * from videojuegos v\n" +
                "inner join videojuegogeneral vg on v.idVideojuegoGeneral = vg.idVideojuegoGeneral\n" +
                "inner join consola c on v.idConsola = c.idConsola\n" +
                "inner join categoria cat on cat.idCategoria = v.idCategoria\n" +
                "where idVideojuego = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, Integer.parseInt(id));

            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    game.setIdVideojuego(resultSet.getInt(1));
                    game.setNombre(resultSet.getString("NombreVideojuego"));
                    game.setDescripcion(resultSet.getString("descripcion"));
                    game.setPrecio(resultSet.getDouble("precio"));
                    game.setImagen(resultSet.getString("imagen"));

                    Categoria categoria = new Categoria(resultSet.getInt("idCategoria"),resultSet.getString("cat.nombre"));
                    game.setCategoria(categoria);
                    Consola consola = new Consola(resultSet.getString("c.nombre"),resultSet.getInt("idConsola"));
                    game.setConsola(consola);
                    game.setIdEstadosVideojuego(resultSet.getInt("idEstadosVideojuego"));
                    game.setIdVideojuego(resultSet.getInt("idVideojuego"));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return game;
    }
    /*
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
    }*/

    public ArrayList<Videojuego> listarVideojuegoPorCategoria(String idCategoria) {
        ArrayList<Videojuego> lista = new ArrayList<>();
        String sql = "select * from videojuegos v\n" +
                "inner join videojuegogeneral vg on v.idVideojuegoGeneral = vg.idVideojuegoGeneral\n" +
                "inner join consola c on v.idConsola = c.idConsola\n" +
                "inner join categoria cat on cat.idCategoria = v.idCategoria\n" +
                "where idCategoria = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, Integer.parseInt(idCategoria));

            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    Videojuego game = new Videojuego();
                    game.setIdVideojuego(resultSet.getInt(1));
                    game.setNombre(resultSet.getString("NombreVideojuego"));
                    game.setDescripcion(resultSet.getString("descripcion"));
                    game.setPrecio(resultSet.getDouble("precio"));
                    game.setImagen(resultSet.getString("imagen"));

                    Categoria categoria = new Categoria(resultSet.getInt("idCategoria"),resultSet.getString("cat.nombre"));
                    game.setCategoria(categoria);
                    Consola consola = new Consola(resultSet.getString("c.nombre"),resultSet.getInt("idConsola"));
                    game.setConsola(consola);
                    game.setIdEstadosVideojuego(resultSet.getInt("idEstadosVideojuego"));
                    game.setIdVideojuego(resultSet.getInt("idVideojuego"));
                    lista.add(game);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;

    }
}
/*



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

    */


