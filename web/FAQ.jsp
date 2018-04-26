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
        <link rel="stylesheet" href="css/bootstrap.css"">
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
        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>
        <!-- CabeÃ§alho "F.A.Q." -->
        <h1 class="text-center"> <i class="glyphicon glyphicon-paperclip"></i> Frequently 
            Asked questions. </h1>
        <!-- Breve descrição-->
        <h4 class="text-center"> Duvidas dos diversos usuários... </h4>
        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>
        <!-- Perguntas -->
        <div class="jumbotron">
            <div class= row>
                <div class="col-sm-1"></div>
                <!-- Lista das perguntas  -->
                <div class="col-sm-10">
                    <!-- Pergunta -->
                    <h3><i class="glyphicon glyphicon-pushpin"></i> Pergunta: O site não está carregando, o fato de minha 
                        internet não estar conectada pode ser um fator chave para o problema?</h3>
                    <h4>&nbsp; &nbsp; &nbsp;<i class="glyphicon glyphicon-share-alt"></i><b><q>Muito Provavelmente.</q></b></h4>
                    <p></p>
                    <!-- Pergunta -->
                    <h3><i class="glyphicon glyphicon-pushpin"></i> Pergunta: O site está totalmente preto, o fato do meu
                        monitor estar desligado pode ser um fator chave para o problema?</h3>
                    <h4>&nbsp; &nbsp; &nbsp;<i class="glyphicon glyphicon-share-alt"></i><b><q>Muito Provavelmente.</q></b></h4>
                    <p></p>
                    <!-- Pergunta -->
                    <h3><i class="glyphicon glyphicon-pushpin"></i> Pergunta: Os criadores desse site tiraram nota maxima no trabalho ?</h3>
                    <h4>&nbsp; &nbsp; &nbsp;<i class="glyphicon glyphicon-share-alt"></i><b><q>Muito Provavelmente.</q></b></h4>
                    <p></p>
                    <!-- Pergunta -->
                    <h3><i class="glyphicon glyphicon-pushpin"></i> Pergunta: O fato de muitas perguntas do FAQ serem respondidas com "Muito provavelmente" não é muito vago ?</h3>
                    <h4>&nbsp; &nbsp; &nbsp;<i class="glyphicon glyphicon-share-alt"></i><b><q>Muito Provavelmente.</q></b></h4>
                    <p></p>
                    <!-- Pergunta -->
                    <h3><i class="glyphicon glyphicon-pushpin"></i> Pergunta: A existencia desse FAQ não é muito provavelmente inútil?,
                        justo que são perguntas obvias e isto é obviamente uma pagina para deixar a navbar maior ?</h3>
                    <h4>&nbsp; &nbsp; &nbsp;<i class="glyphicon glyphicon-share-alt"></i><b><q>Muito Provavelmente.</q></b></h4>
                    <p></p>
                    <!-- Pergunta -->
                    <h3><i class="glyphicon glyphicon-pushpin"></i> Pergunta: A aba "sobre" não é somente mais uma pagina sobre um 
                        sistema capitalista para dar espaço para "zoar" e encher mais ainda com coisas inuteis a navbar 
                        deixando o site mais bonito e cheio ? </h3>
                    <h4>&nbsp; &nbsp; &nbsp;<i class="glyphicon glyphicon-share-alt"></i><b><q>Muito Provavelmente.</q></b></h4>
                    <p></p>
                    <!-- Pergunta -->
                    <h3><i class="glyphicon glyphicon-pushpin"></i> Pergunta: Não consigo digitar nada nos formularios do site, 
                        o fato de eu não ter um teclado pode ser um fator chave para o problema ?</h3>
                    <h4>&nbsp; &nbsp; &nbsp;<i class="glyphicon glyphicon-share-alt"></i><b><q>Muito Provavelmente.</q></b></h4>
                    <p></p>
                    <!-- Pergunta -->
                    <h3><i class="glyphicon glyphicon-pushpin"></i> Pergunta: Os reprovados nas etapas de seleção no 
                        "Game of Selections" tambémm serão punidos com a morte ?</h3>
                    <h4>&nbsp; &nbsp; &nbsp;<i class="glyphicon glyphicon-share-alt"></i><b><q>Muito Provavelmente.</q></b></h4>
                    <p></p>
                    <!-- Pergunta -->
                    <h3><i class="glyphicon glyphicon-pushpin"></i> Pergunta: O fato de os criadores desse site usarem o discord, 
                        é fator crucial para o site ficar tão bem feito ?</h3>
                    <h4>&nbsp; &nbsp; &nbsp;<i class="glyphicon glyphicon-share-alt"></i><b><q>Muito Provavelmente.</q></b></h4>
                    <p></p>
                    <!-- Pergunta -->
                    <h3><i class="glyphicon glyphicon-pushpin"></i> Pergunta: A pergunta acima é claramente uma pretenção e um 
                        pedido falho de apoiar o discord ? </h3>
                    <h4>&nbsp; &nbsp; &nbsp;<i class="glyphicon glyphicon-share-alt"></i><b><q>Muito Provavelmente.</q></b></h4>
                    <p></p>
                    <!-- Pergunta -->
                    <h3><i class="glyphicon glyphicon-pushpin"></i> Pergunta: O fato de nome do site ser Game of Selections pode 
                        resultar em um processo da HBO?</h3>
                    <h4>&nbsp; &nbsp; &nbsp;<i class="glyphicon glyphicon-share-alt"></i><b><q>Muito Provavelmente.</q></b></h4>
                    <p></p>
                    <!-- Pergunta -->
                    <h3><i class="glyphicon glyphicon-pushpin"></i> Pergunta: O fato dos criadores do site sempre estarem pensando 
                        em jogar LoL faz com q eles terminem os trabalhos mais rápido?</h3>
                    <h4>&nbsp; &nbsp; &nbsp;<i class="glyphicon glyphicon-share-alt"></i><b><q>Muito Provavelmente.</q></b></h4>
                    <p></p>
                    <!-- Pergunta -->
                    <h3><i class="glyphicon glyphicon-pushpin"></i> Pergunta: O fato de um membro, a qual não diremos o nomisaias 
                        ficar fazendo cup nodles durante o projeto de criação é fator crucial para demora de criação de site ?</h3>
                    <h4>&nbsp; &nbsp; &nbsp;<i class="glyphicon glyphicon-share-alt"></i><b><q>Muito Provavelmente.</q></b></h4>
                    <p></p> 	
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
    </body>
</html>