<%@page import="Dao.DaoEdital"%>
<%@page import="Dao.DaoSelecao"%>
<%@page import="Model.Selecao"%>
<%@page import="java.util.ArrayList"%>
<!-- Cabelho da pagina -->
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
            <!-- Item da lista -->
            <%  ArrayList<Selecao> selecoes = (ArrayList<Selecao>) session.getAttribute("selecoes");
                DaoEdital e = new DaoEdital();
                if (!selecoes.isEmpty()) {
                    for (int i = 0; i < selecoes.size() && i < 20; i++) {
            %>
            <form action="SelecionaEdital" method="post">
                <button class="list-group-item" type="submit" name="id" value="<%=selecoes.get(i).getEdital().getIdEdital()%>">
                    <h4 class="list-group-item-heading"><i class="glyphicon glyphicon-file"></i>
                        <b> <%= selecoes.get(i).getEdital().getTitulo()%> </b>
                    </h4> <span class="badge"> <%= e.qtdInscritos(selecoes.get(i).getEdital().getIdEdital())%> </span>
                    <p class="list-group-item-text">&nbsp; &nbsp;<i class="glyphicon glyphicon-asterisk"></i>
                        <q><small> <%= selecoes.get(i).getEdital().getDescricao()%> </small></q>
                    </p>
                </button>
            </form>
            <p></p>
            <%      }
                }
            %>
        </div>
    </div>
