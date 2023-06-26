package com.games.luchito.luchoarmy.models.manager.daos;

import com.games.luchito.luchoarmy.models.manager.beans.Administrador;
import com.games.luchito.luchoarmy.models.manager.beans.Juego;
import com.games.luchito.luchoarmy.models.manager.beans.Usuario;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.Period;
import java.sql.*;
import java.util.ArrayList;

public class AdministradorDao {
    public ArrayList<Administrador> listar() {
        ArrayList<Administrador> lista = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select * from mydb.usuarios where usuarios.idRol = 2 AND usuarios.idEstadosUsuarios = 1;";
        String url = "jdbc:mysql://localhost:3306/luchoarmy";

        //me conecto a la db
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Administrador administrador = new Administrador();
                administrador.setIdUsuario(resultSet.getInt(1));
                administrador.setNombre(resultSet.getString(2));
                administrador.setApellido(resultSet.getString(3));
                administrador.setDni(resultSet.getInt(4));
                administrador.setContrasenha(resultSet.getString(5));
                administrador.setTelefono(resultSet.getInt(6));
                administrador.setCorreo(resultSet.getString(7));
                administrador.setMotivoRechazo(resultSet.getString(8));
                administrador.setAvatar(resultSet.getString(9));
                String fechaAcceso = obtenerDiferenciaFecha(resultSet.getString(10));
                administrador.setUltimoAcceso(fechaAcceso);
                administrador.setIdRol(resultSet.getInt(11));
                administrador.setIdManager(resultSet.getInt(12));
                administrador.setIdEstadosUsuarios(resultSet.getInt(13));

                //le saco todos los valores del resultset que retorna en cada linea de querie y
                //lo almaceno a la lista
                lista.add(administrador);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }

    public ArrayList<Administrador> listarDespedidos() {
        ArrayList<Administrador> lista = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select * from mydb.usuarios where usuarios.idRol = 2 AND usuarios.idEstadosUsuarios = 2;";
        String url = "jdbc:mysql://localhost:3306/mydb";

        //me conecto a la db
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Administrador administrador = new Administrador();
                administrador.setIdUsuario(resultSet.getInt(1));
                administrador.setNombre(resultSet.getString(2));
                administrador.setApellido(resultSet.getString(3));
                administrador.setDni(resultSet.getInt(4));
                administrador.setContrasenha(resultSet.getString(5));
                administrador.setTelefono(resultSet.getInt(6));
                administrador.setCorreo(resultSet.getString(7));
                administrador.setMotivoRechazo(resultSet.getString(8));
                administrador.setAvatar(resultSet.getString(9));
                String fechaAcceso = obtenerDiferenciaFecha(resultSet.getString(10));
                administrador.setUltimoAcceso(fechaAcceso);
                administrador.setIdRol(resultSet.getInt(11));
                administrador.setIdManager(resultSet.getInt(12));
                administrador.setIdEstadosUsuarios(resultSet.getInt(13));

                //le saco todos los valores del resultset que retorna en cada linea de querie y
                //lo almaceno a la lista
                lista.add(administrador);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }



    public Administrador listar(String id) {

        Administrador administrador = null;
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
                    administrador = new Administrador();
                    administrador.setIdUsuario(resultSet.getInt(1));
                    administrador.setNombre(resultSet.getString(2));
                    administrador.setApellido(resultSet.getString(3));
                    administrador.setDni(resultSet.getInt(4));
                    administrador.setContrasenha(resultSet.getString(5));
                    administrador.setTelefono(resultSet.getInt(6));
                    administrador.setCorreo(resultSet.getString(7));
                    administrador.setMotivoRechazo(resultSet.getString(8));
                    administrador.setAvatar(resultSet.getString(9));
                    String fechaAcceso = obtenerDiferenciaFecha(resultSet.getString(10));
                    administrador.setUltimoAcceso(fechaAcceso);
                    administrador.setIdRol(resultSet.getInt(11));
                    administrador.setIdManager(resultSet.getInt(12));
                    administrador.setIdEstadosUsuarios(resultSet.getInt(13));

                    //le saco todos los valores del resultset que retorna en cada linea de querie y

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return administrador;
    }

    public ArrayList<Juego> listarJuegosAdmin(String id){
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
    public static void despedir(String adminId, String motivoDespido) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        String sql = "UPDATE usuarios SET usuarios.idEstadosUsuarios = 2, usuarios.motivoRechazo = ? where usuarios.idUsuario = ?;";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, motivoDespido);
            pstmt.setString(2, adminId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void recontratar(String adminId) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        String sql = "UPDATE usuarios SET idEstadosUsuarios = 1, motivoRechazo = NULL where idUsuario = ?";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, adminId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Juego listarJuego(String id){

        Juego juego = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "SELECT v.idVideojuego, g.idVideojuegoGeneral,g.NombreVideojuego, g.stock, v.precio, g.descripcion, g.imagen\n" +
                "from videojuegos v inner join videojuegogeneral g on (v.idVideojuegoGeneral = g.idVideojuegoGeneral) where v.idVideojuegoGeneral = ?\n";
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

    public static void ingresarMotivoDespido(String motivo, String id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String sql = "SELECT v.idVideojuego, g.idVideojuegoGeneral,g.NombreVideojuego, g.stock, v.precio, g.descripcion, g.imagen\n" +
                "from videojuegos v inner join videojuegogeneral g on (v.idVideojuegoGeneral = g.idVideojuegoGeneral) where v.idVideojuegoGeneral = ?\n";
        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, motivo);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Usuario validateUsernameAndPassword(String correo, String password) {

        Usuario usuario = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "SELECT correo FROM usuarios u where u.correo = ? and u.contraHashed = sha2(?,256)";

        String url = "jdbc:mysql://localhost:3306/luchoarmy";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, correo);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuario = obtenerUsuario(rs.getString(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }

    public Usuario obtenerUsuario(String correo) {

        Usuario usuario = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select * from usuarios where correo = ?";
        String url = "jdbc:mysql://localhost:3306/mydb";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, correo); //para que el id de videojuego coincida

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
}
