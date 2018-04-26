/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Dao.DaoEdital;
import Dao.DaoEtapa;
import Dao.DaoSelecao;
import Dao.DaoUsuario;
import Model.Cronograma;
import Model.Edital;
import Model.Selecao;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gunslinger
 */
public class CadastraEdital extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            DaoEdital dao = new DaoEdital();
            DaoSelecao daoS = new DaoSelecao();
            DaoEtapa daoEt = new DaoEtapa();
            DaoUsuario daoUs = new DaoUsuario();

            String nome = request.getParameter("nomeE");
            String descricao = request.getParameter("descricao");
            String linkEdital = request.getParameter("edital_link");
            String diaIni = request.getParameter("dia_ini");
            String mesIni = request.getParameter("mes_ini");
            String anoIni = request.getParameter("ano_ini");
            String diaFim = request.getParameter("dia_fim");
            String mesFim = request.getParameter("mes_fim");
            String anoFim = request.getParameter("ano_fim");
            String area = request.getParameter("area");
            String qtdEtapas = request.getParameter("qtd_etapas");

            int qtd = Integer.parseInt(qtdEtapas);

            Usuario professor = (Usuario) request.getSession().getAttribute("usuario");
                         
            System.out.println(professor.toString());
            
            Usuario at = daoUs.getUsuario(professor.getCpf());

            if (Integer.parseInt(diaIni) < 10) {
                diaIni = "0" + diaIni;
            }
            if (Integer.parseInt(diaFim) < 10) {
                diaFim = "0" + diaFim;
            }

            String dataI = anoIni + "-" + converteMes(mesIni) + "-" + diaIni;
            String dataF = anoFim + "-" + converteMes(mesFim) + "-" + diaFim;

            Edital e = new Edital(descricao, linkEdital, nome, 0, area, false);
            
            dao.inserirEdital(e);

            ArrayList<Edital> ed = dao.buscarEdital(nome);
            
            Selecao s = new Selecao(ed.get(0), at, qtd, new Cronograma(dataI, dataF));

            daoS.inserirSelecao(s);

            int id_selecao = daoS.getId(ed.get(0).getIdEdital());
            
                        
            for (int i = 0; i < qtd; i++) {
               daoEt.inserirEtapa(id_selecao);
            }

            response.sendRedirect("PaginaCadastroEditalSucesso.jsp");
        }
    }

    public String converteMes(String mes) {
        switch (mes) {
            case "Janeiro":
                return "01";
            case "Fevereiro":
                return "02";
            case "Março":
                return "03";
            case "Abril":
                return "04";
            case "Maio":
                return "05";
            case "Junho":
                return "06";
            case "Julho":
                return "07";
            case "Agosto":
                return "08";
            case "Setembro":
                return "09";
            case "Outubro":
                return "10";
            case "Novembro":
                return "11";
            case "Dezembro":
                return "12";
            default:
                return "";
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
