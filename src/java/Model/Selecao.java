package Model;

import java.io.Serializable;
import java.util.List;

public class Selecao implements Serializable{

    private Edital edital;
    private Usuario professor;
    private int qtd_vagas;
    private Cronograma cronograma;
    private int id_selecao;

    public Selecao(int id_selecao, Edital edital, Usuario professor, int qtd_vagas, Cronograma cronograma) {
        this.edital = edital;
        this.professor = professor;
        this.qtd_vagas = qtd_vagas;
        this.cronograma = cronograma;
        this.id_selecao = id_selecao;
    }

    public Selecao(List<Etapa> etapas, Edital edital, Usuario professor, int qtd_vagas, Cronograma cronograma, List<Usuario> alunos, List<Usuario> selecionados) {
        this.edital = edital;
        this.professor = professor;
        this.qtd_vagas = qtd_vagas;
        this.cronograma = cronograma;
    }

    public Selecao(Edital edital, Usuario professor, int qtd_vagas, Cronograma cronograma) {
        this.edital = edital;
        this.professor = professor;
        this.qtd_vagas = qtd_vagas;
        this.cronograma = cronograma;
    }

    public Edital getEdital() {
        return edital;
    }

    public void setEdital(Edital edital) {
        this.edital = edital;
    }

    public Usuario getProfessor() {
        return professor;
    }

    public void setProfessor(Usuario professor) {
        this.professor = professor;
    }

    public int getQtd_vagas() {
        return qtd_vagas;
    }

    public void setQtd_vagas(int qtd_vagas) {
        this.qtd_vagas = qtd_vagas;
    }

    public Cronograma getCronograma() {
        return cronograma;
    }

    public void setCronograma(Cronograma cronograma) {
        this.cronograma = cronograma;
    }

    public int getId_selecao() {
        return id_selecao;
    }

    public void setId_selecao(int id_selecao) {
        this.id_selecao = id_selecao;
    }

}
