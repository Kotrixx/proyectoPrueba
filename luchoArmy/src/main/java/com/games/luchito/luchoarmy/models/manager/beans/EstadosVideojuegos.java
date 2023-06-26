package com.games.luchito.luchoarmy.models.manager.beans;

public class EstadosVideojuegos {
    public String estados(int id){
        String estado = null;
        switch (id){
            case 1:
                estado = "Disponible";
                break;
            case 2:
                estado = "Reservado";
                break;
            case 3:
                estado = "Comprado";
                break;
            case 4:
                estado = "Retirado";
                break;
        }
        return estado;
    }
}
