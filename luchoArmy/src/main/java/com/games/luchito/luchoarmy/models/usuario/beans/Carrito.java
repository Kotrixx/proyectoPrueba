package com.games.luchito.luchoarmy.models.usuario.beans;

import java.util.ArrayList;

public class Carrito {
    //private int Videojuegos_idVideojuego;
    private int Usuarios_idUsuario;
    private int cantidad;
    private ArrayList<Videojuego> videojuegos;

    public ArrayList<Videojuego> getVideojuegos() {
        return videojuegos;
    }

    public void setVideojuegos(ArrayList<Videojuego> videojuegos) {
        this.videojuegos = videojuegos;
    }

    public int getUsuarios_idUsuario() {
        return Usuarios_idUsuario;
    }

    public void setUsuarios_idUsuario(int usuarios_idUsuario) {
        Usuarios_idUsuario = usuarios_idUsuario;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}
