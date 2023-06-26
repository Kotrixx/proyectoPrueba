package com.games.luchito.luchoarmy.models.usuario.beans;

public class EstadoUsuario {
    private int idEstadosUsuarios;
    private String estado;

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getIdEstadosUsuarios() {
        return idEstadosUsuarios;
    }

    public void setIdEstadosUsuarios(int idEstadosUsuarios) {
        this.idEstadosUsuarios = idEstadosUsuarios;
    }
}
