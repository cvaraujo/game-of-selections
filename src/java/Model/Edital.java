package Model;

import java.io.Serializable;

public class Edital implements Serializable{

    private int idEdital;
    private String descricao;
    private String dirEdital;
    private String titulo;
    private int qtd_inscritos;
    private String area;
    private boolean lancado;

    public Edital(int idEdital, String descricao, String dirEdital, String titulo, String area, boolean lancado) {
        this.idEdital = idEdital;
        this.descricao = descricao;
        this.dirEdital = dirEdital;
        this.titulo = titulo;
        this.qtd_inscritos = 0;
        this.area = area;
        this.lancado = lancado;
    }

    public Edital(String descricao, String dirEdital, String titulo, int qtd_inscritos, String area, boolean lancado) {
        this.descricao = descricao;
        this.dirEdital = dirEdital;
        this.titulo = titulo;
        this.qtd_inscritos = qtd_inscritos;
        this.area = area;
        this.lancado = lancado;
    }

    public int getIdEdital() {
        return idEdital;
    }

    public void setIdEdital(int idEdital) {
        this.idEdital = idEdital;
    }

    public String getDirEdital() {
        return dirEdital;
    }

    public void setDirEdital(String dirEdital) {
        this.dirEdital = dirEdital;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getQtd_inscritos() {
        return qtd_inscritos;
    }

    public void setQtd_inscritos(int qtd_inscritos) {
        this.qtd_inscritos = qtd_inscritos;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public boolean isLancado() {
        return lancado;
    }

    public void setLancado(boolean lancado) {
        this.lancado = lancado;
    }

    @Override
    public String toString() {
        return "Edital " + " idEdital: " + idEdital + " descricao: " + descricao + " dirEdital: " + dirEdital;
    }

}
