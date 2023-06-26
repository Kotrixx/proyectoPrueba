package com.games.luchito.luchoarmy.models.manager.daos;
import com.games.luchito.luchoarmy.models.manager.beans.*;

import java.sql.*;
import java.util.ArrayList;

public class ConsolaDao {
    public ArrayList<Consola> listarConsolas() {
        ArrayList<Consola> listaConsolas = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String sql = "select * from Consola ";
        String url = "jdbc:mysql://localhost:3306/mydb";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet resultSet = stmt.executeQuery(sql)) {

            while (resultSet.next()) {
                Consola consola = new Consola();
                consola.setIdConsola(resultSet.getInt(1));
                consola.setNombre(resultSet.getString(2));
                listaConsolas.add(consola);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaConsolas;
    }
}
