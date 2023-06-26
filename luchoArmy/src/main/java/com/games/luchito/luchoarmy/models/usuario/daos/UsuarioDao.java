package com.games.luchito.luchoarmy.models.usuario.daos;

import com.games.luchito.luchoarmy.models.usuario.beans.Rol;
import com.games.luchito.luchoarmy.models.usuario.beans.Usuario;

import java.sql.*;

public class UsuarioDao extends BaseDao{

    public Usuario obtenerUsuario(int id){
        Usuario user = new Usuario();
        String sql = "select * from usuarios where idUsuario = ?";
        try (Connection connection = this.getConnection();
              PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user.setIdUsuario(rs.getInt(1));
                    user.setNombre(rs.getString(2));
                    user.setApellido(rs.getString(3));
                    user.setDni(rs.getInt(4));
                    user.setContrasenha(rs.getString(5));
                    user.setTelefono(rs.getInt("telefono"));
                    user.setCorreo(rs.getString("correo"));
                    user.setMotivoRechazo("motivoRechazo");
                    user.setAvatar("avatar");
                    Rol rol = new Rol();
                    rol.setIdRol(rs.getInt("idRol"));
                    user.setRol(rol);
                }
            }

        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }
    public Usuario validateUsernameAndPassword(String correo, String password) {
        Usuario usuario = null;
        String sql = "SELECT idUsuario FROM usuarios u where u.correo = ? and u.contrasenha = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, correo);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuario = obtenerUsuario(rs.getInt(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }



    public void guardarUsuario(Usuario user){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:mysql://localhost:3306/luchoarmy";
        String sql = "INSERT INTO usuarios (nombre, apellido, dni, contrasenha, telefono, correo,idRol,idEstadosUsuarios,ultimoAcceso) \n" +
                "VALUES (?,?,?,sha2(?,256),?,?,3,1,date(now()))";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1,user.getNombre());
            pstmt.setString(2,user.getApellido());
            pstmt.setInt(3,user.getDni());
            pstmt.setString(4,user.getContrasenha());
            pstmt.setInt(5,user.getTelefono());
            pstmt.setString(6,user.getCorreo());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
