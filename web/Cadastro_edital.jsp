<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.DaoUsuario"%>
<%@page import="Model.Usuario"%>
<% Usuario u = (Usuario) session.getAttribute("usuario");
    if (u != null && u.getTipo().equals("PROFESSOR")) {
%>
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

        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>

        <h1 class="text-center"> <i class="glyphicon glyphicon-open-file"></i> Cadastro de Edital/Seleção</h1>
        <h4 class="text-center"> </h4>

        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>

        <p></p>

        <div class= row>
            <div class="col-sm-1"></div>
            <div class="col-sm-8">
                <!-- Formulario Edital -->
                <form action="CadastraEdital" method="post">
                    <!-- Campo nome -->
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-duplicate"></i></span>
                        <input id="NomeE" type="text" class="form-control" name="nomeE" placeholder="Nome do edital" 
                               data-error="Por favor, Informe um nome de edital valido." 
                               pattern="^[A-z çá-úÁ-Úã-?Ã-?â-ûÂ-Û]*$"
                               maxlength="200"
                               required>
                    </div> 
                    <p></p>
                    <!-- Campo descricao -->
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-menu-hamburger"></i></span>
                        <textarea class="form-control" rows="3" id="comment" placeholder="Descrição" name="descricao"></textarea>

                    </div>
                    <p></p>
                    <!-- Campo link do edital -->
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-bookmark"></i></span>
                        <input id="edital_link" type="text" class="form-control" name="edital_link" placeholder="Edital link">
                    </div>
                    <p></p>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
                        <input id="area" type="text" class="form-control" name="area" placeholder="Area">
                    </div>
                    <p></p>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
                        <input id="qtd_etapas" type="text" class="form-control" name="qtd_etapas" 
                               placeholder="Quantidade de etapas"
                               data-error="Por favor, Informe uma quantidade de etapas maior que zero." 
                               pattern="^(0|1|2|3|4|5|6|7|8|9)+$" required>
                    </div>
                    <p></p>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input id="qtd_vagas" type="text" class="form-control" name="qtd_vagas" 
                               placeholder="Quantidade de vagas"
                               data-error="Por favor, Informe uma quantidade de etapas maior que zero." 
                               pattern="^(0|1|2|3|4|5|6|7|8|9)+$" required>
                    </div>
                    <p></p>
                    <!-- Campo da data de inicio-->
                    <div class= row>
                        <div class="col-sm-2">  
                            <div class="well well-sm"> <span class="glyphicon glyphicon-calendar"> Data inicio </span> </div>
                        </div>

                        <div class="col-sm-2">  
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

                        <div class="col-sm-2">
                            <div class="form-group">
                                <select class="form-control" id="sel_mes" name="mes_ini">
                                    <option>Janeiro</option>
                                    <option>Fevereiro</option>
                                    <option>Marçoo</option>
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

                        <div class="col-sm-2">
                            <%                                LocalDate anoAtual = LocalDate.now();
                            %>
                            <div class="form-group">
                                <select class="form-control" id="sel1" name="ano_ini">
                                    <option><%= anoAtual.getYear()%></option>
                                    <option><%= anoAtual.getYear() + 1%></option>
                                    <option><%= anoAtual.getYear() + 2%></option>
                                    <option><%= anoAtual.getYear() + 3%></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!-- Campo da data do fim-->
                    <div class= row>
                        <div class="col-sm-2">  
                            <div class="well well-sm"> <span class="glyphicon glyphicon-calendar"> Data fim </span> </div>
                        </div>
                        <div class="col-sm-2">  
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

                        <div class="col-sm-2">
                            <div class="form-group">
                                <select class="form-control" id="sel_mes" name="mes_fim">
                                    <option>Janeiro</option>
                                    <option>Fevereiro</option>
                                    <option>Março</option>
                                    <option>Abril</option>
                                    <option>Maio  </option>
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


                        <div class="col-sm-2">
                            <div class="form-group">
                                <select class="form-control" id="sel1" name="ano_fim">
                                    <option><%= anoAtual.getYear()%></option>
                                    <option><%= anoAtual.getYear() + 1%></option>
                                    <option><%= anoAtual.getYear() + 2%></option>
                                    <option><%= anoAtual.getYear() + 3%></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <!-- Botão eviar-->
                    <div class="col-sm-2">
                        <button class="btn btn-info btn-default" type="submit">
                            <i class="glyphicon glyphicon-floppy-open"> Submeter </i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <p></p>
        <!-- Divisor -->
        <div class= row>
            <div class="col-sm-1" style="background-color:white;"></div>
            <div class="col-sm-10" style="background-color:gray;"></div>
            <div class="col-sm-1" style="background-color:white;"></div>
        </div>
        <p></p>
    </body>
</html>
<% } else {
    response.sendRedirect("Inicio.jsp"); %>
<% }%>