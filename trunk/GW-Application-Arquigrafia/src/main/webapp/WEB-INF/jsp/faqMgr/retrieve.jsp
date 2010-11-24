<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="w" uri="http://www.groupwareworkbench.org.br/widgets/commons" %>
<%@ taglib prefix="tag" uri="http://www.groupwareworkbench.org.br/widgets/tag" %>
<%@ taglib prefix="binomial" uri="http://www.groupwareworkbench.org.br/widgets/binomial" %>
<%@ taglib prefix="category" uri="http://www.groupwareworkbench.org.br/widgets/category" %>
<%@ taglib prefix="photo" uri="http://www.groupwareworkbench.org.br/widgets/photomanager" %>
<%@ taglib prefix="arq" tagdir="/WEB-INF/tags" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-Control" content="no-cache">
        <title>Faq</title>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/listagem.js"></script>

        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css" />
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/arq-common.css" />
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/know_more.css" />
	    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/forms.css"  />
	    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/plugins/sds/css/smoothDivScroll.css" />
	    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/bay.css" />
	    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/footer.css" />
	    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/jquery.css" />
	    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/tagcloud.css" />
	    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/image_wall.css" />
	    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/boxy.css" />
	    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-1.8.custom.min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/sds/js/jquery.smoothDivScroll-0.9-min.js"></script>
	    <script type="text/javascript" src="${pageContext.request.contextPath}/plugins/sds/js/scroll.js"></script>
	    <script  type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.boxy.js"></script>
	    <script type="text/javascript">
            $(document).ready(function() {
                $("div#makeMeScrollable").smoothDivScroll({
                    scrollingSpeed: 12,
                    mouseDownSpeedBooster: 3,
                    visibleHotSpots: "always",
                    startAtElementId: "startAtMe"
                });

                $("div#makeMeScrollable2").smoothDivScroll({
                    scrollingSpeed: 12,
                    mouseDownSpeedBooster: 3,
                    visibleHotSpots: "always",
                    startAtElementId: "startAtMe"
                });
            });
        </script>
        
        <tag:scriptTags />
        <binomial:scriptBinomial />
    </head>
    <body>
	    <arq:header2 photoInstance="${photoMgr}" />        
        <w:conteudoPagina titulo="Faq:">
            <br />
            <h1><span class="style1">Cadastro</span></h1>
            <br />
            <form name="dados" method="post" action="<c:url value="/groupware-workbench/faq/${faqMgr.id}" />">
                <input type="hidden" name="faq.id" value="<c:out value="${faq.id}" />" />
                <%-- TODO: Tableless! --%>
                <table cellpadding="3">
                    <c:if test="${categoryMgr.collablet.enabled}">
                        <tr>
                            <td>Categoria</td>
                            <td>
                                <category:simpleDropDownBox entity="${faq}" categoryMgr="${categoryMgr}" />
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <td>Pergunta</td>
                        <td><input size="60" type="text" name="faq.pergunta" value="<c:out value="${faq.pergunta}" />" /></td>
                    </tr>
                    <tr>
                        <td>Resposta</td>
                        <td><textarea rows="4" cols="60" name="faq.resposta"><c:out value="${faq.resposta}" /></textarea></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <c:if test="${tagMgr.collablet.enabled}">
                                Tags clique em uma das tags abaixo para adicion&aacute;-la ao FAQ.
                                <br />
                                <tag:selectTags tagMgr="${tagMgr}" />
                                <tag:setTags tagMgr="${tagMgr}" entity="${faq}" />
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${binomialMgr.collablet.enabled}">
                                <%-- FIXME: binomial:setBinomial não existe e nem nunca existiu! --%>
                                <binomial:setBinomial binomialMgr="${binomialMgr}" entity="${faq}" user="${sessionScope.userLogin}" />
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" class="botao" value="Ok" />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
            </form>
            <div class="barra_botoes">
                <w:voltar collabletInstance="${faqMgr.collablet}" />
            </div>
        </w:conteudoPagina>
	    <div>
            <div style="height: 30px; background-color: #fff"></div>
            <arq:footer photoInstance="${photoMgr}" />
		</div>        
    </body>
</html>
