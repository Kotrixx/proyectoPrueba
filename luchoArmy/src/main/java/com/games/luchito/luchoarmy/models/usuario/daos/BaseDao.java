package com.games.luchito.luchoarmy.models.usuario.daos;

import java.sql.*;

public abstract class BaseDao {
    public Connection getConnection() throws SQLException{
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex){
            ex.printStackTrace();
        }
        String url = "jdbc:mysql://localhost:3306/luchoarmy";
        String user = "root";
        String pass = "root";

    return DriverManager.getConnection(url,user,pass);
    }
}
