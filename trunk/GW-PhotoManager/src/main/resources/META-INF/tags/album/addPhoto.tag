<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="r" uri="http://www.groupwareworkbench.org.br/taglibs/reflection" %>

<%@ attribute name="albumMgr" required="true" rtexprvalue="true" type="br.org.groupwareworkbench.collablet.coop.album.AlbumMgrInstance" %>
<%@ attribute name="album" required="true" rtexprvalue="true" type="br.org.groupwareworkbench.collablet.coop.album.Album" %>
<%@ attribute name="photo" required="true" rtexprvalue="true" type="br.org.groupwareworkbench.arquigrafia.photo.Photo" %>

<%@ attribute name="albumDefault" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%@ attribute name="user" required="true" rtexprvalue="true" type="br.org.groupwareworkbench.collablet.coord.user.User" %>
<%@ attribute name="successClass" required="false" rtexprvalue="false" type="java.lang.String" %>


<%--
    TODO: Evitar inserir <div> que nao fecham de forma obvia pois dependem de analise sensivel ao contexto para
    garantir que sao bem formadas.
--%>
 <script type="text/javascript">
    function addObject(){
    	 $.ajax({
			    type: 		"post",
	   			url: "${pageContext.request.contextPath}/groupware-workbench/albuns/${albumMgr.id}/default/",
	   			data: "objectId= ${photo.id} & strClass= ${photo.class.name}",
	   			complete: function(){
					ShowStatus( "AJAX - complete()" );
				},

			});

	}
 </script>
 
	<div id="BtPhoto">
	   	<input id="submit" type="submit" value="Add to Album" name="submit" onclick="addObject();"/>
	</div>

 <div id="successAddObjectAtDefaultAlbum" >
    <script type="text/javascript">
        $("#successAddObjectAtDefaultAlbum").show().delay(2000).slideUp(300);                
    </script>
    <c:out value="${successAddObjectAtDefaultAlbum}" />    
    <c:if test="${empty successAddObjectAtDefaultAlbum}">
    	<script type="text/javascript">
            $("#successAddObjectAtDefaultAlbum").hide();
    	</script> 
    </c:if>
</div>