package com.games.luchito.luchoarmy.models.manager.daos;
import com.games.luchito.luchoarmy.models.manager.beans.Categoria;

import java.sql.*;
import java.util.ArrayList;

public class CategoriaDao extends BaseDao{

    public ArrayList<Categoria> listarCategorias() {
        ArrayList<Categoria> categorias = new ArrayList<>();
        String sql = "select * from Categoria;";
        try (Connection connection = this.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(resultSet.getInt(1));
                categoria.setNombre(resultSet.getString(2));
                categorias.add(categoria);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return categorias;
    }
    /*
    public ArrayList<Categoria> listarCategorias() {
        ArrayList<Categoria> categorias = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select * from Categoria;";
        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(resultSet.getInt(1));
                categoria.setNombre(resultSet.getString(2));
                categorias.add(categoria);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return categorias;
    }

     */
}
