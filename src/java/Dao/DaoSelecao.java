package Dao;

import Model.Cronograma;
import Model.Edital;
import Model.Selecao;
import Model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoSelecao {

    private Connection con = null;

    public void inserirSelecao(Selecao selecao) {
        con = new ConnectionFactory().getConnection();
        String query = "insert into selecao(id_profAss, id_edital, data_ini, data_fim, qtd_vagas) value(?,?,?,?,?);";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, selecao.getProfessor().getId());
            ps.setInt(2, selecao.getEdital().getIdEdital());
            String[] dataI = selecao.getCronograma().getDataIni().split("-");
            String[] dataF = selecao.getCronograma().getDataFim().split("-");
            ps.setDate(3, java.sql.Date.valueOf(dataI[2] + "-" + dataI[1] + "-" + dataI[0]));
            ps.setDate(4, java.sql.Date.valueOf(dataF[2] + "-" + dataF[1] + "-" + dataF[0]));
            ps.setInt(5, selecao.getQtd_vagas());
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoSelecao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList listarSelecoes() {
        try {
            con = new ConnectionFactory().getConnection();
            PreparedStatement ps = con.prepareStatement("select * from selecao;");
            ResultSet rs = ps.executeQuery();
            ArrayList<Selecao> selecoes = new ArrayList();
            while (rs.next()) {
                PreparedStatement idEdi = con.prepareStatement("select * from edital where id_edital=" + rs
                        .getInt("id_edital"));
                ResultSet resultIdEdi = idEdi.executeQuery();

                Edital e = new Edital(resultIdEdi.getInt("id_edital"), resultIdEdi.getString("descricao"),
                        resultIdEdi.getString("link_edital"),
                        resultIdEdi.getString("titulo"), rs.getString("area"), rs.getString("lancado").equals("TRUE"));

                PreparedStatement prof = con.prepareStatement("select * from usuarios where id_usuario=" + rs
                        .getInt("id_profAss"));

                ResultSet resultProf = prof.executeQuery();

                Usuario p = new Usuario(rs.getInt("id_usuario"), Long.parseLong(rs.getString("matricula")),
                        rs.getString("login"), rs.getString("senha"), Long.parseLong(rs.getString("cpf")),
                        Long.parseLong(rs.getString("rg")), rs.getString("nome"), rs.getString("email"),
                        rs.getString("tipo"), rs.getString("avaliador").equals("TRUE"));

                Cronograma cron = new Cronograma(String.valueOf(rs.getDate("data_ini")), String.valueOf(rs.getDate("data_fim")));

                Selecao s = new Selecao(rs.getInt("id_selecao"), e, p, rs.getInt("qtd_vagas"), cron);

                selecoes.add(s);

                resultIdEdi.close();
                resultProf.close();
                idEdi.close();
                prof.close();
            }
            ps.close();
            rs.close();
            con.close();
            return selecoes;
        } catch (SQLException ex) {
            Logger.getLogger(DaoSelecao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void deletarSelecao(int idEdital) {
        try {
            con = new ConnectionFactory().getConnection();
            PreparedStatement ps = con.prepareStatement("delete from selecao where id_edital=" + idEdital);
            ps.execute();
            ps.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(DaoSelecao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Selecao buscaPorEdital(Edital e) {
        con = new ConnectionFactory().getConnection();
        String query = "select * from selecao where id_edital=" + e.getIdEdital();
        DaoUsuario user = new DaoUsuario();
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Selecao s = new Selecao(rs.getInt("id_selecao"), e,
                        user.getUser(rs.getInt("id_profAss")), rs.getInt("qtd_vagas"),
                        new Cronograma(rs.getString("data_ini"), rs.getString("data_fim")));
                rs.close();
                ps.close();
                con.close();
                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DaoSelecao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public ArrayList entreDatas(String dataIni, String dataFim, String professor, String titulo, String area) {
        con = new ConnectionFactory().getConnection();
        String query = "select id_selecao, id_profAss, id_edital, data_ini, data_fim, qtd_inscritos, qtd_vagas \n"
                + "from selecao join edital using(id_edital) where data_ini >= '" + dataIni + "' and data_fim <= '" + dataFim + "' and lancado='TRUE'";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            PreparedStatement idEdi = null;
            ResultSet resultIdEdi = null;
            PreparedStatement prof = null;
            ResultSet resultProf = null;
            ArrayList<Selecao> selecoes = new ArrayList<>();

            Usuario p = null;
            Edital e = null;

            while (rs.next()) {
                idEdi = con.prepareStatement("select * from edital where id_edital='" + rs
                        .getInt("id_edital") + "' and lancado=TRUE");

                resultIdEdi = idEdi.executeQuery();

                if (resultIdEdi.next()) {
                    e = new Edital(resultIdEdi.getInt("id_edital"), resultIdEdi.getString("descricao"),
                            resultIdEdi.getString("link_edital"),
                            resultIdEdi.getString("titulo"), resultIdEdi.getString("area"),
                            resultIdEdi.getString("lancado").equals("TRUE"));
                }
                prof = con.prepareStatement("select * from usuarios where id_usuario=" + rs
                        .getInt("id_profAss"));

                resultProf = prof.executeQuery();

                if (resultProf.next()) {
                    p = new Usuario(resultProf.getInt("id_usuario"), Long.parseLong(resultProf.getString("matricula")),
                            resultProf.getString("login"), resultProf.getString("senha"), Long.parseLong(resultProf.getString("cpf")),
                            Long.parseLong(resultProf.getString("rg")), resultProf.getString("nome"), resultProf.getString("email"),
                            resultProf.getString("tipo"), resultProf.getString("avaliador").equals("TRUE"));
                }

                Cronograma cron = new Cronograma(String.valueOf(rs.getDate("data_ini")), String.valueOf(rs.getDate("data_fim")));

                selecoes.add(new Selecao(rs.getInt("id_selecao"), e, p, rs.getInt("qtd_vagas"), cron));

                idEdi.close();
                prof.close();
                resultIdEdi.close();
                resultProf.close();
            }
            ps.execute();
            ps.close();

            ArrayList<Selecao> retornoP = new ArrayList<Selecao>();

            boolean entrou = true;

            if (!professor.equals("")) {
                entrou = false;
                for (Selecao s : selecoes) {
                    if (s.getProfessor().getNome().contains(professor)) {
                        if (!retornoP.contains(s)) {
                            retornoP.add(s);
                        }
                    }
                }
            }

            if (!titulo.equals("")) {
                entrou = false;
                for (Selecao s : selecoes) {
                    if (s.getEdital().getTitulo().contains(titulo)) {
                        if (!retornoP.contains(s)) {
                            retornoP.add(s);
                        }
                    }
                }
            }

            if (!area.equals("")) {
                entrou = false;
                for (Selecao s : selecoes) {
                    if (s.getEdital().getArea().contains(area)) {
                        if (!retornoP.contains(s)) {
                            retornoP.add(s);
                        }
                    }
                }
            }
            con.close();
            if (entrou) {
                return selecoes;
            } else {
                return retornoP;
            }

        } catch (SQLException ex) {
            Logger.getLogger(DaoSelecao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getId(int idEdital) {
        con = new ConnectionFactory().getConnection();
        String query = "select id_selecao from selecao where id_edital='" + idEdital + "'";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("id_selecao");
            } else {
                rs.close();
                ps.close();
                con.close();
                return 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DaoSelecao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int getQtdVagas(int idSelecao) {
        con = new ConnectionFactory().getConnection();
        String query = "select qtd_vagas from selecao where id_selecao=?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idSelecao);
            ResultSet rs = ps.executeQuery();
            int qtd = 0;
            if(rs.next()){
                qtd = rs.getInt("qtd_vagas");
            }
            rs.close();
            ps.close();
            con.close();
            return qtd;
        } catch (SQLException ex) {
            Logger.getLogger(DaoSelecao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

}
