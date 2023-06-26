package com.games.luchito.luchoarmy.models.manager.beans;

public class Juego {

    private int idVideojuego; //esto es como el videojuego que se vende

    private int idVideojuegoGeneral; //este es el videojuego en general
    private String NombreVideojuego;
    private int stock;
    private double precio;
    private String oferta;
    private String descripcion;
    private String imagen;
    private Double rating; //Willy añadio esto
    private int idEstadosVideojuegos;

    private int unidades; //unidades vendidas
    private double ganancia; //ganancia con ese juego

    public String getOferta() {
        return oferta;
    }

    public void setOferta(String oferta) {
        this.oferta = oferta;
    }

    public int getIdVideojuego() {
        return idVideojuego;
    }

    public void setIdVideojuego(int idVideojuego) {
        this.idVideojuego = idVideojuego;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    public int getUnidades() {
        return unidades;
    }

    public void setUnidades(int unidades) {
        this.unidades = unidades;
    }

    public double getGanancia() {
        return ganancia;
    }

    public void setGanancia(double ganancia) {
        this.ganancia = ganancia;
    }

    public int getIdVideojuegoGeneral() {
        return idVideojuegoGeneral;
    }

    public void setIdVideojuegoGeneral(int idVideojuegoGeneral) {
        this.idVideojuegoGeneral = idVideojuegoGeneral;
    }

    public String getNombreVideojuego() {
        return NombreVideojuego;
    }

    public void setNombreVideojuego(String nombreVideojuego) {
        NombreVideojuego = nombreVideojuego;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public Double getRating() {return rating;}

    public void setRating(Double rating) {this.rating = rating;}

    public int getIdEstadosVideojuegos() {
        return idEstadosVideojuegos;
    }

    public void setIdEstadosVideojuegos(int idEstadosVideojuegos) {
        this.idEstadosVideojuegos = idEstadosVideojuegos;
    }
}
