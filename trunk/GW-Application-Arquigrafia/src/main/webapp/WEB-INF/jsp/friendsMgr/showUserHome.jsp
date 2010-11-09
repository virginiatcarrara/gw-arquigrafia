<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="w" uri="http://www.groupwareworkbench.org.br/widgets/commons" %>
<%@ taglib prefix="friends" uri="http://www.groupwareworkbench.org.br/widgets/friends" %>
<%@ taglib prefix="r" uri="http://www.groupwareworkbench.org.br/taglibs/reflection" %>
<%@ taglib prefix="tag" uri="http://www.groupwareworkbench.org.br/widgets/tag" %>
<%@ taglib prefix="comment" uri="http://www.groupwareworkbench.org.br/widgets/comment" %>
<%@taglib  prefix="profile" uri="http://www.groupwareworkbench.org.br/widgets/profile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-Control" content="no-cache">
        <title>Recados</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/forms.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/show.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/jquery.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/boxy.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/friends.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/arq-common.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/compiled/arquigrafia-default.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.boxy.js" type="text/javascript"></script>
    </head>
    <body style="background: url(../../../../images/header_bg.jpg) no-repeat scroll 0 0 transparent;">
        <div id="corpo" style=" display: block; width: 990px; margin-left: auto; margin-right: auto; margin-top: 10px;">

            <div id="top_links" class="blue_link" style="margin-bottom: 15px;">
                <a class="blue_link" href="${pageContext.request.contextPath}/groupware-workbench">In&iacute;cio</a>
                    &nbsp;|&nbsp;
                <a class="blue_link" href="${pageContext.request.contextPath}/groupware-workbench/friends/${friendsMgr.id}/edit">Editar Amigos</a>
            </div>

            <div id="cabecalho">
                <img class="${friend_img}" alt="photo <c:out value="${friend.name}" />" src="${friend.photoURL}" />
                <span class="${friend_name}"><c:out value="${friend.name}" /></span>
                <friends:sendRequest friendsMgr="${friendsMgr}" viewer="${userLogin}" viewed="${friend}" />
            </div>

            <div id="informacao">
                <c:if test="${profileMgr.collablet.enabled}">
                    <profile:showProfile profileMgr="${profileMgr}" user="${friend}" />
                </c:if>
            </div>

            <div id="amigos" style="float: right;">
                <friends:listFriends
                        user="${userLogin}"
                        friendsMgr="${friendsMgr}" friendsHeader="friends_header"
                        style="width: 400px;" />
            </div>

            <c:if test="${commentMgr2.collablet.enabled}">
                <div id="comentario" style="width: 750px;">
                    <form name="comments" method="post" enctype="multipart/form-data" action="<c:url value="/groupware-workbench/friends/${friendsMgr.id}/show/${friend.id}" />">
                        <div id="comments_bar">
                            <div id="comments_bar_bg">
                                <div id="comments_bar_title" class="big_blue_title2">
                                    <p>Mensagens</p>
                                </div>
                                <div id="comments_bar_link" class="comments_link">
                                    <a class="white_link"><img src="${pageContext.request.contextPath}/images/add_comment.png" alt="Adicionar Mensagem" /></a>
                                </div>
                                <div id="comments_bar_link2" class="comments_link">
                                    <a class="white_link"><img src="${pageContext.request.contextPath}/images/add_comment2.png" alt="Adicionar Mensagem" /></a>
                                </div>
                            </div>
                        </div>
                        <div id="comments_create" style="height: 130px;">
                            <comment:addComment commentMgr="${commentMgr2}" idObject="${friend.id}" user="${sessionScope.userLogin}" editorClass="editorClass" wrapClass="comments_create_internal" />
                            <input name="commentAdd" value="Adicionar" type="submit" />
                        </div>
                        <div id="comments_show">
                            <comment:getComments commentMgr="${commentMgr2}" entity="${friend}" wrapClass="comments_show_internal" />
                        </div>
                        <script type="text/javascript">
                            $("#comments_create").hide();
                            $("#comments_bar_link2").hide();
                            $("#comments_bar_link").click(function(){
                                $("#comments_create").slideDown();
                                $("#comments_bar_link").hide();
                                $("#comments_bar_link2").show();
                            });
                            $("#comments_bar_link2").click(function(){
                                $("#comments_create").slideUp();
                                $("#comments_bar_link2").hide();
                                $("#comments_bar_link").show();
                            });
                        </script>
                    </form>
                </div>
            </c:if>
        </div>
    </body>
</html>
