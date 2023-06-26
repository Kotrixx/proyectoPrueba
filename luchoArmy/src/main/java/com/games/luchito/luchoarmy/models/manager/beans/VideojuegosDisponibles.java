package com.games.luchito.luchoarmy.models.manager.beans;

public class VideojuegosDisponibles {

    private int idVideoDisponible;
    private String nombre;
    private String descripcion;
    private double precio;
    private String imagen;
    //TODAVIA NO SE SI PONER EL idCategoria o solo el nombre de la categoria
    private String Categoria;
    //private double oferta;

    public int getIdVideoDisponible(int anInt) {
        return idVideoDisponible;
    }

    public void setIdVideoDisponible(int idVideoDisponible) {
        this.idVideoDisponible = idVideoDisponible;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getCategoria() {
        return Categoria;
    }

    public void setCategoria(String categoria) {
        Categoria = categoria;
    }
}
