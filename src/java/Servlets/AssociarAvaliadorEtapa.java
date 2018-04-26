/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Dao.DaoEtapa;
import Dao.DaoUsuario;
import Model.Etapa;
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
public class AssociarAvaliadorEtapa extends HttpServlet {

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
            DaoUsuario professor = new DaoUsuario();
            DaoEtapa associarProf = new DaoEtapa();
            
            Usuario prof = (Usuario) request.getSession().getAttribute("usuario");
            Selecao selecao = (Selecao) request.getSession().getAttribute("selecao");
            ArrayList<Etapa> etapas = (ArrayList) request.getSession().getAttribute("etapas");

            for (int i = 0; i < etapas.size(); i++) {
                String a = request.getParameter("AvaliadorEtapa" + i);
                String[] AvaliadorEtapa = a.split(" - ");
                int id_prof = professor.buscarProfAvaliadorId(AvaliadorEtapa[1], AvaliadorEtapa[2]);
                associarProf.AssociarProfessorEtapa(id_prof, selecao.getId_selecao(), Integer.parseInt(AvaliadorEtapa[0]));
                if(id_prof == prof.getId()){
                    prof.setAvaliador(true);
                    request.getSession().setAttribute("usuario", prof);
                }
            }
            response.sendRedirect("PaginaSucesso.jsp");
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
