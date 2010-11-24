<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="friends" uri="http://www.groupwareworkbench.org.br/widgets/friends" %>
<%@ taglib prefix="photo" uri="http://www.groupwareworkbench.org.br/widgets/photomanager" %>
<%@ taglib prefix="arq" tagdir="/WEB-INF/tags" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/friends.css" />
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
        
        <script type="text/javascript">
            function refreshFriendsPage() {
                window.location.reload(true);
            }
        </script>
    </head>
    <body style="margin: 0px; background: url(../../../images/header_bg.jpg) no-repeat scroll 0 0 transparent;">
        <arq:header2 photoInstance="${photoMgr}" />
        <div id="corpo" class="default_div">
        <div id="info" class="default_info">
            <div id="top_links" class="blue_link">
            </div>
			<div>	
                <span class="big_black_title">Editar Amigos</span>
                <a style="text-align: right;" class="blue_link" href="${pageContext.request.contextPath}/groupware-workbench/friends/${friendsMgr.id}/show/${userLogin.id}">Meu perfil</a>
			</div>
			<br />
            <friends:editFriends style="width: 475px; float: right;"
                    user="${userLogin}"
                    friendsMgr="${friendsMgr}"
                    afterRemoveFunction="refreshFriendsPage"
                    friendsHeader="friends_header" />

            <friends:listFriendsRequests style="width: 475px;"
                    user="${userLogin}"
                    friendsMgr="${friendsMgr}"
                    afterRejectFunction="refreshFriendsPage"
                    afterAcceptFunction="refreshFriendsPage"
                    friendsHeader="friends_header" />
        </div>
        </div>
	    <div>
            <div style="height: 30px; background-color: #fff"></div>
            <arq:footer photoInstance="${photoMgr}" />
		</div>
    </body>
</html>