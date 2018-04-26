<%@page import="java.time.LocalDate"%>
<%@page import="Model.Selecao"%>
<%@page import="Model.Edital"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.DaoEdital"%>
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
        <% if (session.getAttribute("selecoes") != null) { %>
        <jsp:include page="PaginaEditaisPesquisados.jsp"/>
        <% } else { %>
        <h1 class="text-center"> <i class="glyphicon glyphicon-search"></i> Pesquisa de editais</h1>
        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>
        <div class= row>
            <div class="col-sm-1"><p></p></div>
            <!-- Listagem dos editais -->
            <div class="col-sm-7">
                <!-- Lista dos editais -->
                <div class="list-group">
                </div>
            </div>

            <% }%>
            <div class="col-xs-3">
                <!-- Formulario da pesquisa -->  
                <form action="Pesquisa" method="post">
                    <!-- Campo professor -->
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
                        <input id="procurar_prof" type="text" class="form-control" name="procurar_prof" placeholder="Professor">
                    </div>
                    <p></p>
                    <!-- Campo titulo -->
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-italic"></i></span>
                        <input id="procurar_titulo" type="text" class="form-control" name="procurar_titulo" placeholder="Título">
                    </div>
                    <p></p>
                    <!-- Campo area -->
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-book"></i></span>
                        <input id="procurar_area" type="text" class="form-control" name="procurar_area" placeholder="Area">
                    </div>
                    <p></p>
                    <!-- Campo data de: -->
                    <div class= row>
                        <!-- nome "de:"" -->
                        <div class="col-sm-3">  
                            <div class="well well-sm"> <span class="glyphicon glyphicon-calendar"> De: </span> </div>
                        </div>
                        <!-- Campo data de: (DIA) -->
                        <div class="col-sm-3">  
                            <div class="form-group">
                                <select class="form-control" id="sel_dia" name="dia_ini">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>6</option>
                                    <option>7</option>
                                    <option>8</option>
                                    <option>9</option>
                                    <option>10</option>
                                    <option>11</option>
                                    <option>12</option>
                                    <option>13</option>
                                    <option>14</option>
                                    <option>15</option>
                                    <option>16</option>
                                    <option>17</option>
                                    <option>18</option>
                                    <option>19</option>
                                    <option>20</option>
                                    <option>21</option>
                                    <option>22</option>
                                    <option>23</option>
                                    <option>24</option>
                                    <option>25</option>
                                    <option>26</option>
                                    <option>27</option>
                                    <option>28</option>
                                    <option>29</option>
                                    <option>30</option>
                                    <option>31</option>
                                </select>
                            </div>
                        </div>
                        <!-- Campo data de: (MES) -->
                        <div class="col-sm-4">
                            <div class="form-group">
                                <select class="form-control" id="sel_mes" name="mes_ini">
                                    <option>Janeiro</option>
                                    <option>Fevereiro</option>
                                    <option>Março</option>
                                    <option>Abril</option>
                                    <option>Maio</option>
                                    <option>Junho</option>
                                    <option>Julho</option>
                                    <option>Agosto</option>
                                    <option>Setembro</option>
                                    <option>Outubro</option>
                                    <option>Novembro</option>
                                    <option>Dezembro</option>
                                </select>
                            </div>
                        </div>
                        <%                                LocalDate anoAtual = LocalDate.now();
                        %>

                        <!-- Campo data de: (ANO) -->
                        <div class="col-sm-4">
                            <div class="form-group">
                                <select class="form-control" id="sel1" name="ano_ini">
                                    <option><%= anoAtual.getYear() - 2%></option>
                                    <option><%= anoAtual.getYear() - 1%></option>
                                    <option><%= anoAtual.getYear()%></option>
                                    <option><%= anoAtual.getYear() + 1%></option>
                                    <option><%= anoAtual.getYear() + 2%></option>
                                    <option><%= anoAtual.getYear() + 3%></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!-- Campo data até: -->
                    <div class= row>
                        <!-- nome "até:"" -->
                        <div class="col-sm-3"> 
                            <div class="well well-sm"> <span class="glyphicon glyphicon-calendar"> Até: </span> </div>
                        </div>
                        <!-- Campo data até: (DIA) -->
                        <div class="col-sm-3">  
                            <div class="form-group">
                                <select class="form-control" id="sel_dia" name="dia_fim">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>6</option>
                                    <option>7</option>
                                    <option>8</option>
                                    <option>9</option>
                                    <option>10</option>
                                    <option>11</option>
                                    <option>12</option>
                                    <option>13</option>
                                    <option>14</option>
                                    <option>15</option>
                                    <option>16</option>
                                    <option>17</option>
                                    <option>18</option>
                                    <option>19</option>
                                    <option>20</option>
                                    <option>21</option>
                                    <option>22</option>
                                    <option>23</option>
                                    <option>24</option>
                                    <option>25</option>
                                    <option>26</option>
                                    <option>27</option>
                                    <option>28</option>
                                    <option>29</option>
                                    <option>30</option>
                                    <option>31</option>
                                </select>
                            </div>
                        </div>
                        <!-- Campo data de: (MES) -->
                        <div class="col-sm-4">
                            <div class="form-group">
                                <select class="form-control" id="sel_mes" name="mes_fim">
                                    <option>Janeiro</option>
                                    <option>Fevereiro</option>
                                    <option>Março</option>
                                    <option>Abril</option>
                                    <option>Maio</option>
                                    <option>Junho</option>
                                    <option>Julho</option>
                                    <option>Agosto</option>
                                    <option>Setembro</option>
                                    <option>Outubro</option>
                                    <option>Novembro</option>
                                    <option>Dezembro</option>
                                </select>
                            </div>
                        </div>
                        <!-- Campo data de: (ANO) -->
                        <div class="col-sm-4">
                            <div class="form-group">
                                <select class="form-control" id="sel1" name="ano_fim">
                                    <option><%= anoAtual.getYear() + 3%></option>
                                    <option><%= anoAtual.getYear() + 2%></option>
                                    <option><%= anoAtual.getYear() + 1%></option>
                                    <option><%= anoAtual.getYear()%></option>
                                    <option><%= anoAtual.getYear() - 1%></option>
                                    <option><%= anoAtual.getYear() - 2%></option>
                                    <option><%= anoAtual.getYear() - 3%></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!-- Botão pesquisar -->
                    <div class="input-group-btn">
                        <button class="btn btn-info btn-default" type="submit">
                            <i class="glyphicon glyphicon-search"> Pesquisar</i>
                        </button>
                    </div>
                    <p></p>
                </form>
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
