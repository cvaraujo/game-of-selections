/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Dao.DaoAlunosInscritos;
import Dao.DaoNotas;
import Dao.DaoSelecao;
import Model.Nota;
import Model.Selecao;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gunslinger
 */
public class ValidarNotas extends HttpServlet {

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
            DaoAlunosInscritos dao = new DaoAlunosInscritos();
            HttpSession session = request.getSession();
            DaoNotas daoNota = new DaoNotas();
            DaoSelecao daoSelecao = new DaoSelecao();
            DaoAlunosInscritos daoAi = new DaoAlunosInscritos();

            String idEtapa = (String) session.getAttribute("idEtapaLancaNota");

            Selecao selecao = (Selecao) session.getAttribute("idSelecao");

            int idSelecao = selecao.getId_selecao();

            ArrayList<Usuario> u = dao.listaAlunosInscritos(idSelecao);

            for (int i = 0; i < u.size(); i++) {
                String notaAluno = request.getParameter("aluno" + i);
                if (!notaAluno.equals("")) {
                    if (!daoNota.jaTemNota(idSelecao, Integer.parseInt(idEtapa), u.get(i).getId())) {
                        daoNota.inserirNota(idSelecao, Integer.parseInt(idEtapa), u.get(i).getId(), Float.parseFloat(notaAluno));
                    } else {
                        daoNota.alterarNota(idSelecao, Integer.parseInt(idEtapa), u.get(i).getId(), Float.parseFloat(notaAluno));
                    }
                }
            }

            boolean foiAvaliada = daoNota.lancaAprovado(idSelecao);
            ArrayList<Usuario> usuarios = new ArrayList<>();
            if (foiAvaliada) {
                int qtd = daoSelecao.getQtdVagas(idSelecao);
                usuarios = daoAi.listaAlunosInscritos(idSelecao);
                ArrayList<Nota> medias = new ArrayList<>();

                if (!usuarios.isEmpty()) {
                    for (int i = 0; i < u.size(); i++) {
                        Nota a = daoNota.getMedia(u.get(i).getId(), idSelecao);
                        if (a != null) {
                            medias.add(daoNota.getMedia(u.get(i).getId(), idSelecao));
                        }
                    }
                    Collections.sort(medias);
                    for (int i = 0; i < medias.size(); i++) {
                        if (i < qtd) {
                            daoAi.aprova(medias.get(i).getIdAluno(), idSelecao, medias.get(i).getNota());
                        } else {
                            daoAi.reprova(medias.get(i).getIdAluno(), idSelecao, medias.get(i).getNota());
                        }
                    }
                }
            }
            response.sendRedirect("PaginaMeusEditaisProfAvaliador.jsp");

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
