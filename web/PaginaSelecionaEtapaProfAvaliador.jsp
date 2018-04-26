<%@page import="Dao.DaoEdital"%>
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
    DaoEtapa daoEtapas = new DaoEtapa();
    DaoSelecao daoSelecao = new DaoSelecao();
    DaoEdital daoE = new DaoEdital();

    Usuario u = (Usuario) session.getAttribute("usuario");

    String idEdital = request.getParameter("id");

    Edital e = daoE.buscarEdital(Integer.parseInt(idEdital));

    session.setAttribute("editalAtualProf", e);

    int idSelecao = daoSelecao.getId(e.getIdEdital());
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
                    <center>
                        <% ArrayList<Integer> idEtapas = daoEtapas.etapasProfAvaliador(u.getId(), idSelecao);

                            for (int i = 0; i < idEtapas.size(); i++) {
                                System.out.println(idEtapas.get(i));%>
                        <form action="PaginaLancarNotas.jsp" method="post">
                            <!-- -->                                   
                            <button type = "submit" class="btn btn-info btn-default" name="idEtapa" value="<%=idEtapas.get(i)%>" >
                                Etapa <%=i + 1%> 
                            </button>
                        </form>
                        <p></p>
                        <%}%>
                        <div class="input-group-btn form-group">
                            <a href="PaginaMeusEditaisProfAvaliador.jsp">
                                <button  class="btn btn-info btn-default" type="button">
                                    <i class="glyphicon glyphicon-backward"> Voltar </i>
                                </button>
                            </a>
                        </div>
                    </center>
                </div>
            </div>

            <!-- Rodapé -->
            <jsp:include page="footer.jsp" />
    </body>
</html>
<% } else {
    response.sendRedirect("Inicio.jsp"); %>
<% }%>