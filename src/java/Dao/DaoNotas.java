/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Model.Nota;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author gunslinger
 */
public class DaoNotas {

    private Connection con = null;

    public ArrayList getNotas(int idUsuario, int idSelecao) {
        con = new ConnectionFactory().getConnection();
        String query = "select * from notas as n, alunos_inscritos as ai where n.id_aluno = ai.id_aluno \n"
                + "and n.id_selecao=? and n.id_selecao=ai.id_selecao and n.id_aluno=? and n.id_aluno = ai.id_aluno";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idSelecao);
            ps.setInt(2, idUsuario);
            ResultSet rs = ps.executeQuery();
            ArrayList<Float> notas = new ArrayList<>();
            while (rs.next()) {
                notas.add(rs.getFloat("nota"));
            }
            rs.close();
            ps.close();
            con.close();
            return notas;
        } catch (SQLException ex) {
            Logger.getLogger(DaoEtapa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int qtdEtapas(int idSelecao) {
        con = new ConnectionFactory().getConnection();
        String query = "select count(*) as qtd from etapa where id_selecao=?";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idSelecao);
            ResultSet rs = ps.executeQuery();
            int qtd = 0;
            if (rs.next()) {
                qtd = rs.getInt("qtd");
            }
            rs.close();
            ps.close();
            con.close();
            return qtd;
        } catch (SQLException ex) {
            Logger.getLogger(DaoNotas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public void inserirNota(int idSelecao, int idEtapa, int idAluno, float nota) {
        con = new ConnectionFactory().getConnection();
        String query = "insert into notas(id_aluno, id_etapa, id_selecao, nota) "
                + "value(?,?, ?, ?)";
        String avaliadaQuery = "update etapa set avaliada='TRUE' where id_etapa=?";
        try {
            PreparedStatement ps1 = con.prepareStatement(avaliadaQuery);
            ps1.setInt(1, idEtapa);
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idAluno);
            ps.setInt(2, idEtapa);
            ps.setInt(3, idSelecao);
            ps.setFloat(4, nota);
            ps1.execute();
            ps.execute();
            ps1.close();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoEtapa.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
    }

    public void alterarNota(int idSelecao, int idEtapa, int idAluno, float nota) {
        con = new ConnectionFactory().getConnection();
        String query = "update notas set nota=? where id_aluno=? and id_etapa=?"
                + " and id_selecao=? ";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(2, idAluno);
            ps.setInt(3, idEtapa);
            ps.setInt(4, idSelecao);
            ps.setFloat(1, nota);
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoEtapa.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
    }

    public Nota getMedia(int idAluno, int idSelecao) {
        con = new ConnectionFactory().getConnection();
        String query = "select sum(nota)/count(*) as media, notas.id_aluno \n"
                + "from etapa,notas where notas.id_aluno=? and etapa.id_selecao=? and etapa.id_etapa=notas.id_etapa";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idAluno);
            ps.setInt(2, idSelecao);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Nota n = new Nota(rs.getInt("id_aluno"), rs.getFloat("media"));
                rs.close();
                ps.close();
                con.close();
                return n;
            } else {
                rs.close();
                ps.close();
                con.close();
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoEtapa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean jaTemNota(int idSelecao, int idEtapa, int idAluno) {
        con = new ConnectionFactory().getConnection();
        String query = "select nota from notas where id_selecao=? and id_etapa=? and id_aluno=?";
        boolean tem = false;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idSelecao);
            ps.setInt(2, idEtapa);
            ps.setInt(3, idAluno);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                tem = true;
            }
            rs.close();
            ps.close();
            con.close();
            return tem;
        } catch (SQLException ex) {
            Logger.getLogger(DaoNotas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tem;
    }

    public boolean lancaAprovado(int idSelecao) {
        con = new ConnectionFactory().getConnection();
        String query = "select avaliada from etapa where id_selecao = ?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idSelecao);
            ResultSet rs = ps.executeQuery();
            ArrayList<String> avaliadas = new ArrayList<>();
            while (rs.next()) {
                avaliadas.add(rs.getString("avaliada"));
            }
            rs.close();
            ps.close();

            boolean foiAvaliada = true;
            for (String a : avaliadas) {
                if (a.equals("FALSE")) {
                    foiAvaliada = false;
                }
            }
            con.close();
            return foiAvaliada;
        } catch (SQLException ex) {
            Logger.getLogger(DaoNotas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
