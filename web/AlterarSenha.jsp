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
            <i class="glyphicon glyphicon-wrench"></i> Alterar minha senha
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
                    <!-- Nome do professor -->
                    <div class=row>
                        <div class="col-sm-3"></div>
                        <div class="col-sm-6">
                            <form action="AlterarSenha" method="post">
                                <div class="input-group form-group has-feedback">
                                    <span class="input-group-addon"><i
                                            class="glyphicon glyphicon-edit"></i></span> 
                                    <input id="password" type="text" class="form-control" name="login"
                                           placeholder="Login" maxlength="25" pattern="^[A-z0-9]{1,}$" required> 
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <span class="help-block with-errors"></span>
                                </div>
                                <p></p>

                                <div class="input-group form-group has-feedback">
                                    <span class="input-group-addon"><i
                                            class="glyphicon glyphicon-sunglasses"></i></span> 
                                    <input id="password" type="password" class="form-control" name="senha"
                                           placeholder="Senha" data-error="Por favor, Informe uma senha valida"
                                           data-minlength="6" data-minlength-error="A senha deve conter 5 caracteres no mínimo"
                                           maxlength="25" pattern="^[A-z0-9]{1,}$" required> 
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <span class="help-block with-errors"></span>
                                </div>
                                <p></p>
                                <!-- Campo confirmar senha -->
                                <div class="input-group form-group has-feedback">
                                    <span class="input-group-addon"><i
                                            class="glyphicon glyphicon-sunglasses"></i></span> <input
                                        id="password2" type="password" class="form-control"
                                        name="senha2" placeholder="Confirme sua senha"
                                        data-error="Por favor, Informe uma senha valida"
                                        data-match="#password"
                                        data-match-error="Atenção! As senhas não estão iguais."
                                        data-minlength="6"
                                        data-minlength-error="A senha deve conter 5 caracteres no mínimo"
                                        maxlength="25" pattern="^[A-z0-9]{1,}$" required> <span
                                        class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <div class="help-block with-errors"></div>

                                </div>
                                <div class="input-group-btn">
                                    <!-- Botão enviar o login -->
                                    <button class="btn btn-info btn-default btn-sm" type="submit">
                                        <i class="glyphicon glyphicon-ok"> Ok</i>
                                    </button>
                                </div>
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