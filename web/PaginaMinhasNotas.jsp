<%@page import="Dao.DaoNotas"%>
<%@page import="Dao.DaoEtapa"%>
<%@page import="Model.Selecao"%>
<%@page import="Dao.DaoAlunosInscritos"%>
<%@page import="Dao.DaoEdital"%>
<%@page import="Dao.DaoSelecao"%>
<%@page import="Model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Edital"%>
<% Edital e = (Edital) session.getAttribute("editalAtual");%>
<% Usuario u = (Usuario) session.getAttribute("usuario");
    if (u != null && u.getTipo().equals("ALUNO")) {
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
            <i class="glyphicon glyphicon-book"></i> Minhas notas no edital <%= e.getTitulo()%>
        </h1>

        <!-- Divisor -->
        <div class=row>
            <div class="col-sm-1" style="background-color: white;"></div>
            <div class="col-sm-10" style="background-color: gray;"></div>
            <div class="col-sm-1" style="background-color: white;"></div>
        </div>
        <div class="jumbotron">
            <div class=row>
                <div class="col-sm-3"></div>
                <div class="col-sm-9">
                    <h3><i class="glyphicon glyphicon-book"></i> Edital <%= e.getTitulo()%> - Nº: <%=e.getIdEdital()%> </h3>
                    <p></p>
                    <%  DaoNotas daoNota = new DaoNotas();
                        DaoSelecao daoS = new DaoSelecao();
                        DaoEdital daoE = new DaoEdital();
                        DaoAlunosInscritos daoIns = new DaoAlunosInscritos();

                        //Seleção referente ao edital atual selecionado
                        Selecao selecao = daoS.buscaPorEdital(e);

                        // Lista de notas do usuário logado na seleção atual
                        ArrayList<Float> notas = daoNota.getNotas(u.getId(), selecao.getId_selecao());
                        
                        int qtdEtapas = daoNota.qtdEtapas(selecao.getId_selecao());
                        
                        // Quantidade de inscritos na seleção
                        daoE.qtdInscritos(e.getIdEdital());

                        for (int i = 0; i < qtdEtapas; i++) {
                            if (i < notas.size()) {
                    %>
                    <p></p>
                    <h4><b><i class="glyphicon glyphicon-bookmark"></i> Fase <%= i + 1%>:</b> <%= notas.get(i)%> </h4>
                    <% } else {%>
                    <p></p>
                    <h4><b><i class="glyphicon glyphicon-bookmark"></i> Fase <%= i + 1%>:</b> Nota ainda não lançada </h4>
                    <% }
                        }%>
                    <p></p>
                    <h4><b><i class="glyphicon glyphicon-bookmark"></i> Resultado final atual:</b> 
                        <%=daoIns.getSituacao(selecao.getId_selecao(), u.getId())%> </h4>
                    <p></p>
                    <a href="PaginaMeusEditais.jsp"><button type="button" class="btn btn-info btn-lg" ><i class="glyphicon glyphicon-share-alt"></i> Voltar</button></a>
                </div>
            </div>

        </div>
        <!-- Rodapé -->
        <jsp:include page="footer.jsp" />
    </body>
</html>

<% } else {
    response.sendRedirect("Inicio.jsp"); %>
<% }%>