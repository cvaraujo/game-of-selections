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

        <!-- Se a varivel Usuarios for true -->
        <!-- Lista dos usuarios -->
        <div class=row>
            <div class="col-sm-1"></div>
            <div class="col-sm-10">
                <form action="ListaUsuarioPesquisa" method="post">
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
                                           name="proc_nome" placeholder="Nome">
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
                    <!-- usuario da lista -->
                    <form action="AlterarPrivilegioUsuario" method="post">
                        <%
                            DaoUsuario daoU = new DaoUsuario();
                            ArrayList<Usuario> usuarios2 = (ArrayList<Usuario>) session.getAttribute("usuariosListados");
                            ArrayList<Usuario> usuarios = new ArrayList<>();
                            if (usuarios2 == null) {
                                usuarios = daoU.listarUsuarios();
                            } else {
                                usuarios = usuarios2;
                            }
                            for (int i = 0; i < usuarios.size(); i++) {%>
                        <a href="#" class="list-group-item">
                            <div class=row>
                                <div class="col-xs-8">
                                    <h4 class="list-group-item-heading">
                                        <b><img class="img-circle" src="img/<%=usuarios.get(i).getTipo().toLowerCase()%>.png" width="25">
                                            <%=usuarios.get(i).getLogin()%> | <%=usuarios.get(i).getNome()%> - 
                                            <%=usuarios.get(i).getMatricula()%> - 
                                            <%=usuarios.get(i).getTipo()%> </b>
                                    </h4>
                                </div>
                                <div class="col-xs-4">
                                    <button name="aumentar" value="<%=usuarios.get(i).getId()%>" type="submit" class="btn btn-info btn-xs">
                                        <i class="glyphicon glyphicon-arrow-up"></i> Tornar Professor
                                    </button>
                                    <button name="diminuir" value="<%=usuarios.get(i).getId()%>" type="submit" class="btn btn-info btn-xs">
                                        <i class="glyphicon glyphicon-arrow-down"></i> Tornar Aluno
                                    </button>
                                    <button name="adm" value="<%=usuarios.get(i).getId()%>" type="submit" class="btn btn-info btn-xs">
                                        <i class="glyphicon glyphicon-arrow-up"></i> Tornar ADM
                                    </button>
                                </div>
                            </div>
                        </a>
                        <% }%>
                    </form>
                </div>
            </div>
            <div class="col-sm-1"></div>
        </div>



        <!-- Rodapé -->
        <jsp:include page="footer.jsp" />

    </body>
</html>
<% } else { %>
<%response.sendRedirect("Inicio.jsp"); %>
<% }%>