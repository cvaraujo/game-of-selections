<%@page import="Model.Edital"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.DaoEdital"%>
<%@page import="Model.Usuario"%>
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
            <i class="glyphicon glyphicon-th-list"></i> Meus editais
        </h1>
        <!-- Breve descrição -->
        <h4 class="text-center">Estou inscrito em:</h4>
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
                <%  DaoEdital dao = new DaoEdital();
                    ArrayList<Edital> editais = dao.meusEditais(u.getId());
                    if (!editais.isEmpty()) {
                        for (int i = 0; i < editais.size(); i++) {
                %>
                <form action="SelecionaEditaisAluno" method="post">
                    <div class="list-group">
                        <!-- Item da lista -->
                        <button class="list-group-item" type="submit" name="id" value="<%=editais.get(i).getIdEdital()%>">
                            <h4 class="list-group-item-heading"><i class="glyphicon glyphicon-file"></i>
                                <b> <%= editais.get(i).getTitulo()%> </b>
                            </h4> <span class="badge"> <%= dao.qtdInscritos(editais.get(i).getIdEdital()) %>  </span>
                            <p class="list-group-item-text">&nbsp; &nbsp;<i class="glyphicon glyphicon-asterisk"></i>
                                <q><small> <%= editais.get(i).getDescricao()%> </small></q>
                            </p>
                        </button>
                    </div>
                </form>
                <%      }
                    }
                %>
            </div>
            <div class="col-sm-1"></div>
        </div>

        <!-- Rodapé -->
        <jsp:include page="footer.jsp" />

    </body>
</html>
<% } else { %>
<html>
    <body>
        <h1>
            Você não tem permissão para isso!
        </h1>
    </body>
</html>
<% }%>