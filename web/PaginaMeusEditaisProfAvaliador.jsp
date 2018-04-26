<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Dao.DaoSelecao"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Edital"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.DaoEdital"%>
<% Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario != null && usuario.getTipo().equals("PROFESSOR")) {
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
    </head>
    <body>
        <!-- Cabeçalho -->
        <jsp:include page="navbarLogado.jsp" />
        <!-- Divisor -->
        <div class=row>
            <div class="col-sm-1" style="background-color: white;"></div>
            <div class="col-sm-10" style="background-color: gray;"></div>
            <div class="col-sm-1" style="background-color: white;"></div>
        </div>
        <!-- Cabeçalho Editais -->
        <h1 class="text-center">
            <i class="glyphicon glyphicon-th-list"></i> Avaliar Editais
        </h1>
        <!-- Breve descrição -->
        <h4 class="text-center">Seleções:</h4>
        <!-- Divisor -->
        <div class=row>
            <div class="col-sm-1" style="background-color: white;"></div>
            <div class="col-sm-10" style="background-color: gray;"></div>
            <div class="col-sm-1" style="background-color: white;"></div>
        </div>
        <!-- Lista dos editais -->
        <div class=row>
            <div class="col-sm-1"></div>
            <div class="col-sm-10">

                <div class="list-group">
                    <!-- Item da lista -->
                    <% DaoEdital daoEdital = new DaoEdital();
                        ArrayList<Edital> editais = daoEdital.meusEditaisProfAvaliador(usuario.getId());

                        for (Edital edital : editais) {
                            if (edital != null) {
                    %>
                    <div class=row>
                        <div class="col-sm-11">
                            <form action="PaginaSelecionaEtapaProfAvaliador.jsp" method="post">
                                <div class="list-group">
                                    <!-- Item da lista -->
                                    <button class="list-group-item" type="submit" name="id" value="<%= edital.getIdEdital()%>">
                                        <h4 class="list-group-item-heading"><i class="glyphicon glyphicon-file"></i>
                                            <b> <%= edital.getTitulo()%> </b>
                                        </h4> <span class="badge"> <%= daoEdital.qtdInscritos(edital.getIdEdital())%> </span>
                                        <p class="list-group-item-text">&nbsp; &nbsp;<i class="glyphicon glyphicon-asterisk"></i>
                                            <q><small> <%= edital.getDescricao()%> </small></q>
                                        </p>
                                    </button>
                                </div>
                            </form>
                        </div>
                        <%}
                            }%>
                    </div>
                </div>
            </div>
            <div class="col-sm-1"></div>

            <!-- Rodapé -->
            <jsp:include page="footer.jsp" />

    </body>
</html>

<%}%>