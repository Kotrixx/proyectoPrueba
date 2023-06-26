package com.games.luchito.luchoarmy.models.manager.daos;

import com.games.luchito.luchoarmy.models.manager.beans.VideojuegosDisponibles;

import java.sql.*;
import java.util.ArrayList;

public class ConfiguracionVideojuego extends BaseDao{

    //ESTOS SERÁN LOS VIDEOJUEGOS QUE VA A PODER COMPRAR EL ADMINISTRADOR
    public ArrayList<VideojuegosDisponibles>listarVideojuegosDisponibles(){

        ArrayList<VideojuegosDisponibles> lista = new ArrayList<>();

        String sql="select  idVideojuego,NombreVideojuego, descripcion, precio, nombre, imagen,oferta  from videojuegos v\n" +
                "inner join videojuegoGeneral vg on v.idVideojuegoGeneral = vg.idVideojuegoGeneral \n" +
                "inner join compras e on v.idCompra = e.idCompra\n" +
                "inner join categoria c on v.idCategoria=c.idCategoria\n" +
                "where e.idestadosAnuncio = 2;";
        try(Connection connection=this.getConnection();
             Statement stmt=connection.createStatement();
        ResultSet resultSet=stmt.executeQuery(sql)){

            while(resultSet.next()){
                VideojuegosDisponibles videojuegos= new VideojuegosDisponibles();
                videojuegos.setIdVideoDisponible(resultSet.getInt(1));
                videojuegos.setNombre(resultSet.getString(2));
                videojuegos.setDescripcion(resultSet.getString(3));
                videojuegos.setPrecio(resultSet.getDouble(4));
                videojuegos.setCategoria(resultSet.getString(5));
                videojuegos.setImagen(resultSet.getString(6));
                lista.add(videojuegos);
            }
        }
        catch (SQLException e){
            System.out.println("Fallo conexion");
            e.printStackTrace();
            //throw new RuntimeException(e);
        }
        return lista;
    }
    //  ESTE MÉTODO TODAVIA FALTA MODIFICAR YA QUE PARA ACTUALIZAR TENDRÍA QUE HACER OTRA QUERY DONDE ACTUALICE DOS TABLAS
    /*
    public void ActualizarVideojuego(VideojuegosDisponibles videojuegos){
        String sql="UPDATE videojuegogeneral SET NombreVideojuego = ?,descripcion = ?,imagen= ? WHERE idVideojuegoGeneral = ?";
        try (
                Connection connection = this.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, videojuegos.getNombreVideojuego());
            pstmt.setString(2, videojuegos.getDescripcionVideojuego());
            pstmt.setString(3, videojuegos.getImagen());

            pstmt.executeUpdate();

        } catch (
                SQLException e) {
            throw new RuntimeException(e);
        }
    }*/

    //ESTE MÉTODO VA A SERVIR PARA AGRGEAR UN NUEVO VIDEOJUEGO A LA LISTA DE JUEGOS DISPONIBLES, ES DECIR LO QUE ESTÁN A LA VENTA,
    //ES DECIR IRÍAN A LA LISTA DE VIDEOJUEGOS DISPONIBLES
    /*public void AgregarNuevoVideojuego(VideojuegosDisponibles videojuegos){

        String sql = "INSERT INTO videojuegosgeneral (idVideojuegoGeneral,NombreVideojuego,descripcion,imagen) VALUES (?,?,?,?)";

        try(
                Connection connection = this.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1,videojuegos.getIdVideojuegoGeneral() );
            pstmt.setString(2, videojuegos.getNombreVideojuego());
            pstmt.setString(3, videojuegos.getDescripcionVideojuego());
            pstmt.setString(4, videojuegos.getImagen());

            pstmt.executeUpdate();

        } catch (
                SQLException e) {
            throw new RuntimeException(e);
        }
    }
    */
    //ESTA TABLA A SERVIR PARA BORRAR VIDEOJUEGOS
    /*
    public void BorrarVideojuego(int idVideojuego){
        String sql = "DELETE FROM videojuegosgeneral WHERE idVideojuegoGeneral = ?";
        try(
             Connection connection=this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)
                ){
            pstmt.setInt(1,idVideojuego);

        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }
    */
    // ESTO EN EL EJEMPLO DE STUARDO, ES COMO SI ESTUVIERA AGREGANDO LOS NUEVOS VIDEOJUEGOS
    /*public VideojuegosDisponibles listar(int id){
        VideojuegosDisponibles videojuegos=null;


        String sql = "select * from videojuegogeneral where idVideojuegoGeneral = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setInt(1, id);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    videojuegos = new VideojuegosDisponibles();
                    videojuegos.setIdVideojuegoGeneral(rs.getInt(1));
                    videojuegos.setNombreVideojuego(rs.getString(2));
                    videojuegos.setDescripcionVideojuego(rs.getString(4));
                    videojuegos.setImagen(rs.getString(5));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return videojuegos;
    }
    */

}
