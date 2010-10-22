<%@ tag body-content="empty" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="w" uri="http://www.groupwareworkbench.org.br/widgets/commons" %>
<%@ taglib prefix="photo" uri="http://www.groupwareworkbench.org.br/widgets/photomanager" %>

<%@ attribute name="photoRegister" required="true" rtexprvalue="true" type="br.org.groupwareworkbench.arquigrafia.photo.Photo" %>
<%@ attribute name="albumMgr" required="true" rtexprvalue="true" type="br.org.groupwareworkbench.collablet.coop.album.AlbumMgrInstance" %>

<script src="${pageContext.request.contextPath}/js/formToWizard.js" type="text/javascript"></script>
<script type="text/javascript"> 
    $(document).ready(function() {
        $("#photoRegisterForm").formToWizard();
    });
</script>
        
<div class="big_white_title" id="register_title">
    <div><img src="${pageContext.request.contextPath}/images/upload.png" alt="upload" />&nbsp;</div>
    <div>Album - Add Photos</div>
</div>
<c:if test="${not empty errors}">
    <div id="errors">
        <c:forEach var="error" items="${errors}">
            <c:out value="${error.category}" /> - <c:out value="${error.message}" />
        </c:forEach>
    </div>
</c:if>
<div id="internal_wrap">
    <div class="mid_blue_text" style="margin-left: 30px; background-color: #fff;">
        <form name="photoRegisterForm" id="photoRegisterForm" method="post" enctype="multipart/form-data"
                action="<c:url value="/groupware-workbench/album/${albumMgr.id}/album/${album.id}/photo/registra/" />">
            <photo:save photoRegister="${photoRegister}"
                    albumMgr="${albumMgr}"
                    user="${sessionScope.userLogin}" formClass="form1"
                    formLineClass="field_line_f1" formLabelClass="label_f1"
                    formInputClass="input_f1" />
        </form>
    </div>
</div>