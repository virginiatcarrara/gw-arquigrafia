<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.groupwareworkbench.org.br/widgets/commons" prefix="Widgets" %>
<%@ taglib	uri="http://www.groupwareworkbench.org.br/widgets/photomanager" prefix="photo"%>	
<%@ taglib uri="http://www.groupwareworkbench.org.br/widgets/binomial" prefix="binomialMgr"%>
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Foto Busca</title>

</head>
<link href="${pageContext.request.contextPath}/css/novo.css" rel="stylesheet" type="text/css" />

<link type="text/css"
	href="${pageContext.request.contextPath}/css/jquery-ui-1.8.custom.css"
	rel="Stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-ui-1.8.custom.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/fancybox/jquery.mousewheel-3.0.2.pack.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/fancybox/jquery.fancybox-1.3.1.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/fancybox/jquery.fancybox-1.3.1.css" media="screen" />

<body>

<Widgets:Topo collabletInstance="${photoInstance}" />
<Widgets:ConteudoPagina titulo="Busca Fotos">

	<Widgets:Configuracao collabletInstance="${photoInstance}" />
	
	<span class="subTitulo">Collablets</span>
		<br />
        <br />

        <Widgets:MenuFerramentas collabletInstance="${photoInstance}" groups="${groups}" />
        <br />
        
        <br />

<br/>
<a href="<c:url value="/groupware-workbench/${photoInstance.id}/photo/registra"/>">Registrar uma nova foto</a> 
<br/>
<br />


<table width="100%">
<tr style="vertical-align: top">
<td>
	<h1>Busca Fotos</h1>
	<photo:search photoInstance="${photoInstance}"/>
	<photo:list photos="${fotos}" photoInstance="${photoInstance}"/>
</td>
<td>
	<h1>Lista Fotos</h1>
	<photo:listAll photoInstance="${photoInstance}"/>	
</td>
</tr>
</table>

<c:forEach var="error" items="${errors}">
	${error.category} - ${error.message} <br />
</c:forEach>



<Widgets:Voltar collabletInstance="${photoInstance}" />
</Widgets:ConteudoPagina>

</body>
</html>