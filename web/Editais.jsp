<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.management.Query"%>
<%@page import="Model.Usuario"%>
<%@page import="Model.Edital"%>
<%@page import="java.util.ArrayList"%>
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
                <jsp:useBean id="dao" class="Dao.DaoEdital"/>
                <c:forEach var="edital" items="${dao.listarEditais()}" varStatus="id">
                    <form action="SelecionaEdital" method="get">
                        <div class="list-group">
                            <!-- Item da lista -->
                            <button class="list-group-item" type="submit" name="id" value="${edital.idEdital}">
                                <h4 class="list-group-item-heading"><i class="glyphicon glyphicon-file"></i>
                                    <b> ${edital.titulo} </b>
                                </h4> <span class="badge"> ${dao.qtdInscritos(edital.idEdital)} </span>
                                <p class="list-group-item-text">&nbsp; &nbsp;<i class="glyphicon glyphicon-asterisk"></i>
                                    <q><small>  ${edital.descricao} </small></q>
                                </p>
                            </button>
                        </div>
                    </form>
                </c:forEach>
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
