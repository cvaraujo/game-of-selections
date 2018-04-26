package Dao;

import Model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoUsuario {

    private Connection con = null;

    public boolean inserirUsuario(Usuario aluno) {
        con = new ConnectionFactory().getConnection();
        String query = "insert into usuarios(nome, cpf, rg, matricula, email, login, senha, tipo, avaliador) value(?,?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, aluno.getNome());
            ps.setString(2, String.valueOf(aluno.getCpf()));
            ps.setString(3, String.valueOf(aluno.getRg()));
            ps.setString(4, String.valueOf(aluno.getMatricula()));
            ps.setString(5, aluno.getEmail());
            ps.setString(6, aluno.getLogin());
            ps.setString(7, aluno.getSenha());
            ps.setString(8, "ALUNO");
            ps.setString(9, "FALSE");
            try {
                ps.execute();
            } catch (SQLException e) {
                con.close();
                return true;
            }
            ps.close();
            con.close();
            return false;
        } catch (SQLException ex) {
            ex.getCause();
        }
        return false;
    }

    public ArrayList listarAlunos() {
        try {
            con = new ConnectionFactory().getConnection();
            PreparedStatement ps = con.prepareStatement("select * from usuarios where tipo=ALUNO;");
            ResultSet rs = ps.executeQuery();
            ArrayList<Usuario> alunos = new ArrayList();
            while (rs.next()) {
                Usuario a = new Usuario(rs.getInt("id_usuario"), Long.parseLong(rs.getString("matricula")),
                        rs.getString("login"), rs.getString("senha"), Long.parseLong(rs.getString("cpf")),
                        Long.parseLong(rs.getString("rg")), rs.getString("nome"), rs.getString("email"),
                        rs.getString("tipo"), rs.getString("avaliador").equals("TRUE"));
                alunos.add(a);
            }
            rs.close();
            ps.close();
            con.close();
            return alunos;
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(DaoUsuario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList listarProfessores() {
        try {
            con = new ConnectionFactory().getConnection();
            PreparedStatement ps = con.prepareStatement("select * from usuarios where tipo='PROFESSOR';");
            ResultSet rs = ps.executeQuery();
            ArrayList<Usuario> alunos = new ArrayList();
            while (rs.next()) {
                Usuario a = new Usuario(rs.getInt("id_usuario"), Long.parseLong(rs.getString("matricula")),
                        rs.getString("login"), rs.getString("senha"), Long.parseLong(rs.getString("cpf")),
                        Long.parseLong(rs.getString("rg")), rs.getString("nome"), rs.getString("email"),
                        rs.getString("tipo"), rs.getString("avaliador").equals("TRUE"));
                alunos.add(a);
            }
            rs.close();
            ps.close();
            con.close();
            return alunos;
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(DaoUsuario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList listarUsuarios() {
        try {
            con = new ConnectionFactory().getConnection();
            PreparedStatement ps = con.prepareStatement("select * from usuarios");
            ResultSet rs = ps.executeQuery();
            ArrayList<Usuario> alunos = new ArrayList();
            while (rs.next()) {
                Usuario a = new Usuario(rs.getInt("id_usuario"), Long.parseLong(rs.getString("matricula")),
                        rs.getString("login"), rs.getString("senha"), Long.parseLong(rs.getString("cpf")),
                        Long.parseLong(rs.getString("rg")), rs.getString("nome"), rs.getString("email"),
                        rs.getString("tipo"), rs.getString("avaliador").equals("TRUE"));
                alunos.add(a);
            }
            rs.close();
            ps.close();
            con.close();
            return alunos;
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(DaoUsuario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return null;
    }

    public void liberarPrivilegios(int idUsuario, String tipo) {
        try {
            con = new ConnectionFactory().getConnection();
            PreparedStatement ps = con.prepareStatement("update usuarios set tipo=? where id_usuario=" + idUsuario);
            ps.setString(1, tipo);
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario validarUsuario(String login, String senha) {
        con = new ConnectionFactory().getConnection();
        String query = "select * from usuarios where login='" + login + "' and senha='" + senha + "'";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Usuario(rs.getInt("id_usuario"), rs.getLong("matricula"), rs.getString("login"),
                        rs.getString("senha"), rs.getLong("cpf"), rs.getLong("rg"), rs.getString("nome"),
                        rs.getString("email"), rs.getString("tipo"), rs.getString("avaliador").equals("TRUE"));
            }
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println("Deu exepition");
            return null;
        }
        return null;
    }

    public Usuario getUser(int id) {
        con = new ConnectionFactory().getConnection();
        String query = "select * from usuarios where id_usuario=" + id;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Usuario a = new Usuario(rs.getInt("id_usuario"), Long.parseLong(rs.getString("matricula")),
                        rs.getString("login"), rs.getString("senha"), Long.parseLong(rs.getString("cpf")),
                        Long.parseLong(rs.getString("rg")), rs.getString("nome"), rs.getString("email"),
                        rs.getString("tipo"), rs.getString("avaliador").equals("TRUE"));
                rs.close();
                ps.close();
                con.close();
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void alterarSenha(String senha, String login) {
        con = new ConnectionFactory().getConnection();
        String query = "update usuarios set senha=? where login='" + login + "'";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, senha);
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario getUsuario(long cpf) {
        con = new ConnectionFactory().getConnection();
        String query = "select * from usuarios where cpf='" + cpf + "'";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Usuario a = new Usuario(rs.getInt("id_usuario"), Long.parseLong(rs.getString("matricula")),
                        rs.getString("login"), rs.getString("senha"), Long.parseLong(rs.getString("cpf")),
                        Long.parseLong(rs.getString("rg")), rs.getString("nome"), rs.getString("email"),
                        rs.getString("tipo"), rs.getString("avaliador").equals("TRUE"));
                rs.close();
                ps.close();
                con.close();
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void alterarSenha(int idUsuario, String senha) {
        con = new ConnectionFactory().getConnection();
        String query = "update usuarios set senha=? where id_usuario=" + idUsuario;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, senha);
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void alterarEmail(String email, int idUsuario) {
        con = new ConnectionFactory().getConnection();
        String query = "update usuarios set email=? where id_usuario=" + idUsuario;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void alterarNome(int idUsuario, String nome) {
        con = new ConnectionFactory().getConnection();
        String query = "update usuarios set nome=? where id_usuario=" + idUsuario;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, nome);
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList listarUsuariosPorNome(String nome) {
        con = new ConnectionFactory().getConnection();
        String query = "select * from usuarios where nome like '%" + nome + "%'";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            ArrayList<Usuario> alunos = new ArrayList();
            while (rs.next()) {
                Usuario a = new Usuario(rs.getInt("id_usuario"), Long.parseLong(rs.getString("matricula")),
                        rs.getString("login"), rs.getString("senha"), Long.parseLong(rs.getString("cpf")),
                        Long.parseLong(rs.getString("rg")), rs.getString("nome"), rs.getString("email"),
                        rs.getString("tipo"), rs.getString("avaliador").equals("TRUE"));
                alunos.add(a);
            }
            rs.close();
            ps.close();
            con.close();
            return alunos;
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(DaoUsuario.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return null;
    }

    public Usuario buscarProfAvaliador(String nome, String login) {
        con = new ConnectionFactory().getConnection();
        String query = "select * from usuarios where nome= ? and login = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, nome);
            ps.setString(2, login);
            ResultSet rs = ps.executeQuery();
            Usuario a = null;
            if (rs.next()) {
                a = new Usuario(rs.getInt("id_usuario"), Long.parseLong(rs.getString("matricula")),
                        rs.getString("login"), rs.getString("senha"), Long.parseLong(rs.getString("cpf")),
                        Long.parseLong(rs.getString("rg")), rs.getString("nome"), rs.getString("email"),
                        rs.getString("tipo"), rs.getString("avaliador").equals("TRUE"));
                rs.close();
                ps.close();
            }
            rs.close();
            ps.close();
            con.close();
            return a;
        } catch (SQLException ex) {
            ex.getCause();
        }
        return null;
    }

    public int buscarProfAvaliadorId(String nome, String login) {
        con = new ConnectionFactory().getConnection();
        String query = "select id_usuario from usuarios where nome= ? and login = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, nome);
            ps.setString(2, login);
            ResultSet rs = ps.executeQuery();
            int id_prof = 0;
            if (rs.next()) {
                id_prof = rs.getInt("id_usuario");
                rs.close();
                ps.close();
            }
            rs.close();
            ps.close();
            con.close();
            return id_prof;
        } catch (SQLException ex) {
            ex.getCause();
        }
        return 0;
    }
}
