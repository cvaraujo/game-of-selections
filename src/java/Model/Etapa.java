package Model;

import java.io.Serializable;

public class Etapa implements Serializable{

    private int idEtapa;
    private int idSelecao;
    private int idAvaliador;
    private int idAluno;

    public Etapa(int idEtapa, int idSelecao, int idAvaliador) {
        this.idEtapa = idEtapa;
        this.idSelecao = idSelecao;
        this.idAvaliador = idAvaliador;
    }

    public Etapa(float nota, int idEtapa, int idSelecao) {
        this.idEtapa = idEtapa;
        this.idSelecao = idSelecao;
    }

    public Etapa(float nota, int idEtapa, int idSelecao, int idAvaliador, int idAluno) {
        this.idEtapa = idEtapa;
        this.idSelecao = idSelecao;
        this.idAvaliador = idAvaliador;
        this.idAluno = idAluno;
    }

    public int getIdAluno() {
        return idAluno;
    }

    public void setIdAluno(int idAluno) {
        this.idAluno = idAluno;
    }

    public int getIdEtapa() {
        return idEtapa;
    }

    public void setIdEtapa(int idEtapa) {
        this.idEtapa = idEtapa;
    }

    public int getIdSelecao() {
        return idSelecao;
    }

    public void setIdSelecao(int idSelecao) {
        this.idSelecao = idSelecao;
    }

    public int getIdAvaliador() {
        return idAvaliador;
    }

    public void setIdAvaliador(int idAvaliador) {
        this.idAvaliador = idAvaliador;
    }

}
