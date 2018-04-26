package Dao;

import Model.Selecao;
import Model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoAlunosInscritos {

    Connection con = null;

    public void inscreverUsuario(Usuario u, Selecao s) {
        con = new ConnectionFactory().getConnection();
        String query = "insert into alunos_inscritos(id_aluno, id_selecao, situacao_aluno) value(?,?,?)";
        String update = "update selecao set qtd_inscritos=qtd_inscritos+? where id_selecao=" + s.getId_selecao();

        try {
            PreparedStatement ps = con.prepareStatement(query);
            PreparedStatement ps2 = con.prepareStatement(update);

            ps.setInt(1, u.getId());
            ps.setInt(2, s.getId_selecao());
            ps.setString(3, "NENHUMA");

            ps2.setInt(1, 1);

            ps2.execute();
            ps2.close();
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoSelecao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean estaNoEdital(int idAluno, int idSelecao) {
        con = new ConnectionFactory().getConnection();
        String query = "select * from alunos_inscritos where id_aluno=" + idAluno + " and id_selecao=" + idSelecao;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ps.close();
                rs.close();
                return true;
            }

            ps.close();
            rs.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoSelecao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList listaAlunosInscritos(int idSelecao) {
        con = new ConnectionFactory().getConnection();
        String query = "select id_aluno, nome, matricula from alunos_inscritos,"
                + "usuarios where id_aluno=id_usuario and id_selecao=" + idSelecao + "";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            ArrayList<Usuario> inscritos = new ArrayList<>();
            while (rs.next()) {
                Usuario u = new Usuario(rs.getString("nome"), rs.getLong("matricula"), rs.getInt("id_aluno"));
                inscritos.add(u);
            }
            rs.close();
            ps.close();
            con.close();
            return inscritos;
        } catch (SQLException ex) {
            Logger.getLogger(DaoAlunosInscritos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void aprova(int idAluno, int idSelecao, float notaFinal) {
        con = new ConnectionFactory().getConnection();
        String query = "update alunos_inscritos "
                + "set nota_final=?, situacao_aluno='DEFERIDO' where id_aluno=? and id_selecao=?;";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setFloat(1, notaFinal);
            ps.setInt(2, idAluno);
            ps.setInt(3, idSelecao);
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoAlunosInscritos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void reprova(int idAluno, int idSelecao, float notaFinal) {
        con = new ConnectionFactory().getConnection();
        String query = "update alunos_inscritos "
                + "set nota_final=?, situacao_aluno='INDEFERIDO' where id_aluno=? and id_selecao=?;";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setFloat(1, notaFinal);
            ps.setInt(2, idAluno);
            ps.setInt(3, idSelecao);
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoAlunosInscritos.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public String getSituacao(int idSelecao, int idUsuario) {
        con = new ConnectionFactory().getConnection();
        String query = "select situacao_aluno from alunos_inscritos where id_aluno=? and id_selecao=?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idUsuario);
            ps.setInt(2, idSelecao);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("situacao_aluno");
            }
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoAlunosInscritos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public String getNome(int idUsuario) {
        con = new ConnectionFactory().getConnection();
        String query = "select nome from usuarios where id_usuario = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();
            String nome = "";
            if (rs.next()) {
                nome = rs.getString("nome");
            }
            rs.close();
            ps.close();
            con.close();
            return nome;
        } catch (SQLException ex) {
            Logger.getLogger(DaoAlunosInscritos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
