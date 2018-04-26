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
                <!-- Botão com dropdown -->
                <!-- Botão Cadastro -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Cadastro
                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <!-- Botão Edital
                        <li class="disabled"><a href="Cadastro_edital.jsp">Edital</a></li>
                        -->
                        <!-- Botão Usuario -->
                        <li><a href="Cadastro_usuario.jsp">Usuario</a></li>
                    </ul>
                </li>
                <!-- Botão FAQ -->
                <li><a href="FAQ.jsp">FAQ</a></li>
                <!-- Botão Sobre -->
                <li><a href="Sobre.jsp">Sobre</a></li>
            </ul>
            <!-- Botão login -->
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-log-in"></span> Login</a>
                    <!-- Formulario de menu -->
                    <ul class="dropdown-menu">
                        <form action="ValidarUsuario" method="post">
                            <div class="input-group input-group-sm navbar-btn ">
                                <!-- Login -->
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input type="text" class="form-control" placeholder="Login" name="login_login">
                            </div>
                            <div class="input-group input-group-sm navbar-btn ">
                                <!-- Senha -->
                                <span class="input-group-addon"><i class="glyphicon glyphicon-sunglasses"></i></span>
                                <input type="Password" class="form-control" placeholder="Password" name="login_senha">
                            </div>
                            <center>
                                <div class="input-group-btn">
                                    <!-- Botão enviar o login -->
                                    <button class="btn btn-info btn-default btn-sm" type="submit">
                                        <i class="glyphicon glyphicon-ok"> Login </i> 
                                    </button>
                                </div>
                                
                            </center>
                            <p></p>
                        </form>
                        <center>
                            <div class="input-group-btn">
                                <!-- Botão cadastrar -->
                                <a href="Cadastro_usuario.jsp"><button class="btn btn-info btn-default btn-sm">
                                        <i class="glyphicon glyphicon-ok"> Cadastre-se </i> 
                                    </button></a>
                            </div>
                            <h5><a href="PaginaEsqueciSenha.jsp">Esqueceu sua senha?</a></h5>
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