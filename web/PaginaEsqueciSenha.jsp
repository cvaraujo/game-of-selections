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
        <jsp:include page="navbar.jsp" />
        <!-- Nome|Numero  do Edital -->
        <h1 class="text-center">
            <i class="glyphicon glyphicon-wrench"></i> Esqueci minha senha
        </h1>

        <!-- Divisor -->
        <div class=row>
            <div class="col-sm-1" style="background-color: white;"></div>
            <div class="col-sm-10" style="background-color: gray;"></div>
            <div class="col-sm-1" style="background-color: white;"></div>
        </div>
        <!-- Dados do edital -->
        <div class="jumbotron">
            <div class=row>
                <div class="col-sm-1"></div>
                <div class="col-sm-10">
                    <div class=row>
                        <div class="col-sm-3"></div>
                        <div class="col-sm-6">
                            <form action="MandarEmail" method="post">
                                <div class="input-group input-group-sm navbar-btn ">
                                    <!-- Email -->
                                    <span class="input-group-addon"><i
                                            class="glyphicon glyphicon-user"></i></span> 
                                    <input type="text" class="form-control" placeholder="Email" name="esqueci_email">
                                </div>

                                <center>
                                    <div class="input-group-btn">
                                        <!-- Botão enviar o login -->
                                        <button class="btn btn-info btn-default btn-sm" type="submit">
                                            <i class="glyphicon glyphicon-ok"> Enviar</i>
                                        </button>
                                    </div>
                                </center>
                            </form>

                        </div>
                    </div>


                </div>
                <div class="col-sm-1"></div>
            </div>
        </div>
        <!-- Rodapé -->
        <jsp:include page="footer.jsp" />

    </body>
</html>