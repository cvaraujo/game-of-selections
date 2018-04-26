/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author gunslinger
 */
public class Nota implements Comparable<Nota> {

    private int idAluno;
    private float nota;

    public Nota(int idAluno, float nota) {
        this.idAluno = idAluno;
        this.nota = nota;
    }

    public int getIdAluno() {
        return idAluno;
    }

    public void setIdAluno(int id_aluno) {
        this.idAluno = id_aluno;
    }

    public float getNota() {
        return nota;
    }

    public void setNota(float nota) {
        this.nota = nota;
    }

    @Override
    public int compareTo(Nota t) {
        return Float.compare(t.getNota(), getNota());

    }

}
