<%@page import="Model.Usuario"%>

<% Usuario u = (Usuario) session.getAttribute("usuario"); %>

<!-- Barra de navegação -->
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Logo "Game of Selections" -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand" href="Inicio.jsp">Game of Selections</a>
        </div>
        <!-- Botões da barra -->
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <!-- Botão inicio -->
                <li><a href="Inicio.jsp">Inicio</a></li>
                <!-- Botão Editais -->
                <li><a href="Editais.jsp">Editais</a></li>
                <!-- Botão Pesquisar -->
                <li><a href="Pesquisar.jsp">Pesquisar</a></li>
                    <% if (u.getTipo().equals("PROFESSOR")) { %>
                <li><a href="PaginaMeusEditaisProf.jsp">Meus Editais</a></li>
                    <% }
                        if (u.getTipo().equals("ALUNO")) { %> 
                <li><a href="PaginaMeusEditais.jsp">Minhas Seleções</a></li> 
                    <% } %>
                <!-- Botão com dropdown -->
                <!-- Botão Cadastro -->
                <% if (u.getTipo().equals("PROFESSOR") && u.isAvaliador()) { %>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Cadastro
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <!-- Botão Edital -->
                        <li><a href="Cadastro_edital.jsp">Edital</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <!-- Botão Edital -->
                <li><a href="PaginaMeusEditaisProfAvaliador.jsp">Lançar Notas</a></li>
                    <% }
                        if (u.getTipo().equals("PROFESSOR") && !u.isAvaliador()) { %>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Cadastro
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <!-- Botão Edital -->
                        <li><a href="Cadastro_edital.jsp">Edital</a></li>
                    </ul>
                </li>
                <% } %>
                <% if (u.getTipo().equals("ADM")) {
                %> <li><a href="PaginaAdmUsuarios.jsp">Ger. Usuários</a></li> 
                <li><a href="PaginaAdmSelecoes.jsp">Ger. Seleções</a></li>
                    <%}%>
                <!-- Botão FAQ -->
                <li><a href="FAQ.jsp">FAQ</a></li>
                <!-- Botão Sobre -->
                <li><a href="Sobre.jsp">Sobre</a></li>
                <!-- Botão Sobre -->
                <!-- Se o usuario for adm -->

            </ul>
            <!-- Botão login -->
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">

                        <!-- Aqui terá o tipo do usuario logado -->
                        <div class="row"> <!--Tipo de usuário logado-->
                            <% if (u.getTipo().equals("PROFESSOR")) {%>
                            <div class="col-sm-8"><span class="glyphicon glyphicon-th"></span> Prof </div>
                            <% } else {%>
                            <div class="col-sm-8"><span class="glyphicon glyphicon-th"></span> <%=u.getTipo().toLowerCase()%> </div>
                            <% }%>
                            <div class="col-sm-4"><img class="img-circle " src="img/<%=u.getTipo().toLowerCase()%>.png" width="18"></div>
                        </div>

                    </a>
                    <!-- Formulario de menu -->
                    <ul class="dropdown-menu">
                        <center>
                            <span><img class="img-responsive img-circle" src="img/<%=u.getTipo().toLowerCase()%>.png" width="50"></span>
                            <!-- Login e nome de usuário-->
                            <h5><b> <%= u.getLogin()%> </b></h5>
                            <h5> <%= u.getNome()%> </h5>

                            <div class="input-group-btn">
                                <!-- Botão enviar o login -->
                                <a href="UserConf.jsp"><button class="btn btn-info btn-default btn-sm" type="submit">
                                        <i class="glyphicon glyphicon-cog"> Configurações</i> 
                                    </button></a>
                            </div>
                            <p>
                            <div class="input-group-btn">
                                <!-- Botão cadastrar -->
                                <form action="Quit"><button type="submit" class="btn btn-info btn-default btn-sm">
                                        <i class="glyphicon glyphicon-off"> Sair</i> 
                                    </button>
                                </form>
                            </div>
                            </p>
                        </center>
                    </ul>
                </li>
            </ul>
            <!-- Barra Pesquisar -->
            <div class="col-xs-2 navbar-right">
                <form action="SearchBarEditais.jsp" method="post">
                    <div class="input-group input-group-sm navbar-btn ">
                        <!-- Barra pesquisar -->
                        <input type="text" class="form-control" placeholder="Search" name="Search_bar">
                        <div class="input-group-btn">
                            <!-- Botão pesquisar -->
                            <button class="btn btn-info btn-default" type="submit">
                                <i class="glyphicon glyphicon-search"></i> 
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</nav>