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
        <h1 class="text-center"> <i class="glyphicon glyphicon-thumbs-up"></i> Cadastro efetuado com sucesso ! </h1>

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
                            <%                                Usuario u = (Usuario) request.getAttribute("user");
                            %>
                            <h4><i class="glyphicon glyphicon-align-left"></i> <b>Usuario:</b> <%= u.getNome()%> </h4>
                            <h4><i class="glyphicon glyphicon-user"></i> <b>Login:</b> <%= u.getLogin()%> </h4>
                            <h4><i class="glyphicon glyphicon-envelope"></i> <b>Email:</b> <%= u.getEmail()%> </h4>
                            <p></p>
                            <!-- Botão Inscreva-se -->
                            <!-- Gatilho para o modal -->
                            <div class= row>
                                <div class="col-sm-3">
                                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-ok-sign"></i> Entrar</button>	
                                </div>
                                <div class="col-sm-3">
                                    <a href="Inicio.jsp"><button type="button" class="btn btn-info btn-lg" ><i class="glyphicon glyphicon-share-alt"></i> Voltar</button></a>
                                </div>
                            </div>

                            <!-- Modal -->
                            <div id="myModal" class="modal fade" role="dialog">
                                <div class="modal-dialog">
                                    <!-- Conteudo do modal-->
                                    <div class="modal-content">
                                        <!-- Cabeçalho do modal -->
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Entrar</h4>
                                        </div>
                                        <!-- Corpo do modal -->
                                        <div class="modal-body">
                                            <form action="ValidarUsuario" method="post">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                                    <input id="login" type="text" class="form-control" name="login_login" placeholder="Login">
                                                </div>
                                                <p></p>
                                                <div class="input-group">
                                                    <!--  -->
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                                    <input id="senha" type="password" class="form-control" name="login_senha" placeholder="Senha">
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-default">Entrar</button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
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