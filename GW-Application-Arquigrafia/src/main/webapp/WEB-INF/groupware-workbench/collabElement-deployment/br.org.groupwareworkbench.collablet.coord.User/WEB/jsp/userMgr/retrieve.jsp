<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="w" uri="http://www.groupwareworkbench.org.br/widgets/commons" %>
<%@ taglib prefix="role" uri="http://www.groupwareworkbench.org.br/widgets/role" %>
<%@ taglib prefix="profile" uri="http://www.groupwareworkbench.org.br/widgets/profile" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-Control" content="no-cache">
        <title>Usu&aacute;rio</title>
        <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.maskedinput.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#form1").validate();
            });
        </script>
        <profile:scriptProfile />
    </head>
    <body>
        <w:topo collabletInstance="${collabletInstance}" />
        <w:conteudoPagina titulo="Usu&aacute;rio">
            <br/>
            <ul>
                <c:forEach var="error" items="${errors}">
                    <li><c:out value="${error.message}" /> - <c:out value="${error.category}" /></li>
                </c:forEach>
            </ul>

            <form id="form1" class="cmxform" name="dados" method="POST" action="<c:url value="/groupware-workbench/${collabletInstance.id}/userMgr/${userMgr.id}" />" accept-charset="UTF-8">
                <input type="hidden" name="user.id" value="<c:out value="${user.id}" />" />
                <input type="hidden" name="user.idInstance" value="${collabletInstance.id}" />
                <div class="form_1" id="user_retrieve_form">
                    <ul class="field_line_f1">
                        <li class="label_f1"><span>Login:</span></li>
                        <li class="input_f1"><input type="text" class="required" name="user.login" value="<c:out value="${user.login}" />" /></li>
                    </ul>
                    <ul class="field_line_f1">
                        <li class="label_f1"><span>Password:</span></li>
                        <li class="input_f1"><input id="password" class="required" type="password" name="user.password" value="<c:out value="${user.password}" />" /></li>
                    </ul>
                    <ul class="field_line_f1">
                        <li class="label_f1"><span>E-mail:</span></li>
                        <li class="input_f1"><input id="email" class="required email" type="text" name="user.email" value="<c:out value="${user.email}" />" /></li>
                    </ul>
                    <ul class="field_line_f1">
                        <li class="label_f1"><span>Nome:</span></li>
                        <li class="input_f1"><input id="name" class="required" type="text" name="user.name" value="<c:out value="${user.name}" />" /></li>
                    </ul>
                </div>

                <c:if test="${profileMgr != null}">
                    <profile:profile profileMgr="${profileMgr}" genericEntity="${user}" />
                </c:if>

                <div class="subsection_f1">
                    <fieldset>
                        <c:if test="${roleMgr != null}">
                            <legend><span class="subtitle_f1">Atribuir pap&eacute;is:</span></legend>
                            <role:selectRole roleMgr="${roleMgr}" genericEntity="${user}" />
                        </c:if>
                    </fieldset>
                </div>

                <div class="form_1">
                    <ul class="bt_line_f1">
                        <li class="bt_cell_submit">
                            <input type="submit" class="botao" value="Ok" />
                        </li>
                    </ul>
                </div>
            </form>
            <div class="barra_botoes">
                <w:voltar collabletInstance="${collabletInstance}" />
            </div>
        </w:conteudoPagina>
    </body>
</html>