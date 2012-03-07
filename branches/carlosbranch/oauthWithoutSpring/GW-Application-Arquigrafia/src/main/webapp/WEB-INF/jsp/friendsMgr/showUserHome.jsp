<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="w" uri="http://www.groupwareworkbench.org.br/widgets/commons" %>
<%@ taglib prefix="friends" uri="http://www.groupwareworkbench.org.br/widgets/friends" %>
<%@ taglib prefix="r" uri="http://www.groupwareworkbench.org.br/taglibs/reflection" %>
<%@ taglib prefix="tag" uri="http://www.groupwareworkbench.org.br/widgets/tag" %>
<%@ taglib prefix="comment" uri="http://www.groupwareworkbench.org.br/widgets/comment" %>
<%@taglib  prefix="profile" uri="http://www.groupwareworkbench.org.br/widgets/profile" %>
<%@ taglib prefix="photo" uri="http://www.groupwareworkbench.org.br/widgets/photomanager" %>
<%@ taglib prefix="arq" tagdir="/WEB-INF/tags" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-Control" content="no-cache">
        <title>Recados</title>
        <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/images/favicon.ico" />"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/forms.css" />"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/show.css" />"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/friends.css" />"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/reset.css" />"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/arq-common.css" />"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/header.css" />"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/know_more.css" />"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/forms.css" />"/>
        <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/plugins/sds/css/smoothDivScroll.css" />"/>
        <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/bay.css" />"/>
        <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/footer.css" />"/>
        <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery.css" />"/>
        <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/tagcloud.css" />"/>
        <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/image_wall.css" />"/>
        <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/boxy.css" />"/>
        <script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/js/jquery-ui.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/plugins/sds/js/jquery.smoothDivScroll-0.9-min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/plugins/sds/js/scroll.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/js/jquery.boxy.js"/>"></script>
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
    </head>
    <body style="background: url(../../../../images/header_bg.jpg) no-repeat scroll 0 0 transparent;">
    	<arq:header2 photoInstance="${photoMgr}" />
        <div id="corpo" class="default_div">
            <div id="info" class="default_info">
                <br />
                <div class="linha">
                    <c:if test="${friend.id == userLogin.id}">
                        <c:if test="${not empty pending}">
                            <h4 style="color: #DF4C32; font-family: Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold;">
                                voc&ecirc; tem ${pending} convite(s) de amizade pendente(s), clique <a class="blue_link" href="<c:url value="/groupware-workbench/friends/${friendsMgr.id}/edit" />">aqui</a> para visualiz&aacute;-las ou no link Editar Amigos.
                            </h4>
                            <br />
                        </c:if>
                    </c:if>
                </div>
                <div class="linha">
                    <div class="coluna" style="float: left;">
                        <c:choose>
                            <c:when test="${empty friend.photoURL}">
                                <img class="imagem_user" src="<c:url value="/images/users/default.jpg" />" />
                            </c:when>
                            <c:otherwise>
                                <img class="imagem_user" src="${friend.photoURL}" />
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="coluna" style="float: left; width: 475px;">
                        <div class="linha">
                            <span class="big_black_title"><c:out value="${friend.name}" /></span>
                        </div>
                        <div class="linha">
                            <c:if test="${friend.id == userLogin.id}">
                                <form class="cmxform" name="edit" method="POST" action="<c:url value="/groupware-workbench/user/edit" />" accept-charset="UTF-8" autocomplete="off">
                                    <input type="hidden" id="idUser" name="idUser" value="<c:out value="${friend.id}" />" />
                                    <input type="hidden" id="url" name="url" value="/groupware-workbench/friends/${friendsMgr.id}/show/${friend.id}" />
                                    <input type="submit"  name="Editar" value="Editar perfil" />
                                </form>
                            </c:if>
                            <friends:sendRequest friendsMgr="${friendsMgr}" viewer="${userLogin}" viewed="${friend}" />
                        </div>
                    </div>
                    <div style="font-size: 12px; font-family: Calibri;"> <a href='<c:url value="/groupware-workbench/externalaccount/${externalAccountMgr.id}/manage" />'>Amigos de outras redes</a></div>
                    <div class="coluna" style="float: left;">
                        <friends:listFriends
                            user="${friend}"
                            friendsMgr="${friendsMgr}" friendsHeader="friends_header"
                            style="width: 400px;" />
                    </div>
                </div>
                <br />
                <div id="informacao" class="linha">
                    <br />
                    <br />
                    <c:if test="${profileMgr.collablet.enabled}">
                        <profile:showProfile profileMgr="${profileMgr}" user="${friend}" />
                    </c:if>
                </div>
                <div class="linha">
                    <c:if test="${commentMgr2.collablet.enabled}">
                        <div id="comentario" style="width: 700px; float:left; margin-top: 10px;">
                            <form name="comments" method="post" enctype="multipart/form-data" action="<c:url value="/groupware-workbench/friends/${friendsMgr.id}/show/${friend.id}" />">
                                <div id="comments_bar">
                                    <div id="comments_bar_bg">
                                        <div id="comments_bar_title" class="big_blue_title2">
                                            <p>Mensagens</p>
                                        </div>
                                        <div id="comments_bar_link" class="comments_link">
                                            <a class="white_link"><img src="<c:url value="/images/add_comment.png"/>" alt="Adicionar Mensagem"></a>
                                        </div>
                                        <div id="comments_bar_link2" class="comments_link">
                                            <a class="white_link"><img src="<c:url value="/images/add_comment2.png"/>" alt="Adicionar Mensagem"></a>
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
            </div>
        </div>
        <div>
            <div style="height: 30px; background-color: #fff"></div>
            <arq:footer photoInstance="${photoMgr}" />
        </div>
    </body>
</html>
