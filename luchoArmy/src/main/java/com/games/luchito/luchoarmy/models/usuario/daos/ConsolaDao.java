package com.games.luchito.luchoarmy.models.usuario.daos;
import com.games.luchito.luchoarmy.models.usuario.beans.Catalogo;
import com.games.luchito.luchoarmy.models.usuario.beans.Consola;

import java.sql.*;
import java.util.ArrayList;

public class ConsolaDao extends BaseDao{
    public ArrayList<Consola> listarConsolas() {
        ArrayList<Consola> lista = new ArrayList<>();

        String sql = "SELECT * FROM consola;";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            try (ResultSet resultSet = pstmt.executeQuery()) {

                while (resultSet.next()) {
                    Consola consola = new Consola();
                    consola.setIdConsola(resultSet.getInt("idConsola"));
                    consola.setNombre(resultSet.getString("nombre"));
                    lista.add(consola);
                }
            }
        }   catch (SQLException e) {
            System.out.println("No se pudo conectar");
            throw new RuntimeException(e);
        }
        return lista;
    }
}
