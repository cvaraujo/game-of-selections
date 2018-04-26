<%@page import="Model.Etapa"%>
<%@page import="Dao.DaoEtapa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.DaoAlunosInscritos"%>
<%@page import="Model.Selecao"%>
<%@page import="Dao.DaoSelecao"%>
<%@page import="Model.Edital"%>
<%@page import="Model.Usuario"%>
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
        <!-- Importaçãoo do css -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <!-- Importação dos js -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <!-- Cabeçalho -->
        <% Usuario user = (Usuario) session.getAttribute("usuario");
            if (user == null) {
        %> <jsp:include page="navbar.jsp"/> <%
        } else {
        %> <jsp:include page="navbarLogado.jsp"/> <%
            }

        %>

        <% Edital atual = (Edital) request.getAttribute("editalAtualProf");
            DaoSelecao sel = new DaoSelecao();
            DaoEtapa daoEt = new DaoEtapa();

            Selecao selecao = sel.buscaPorEdital(atual);

            ArrayList<Integer> et = daoEt.getEtapas(selecao.getId_selecao());
            // Dados das etapas
            session.setAttribute("etapas", et);
            // Seleções
            session.setAttribute("selecao", selecao);
        %>
        <!-- Nome | Numero  do Edital -->
        <h1 class="text-center"> <i class="glyphicon glyphicon-duplicate"></i> Edital nº: <%= atual.getIdEdital()%> - Seleção <%= selecao.getId_selecao()%> </h1>

        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>
        <!-- Dados dos alunos -->
        <div class="jumbotron">
            <div class= row>
                <div class="col-sm-1"></div>
                <div class="col-sm-8">
                    <!-- Nome do professor -->
                    <h3><i class="glyphicon glyphicon-education"></i> Professor: <%= selecao.getProfessor().getNome()%> </h3>
                    <!-- Datas -->
                    <!-- Inicio -->
                    <h3><i class="glyphicon glyphicon-calendar"></i> Inicio: <%= selecao.getCronograma().getDataIni()%> </h3>
                    <!-- Fim -->
                    <h3><i class="glyphicon glyphicon-calendar"></i> Fim: <%= selecao.getCronograma().getDataFim()%></h3>
                    <h3><i class="glyphicon glyphicon-calendar"></i> Area: <%=atual.getArea()%></h3>
                    <!-- Descrição do edital -->
                    <h3><i class="glyphicon glyphicon-align-left"></i> Sobre: 
                        <h5>
                            <!-- Paragrafos -->
                            <p>
                                <%= atual.getDescricao()%>
                            </p>
                        </h5>
                    </h3>
                    <!-- Link do edital (PDF) -->
                    <h3><i class="glyphicon glyphicon-folder-open"></i> Baixe o edital: <a href= <%= atual.getDirEdital()%> >Edital <%= atual.getTitulo()%></a>.</h3>
                    <div class="col-sm-1"></div>
                </div>
                <p></p>
            </div>
        </div>
        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>

        <jsp:include page="footer.jsp"/>

    </body>
</html>
<% } else {
    response.sendRedirect("Inicio.jsp"); %>
<% }%>