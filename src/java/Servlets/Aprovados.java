/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Dao.DaoAlunosInscritos;
import Dao.DaoNotas;
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
public class Aprovados extends HttpServlet {

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
            HttpSession session = request.getSession();
            //id edital e id usuario
            DaoAlunosInscritos dao = new DaoAlunosInscritos();
            Selecao s = (Selecao) session.getAttribute("selecao");

            DaoNotas daoNota = new DaoNotas();

            ArrayList<Usuario> u = dao.listaAlunosInscritos(s.getId_selecao());

            ArrayList<Nota> medias = new ArrayList<>();

            session.removeAttribute("medias");

            if (!u.isEmpty()) {
                for (int i = 0; i < u.size(); i++) {
                    Nota a = daoNota.getMedia(u.get(i).getId(), s.getId_selecao());
                    if (a != null) {
                        medias.add(daoNota.getMedia(u.get(i).getId(), s.getId_selecao()));
                    }
                }

                Collections.sort(medias);

                session.setAttribute("medias", medias);
                session.setAttribute("usuariosInscritos", u);
                response.sendRedirect("PaginaAprovados.jsp");
            } else {
                session.setAttribute("medias", medias);
                session.setAttribute("usuariosInscritos", u);
                response.sendRedirect("PaginaAprovados.jsp");
            }
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
