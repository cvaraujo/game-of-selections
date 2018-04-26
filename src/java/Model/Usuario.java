package Model;

import java.io.Serializable;

public class Usuario implements Serializable{

    private String login;

    private String senha;

    private long cpf;

    private long rg;

    private String nome;

    private String email;

    private long matricula;

    private int id;

    private String tipo;

    private boolean avaliador;

    public Usuario(int id, long matricula, String login, String senha, long cpf, long rg, String nome, String email,
            String tipo, boolean avaliador) {
        this.login = login;
        this.senha = senha;
        this.cpf = cpf;
        this.rg = rg;
        this.nome = nome;
        this.email = email;
        this.matricula = matricula;
        this.id = id;
        this.tipo = tipo;
        this.avaliador = avaliador;
    }

    public Usuario(String login, String senha, long cpf, long rg, String nome, String email, long matricula, String tipo, boolean avaliador) {
        this.login = login;
        this.senha = senha;
        this.cpf = cpf;
        this.rg = rg;
        this.nome = nome;
        this.email = email;
        this.matricula = matricula;
        this.tipo = tipo;
        this.avaliador = avaliador;
    }

    public Usuario(String nome, long matricula, int id) {
        this.nome = nome;
        this.matricula = matricula;
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public long getCpf() {
        return cpf;
    }

    public void setCpf(long cpf) {
        this.cpf = cpf;
    }

    public long getRg() {
        return rg;
    }

    public void setRg(long rg) {
        this.rg = rg;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public long getMatricula() {
        return matricula;
    }

    public void setMatricula(long matricula) {
        this.matricula = matricula;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public boolean isAvaliador() {
        return avaliador;
    }

    public void setAvaliador(boolean avaliador) {
        this.avaliador = avaliador;
    }

    public String toString() {
        return "Usuario login=" + login + ", senha= " + senha + ", cpf= " + cpf + ", rg= " + rg + ", nome= " + nome + ", email= " + email;
    }
}
