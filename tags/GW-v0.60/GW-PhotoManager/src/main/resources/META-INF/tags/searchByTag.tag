<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.groupwareworkbench.org.br/taglibs/reflection" prefix="r" %>
<%@ taglib uri="http://www.groupwareworkbench.org.br/widgets/tag" prefix="TagMgr" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ attribute name="photoInstance" required="true" rtexprvalue="true" type="br.org.groupware_workbench.photo.PhotoMgrInstance" %>
<%@ attribute name="linkClass" required="false" type="java.lang.String" %>
<%@ attribute name="showName" required="false" type="java.lang.Boolean" rtexprvalue="false" %>
<%@ attribute name="showLocation" required="false" type="java.lang.Boolean" rtexprvalue="false" %>
<%@ attribute name="nameClass" required="false" type="java.lang.String" %>
<%@ attribute name="locationClass" required="false" type="java.lang.String" %>
<%@ attribute name="idList" required="true" type="java.util.Collection" %>

<r:callMethod methodName="getDirImagesRelativo"	instance="${photoInstance}" var="dirImagem" />
<r:callMethod methodName="getThumbPrefix" instance="${photoInstance}" var="thumbPrefix" />
<r:callMethod methodName="getMostraPrefix" instance="${photoInstance}" var="showPrefix" />
<r:callMethod methodName="buscaFotoPorListaId" instance="${photoInstance}" var="photos">
	    <r:param type="java.util.List" value="${idList}" />
</r:callMethod>        
        
<%--
    TODO: Evitar inserir <div> que n�o fecham de forma �bvia pois dependem de an�lise sens�vel ao contexto para
    garantir que s�o bem formadas.
--%>
<c:forEach var="foto" items="${photos}">
    <c:if test="${showName || showLocation}">
        <div style="float: left">
            <div>
    </c:if>
    <a class="${linkClass}" rel="linkimage" href="<c:url value="/groupware-workbench/${photoInstance.id}/photo/show/${foto.id}"/>">
        <img src="${pageContext.request.contextPath}/${dirImagem}/${thumbPrefix}${foto.nomeArquivoUnico}" alt="${foto.nome}"/>
    </a>
    <c:if test="${showName || showLocation}">
        </div>
    </c:if>
    <c:if test="${showName}">
        <div class="${nameClass}">
            <c:out value="${foto.nome}" />
        </div>
    </c:if>
    <c:if test="${showLocation}">
        <div class="${locationClass}" >
            <c:out value="${foto.lugar}" />
        </div>
    </c:if>
    <c:if test="${showName || showLocation}">
        </div>
    </c:if>
</c:forEach>
