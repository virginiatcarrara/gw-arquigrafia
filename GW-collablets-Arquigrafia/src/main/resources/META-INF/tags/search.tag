<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="r" uri="http://www.groupwareworkbench.org.br/taglibs/reflection" %>

<%@ attribute name="photoMgr" required="true" rtexprvalue="true" type="br.org.groupwareworkbench.arquigrafia.photo.PhotoMgrInstance" %>

<script type="text/javascript">
    $(function() {
        $("#datepicker").datepicker({
            "showOn": "button",
            "changeMonth": true,
            "changeYear": true,
            "width": 15,
            "dateFormat": "dd/mm/yy", <%-- Aten��o: De acordo com a documenta��o, yy � o ano com 4 d�gitos. --%>
            "buttonImage": "${pageContext.request.contextPath}/images/calendar.gif",
            "buttonImageOnly": true
        });
    });
</script>

<div id="form1">
    <form name="formBusca" action="<c:url value="/photo/${photoMgr.id}/busca"/>" method="post">
        <%-- TODO: Tableless! --%>
        <table>
            <tr>
                <td><input type="text" name="busca" /></td>
            </tr>
            <tr>
                <td><input type="submit" value="Buscar" /></td>
            </tr>
        </table>
    </form>
    <br />
    <span id="avancedSearch"><a href="#">Pesquisa Avan&ccedil;ada</a></span>
</div>

<div id="form2">
    <form name="formBuscaAvancada" action="<c:url value="/photo/${photoMgr.id}/buscaA" />" method="post">
        <%-- TODO: Tableless! --%>
        <table>
            <tr>
                <td>Nome:</td>
                <td><input type="text" name="nome" /></td>
            </tr>
            <tr>
                <td>Descri&ccedil;&atilde;o:</td>
                <td><textarea rows="3" name="descricao"></textarea></td>
            </tr>
            <tr>
                <td>Lugar onde foi tirada</td>
                <td><input type="text" name="lugar" /></td>
            </tr>
            <tr>
                <td>Data</td>
                <td><input type="text" id="datepicker" name="date" /></td>
            </tr>
            <tr>
                <td><input type="submit" value="Buscar" /></td>
            </tr>
        </table>
    </form>
    <br />
    <span id="simpleSearch"><a href="#">Pesquisa Simples</a></span>
</div>

<script type="text/javascript">
    $("#form2").hide();
    $("#simpleSearch").click(function() {
        $("#form1").show();
        $("#form2").hide();
    });
    $("#avancedSearch").click(function() {
        $("#form2").show();
        $("#form1").hide();
    });
</script>