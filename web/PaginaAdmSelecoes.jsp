<%@page import="Dao.DaoUsuario"%>
<%@page import="Dao.DaoSelecao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Edital"%>
<%@page import="Dao.DaoEdital"%>
<%@page import="Model.Usuario"%>
<% Usuario u = (Usuario) session.getAttribute("usuario");
    if (u != null && u.getTipo().equals("ADM")) {%>
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
            <i class="glyphicon glyphicon-cog"></i> Bem vindo Administrador: <%=u.getNome()%>
        </h1>

        <!-- Divisor -->
        <div class=row>
            <div class="col-sm-1" style="background-color: white;"></div>
            <div class="col-sm-10" style="background-color: gray;"></div>
            <div class="col-sm-1" style="background-color: white;"></div>
        </div>
        <p></p>

        <div class=row>
            <div class="col-sm-1"></div>
            <div class="col-sm-10">
                <form action="PaginaAdmSelecoes.jsp" method="post">
                    <div>
                        <!-- Formulario da pesquisa -->
                        <div class=row>
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8">
                                <!-- Campo titulo -->
                                <div class="input-group">
                                    <span class="input-group-addon"><i
                                            class="glyphicon glyphicon-text-background"></i></span>
                                    <input type="text" class="form-control"
                                           name="titulo" placeholder="Título">
                                    <div class="input-group-btn">
                                        <button class="btn btn-info btn-default" type="submit">
                                            <i class="glyphicon glyphicon-search"> Pesquisar</i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>


                <p></p>
                <div class="list-group">
                    <!-- Item da lista -->
                    <%  String busca = request.getParameter("titulo");

                        DaoEdital daoEd = new DaoEdital();
                        DaoSelecao daoS = new DaoSelecao();
                        ArrayList<Edital> editais;
                        if (busca == null) {
                            editais = daoEd.listarEditaisNaoLancados();
                        } else {
                            editais = daoEd.buscarPorTituloNaoLancados(busca);
                        }
                        
                        for (int i = 0; i < editais.size(); i++) {
                            if (daoS.buscaPorEdital(editais.get(i)) != null) {
                    %>
                    <form action="ExcluirEdital" method="post">
                        <a href="#" class="list-group-item">
                            <div class=row>
                                <div class="col-sm-10">
                                    <h4 class="list-group-item-heading">
                                        <i class="glyphicon glyphicon-file"></i><b>Edital
                                            <%= editais.get(i).getTitulo()%> - Nº: <%=editais.get(i).getIdEdital()%> - 
                                            Inicia em: <%= daoS.buscaPorEdital(editais.get(i)).getCronograma().getDataIni()%>
                                            Finaliza em: <%= daoS.buscaPorEdital(editais.get(i)).getCronograma().getDataFim()%> 

                                        </b>
                                    </h4>
                                    <p class="list-group-item-text">
                                        &nbsp; &nbsp;<i class="glyphicon glyphicon-asterisk"></i><q><small>
                                                <%=editais.get(i).getDescricao()%>
                                            </small></q>
                                    </p>
                                </div>

                                <div class="col-sm-2">
                                    <button name="edital" value="<%= editais.get(i).getIdEdital()%>" type="submit" class="btn btn-info btn-xs">
                                        <i class="glyphicon glyphicon-remove-sign"></i> Excluir
                                    </button>
                                </div>
                            </div>
                        </a>
                    </form>
                    <% }
                        }%>
                </div>
            </div>
            <div class="col-sm-1"></div>
        </div>

        <!-- Divisor -->
        <div class=row>
            <div class="col-sm-1" style="background-color: white;"></div>
            <div class="col-sm-10" style="background-color: gray;"></div>
            <div class="col-sm-1" style="background-color: white;"></div>
        </div>
        <p></p>

        <!-- Se a varivel Usuarios for true -->
        <!-- Lista dos usuarios -->
        <div class=row>
            <div class="col-sm-1"></div>
            <div class="col-sm-10">
            </div>
            <div class="col-sm-1"></div>
        </div>



        <!-- Rodapé -->
        <jsp:include page="footer.jsp" />

    </body>
</html>
<% } else { %>
<html>
    <body>
        <h1>
            Você não tem permissão para isso!
        </h1>
    </body>
</html>
<% }%>