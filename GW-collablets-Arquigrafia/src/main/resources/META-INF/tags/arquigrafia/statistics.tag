<%@ tag body-content="empty" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s"
	uri="http://www.groupwareworkbench.org.br/widgets/security"%>
<%@ taglib prefix="p"
	uri="http://www.groupwareworkbench.org.br/widgets/photomanager"%>

<%@ attribute name="photoMgr" required="false" rtexprvalue="true"
	type="br.org.groupwareworkbench.arquigrafia.photo.PhotoMgrInstance"%>
<%@ attribute name="tagMgr" required="false" rtexprvalue="true"
	type="br.org.groupwareworkbench.collablet.communic.tag.TagMgrInstance"%>
<%@ attribute name="commentMgr" required="false" rtexprvalue="true"
	type="br.org.groupwareworkbench.collablet.communic.comment.CommentMgrInstance"%>
<%@ attribute name="userMgr" required="false" rtexprvalue="true"
	type="br.org.groupwareworkbench.collablet.coord.user.UserMgrInstance"%>
<%@ attribute name="binomialMgr" required="false" rtexprvalue="true"
	type="br.org.groupwareworkbench.collablet.coop.binomial.BinomialMgrInstance"%>
<%@ attribute name="albumMgr" required="false" rtexprvalue="true"
	type="br.org.groupwareworkbench.collablet.coop.album.AlbumMgrInstance"%>

<p:countAllTags tagMgr="${tagMgr}" />
<p:countAllEvaluations binomialMgr="${binomialMgr}" />
<p:countAllComments commentMgr="${commentMgr}" />
<p:countAllAlbums albumMgr="${albumMgr}" />
<p:countAllUsers userMgr="${userMgr}" />
<p:countAllPhotos photoMgr="${photoMgr}" />
