<%@ tag body-content="empty" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="r" uri="http://www.groupwareworkbench.org.br/taglibs/reflection"%>

<%@ attribute name="photoMgr" required="true" rtexprvalue="true"
	type="br.org.groupwareworkbench.arquigrafia.photo.PhotoMgrInstance"%>
<%@ attribute name="user" required="true" rtexprvalue="true" type="br.org.groupwareworkbench.collablet.coord.user.User" %>
<%@ attribute name="photoPageNumber" required="false" rtexprvalue="true"
	type="java.lang.Long"%>
<%@ attribute name="photosPerPage" required="true" rtexprvalue="true"
	type="java.lang.Long"%>


<c:if test="${photoMgr.collablet.enabled}">

<c:choose>
    <c:when test="${(not empty photoPageNumber) && (photoPageNumber >= 0)}">
       <r:callMethod methodName="listPhotoByUserPageAndOrder" instance="${photoMgr}" var="photos" >
    	<r:param type="br.org.groupwareworkbench.collablet.coord.user.User" value="${user}" />
    	<r:param type="java.lang.Long" value="${photosPerPage}"/>
    	<r:param type="java.lang.Long" value="${photoPageNumber}"/>
	</r:callMethod>
    </c:when>
    <c:otherwise>
        <r:callMethod methodName="listPhotoByUserPageAndOrder" instance="${photoMgr}" var="photos" >
    	<r:param type="br.org.groupwareworkbench.collablet.coord.user.User" value="${user}" />
    	<r:param type="java.lang.Long" value="${photosPerPage}" />
    	<r:param type="java.lang.Long" value="${0}" />
	</r:callMethod>
    </c:otherwise>
</c:choose>
	<c:forEach var="foto" items="${photos}">
			<a class="search_image" href="<c:url value="/photo/${foto.id}"/>"> 
				<img src="<c:url value="/photo/img-thumb/${foto.id}"/>?_log=no" />
			</a>
	</c:forEach>
</c:if>