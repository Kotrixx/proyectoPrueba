package com.games.luchito.luchoarmy.models.usuario.daos;

import com.games.luchito.luchoarmy.models.usuario.beans.Carrito;
import com.games.luchito.luchoarmy.models.usuario.beans.Consola;
import com.games.luchito.luchoarmy.models.usuario.beans.Videojuego;

import java.sql.*;
import java.util.ArrayList;

public class CarritoDao extends BaseDao{
    Carrito carrito = new Carrito();
    public Carrito obtenerCarrito(String idUsuario){
        ArrayList<Videojuego> lista = new ArrayList<>();
        String sql = "select * from carrito c \n" +
                "inner join videojuegos v on v.idVideojuego = c.Videojuegos_idVideojuego\n" +
                "inner join videojuegoGeneral vg on v.idVideojuegoGeneral = vg.idVideojuegoGeneral\n" +
                "inner join consola con on v.idConsola = con.idConsola\n" +
                "where Usuarios_idUsuario = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, Integer.parseInt(idUsuario));
            carrito.setUsuarios_idUsuario(Integer.parseInt(idUsuario));
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while(resultSet.next()) {
                    Videojuego game = new Videojuego();
                    game.setIdVideojuego(resultSet.getInt(1));
                    game.setNombre(resultSet.getString("NombreVideojuego"));
                    game.setDescripcion(resultSet.getString("descripcion"));
                    game.setPrecio(resultSet.getDouble("precio"));
                    game.setImagen(resultSet.getString("imagen"));

                    //Categoria categoria = new Categoria(resultSet.getInt("idCategoria"),resultSet.getString("cat.nombre"));
                    //game.setCategoria(categoria);
                    Consola consola = new Consola(resultSet.getString("con.nombre"),resultSet.getInt("idConsola"));
                    game.setConsola(consola);
                    game.setIdEstadosVideojuego(resultSet.getInt("idEstadosVideojuego"));
                    game.setIdVideojuego(resultSet.getInt("idVideojuego"));
                    lista.add(game);

                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        carrito.setVideojuegos(lista);
        return carrito;
    }

    public double obtenerPrecioTotal(String idUsuario){
        ArrayList<Videojuego> lista = new ArrayList<>();
        String sql = "select sum(precio) from carrito c\n" +
                "\tinner join videojuegos v on c.Videojuegos_idVideojuego = v.idVideojuego\n" +
                "\twhere Usuarios_idUsuario = ?";
        double precioTotal = 0;
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, Integer.parseInt(idUsuario));
            try(ResultSet resultSet = pstmt.executeQuery()){
               while(resultSet.next()){
                   precioTotal = resultSet.getDouble(1);
               }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return precioTotal;
    }

    public void agregarVideojuego(String idUsuario,String idVideojuego){
        ArrayList<Videojuego> lista = new ArrayList<>();
        String sql = "insert into carrito(Videojuegos_idVideojuego,Usuarios_idUsuario,cantidad)\n" +
                "values (?,?,1);";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, Integer.parseInt(idVideojuego));
            pstmt.setInt(2,Integer.parseInt(idUsuario));
            //carrito.setUsuarios_idUsuario(Integer.parseInt(idUsuario));
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
