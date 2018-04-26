<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <jsp:include page="navbar.jsp"/>
        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>

        <h1 class="text-center"> <i class="glyphicon glyphicon-user"></i> Cadastro de Usuário</h1>
        <h4 class="text-center"> </h4>
        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>
        <p></p>

        <div class= row>
            <div class="col-sm-2"></div>
            <div class="col-sm-8"> 
                <!-- Formulario professor -->
                <form data-toggle="validator" id="formCadastro" role="form" action="CadastrarUsuario" method="post">
                    <!-- Campo nome -->
                    <div class="input-group form-group has-feedback">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="Nome" type="text" class="form-control" name="nome" placeholder="Nome" 
                               data-error="Por favor, Informe um nome valido." 
                               pattern="^[A-z çá-úÁ-Úã-?Ã-?â-ûÂ-Û]*$"
                               maxlength="100"
                               required>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <p></p>
                    <!-- Campo Cpf -->
                    <div class="input-group form-group has-feedback">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-align-left"></i></span>

                        <input id="CPF" type="text" class="form-control" name="cpf" placeholder="CPF" 
                               data-error="Por favor, Informe um CPF valido." 
                               data-minlength="11" data-minlength-error="O CPF deve conter 11 digitos, sem pontos"
                               maxlength="11"
                               pattern="^[0-9]{1,}$"
                               required>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>


                    <p></p>
                    <!-- Campo RG -->
                    <div class="input-group form-group has-feedback">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-align-left"></i></span>

                        <input id="RG" type="text" class="form-control" name="rg" placeholder="RG" 
                               data-error="Por favor, Informe um RG valido." 
                               data-minlength="7" data-minlength-error="O RG deve conter 7 digitos no mínimo, sem pontos"
                               maxlength="11"
                               pattern="^[0-9]{1,}$"
                               required>

                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <p></p>
                    <!-- Campo matricula -->
                    <div class="input-group form-group has-feedback">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
                        <input id="matricula" type="text" class="form-control" name="matricula" placeholder="Matrícula"
                               data-error="Por favor, Informe uma matrícula valida." 
                               data-minlength="5" data-minlength-error="A matricula deve conter 7 digitos no mínimo"
                               maxlength="8"
                               pattern="^[0-9]{1,}$"
                               required>

                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <p></p>
                    <!-- Campo email -->
                    <div class="input-group form-group has-feedback">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>

                        <input id="Email" type="email" class="form-control" name="email" placeholder="Email" 
                               data-error="Por favor, informe um e-mail valido." 
                               required>

                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <p></p>
                    <!-- Campo login -->
                    <div class="input-group form-group has-feedback">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="Login" type="text" class="form-control" name="login" placeholder="Login" 
                               data-error="Por favor, Informe um login valido" 
                               data-minlength="5" data-minlength-error="O login deve conter 5 caracteres no mínimo"
                               maxlength="15"
                               pattern="^[A-z0-9]{1,}$"
                               required>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                    <p></p>
                    <!-- Campo senha -->
                    <div class="input-group form-group has-feedback">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-sunglasses"></i></span>
                        <input id="password" type="password" class="form-control" name="senha" placeholder="Senha" 
                               data-error="Por favor, Informe uma senha valida"
                               data-minlength="6" data-minlength-error="A senha deve conter 5 caracteres no mínimo" 
                               maxlength="25"
                               pattern="^[A-z0-9]{1,}$"
                               required>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <span class="help-block with-errors"></span>
                    </div>
                    <p></p>
                    <!-- Campo confirmar senha -->
                    <div class="input-group form-group has-feedback">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-sunglasses"></i></span>
                        <input id="password2" type="password" class="form-control" name="senha2" placeholder="Confirme sua senha" 
                               data-error="Por favor, Informe uma senha valida"
                               data-match="#password" data-match-error="Atenção! As senhas não estão iguais." 
                               data-minlength="6" data-minlength-error="A senha deve conter 5 caracteres no mínimo" 
                               maxlength="25"
                               pattern="^[A-z0-9]{1,}$"
                               required>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>

                    </div>
                    <p></p>
                    <!-- butão enviar -->
                    <div class="input-group-btn form-group">
                        <button class="btn btn-info btn-default" type="submit">
                            <i class="glyphicon glyphicon-floppy-open"> Enviar</i>
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Rodapé -->
        <jsp:include page="footer.jsp"/>

    </body>
</html>