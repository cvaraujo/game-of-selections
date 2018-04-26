<%@page import="Model.Selecao"%>
<%@page import="Dao.DaoSelecao"%>
<%@page import="Model.Edital"%>
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
        <!-- Importaçãoo do css -->
        <link rel="stylesheet" href="css/bootstrap.css">
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

        <% Edital atual = (Edital) session.getAttribute("editalAtual");

            DaoSelecao sel = new DaoSelecao();

            Selecao selecao = sel.buscaPorEdital(atual);

            session.setAttribute("selecao", selecao);
        %>
        <!-- Nome | Numero  do Edital -->
        <h1 class="text-center"> <i class="glyphicon glyphicon-duplicate"></i> Edital nº: <%= atual.getIdEdital()%> - Seleção <%= selecao.getId_selecao()%> </h1>
        <!-- Breve descrição do edital 
        <h4 class="text-center"> </h4>
        --><!-- Divisor -->
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
                    <h3><i class="glyphicon glyphicon-education"></i> Professor: <%= selecao.getProfessor().getNome()%> </h3>
                    <!-- Datas -->
                    <!-- Inicio -->
                    <h3><i class="glyphicon glyphicon-calendar"></i> Inicio: <%= selecao.getCronograma().getDataIni()%> </h3>
                    <!-- Fim -->
                    <h3><i class="glyphicon glyphicon-calendar"></i> Fim: <%= selecao.getCronograma().getDataFim()%></h3>
                    <!-- Descrição do edital -->
                    <h3><i class="glyphicon glyphicon-align-left"></i> Sobre: 
                        <h5>
                            <!-- Paragrafos -->
                            <p>
                                <%= atual.getDescricao()%>
                            </p>
                        </h5>
                    </h3>
                    <h3><i class="glyphicon glyphicon-check"></i> Quantidade de vagas: <%=selecao.getQtd_vagas()%> </h3>
                    <!-- Link do edital (PDF) -->
                    <h3><i class="glyphicon glyphicon-folder-open"></i> Baixe o edital: <a href="http://<%= atual.getDirEdital()%>" target="_blank">Edital <%= atual.getTitulo()%></a>.</h3>
                    <!-- Botão Inscreva-se -->
                    <!-- Gatilho para o modal -->
                    <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-ok-sign"></i> Inscreva-se</button>
                    <!-- Modal -->
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <% if (user != null) { %> 
                            <form action="Inscricao" method="post">
                                <!-- Conteudo do modal-->
                                <div class="modal-content">
                                    <!-- Cabeçalho do modal -->
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Inscrição</h4>
                                    </div>
                                    <!-- Corpo do modal -->
                                    <div class="modal-body">
                                        <!-- Campo link do edital -->
                                        <div class="input-group">
                                            <!--  -->
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-link"></i></span>
                                            <input id="C_matricula" type="password" class="form-control" name="senha" placeholder="Digite sua senha">
                                        </div>
                                    </div>
                                    <!-- Botões do modal -->
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-default">Login</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                    </div>
                                </div>
                            </form>                            
                        </div>
                    </div>
                    <% } else { %>
                    <div class="modal-dialog">
                        <!-- Conteudo do modal-->
                        <div class="modal-content">
                            <!-- Cabeçalho do modal -->
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title">Você deve estar logado para se inscrever.</h4>
                            </div>
                            <!-- Botões do modal -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default btn-info" data-dismiss="modal">ok</button>
                            </div>
                        </div>
                    </div>
                    <% }%>
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

        <jsp:include page="footer.jsp"/>

    </body>
</html>