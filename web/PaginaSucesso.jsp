<%@page import="Model.Usuario"%>
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
        <% Usuario user = (Usuario) session.getAttribute("usuario");
            if (user == null) {
        %> <jsp:include page="navbar.jsp"/> <%
        } else {
        %> <jsp:include page="navbarLogado.jsp"/> <%
            }

        %>
        <!-- Nome|Numero  do Edital -->
        <h1 class="text-center"> <i class="glyphicon glyphicon-thumbs-up"></i> Alteração efetuada com sucesso ! </h1>

        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>
        <!-- Dados do edital -->
        <div class="jumbotron">
            <div class= row>
                <div class="col-sm-1"></div>
                <div class="col-sm-10">
                    <!-- Nome do professor -->
                    <div class= row>
                        <div class="col-sm-4"></div>
                        <div class="col-sm-6">
                            <h4><i class="glyphicon glyphicon-align-left"></i> <b>Alterações efetuadas com sucesso!</b></h4>
                            <p></p>
                            <!-- Botão Inscreva-se -->
                            <!-- Gatilho para o modal -->
                            <div class= row>
                                <div class="col-sm-3">
                                    <a href="<%= session.getAttribute("Ultimolocal") %>"><button type="button" class="btn btn-info btn-lg" ><i class="glyphicon glyphicon-share-alt"></i> Voltar</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </div>
        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>


        <!-- Rodapé -->
        <jsp:include page="footer.jsp"/>

    </body>
</html>