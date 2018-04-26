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
        <!-- Nome|Numero  do Edital -->
        <h1 class="text-center">
            <i class="glyphicon glyphicon-remove-sign"></i> Inscrição inválida
        </h1>

        <!-- Divisor -->
        <div class=row>
            <div class="col-sm-1" style="background-color: white;"></div>
            <div class="col-sm-10" style="background-color: gray;"></div>
            <div class="col-sm-1" style="background-color: white;"></div>
        </div>
        <div class="jumbotron">
            <center>
                <h3>Você já esta inscrito.</h3>
                <a href="Inicio.jsp"><button class="btn btn-info btn-default "
                                             type="submit">
                        <i class="glyphicon glyphicon-th-large"> Inicio</i>
                    </button></a> <a href="Editais.jsp"><button class="btn btn-info btn-default "
                                                            type="submit">
                        <i class="glyphicon glyphicon-pencil"> Editais</i>
                    </button></a>
            </center>

        </div>
        <!-- Divisor -->

        <!-- Rodapé -->
        <jsp:include page="footer.jsp" />
    </body>
</html>