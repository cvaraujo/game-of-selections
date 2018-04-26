package Dao;

import Model.Edital;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoEdital {

    private Connection con = null;

    public void inserirEdital(Edital edital) {
        con = new ConnectionFactory().getConnection();
        String query = "insert into edital(titulo, descricao, link_edital, area, lancado) value(?, ?, ?, ?, ?);";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(2, edital.getDescricao());
            ps.setString(3, edital.getDirEdital());
            ps.setString(1, edital.getTitulo());
            ps.setString(4, edital.getArea());
            ps.setString(5, "FALSE");
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoEdital.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
    }

    public java.util.ArrayList listarEditais() {
        con = new ConnectionFactory().getConnection();
        try {
            PreparedStatement ps = con.prepareStatement("call listar_editais(?);");
            ps.setInt(1, 20);
            ResultSet rs = ps.executeQuery();
            java.util.ArrayList<Edital> editais = new java.util.ArrayList();
            while (rs.next()) {
                Edital e = new Edital(rs.getInt("id_edital"), rs.getString("descricao"),
                        rs.getString("link_edital"), rs.getString("titulo"), rs.getString("area"), rs.getString("lancado").equals("TRUE"));
                editais.add(e);
            }
            rs.close();
            ps.close();
            con.close();
            return editais;
        } catch (SQLException ex) {
            Logger.getLogger(DaoEdital.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return null;
    }

    public java.util.ArrayList listarEditaisNaoLancados() {
        try {
            con = new ConnectionFactory().getConnection();
            PreparedStatement ps = con.prepareStatement("select * from edital where lancado='FALSE' ORDER BY id_edital DESC;");
            ResultSet rs = ps.executeQuery();
            java.util.ArrayList<Edital> editais = new java.util.ArrayList();
            while (rs.next()) {
                Edital e = new Edital(rs.getInt("id_edital"), rs.getString("descricao"),
                        rs.getString("link_edital"), rs.getString("titulo"), rs.getString("area"),
                        rs.getString("lancado").equals("TRUE"));
                editais.add(e);
            }
            rs.close();
            ps.close();
            con.close();
            return editais;
        } catch (SQLException ex) {
            Logger.getLogger(DaoEdital.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return null;
    }

    public Edital buscarEdital(int id_edital) {
        con = new ConnectionFactory().getConnection();
        String query = "select * from edital where id_edital=" + id_edital;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            Edital e = null;
            if (rs.next()) {
                e = new Edital(rs.getInt("id_edital"), rs.getString("descricao"),
                        rs.getString("link_edital"), rs.getString("titulo"), rs.getString("area"),
                        rs.getString("lancado").equals("TRUE"));
            }
            ps.execute();
            ps.close();
            con.close();
            return e;
        } catch (SQLException ex) {
            Logger.getLogger(DaoEdital.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        return null;
    }

    public void deletarEdital(int idEdital) {
        con = new ConnectionFactory().getConnection();
        String query = "delete from edital where id_edital=" + idEdital;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoEdital.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
    }

    public ArrayList buscarPorTitulo(String titulo) {
        con = new ConnectionFactory().getConnection();
        String query = "select * from edital where titulo like '%" + titulo + "%' and lancado='TRUE'";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            ArrayList<Edital> editais = new ArrayList<>();
            while (rs.next()) {
                Edital e = new Edital(rs.getInt("id_edital"), rs.getString("descricao"),
                        rs.getString("link_edital"), rs.getString("titulo"), rs.getString("area"), rs.getString("lancado").equals("TRUE"));
                editais.add(e);
            }
            ps.close();
            rs.close();
            con.close();
            return editais;
        } catch (SQLException ex) {
            Logger.getLogger(DaoEdital.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList buscarPorTituloNaoLancados(String titulo) {
        con = new ConnectionFactory().getConnection();
        String query = "select * from edital where titulo like '%" + titulo + "%' and lancado='FALSE'";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            ArrayList<Edital> editais = new ArrayList<>();
            while (rs.next()) {
                Edital e = new Edital(rs.getInt("id_edital"), rs.getString("descricao"),
                        rs.getString("link_edital"), rs.getString("titulo"), rs.getString("area"), rs.getString("lancado").equals("TRUE"));
                editais.add(e);
            }
            ps.close();
            rs.close();
            con.close();
            return editais;
        } catch (SQLException ex) {
            Logger.getLogger(DaoEdital.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList buscarEdital(String titulo) {
        con = new ConnectionFactory().getConnection();
        String query = "select * from edital where titulo='" + titulo + "'";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            ArrayList<Edital> editais = new ArrayList<>();
            if (rs.next()) {
                Edital e = new Edital(rs.getInt("id_edital"), rs.getString("descricao"),
                        rs.getString("link_edital"), rs.getString("titulo"), rs.getString("area"), rs.getString("lancado").equals("TRUE"));
                editais.add(e);
                rs.close();
                ps.close();
                con.close();
                return editais;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoEdital.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList meusEditais(int id_usuario) {
        con = new ConnectionFactory().getConnection();
        String query = "select titulo, id_edital, area, descricao, link_edital, lancado "
                + "from alunos_inscritos join selecao using(id_selecao) join edital using(id_edital) where id_aluno=?;";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id_usuario);
            ResultSet rs = ps.executeQuery();
            ArrayList<Edital> editais = new ArrayList<>();
            while (rs.next()) {
                Edital e = new Edital(rs.getInt("id_edital"), rs.getString("descricao"),
                        rs.getString("link_edital"), rs.getString("titulo"), rs.getString("area"),
                        rs.getString("lancado").equals("TRUE"));
                editais.add(e);
            }
            rs.close();
            ps.close();
            con.close();
            return editais;
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList meusEditaisProf(int id_prof) {
        con = new ConnectionFactory().getConnection();
        String query = "select titulo, id_edital, area, descricao, link_edital, lancado "
                + "from usuarios,selecao join edital using(id_edital) where id_usuario = id_profAss and id_profAss=" + id_prof;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            ArrayList<Edital> editais = new ArrayList<>();
            while (rs.next()) {
                Edital e = new Edital(rs.getInt("id_edital"), rs.getString("descricao"),
                        rs.getString("link_edital"), rs.getString("titulo"), rs.getString("area"),
                        rs.getString("lancado").equals("TRUE"));
                editais.add(e);
            }
            rs.close();
            ps.close();
            con.close();
            return editais;
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList meusEditaisProfAvaliador(int id_prof) {
        con = new ConnectionFactory().getConnection();
        String query = "select distinct ed.id_edital,ed.titulo,ed.descricao, ed.link_edital,ed.area,ed.lancado \n"
                + "from selecao as s join etapa as e using(id_selecao) join edital as ed using(id_edital) \n"
                + "where e.id_avaliador = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id_prof);
            ResultSet rs = ps.executeQuery();
            ArrayList<Edital> editais = new ArrayList<>();
            while (rs.next()) {
                Edital e = new Edital(rs.getInt("id_edital"), rs.getString("descricao"),
                        rs.getString("link_edital"), rs.getString("titulo"), rs.getString("area"),
                        rs.getString("lancado").equals("TRUE"));
                editais.add(e);
            }
            rs.close();
            ps.close();
            con.close();
            return editais;
        } catch (SQLException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void LancaEdital(int id_edital) {
        con = new ConnectionFactory().getConnection();
        String query = "update edital set lancado='TRUE' where id_edital='" + id_edital + "'";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoEdital.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int qtdInscritos(int idEdital) {
        con = new ConnectionFactory().getConnection();
        String query = "select qtd_inscritos from selecao where id_edital=" + idEdital;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("qtd_inscritos");
            }
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoEdital.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }
}
