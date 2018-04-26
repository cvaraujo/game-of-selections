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
        <!-- Cabe�alho -->
        <% Usuario user = (Usuario) session.getAttribute("usuario");
            if (user == null) {
        %> <jsp:include page="navbar.jsp"/> <%
          } else {
        %> <jsp:include page="navbarLogado.jsp"/> <%
              }

        %>
        <!-- Cabeçalho "nossa equipe" -->
        <h1 class="text-center"> Nossa equipe </h1>
        <!-- Subtitulo -->
        <h4 class="text-center"> &nbsp; &nbsp; Equipe de profissionais alocados para esse incrivel projeto... </h4>
        <p></p>
        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>
        <p></p>
        <!-- Fotos / Nomes -->
        <section id="team">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-9">
                    <div class="container wow fadeInUp">
                        <div class="row">
                            <div class="col-md-2">
                                <!-- Isaac Rahel -->
                                <div class="member">
                                    <div class="pic"><img class="img-responsive img-circle"  src="img/team-1.png" alt=""></div>
                                    <h4> &nbsp;  &nbsp;  &nbsp; &nbsp;<i class="glyphicon glyphicon-sunglasses"></i> I.Rahel</h4>
                                    <!-- Função -->
                                    <span>&nbsp;  &nbsp;  &nbsp; &nbsp; Aquaman do cabelo amarelo.</span>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <!-- Carlos Victor-->
                                <div class="member">
                                    <div class="pic"><img class="img-responsive img-circle" src="img/team-2.png" alt=""></div>
                                    <h4>&nbsp;  &nbsp; &nbsp;  &nbsp; <i class="glyphicon glyphicon-ice-lolly-tasted"></i> C.Victor</h4>
                                    <!-- Função -->
                                    <span>&nbsp;  &nbsp; &nbsp;  &nbsp; Chefe Bizarro.</span>
                                </div>
                            </div>
                            <!-- Isaias Ferreira -->
                            <div class="col-md-2">
                                <div class="member">
                                    <div class="pic"><img class="img-responsive img-circle" src="img/team-3.png" alt=""></div>
                                    <h4>&nbsp; &nbsp;  &nbsp; <i class="glyphicon glyphicon-fire"></i> I.Ferreira</h4>
                                    <!-- Função -->
                                    <span>&nbsp; &nbsp;  &nbsp; &nbsp; Cozinheiro Cup Nodles.</span>
                                </div>
                            </div>
                            <!-- Thomas Dillan -->
                            <div class="col-md-2">
                                <div class="member">
                                    <div class="pic"><img class="img-responsive img-circle" src="img/team-4.png" alt=""></div>
                                    <h4>&nbsp;  &nbsp; &nbsp; &nbsp; <i class="glyphicon glyphicon-camera"></i> T.Dillan</h4>
                                    <!-- Função -->
                                    <span>&nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Designer Papaleguas</span>
                                </div>
                            </div>
                        </div>  
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
        </section>
        <p></p>
        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>
        <!-- Parte Contato -->
        <div class= row>
            <div class="col-sm-2"></div>
            <div class="col-sm-8"> 
                <div class="container-fluid bg-grey">
                    <h2 class="text-center">Contato</h2>
                    <div class="row">
                        <div class="col-sm-5">
                            <!-- Descrição-->
                            <p>Contate-nos e n�o receba resposta at� as proximas 72hrs.</p>
                            <!-- Endereço -->
                            <p><span class="glyphicon glyphicon-map-marker"></span> Flores, Alto Santo, Ic�, BR</p>
                            <!-- Tel -->
                            <p><span class="glyphicon glyphicon-phone"></span> +00 (88) 40028922</p>
                            <!-- Email -->
                            <p><span class="glyphicon glyphicon-envelope"></span> naoenvienada@hotmail.com</p> 
                        </div>
                        <div class="col-sm-7">
                            <!-- Formularios -->
                            <div class="row">
                                <div class="col-sm-6 form-group">
                                    <!-- Nome -->
                                    <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
                                </div>
                                <div class="col-sm-6 form-group">
                                    <!-- Email -->
                                    <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
                                </div>
                            </div>
                            <!-- Comentarios -->
                            <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
                            <!-- Botão enviar -->
                            <div class="row">
                                <div class="col-sm-12 form-group">
                                    <button class="btn btn-info btn-default pull-right" type="submit"> <i class="glyphicon glyphicon-envelope"></i> Enviar</button>
                                </div>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class=row>
            <div class="col-sm-3"></div>
            <div class="col-sm-2">
                <h1>Considera��es: </h1><h3><q>Caaampe���ooo, vencedooooor...</q></h3>
            </div>
            <div class="col-sm-2"></div>

            <div class="col-sm-5">
                <div class="pic"><img class="img-responsive img-circle"  src="img/midoria.gif" alt=""></div>
            </div>
        </div>

    </body>
</html>
