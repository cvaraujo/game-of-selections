<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Dao.DaoAlunosInscritos"%>
<%@page import="Dao.DaoUsuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Etapa"%>
<%@page import="Model.Selecao"%>
<%@page import="Dao.DaoEtapa"%>
<%@page import="Dao.DaoSelecao"%>
<%@page import="Model.Edital"%>
<%@page import="Model.Usuario"%>
<%  DaoAlunosInscritos dao = new DaoAlunosInscritos();
    DaoSelecao daoSelecao = new DaoSelecao();

    Edital idEdital = (Edital) session.getAttribute("editalAtualProf");

    Selecao idSelecao = daoSelecao.buscaPorEdital(idEdital);

%>
<% Usuario u = (Usuario) session.getAttribute("usuario");
    if (u != null && u.getTipo().equals("PROFESSOR")) {
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
            <i class="glyphicon glyphicon-align-left"></i> Notas
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
                    <form action="ValidarNotas" method="post" data-toggle="validator" id="formCadastro" role="form">
                        <center>
                            <%  ArrayList<Usuario> usuarios = dao.listaAlunosInscritos(idSelecao.getId_selecao());
                                String idEtapa = request.getParameter("idEtapa");

                                session.setAttribute("idEtapaLancaNota", idEtapa);
                                session.setAttribute("idSelecao", idSelecao);

                                if (!usuarios.isEmpty()) {
                                    for (int i = 0; i < usuarios.size(); i++) {%>
                            <div class="input-group form-group has-feedback">
                                <div class="input-group">
                                    <span class="input-group-addon"> <%=usuarios.get(i).getNome()%> - <%=usuarios.get(i).getMatricula()%> </span> 
                                    <input id="aluno" type="Real" class="form-control"
                                           name="aluno<%=i%>" placeholder="Nota"
                                           data-error="Entrada invalida" maxlength=5
                                           pattern="^((0|1|2|3|4|5|6|7|8|9|10)|(0|1|2|3|4|5|6|7|8|9)[.]{1,}[0-9]{1,})$"
                                           required> <span class="glyphicon form-control-feedback"
                                           aria-hidden="true" ></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                                <p></p>
                            </div>
                            <% }
                                }%>
                            <div class="input-group-btn form-group">
                                <button  class="btn btn-info btn-default" type="submit">
                                    <i class="glyphicon glyphicon-floppy-open"> Submeter </i>
                                </button>
                            </div>
                            <div class="input-group-btn form-group">
                                <a href="PaginaMeusEditaisProfAvaliador.jsp">
                                    <button  class="btn btn-info btn-default" type="button">
                                        <i class="glyphicon glyphicon-backward"> Voltar </i>
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