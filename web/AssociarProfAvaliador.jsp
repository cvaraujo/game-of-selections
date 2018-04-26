<%@page import="Model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Etapa"%>
<%@page import="Dao.DaoEtapa"%>
<%@page import="Dao.DaoSelecao"%>
<%@page import="Model.Selecao"%>
<%@page import="Model.Edital"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Dao.DaoUsuario"%>
<% Usuario u = (Usuario) session.getAttribute("usuario");
    if(u != null && u.getTipo().equals("PROFESSOR")){ 
%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Titulo -->
        <title>G.O.S</title>
        <!-- Icone -->
        <link rel="shortcut icon" href="ico.png">
        <!-- Definição dos metadados -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Importação do css -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="lib/animate-css/animate.min.css" rel="stylesheet">
        <!-- Importação dos js -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/validator.min.js"></script>
    </head>
    <body>
        <!-- Cabeçalho -->
        <jsp:include page="navbarLogado.jsp" />
        <!-- Nome|Numero  do Edital -->
        <h1 class="text-center">
            <i class="glyphicon glyphicon-align-left"></i> Selecionar Avaliadores
        </h1>

        <!-- Divisor -->
        <div class=row>
            <div class="col-sm-1" style="background-color: white;"></div>
            <div class="col-sm-10" style="background-color: gray;"></div>
            <div class="col-sm-1" style="background-color: white;"></div>
        </div>
        <div class="jumbotron">
            <div class=row>
                <div class="col-sm-1"></div>
                <div class="col-sm-10">
                    <%  Edital atual = (Edital) session.getAttribute("editalAtualProf");
                        DaoSelecao sel = new DaoSelecao();
                        DaoEtapa daoEt = new DaoEtapa();
                        DaoUsuario daoU = new DaoUsuario();

                        Selecao selecao = sel.buscaPorEdital(atual);

                        ArrayList<Etapa> etapas = daoEt.getEtapas(selecao.getId_selecao());
                        
                        ArrayList<Usuario> professores = daoU.listarProfessores();
                        // Dados das etapas
                        session.setAttribute("etapas", etapas);
                        // Seleções
                        session.setAttribute("selecao", selecao); %>
                    <p></p>
                    <center>

                        <jsp:useBean id="dao" class="Dao.DaoUsuario"/>
                        <form action="AssociarAvaliadorEtapa" method="post"> 
                            <% for (int i = 0; i < etapas.size(); i++) { %>
                            <h2>
                                Etapa: <%= i + 1%> 
                            </h2>
                            <select class="btn btn-info btn-success" name="AvaliadorEtapa<%=i%>">
                                <% for (int j = 0; j < professores.size(); j++) {%>
                                <option>
                                    <%=etapas.get(i).getIdEtapa()%> - <%=professores.get(j).getNome()%> - <%=professores.get(j).getLogin()%>
                                </option>                                      
                                <%}%>
                            </select>
                            <p></p>
                            <% }%>
                            <p></p>

                            <div class="input-group-btn form-group">
                                <button  class="btn btn-info btn-default" type="submit">
                                    <i class="glyphicon glyphicon-floppy-open"> Pronto </i>
                                </button>
                            </div>
                        </form>
                        <p></p>
                        <div class="input-group-btn form-group">
                            <a href="PaginaEditalProf.jsp">
                                <button  class="btn btn-info btn-lg" type="button">
                                    <i class="glyphicon glyphicon-floppy-open"> Voltar </i>
                                </button>
                            </a>
                        </div>
                    </center>
                    </form>
                </div>
            </div>

            <!-- Rodapé -->
            <jsp:include page="footer.jsp" />
    </body>
</html>
<% } else {
    response.sendRedirect("Inicio.jsp"); %>
<% }%>