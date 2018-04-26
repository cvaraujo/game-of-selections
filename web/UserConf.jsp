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
        <jsp:include page="navbarLogado.jsp"/>
        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>
        <!-- CabeÃ§alho "F.A.Q." -->
        <h1 class="text-center"> <i class="glyphicon glyphicon-cog"></i> Minhas configurações. </h1>
        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>
        <!-- Perguntas -->
        <div class="jumbotron">
            <div class= row>
                <div class="col-sm-2"></div>
                <!-- Lista das perguntas  -->
                <div class="col-sm-4">
                    <% Usuario u = (Usuario) session.getAttribute("usuario");
                        String getSenha = "";
                        for (int i = 0; i < u.getSenha().length(); i++) {
                            if (i == u.getSenha().length() - 2 || i == u.getSenha().length() - 1) {
                                getSenha += u.getSenha().charAt(i);
                            } else {
                                getSenha += "*";
                            }
                        }
                    %>
                    <!-- Tipo da conta -->
                    <p><b><i class="glyphicon glyphicon-user"></i> Cargo:</b> <i> <%=u.getTipo().toLowerCase()%></i>
                    </p>    
                    <p><b><i class="glyphicon glyphicon-user"></i> Login:</b> <i> <%=u.getLogin()%> </i>
                    </p>
                    <p><b><i class="glyphicon glyphicon-align-left"></i> Nome:</b> <i><%=u.getNome()%></i>
                    </p>
                    <p><b><i class="glyphicon glyphicon-envelope"></i> Email:</b> <i><%=u.getEmail()%></i>
                    </p>
                    <p><b><i class="glyphicon glyphicon-sunglasses"></i> Senha:</b> <i><%= getSenha%></i>
                    </p>
                    <p><b><i class="glyphicon glyphicon-text-background"></i> Matricula:</b> <i><%=u.getMatricula()%></i>
                    </p>
                    <p><b><i class="glyphicon glyphicon-align-left"></i> RG:</b> <i> <%="**********" + u.getRg() % 100%> </i>
                    </p>
                    <p><b><i class="glyphicon glyphicon-align-left"></i> CPF:</b> <i><%="**********" + u.getCpf() % 100%></i>
                    </p>
                    <p></p>
                    <div class= row>
                        <div class="col-sm-6">
                            <!-- Single button -->
                            <div class="btn-group">
                                <button type="button" class="btn btn-info dropdown-toggle btn-lg"
                                        data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                    <i class="glyphicon glyphicon-cog"></i> Alterar dados <span
                                        class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="#" data-toggle="modal"
                                           data-target="#Modal_senha">Senha</a></li>
                                    <li><a href="#" data-toggle="modal"
                                           data-target="#Modal_email">Email</a></li>
                                    <li><a href="#" data-toggle="modal"
                                           data-target="#Modal_nome">Nome</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <a href="Inicio.jsp"><button type="button"
                                                         class="btn btn-info btn-lg">
                                    <i class="glyphicon glyphicon-share-alt"></i> Voltar
                                </button></a>
                        </div>

                        <!-- Modal Nome -->
                        <div id="Modal_nome" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!-- Conteudo do modal-->
                                <div class="modal-content">
                                    <!-- Cabeçalho do modal -->
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Alterar dados</h4>
                                    </div>
                                    <!-- Corpo do modal -->
                                    <div class="modal-body">
                                        <!-- Formulario professor -->
                                        <form action="AlterarNomeConf" method="get" data-toggle="validator" id="formCadastro" role="form">
                                            <!-- Campo nome -->
                                            <div class="input-group form-group has-feedback">
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-education"></i></span> 
                                                <input id="Nome"
                                                       type="text" class="form-control" name="nome"
                                                       placeholder="Nome"
                                                       data-error="Por favor, Informe um nome valido."
                                                       pattern="^[A-z ]{1,}$" maxlength="70" required> <span
                                                       class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                                <div class="help-block with-errors"></div>
                                            </div>
                                            <p></p>
                                            <!-- Campo senha -->
                                            <div class="input-group form-group has-feedback">
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-sunglasses"></i></span> <input
                                                    id="password" type="password" class="form-control"
                                                    name="senha" placeholder="Senha"
                                                    data-error="Por favor, Informe uma senha valida"
                                                    data-minlength="6"
                                                    data-minlength-error="A senha deve conter 5 caracteres no mínimo"
                                                    maxlength="25" pattern="^[A-z0-9]{1,}$" required> <span
                                                    class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                                <span class="help-block with-errors"></span>
                                            </div>
                                            <p></p>
                                            <!-- Botões do modal -->
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-default">Alterar</button>
                                                <button type="button" class="btn btn-default"
                                                        data-dismiss="modal">Cancelar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal senha-->
                        <div id="Modal_senha" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!-- Conteudo do modal-->
                                <div class="modal-content">
                                    <!-- Cabeçalho do modal -->
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Alterar dados</h4>
                                    </div>
                                    <!-- Corpo do modal -->
                                    <div class="modal-body">
                                        <!-- Formulario professor -->
                                        <form action="AlteraSenhaConf" method="post" data-toggle="validator" id="formCadastro" role="form">
                                            <!-- Campo senha -->
                                            <div class="input-group form-group has-feedback">
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-sunglasses"></i></span> <input
                                                    id="password" type="password" class="form-control"
                                                    name="senhaAntiga" placeholder="Senha antiga"
                                                    data-error="Por favor, Informe uma senha valida"
                                                    data-minlength="6"
                                                    data-minlength-error="A senha deve conter 5 caracteres no mínimo"
                                                    maxlength="25" pattern="^[A-z0-9]{1,}$" required> <span
                                                    class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                                <span class="help-block with-errors"></span>
                                            </div>

                                            <!-- Campo senha -->
                                            <div class="input-group form-group has-feedback">
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-sunglasses"></i></span> <input
                                                    id="password" type="password" class="form-control"
                                                    name="senhaNova" placeholder="Senha nova"
                                                    data-error="Por favor, Informe uma senha valida"
                                                    data-minlength="6"
                                                    data-minlength-error="A senha deve conter 5 caracteres no mínimo"
                                                    maxlength="25" pattern="^[A-z0-9]{1,}$" required> <span
                                                    class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                                <span class="help-block with-errors"></span>
                                            </div>
                                            <p></p>
                                            <!-- Campo confirmar senha -->
                                            <div class="input-group form-group has-feedback">
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-sunglasses"></i></span> <input
                                                    id="password2" type="password" class="form-control"
                                                    name="senhaNovaConfirm" placeholder="Confirme a senha nova"
                                                    data-error="Por favor, Informe uma senha valida"
                                                    data-match="#password"
                                                    data-match-error="Atenção! As senhas não estão iguais."
                                                    data-minlength="6"
                                                    data-minlength-error="A senha deve conter 5 caracteres no mínimo"
                                                    maxlength="25" pattern="^[A-z0-9]{1,}$" required> <span
                                                    class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                                <div class="help-block with-errors"></div>
                                            </div>
                                            <p></p>

                                            <!-- Botões do modal -->
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-default">Entrar</button>
                                                <button type="button" class="btn btn-default"
                                                        data-dismiss="modal">Cancelar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Modal email-->
                        <div id="Modal_email" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <!-- Conteudo do modal-->
                                <div class="modal-content">
                                    <!-- Cabeçalho do modal -->
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Alterar dados</h4>
                                    </div>
                                    <!-- Corpo do modal -->
                                    <div class="modal-body">

                                        <form name="AlterarEmailConf" method="post" data-toggle="validator" id="formCadastro" role="form">
                                            <!-- Campo email -->
                                            <div class="input-group form-group has-feedback">
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-envelope"></i></span> 
                                                <input id="Email"
                                                       type="email" class="form-control" name="email"
                                                       placeholder="Email"
                                                       data-error="Por favor, informe um e-mail valido." required>
                                                <span class="glyphicon form-control-feedback"
                                                      aria-hidden="true"></span>
                                                <div class="help-block with-errors"></div>
                                            </div>
                                            <!-- Campo senha -->
                                            <div class="input-group form-group has-feedback">
                                                <span class="input-group-addon"><i
                                                        class="glyphicon glyphicon-sunglasses"></i></span> 
                                                <input
                                                    id="Senha" type="password" class="form-control"
                                                    name="senha" placeholder="Senha"
                                                    data-error="Por favor, Informe uma senha valida"
                                                    data-minlength="6"
                                                    data-minlength-error="A senha deve conter 5 caracteres no mínimo"
                                                    maxlength="25" pattern="^[A-z0-9]{1,}$" required> <span
                                                    class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                                <span class="help-block with-errors"></span>
                                            </div>
                                            <!-- Botões do modal -->
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-default"
                                                        >Alterar</button>
                                                <button type="button" class="btn btn-default"
                                                        data-dismiss="modal">Cancelar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <img class="img-responsive img-circle" src="img/<%=u.getTipo().toLowerCase()%>.png"
                         width="300">
                </div>
                <div class="col-sm-1"></div>
            </div>
        </div>
        <!-- Rodapé -->
        <jsp:include page="footer.jsp" />

    </body>
</html>