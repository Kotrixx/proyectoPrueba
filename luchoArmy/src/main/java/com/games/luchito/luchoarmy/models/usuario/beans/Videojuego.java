package com.games.luchito.luchoarmy.models.usuario.beans;

public class Videojuego {
    private int idVideojuego;
    private double precio;
    private double oferta;
    //private int idCategoria;
    //private int idConsola;
    private Categoria categoria;
    private Consola consola;
    private int idEstadosVideojuego;
    private int idUsuario;
    private int idvideojuegoGeneral;
    private int idCompra;
    private String nombre;
    private String imagen;
    private String descripcion;

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Consola getConsola() {
        return consola;
    }

    public void setConsola(Consola consola) {
        this.consola = consola;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
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

    public double getOferta() {
        return oferta;
    }

    public void setOferta(double oferta) {
        this.oferta = oferta;
    }




    public int getIdEstadosVideojuego() {
        return idEstadosVideojuego;
    }

    public void setIdEstadosVideojuego(int idEstadosVideojuego) {
        this.idEstadosVideojuego = idEstadosVideojuego;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdvideojuegoGeneral() {
        return idvideojuegoGeneral;
    }

    public void setIdvideojuegoGeneral(int idvideojuegoGeneral) {
        this.idvideojuegoGeneral = idvideojuegoGeneral;
    }

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }
}
