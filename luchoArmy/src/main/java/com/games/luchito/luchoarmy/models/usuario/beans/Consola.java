package com.games.luchito.luchoarmy.models.usuario.beans;

public class Consola {
    private String nombre;
    private int idConsola;

    public Consola() {

    }

    public Consola(String nombre, int idConsola) {
        this.nombre = nombre;
        this.idConsola = idConsola;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdConsola() {
        return idConsola;
    }

    public void setIdConsola(int idConsola) {
        this.idConsola = idConsola;
    }




}
