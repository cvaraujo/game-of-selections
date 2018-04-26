/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Dao.DaoUsuario;
import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Carlos Victor
 */
public class CadastrarUsuario extends HttpServlet {

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

            boolean cadastra = true;

            String nome = request.getParameter("nome");
            String cpf = request.getParameter("cpf");
            String rg = request.getParameter("rg");
            String matricula = request.getParameter("matricula");
            String email = request.getParameter("email");
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            String senha2 = request.getParameter("senha2");

            HttpSession session = request.getSession();

            session.setAttribute("nomeCadastro", nome);
            session.setAttribute("cpfCadastro", cpf);
            session.setAttribute("rgCadastro", rg);
            session.setAttribute("matriculaCadastro", matricula);
            session.setAttribute("emailCadastro", email);
            session.setAttribute("loginCadastro", login);

            // Verifica nome
            if (nome.length() == 0) {
                cadastra = false;
            }
            for (int i = 0; i < nome.length(); i++) {
                if (Character.isDigit(nome.charAt(i))) {
                    response.sendRedirect("PaginaCadastroErro.jsp");
                    break;
                }
            }
            if (!senha.equals(senha2)) {
                cadastra = false;
            }
            // verifica cpf
            if (cpf.length() != 11) {
                cadastra = false;
            }
            // verifica rg
            if (rg.length() < 7 && rg.length() > 11) {
                cadastra = false;
            }
            for (int i = 0; i < rg.length(); i++) {
                if (!Character.isDigit(rg.charAt(i))) {
                    cadastra = false;
                    break;
                }
            }
            // verifica matricula
            if (rg.length() < 5 && matricula.length() > 8) {
                cadastra = false;
            }

            if (cadastra) {

                Usuario usuario = new Usuario(login, senha, Long.valueOf(cpf), Long.valueOf(rg),
                        nome, email, Long.valueOf(matricula), "ALUNO", false);

                request.setAttribute("user", usuario);

                DaoUsuario dao = new DaoUsuario();

                if (dao.inserirUsuario(usuario)) {
                    response.sendRedirect("PaginaCadastroErro.jsp");
                } else {
                    session.removeAttribute("nomeCadastro");
                    session.removeAttribute("cpfCadastro");
                    session.removeAttribute("rgCadastro");
                    session.removeAttribute("matriculaCadastro");
                    session.removeAttribute("emailCadastro");
                    session.removeAttribute("loginCadastro");

                    request.getRequestDispatcher("PaginaCadastroSucesso.jsp").forward(request, response);
                }
            } else {
                request.getRequestDispatcher("Cadastro_usuario.jsp");
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
