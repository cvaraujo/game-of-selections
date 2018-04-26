package Dao;

import Model.Etapa;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoEtapa {

    private Connection con = null;

    public void inserirEtapa(int id_selecao) {
        con = new ConnectionFactory().getConnection();
        String query = "insert into etapa(id_selecao) value(?)";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id_selecao);
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoEtapa.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList getEtapas(int idSelecao) {
        try {
            con = new ConnectionFactory().getConnection();
            PreparedStatement ps = con.prepareStatement("select * from etapa where id_selecao =" + idSelecao);
            ResultSet rs = ps.executeQuery();
            ArrayList<Etapa> etapas = new ArrayList<>();
            while (rs.next()) {
                Etapa e = new Etapa(rs.getInt("id_etapa"), rs.getInt("id_selecao"), rs.getInt("id_avaliador"));
                etapas.add(e);
            }
            rs.close();
            ps.close();
            con.close();
            return etapas;
        } catch (SQLException ex) {
            Logger.getLogger(DaoEtapa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void AssociarProfessorEtapa(int idProf, int idSelecao, int idEtapa) {
        con = new ConnectionFactory().getConnection();
        String query = "update etapa set id_avaliador=? where id_etapa=? and id_selecao=?";
        String atualizaQuery = "call tornar_avaliador(?)";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            PreparedStatement ps1 = con.prepareStatement(atualizaQuery);
            ps.setInt(1, idProf);
            ps.setInt(2, idEtapa);
            ps.setInt(3, idSelecao);
            ps1.setInt(1, idProf);
            ps1.execute();
            ps.execute();
            ps1.close();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoEtapa.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList etapasProfAvaliador(int idProfAvaliador, int idSelecao) {
        con = new ConnectionFactory().getConnection();
        String query = "select id_etapa from etapa where id_selecao = ? and id_avaliador = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idSelecao);
            ps.setInt(2, idProfAvaliador);
            ResultSet rs = ps.executeQuery();
            ArrayList<Integer> etapas = new ArrayList<>();
            while (rs.next()) {
                etapas.add(rs.getInt("id_etapa"));
            }
            rs.close();
            ps.close();
            con.close();
            return etapas;
        } catch (SQLException ex) {
            Logger.getLogger(DaoEtapa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
