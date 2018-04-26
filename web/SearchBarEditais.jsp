<%@page import="Model.Usuario"%>
<%@page import="Model.Edital"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.DaoEdital"%>
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
        <!-- Importaçao do css -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <!-- Importaçao dos js -->
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
        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>
        <!-- Cabeçalho Editais -->
        <h1 class="text-center"> <i class="glyphicon glyphicon-th-list"></i> Listagem dos editais.</h1>
        <!-- Breve descrição -->
        <h4 class="text-center"> Recentemente lançados...</h4>
        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>
        <!-- Lista dos editais -->
        <div class= row>
            <div class="col-sm-1"></div>
            <div class="col-sm-10">
                <% String pesquisa = request.getParameter("Search_bar");
                    if (pesquisa != null) {
                        DaoEdital dao = new DaoEdital();

                        ArrayList<Edital> editais = dao.buscarPorTitulo(pesquisa);

                        if (!editais.isEmpty()) {
                            for (Edital edital : editais) {%>
                <div class="list-group">
                    <!-- Item da lista -->
                    <a href="Pagina_edital.jsp" class="list-group-item">
                        <h4 class="list-group-item-heading"><i class="glyphicon glyphicon-file"></i>
                            <b>Edital <%= edital.getTitulo()%> </b>
                        </h4> <span class="badge"> <%= edital.getQtd_inscritos()%> </span>
                        <p class="list-group-item-text">&nbsp; &nbsp;<i class="glyphicon glyphicon-asterisk"></i>
                            <q><small> <%= edital.getDescricao()%> </small>
                            </q>
                        </p>
                    </a>
                </div>
                <%      }
                        }
                    }%>
            </div>
            <div class="col-sm-1"></div>
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