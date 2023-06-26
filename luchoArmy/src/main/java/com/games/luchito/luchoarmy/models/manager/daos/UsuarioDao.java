package com.games.luchito.luchoarmy.models.manager.daos;

import com.games.luchito.luchoarmy.models.manager.beans.Usuario;
import com.games.luchito.luchoarmy.models.manager.beans.Juego;

import java.sql.*;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class UsuarioDao {

    public ArrayList<Usuario> listar() {
        ArrayList<Usuario> lista = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select * from mydb.usuarios where usuarios.idRol = 3 AND usuarios.idEstadosUsuarios = 1;";
        String url = "jdbc:mysql://localhost:3306/mydb";

        //me conecto a la db
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(resultSet.getInt(1));
                usuario.setNombre(resultSet.getString(2));
                usuario.setApellido(resultSet.getString(3));
                usuario.setDni(resultSet.getInt(4));
                usuario.setContrasenha(resultSet.getString(5));
                usuario.setTelefono(resultSet.getInt(6));
                usuario.setCorreo(resultSet.getString(7));
                usuario.setMotivoRechazo(resultSet.getString(8));
                usuario.setAvatar(resultSet.getString(9));
                String fechaAcceso = obtenerDiferenciaFecha(resultSet.getString(10));
                usuario.setUltimoAcceso(fechaAcceso);
                usuario.setIdRol(resultSet.getInt(11));
                usuario.setIdManager(resultSet.getInt(12));
                usuario.setIdEstadosUsuarios(resultSet.getInt(13));

                //le saco todos los valores del resultset que retorna en cada linea de querie y
                //lo almaceno a la lista
                lista.add(usuario);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public static String obtenerDiferenciaFecha(String fecha) {
        // Obtener la fecha actual
        LocalDate fechaActual = LocalDate.now();

        // Convertir la fecha dada a LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDate fechaDada = LocalDate.parse(fecha, formatter);

        // Calcular la diferencia entre las fechas
        Period periodo = Period.between(fechaDada, fechaActual);

        // Obtener los componentes del periodo
        int anos = periodo.getYears();
        int meses = periodo.getMonths();
        int dias = periodo.getDays();

        // Construir la representación de la diferencia
        StringBuilder diferencia = new StringBuilder();
        if (anos > 0) {
            diferencia.append(anos).append(anos == 1 ? " año " : " años ");
        }
        if (meses > 0) {
            diferencia.append(meses).append(meses == 1 ? " mes " : " meses ");
        }
        if (dias > 0) {
            diferencia.append(dias).append(dias == 1 ? " día " : " días ");
        }

        return diferencia.toString();
    }



    public ArrayList<Usuario> listarBaneados() {
        ArrayList<Usuario> lista = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select * from mydb.usuarios where usuarios.idRol = 3 AND usuarios.idEstadosUsuarios = 2;";
        String url = "jdbc:mysql://localhost:3306/mydb";

        //me conecto a la db
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(resultSet.getInt(1));
                usuario.setNombre(resultSet.getString(2));
                usuario.setApellido(resultSet.getString(3));
                usuario.setDni(resultSet.getInt(4));
                usuario.setContrasenha(resultSet.getString(5));
                usuario.setTelefono(resultSet.getInt(6));
                usuario.setCorreo(resultSet.getString(7));
                usuario.setMotivoRechazo(resultSet.getString(8));
                usuario.setAvatar(resultSet.getString(9));
                String fechaAcceso = obtenerDiferenciaFecha(resultSet.getString(10));
                usuario.setUltimoAcceso(fechaAcceso);
                usuario.setIdRol(resultSet.getInt(11));
                usuario.setIdManager(resultSet.getInt(12));
                usuario.setIdEstadosUsuarios(resultSet.getInt(13));

                //le saco todos los valores del resultset que retorna en cada linea de querie y
                //lo almaceno a la lista
                lista.add(usuario);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }



    public Usuario listar(String id) {

        Usuario usuario = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select * from usuarios where idUsuario = ?";
        String url = "jdbc:mysql://localhost:3306/mydb";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, id); //para que el id de videojuego coincida

            //aca no hay bucle while porque solo sacamos 1 dato nms
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    usuario = new Usuario();
                    usuario.setIdUsuario(resultSet.getInt(1));
                    usuario.setNombre(resultSet.getString(2));
                    usuario.setApellido(resultSet.getString(3));
                    usuario.setDni(resultSet.getInt(4));
                    usuario.setContrasenha(resultSet.getString(5));
                    usuario.setTelefono(resultSet.getInt(6));
                    usuario.setCorreo(resultSet.getString(7));
                    usuario.setMotivoRechazo(resultSet.getString(8));
                    usuario.setAvatar(resultSet.getString(9));
                    String fechaAcceso = obtenerDiferenciaFecha(resultSet.getString(10));
                    usuario.setUltimoAcceso(fechaAcceso);
                    usuario.setIdRol(resultSet.getInt(11));
                    usuario.setIdManager(resultSet.getInt(12));
                    usuario.setIdEstadosUsuarios(resultSet.getInt(13));

                    //le saco todos los valores del resultset que retorna en cada linea de querie y

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }

    public ArrayList<Juego> listarJuegosUser(String id){
        //hacemos una lista de juegos
        ArrayList<Juego> lista = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "SELECT o.idVideojuegoGeneral, o.NombreVideojuego, v.precio, o.stock, o.descripcion, o.imagen, o.rating, v.idEstadosVideojuego, V.oferta \n" +
                "FROM videojuegos v\n" +
                "JOIN videojuegogeneral o ON v.idVideojuegoGeneral = o.idVideojuegoGeneral where v.idUsuario = ?";
        String url = "jdbc:mysql://localhost:3306/mydb";

        //me conecto a la db
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, id);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Juego juego = new Juego();
                    //juego.setIdVideojuego(resultSet.getInt(1));
                    juego.setIdVideojuegoGeneral(resultSet.getInt(1));
                    juego.setNombreVideojuego(resultSet.getString(2));
                    juego.setPrecio(resultSet.getDouble(3));
                    juego.setStock(resultSet.getInt(4));
                    juego.setDescripcion(resultSet.getString(5));
                    juego.setImagen(resultSet.getString(6));
                    juego.setRating(resultSet.getDouble(7));
                    juego.setIdEstadosVideojuegos(resultSet.getInt(8));
                    juego.setOferta(resultSet.getString(9));

                    lista.add(juego);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return lista;
    }
    public static void banear(String adminId) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        String sql = "UPDATE usuarios SET idEstadosUsuarios = 2 where idUsuario = ?";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, adminId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void desbanear(String adminId) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        String sql = "UPDATE usuarios SET idEstadosUsuarios = 1 where idUsuario = ?";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, adminId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void guardarUsuario(Usuario user){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:mysql://localhost:3306/luchoarmy";
        String sql = "INSERT INTO usuarios (nombre, apellido, dni, contrasenha,contraHashed, telefono, correo,idRol,idEstadosUsuarios,ultimoAcceso) \n" +
                "VALUES (?,?,?,?,sha2(?,256),?,?,3,1,date(now()))";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
                pstmt.setString(1,user.getNombre());
                pstmt.setString(2,user.getApellido());
                pstmt.setInt(3,user.getDni());
                pstmt.setString(4,user.getContrasenha());
                pstmt.setString(5,user.getContrasenha());
                pstmt.setInt(6,user.getTelefono());
                pstmt.setString(7,user.getCorreo());
                pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}

