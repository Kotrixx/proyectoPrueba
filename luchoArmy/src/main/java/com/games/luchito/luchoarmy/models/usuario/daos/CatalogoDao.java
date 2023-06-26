package com.games.luchito.luchoarmy.models.usuario.daos;

import com.games.luchito.luchoarmy.models.usuario.beans.Catalogo;
import com.games.luchito.luchoarmy.models.usuario.beans.Categoria;
import com.games.luchito.luchoarmy.models.usuario.beans.Consola;
import java.sql.*;
import java.util.ArrayList;

public class CatalogoDao extends BaseDao {


    public ArrayList<Catalogo> listarCatalogo() {
        ArrayList<Catalogo> lista = new ArrayList<>();

        String sql = "SELECT * FROM luchoarmy.catalogo cat\n" +
                "INNER JOIN luchoarmy.categoria c on cat.Categoria_idCategoria = c.idCategoria \n" +
                "INNER JOIN luchoarmy.consola con on cat.Consola_idConsola = con.idConsola\n" +
                "WHERE cat.retirado = ?\n" +
                "ORDER BY cat.idCatalogo;";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, 0);
            try (ResultSet resultSet = pstmt.executeQuery()) {

                while (resultSet.next()) {
                    Catalogo catalogo = new Catalogo();
                    fetchCatalogo(catalogo,resultSet);
                    lista.add(catalogo);
                }
            }
        }   catch (SQLException e) {
                System.out.println("No se pudo conectar");
                throw new RuntimeException(e);
            }
            return lista;
    }

    public ArrayList<Catalogo> listarCatalogoPagina(int page, int pageSize) {
        ArrayList<Catalogo> lista = new ArrayList<>();

        String sql = "SELECT * FROM luchoarmy.catalogo cat\n" +
                "INNER JOIN luchoarmy.categoria c on cat.Categoria_idCategoria = c.idCategoria \n" +
                "INNER JOIN luchoarmy.consola con on cat.Consola_idConsola = con.idConsola\n" +
                "WHERE cat.retirado = ?\n" +
                "ORDER BY cat.idCatalogo\n" +
                "LIMIT ?,?;";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, 0);
            int offset = (page - 1) * pageSize;
            pstmt.setInt(2, offset);
            pstmt.setInt(3, pageSize);
            try (ResultSet resultSet = pstmt.executeQuery()) {

                while (resultSet.next()) {
                    Catalogo catalogo = new Catalogo();
                    fetchCatalogo(catalogo,resultSet);
                    lista.add(catalogo);
                }
            }
        }   catch (SQLException e) {
            System.out.println("No se pudo conectar");
            throw new RuntimeException(e);
        }
        return lista;
    }


    public ArrayList<Catalogo> listarCatalogoXcategoria(int idCategoria) {
        ArrayList<Catalogo> lista = new ArrayList<>();

        String sql = "SELECT * FROM luchoarmy.catalogo cat\n" +
                "INNER JOIN luchoarmy.categoria c on cat.Categoria_idCategoria = c.idCategoria \n" +
                "INNER JOIN luchoarmy.consola con on cat.Consola_idConsola = con.idConsola\n" +
                "WHERE retirado = 0 AND cat.Categoria_idCategoria =?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, idCategoria);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    Catalogo catalogo = new Catalogo();
                    fetchCatalogo(catalogo,resultSet);
                    lista.add(catalogo);
                }
            }
        }   catch (SQLException e) {
            System.out.println("No se pudo conectar");
            throw new RuntimeException(e);
        }
        return lista;
    }



    public ArrayList<Catalogo> listarCatalogoXcategoriaXconsola(int idCategoria,int idConsola) {
        ArrayList<Catalogo> lista = new ArrayList<>();

        String sql = "SELECT * FROM luchoarmy.catalogo cat\n" +
                "INNER JOIN luchoarmy.categoria c on cat.Categoria_idCategoria = c.idCategoria \n" +
                "INNER JOIN luchoarmy.consola con on cat.Consola_idConsola = con.idConsola\n" +
                "WHERE retirado = 0 AND cat.Categoria_idCategoria =? AND cat.Categoria_idCategoria=?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, idCategoria);
            pstmt.setInt(2, idConsola);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                while (resultSet.next()) {
                    Catalogo catalogo = new Catalogo();
                    fetchCatalogo(catalogo,resultSet);
                    lista.add(catalogo);
                }
            }
        }   catch (SQLException e) {
            System.out.println("No se pudo conectar");
            throw new RuntimeException(e);
        }
        return lista;
    }

    public Catalogo obtenerJuegoCat(int idCatalogo) {
        Catalogo catalogo = null;
        String sql = "SELECT * FROM luchoarmy.catalogo cat\n" +
                "INNER JOIN luchoarmy.categoria c on cat.Categoria_idCategoria = c.idCategoria \n" +
                "INNER JOIN luchoarmy.consola con on cat.Consola_idConsola = con.idConsola\n" +
                "WHERE cat.idCatalogo = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, idCatalogo);
            try (ResultSet resultSet = pstmt.executeQuery()) {

                if (resultSet.next()) {
                    catalogo = new Catalogo();
                    fetchCatalogo(catalogo, resultSet);
                }
            }
        }   catch (SQLException e) {
            System.out.println("No se pudo conectar");
            throw new RuntimeException(e);
        }
        return catalogo;
    }


    private void fetchCatalogo(Catalogo catalogo, ResultSet resultSet) throws SQLException {
        catalogo.setIdCatalogo(resultSet.getInt("cat.idCatalogo"));
        catalogo.setNombre(resultSet.getString("cat.nombre"));
        catalogo.setStock(resultSet.getInt("cat.stock"));
        catalogo.setDescripcion(resultSet.getString("cat.descripcion"));
        catalogo.setImagen(resultSet.getBytes("cat.imagen"));
        catalogo.setRating(resultSet.getDouble("cat.rating"));
        catalogo.setPrecio(resultSet.getDouble("cat.precio"));
        catalogo.setOferta(resultSet.getDouble("cat.oferta"));
        Consola consola = new Consola();
        consola.setIdConsola(resultSet.getInt("cat.Consola_idConsola"));
        consola.setNombre(resultSet.getString("con.nombre"));
        catalogo.setConsola(consola);
        Categoria categoria = new Categoria();
        categoria.setIdCategoria (resultSet.getInt("cat.Categoria_idCategoria"));
        categoria.setNombre(resultSet.getString("c.nombre"));
        catalogo.setCategoria(categoria);
        catalogo.setRetirado(resultSet.getInt("cat.retirado"));
    }
    public ArrayList<Catalogo> buscarJuegoXnombre(String name) {

        ArrayList<Catalogo> listaCatalogo = new ArrayList<>();

        String sql = "SELECT * FROM luchoarmy.catalogo cat\n" +
                "INNER JOIN luchoarmy.categoria c on cat.Categoria_idCategoria = c.idCategoria \n" +
                "INNER JOIN luchoarmy.consola con on cat.Consola_idConsola = con.idConsola\n" +
                "WHERE lower(cat.nombre) LIKE ?";
        try (Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            String name2= "%"+name.toLowerCase()+"%";
            pstmt.setString(1, name2);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Catalogo catalogo = new Catalogo();
                    fetchCatalogo(catalogo, rs);

                    listaCatalogo.add(catalogo);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listaCatalogo;
    }
    public ArrayList<Catalogo> buscarJuegoXnombre2(String name,int page, int pageSize) {

        ArrayList<Catalogo> listaCatalogo = new ArrayList<>();

        String sql = "SELECT * FROM luchoarmy.catalogo cat\n" +
                "INNER JOIN luchoarmy.categoria c on cat.Categoria_idCategoria = c.idCategoria \n" +
                "INNER JOIN luchoarmy.consola con on cat.Consola_idConsola = con.idConsola\n" +
                "WHERE cat.retirado = ? and lower(cat.nombre) LIKE ?\n" +
                "LIMIT ?,?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            String name2= "%"+name.toLowerCase()+"%";
            pstmt.setInt(1, 0);
            pstmt.setString(2, name2);
            int offset = (page - 1) * pageSize;
            pstmt.setInt(3, offset);
            pstmt.setInt(4, pageSize);


            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Catalogo catalogo = new Catalogo();
                    fetchCatalogo(catalogo, rs);

                    listaCatalogo.add(catalogo);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return listaCatalogo;
    }
}