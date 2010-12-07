<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="w" uri="http://www.groupwareworkbench.org.br/widgets/commons" %>
<%@ taglib prefix="photo" uri="http://www.groupwareworkbench.org.br/widgets/photomanager" %>
<%@ taglib prefix="arq" tagdir="/WEB-INF/tags" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-Control" content="no-cache">
        <title>Sugest&otilde;es y cr&iacute;ticas</title>
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
        <script src="${pageContext.request.contextPath}/js/chili-1.7.pack.js" type="text/javascript" ></script>
        <script src="${pageContext.request.contextPath}/js/jquery.easing.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.dimensions.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.accordion.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/bay.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.boxy.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="wrap">
            <arq:header2 photoInstance="${photoMgr}" />
				<div id="corpo" class="default_div">
				<form id="form1" class="cmxform" name="dados" method="POST" action="<c:url value="/groupware-workbench/user/${userMgr.id}/sendEmail/${userLogin.id}" />" accept-charset="UTF-8" autocomplete="off">
                <div id="info" class="default_info">
                	<span class="tituloPrincipal"> Sugest&otilde;es e Cr&iacute;ticas:</span>
                    <ul class="field_line_f1">
                        <li class="label_f1"><span>Nome:</span></li>
                        <li class="input_f1"><c:out value="${sessionScope.userLogin.name}" /></li>
                    </ul>
                    <ul class="field_line_f1">
                        <li class="label_f1"><span>Assunto</span></li>
                        <li class="input_f1"><input id="subject" type="text" name="subject" value="" /></li>
                    </ul>
                    <ul class="field_line_f1">
                        <li class="label_f1"><span>Sugest&otilde;es e cr&iacute;ticas:</span></li>
                        <li class="input_f1"><textarea rows="4" cols="60" id="message" name="message"> </textarea>
                        </li>
                    </ul>
                </div>
                <div class="form_1" style="text-align: center;">
                    <ul class="bt_line_f1">
                        <li class="bt_cell_submit">
                            <input type="submit" class="botao" value="Ok" />
                        </li>
                    </ul>
                </div>
	            </form>
            </div>
            <div style="height: 30px; background-color: #fff"></div>
            <arq:footer photoInstance="${photoMgr}" />
        </div>
    </body>
</html>