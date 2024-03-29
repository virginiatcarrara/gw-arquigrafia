<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="w" uri="http://www.groupwareworkbench.org.br/widgets/commons" %>
<%@ taglib prefix="coll" uri="http://www.groupwareworkbench.org.br/widgets/collections" %>
<%@ taglib prefix="photo" uri="http://www.groupwareworkbench.org.br/widgets/photomanager" %>
<%@ taglib prefix="arq" tagdir="/WEB-INF/tags" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-Control" content="no-cache">
        <title>Avalia&ccedil;&atilde;o</title>
        <link rel="shortcut icon" type="image/x-icon" href="<c:url value="/images/favicon.ico" />"/>
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
        <script type="text/javascript" src="<c:url value="/js/listagem.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/js/jquery.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/js/jquery-ui.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/js/jquery.raty.js"/>"></script>
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

        <script type="text/javascript">
            $(function() {
                $('div#star').raty({
                    path: "${pageContext.request.contextPath}/images/",
                    onClick: function(score) {
                        document.forms[0].score.value = score;
                        alert('score: ' + score);
                    }
                });

                $('div#fixed').raty({
                    path: "${pageContext.request.contextPath}/images/",
                    readOnly: true,
                    start: 2
		});

                $('div#custom').raty({
                    path: "${pageContext.request.contextPath}/images/",
                    scoreName: 'entity.score',
                    number: 10
                });

                $('div#target').raty({
                    path: "${pageContext.request.contextPath}/images/",
                    hintList: ['a', '', null, 'd', '5'],
                    starOn: 'medal-on.png',
                    starOff: 'medal-off.png'
                });

                $('div#click').raty({
                    path: "${pageContext.request.contextPath}/images/",
                    onClick: function(score) {
                        alert('score: ' + score);
                    }
                });

                $('div#half').raty({
                    path: "${pageContext.request.contextPath}/images/",
                    start: 3.3,
                    showHalf: true
                });

                $('div#cancel').raty({
                    path: "${pageContext.request.contextPath}/images/",
                    showCancel: true
                });

                $('div#cancel-custom').raty({
                    path: "${pageContext.request.contextPath}/images/",
                    cancelHint: 'remove my rating!',
                    cancelPlace: 'right',
                    showCancel: true,
                    onClick: function(score) {
                        alert('score: ' + score);
                    }
                });
            });

            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-17006803-1']);
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
	</script>

        <style type="text/css">
            a#coffee-link, div#coffee-container {
                border-radius: 4px;
                -khtml-border-radius: 4px;
                -moz-border-radius: 4px;
                -opera-border-radius: 4px;
                -webkit-border-radius: 4px;
            }

            div#link a {
                color: #EA9C00;
                font: bold 10px verdana;
                letter-spacing: .9px;
                text-decoration: none;
            }
			
            div#link a:hover {
                color: #DC5;
                font: bold 10px verdana;
                letter-spacing: .9px;
                text-decoration: underline;
            }

            a#coffee-link {
                background: url('img/coffee.png') 6px 2px no-repeat;
                border: 1px solid #D9C640;
                color: #FFF;
                display: block;
                font: bold 10px verdana;
                letter-spacing: .9px;
                padding: 4px 5px 4px 26px;
                text-decoration: none;
            }

            a#coffee-link:hover {
                text-decoration: underline;
            }

            div#adsense {
                font: 10px verdana;
                color: #AB9927;
                text-indent: 7px;
            }

            div#coffee-container {
                background-color: #DC5;
                float: right;
                margin-right: 15px;
            }

            div.description {
                font: 10px verdana;
                color: #555;
                letter-spacing: .1px;
                margin-bottom: 10px;
                text-indent: 7px;
                text-align: left;
                width: 99%;
            }

            div#link {
                font: 10px verdana;
                color: #AB9927;
                text-indent: 7px;
            }

            div.notice {
                font: 9px verdana;
                color: #777;
                letter-spacing: .1px;
                margin-bottom: 3px;
                text-indent: 7px;
                text-align: left;
                width: 99%;
            }

            div.session {
                font: bold 13px verdana;
                border-bottom: 1px solid #EFEFEF;
                color: #444;
                letter-spacing: .7px;
                margin-bottom: 10px;
                margin-top: 24px;
                text-align: left;
                width: 99%;
            }

            div.source {
                background: #F8F8FF;
                border: 1px solid #EFEFEF;
                border-left: 3px solid #CCC;
                color: #444;
                font: 12px monospace;
                letter-spacing: .1px;
                margin-bottom: 7px;
                margin-top: 5px;
                padding: 7px;
                width: 99%;
            }

            div.text {
                font: 10px verdana;
                color: #555;
                letter-spacing: .1px;
                margin-bottom: 20px;
                margin-top: 5px;
                text-align: left;
                text-indent: 7px;
                width: 99%;
            }

            div.title {
                font: bold 17px verdana;
                color: #269;
                letter-spacing: .7px;
                margin-bottom: 20px;
                margin-top: 5px;
                text-align: left;
                width: 99%;
            }
			
            span.comment-html, span.comment-script {
                font: 12px monospace;
                letter-spacing: .1px;
                margin-bottom: 7px;
                margin-top: 5px;
            }

            span.comment-html {
                color: #5e85de;
            }

            span.comment-script {
                color: #578F73;
            }

            span#version {
                color: #777;
                font: 10px verdana;
            }
        </style>
    </head>
    <body>
        <arq:header2 photoMgr="${photoMgr}" />
        <w:conteudoPagina titulo="Star Rating Bar">
            <div class="title">jQuery Raty - A Star Rating Plugin</div>

            <div class="text">jQuery <b>Raty</b> is a plugin that generates a customizable star rating automatically.</div>

            <div class="session">With default options:</div>
            <div id="star"></div>

            <div class="source">
                $('#star').raty();<br />
                <br />
                &lt;div id="star"&gt;&lt;/div&gt;
            </div>

            <input type="hidden" id="score" value="" />

            <div class="session">Started with a score and read only value:</div>
            <div id="fixed"></div>

            <div class="source">
                $('#fixed').raty({<br />
                    &nbsp;&nbsp;readOnly:&nbsp;&nbsp;true,<br />
                    &nbsp;&nbsp;start:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2<br />
                });<br />
                <br />

                &lt;div id="fixed"&gt;&lt;/div&gt;
            </div>

            <div class="session">With a custom score name and a number of stars:</div>
            <div id="custom"></div>

            <div class="source">
                $('#custom').raty({<br />
                    &nbsp;&nbsp;scoreName:&nbsp;&nbsp;'entity.score',<br />
                    &nbsp;&nbsp;number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10<br />
                });<br />
                <br />

                &lt;div id="custom"&gt;&lt;/div&gt;
            </div>

            <div class="session">With a custom hint and icons:</div>
            <div id="target"></div>

            <div class="source">
                $('#target').raty({<br />
                    &nbsp;&nbsp;hintList:&nbsp;&nbsp;['a', '', null, 'd', '5'],<br />
                    &nbsp;&nbsp;starOn:&nbsp;&nbsp;&nbsp;&nbsp;'medal-on.png',<br />
                    &nbsp;&nbsp;starOff:&nbsp;&nbsp;&nbsp;'medal-off.png'<br />
                });<br />
                <br />

                &lt;div id="target"&gt;&lt;/div&gt;
            </div>

            <div class="session">Using onClick function:</div>
            <div id="click"></div>

            <div class="source">
                $('#click').raty({<br />
                    &nbsp;&nbsp;onClick: function(score) {<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;alert('score: ' + score);<br />
                    &nbsp;&nbsp;}<br />
                });<br />
                <br />

                &lt;div id="click"&gt;&lt;/div&gt;
            </div>

            <div class="session">Displaying half star:</div>
            <div id="half"></div>

            <div class="source">
                $('#half').raty({<br />
                    &nbsp;&nbsp;start:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.3,<br />
                    &nbsp;&nbsp;showHalf:&nbsp;&nbsp;true<br />
                });<br />
                <br />

                &lt;div id="half"&gt;&lt;/div&gt;
            </div>

            <div class="session">With a default cancel button:</div>
            <div id="cancel"></div>

            <div class="source">
                $('#cancel').raty({<br />
                    &nbsp;&nbsp;showCancel: true<br />
                });<br />
                <br />

                &lt;div id="cancel"&gt;&lt;/div&gt;
            </div>

            <div class="session">With a custom cancel button:</div>
            <div id="cancel-custom"></div>

            <div class="source">
                $('#cancel-custom').raty({<br/>
                    &nbsp;&nbsp;cancelHint:&nbsp;&nbsp;&nbsp;'remove my rating!',<br/>
                    &nbsp;&nbsp;cancelPlace:&nbsp;&nbsp;'right',<br/>
                    &nbsp;&nbsp;showCancel:&nbsp;&nbsp;&nbsp;true<br/>
                    &nbsp;&nbsp;onClick: function(score) {<br/>
                    &nbsp;&nbsp;&nbsp;&nbsp;alert('score: ' + score);<br/>
                    &nbsp;&nbsp;}<br/>
                });<br/><br/>

                &lt;div id="cancel-custom"&gt;&lt;/div&gt;
            </div>

            <div class="session">Default options:</div>

            <div class="source">
                cancelHint:&nbsp;&nbsp;&nbsp;'cancel this rating!'<br />
                <div class="notice">The hint information.</div>
                cancelOff:&nbsp;&nbsp;&nbsp;&nbsp;'cancel-off.png'<br />
                <div class="notice">Name of the cancel image off.</div>
                cancelOn:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'cancel-on.png'<br />
                <div class="notice">Name of the cancel image on.</div>
                cancelPlace:&nbsp;&nbsp;'left'<br />
                <div class="notice">Position of the cancel button.</div>
                hintList:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;['bad', 'poor', 'regular', 'good', 'gorgeous']<br />
                <div class="notice">List of names that will be used as a hint on each star.</div>
                number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5<br />
                <div class="notice">Number of stars that will be presented.</div>
                path:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'img/'<br />
                <div class="notice">Path where are the images of the stars.</div>
                readOnly:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;false<br />
                <div class="notice">If the stars will be read-only.</div>
                scoreName:&nbsp;&nbsp;&nbsp;&nbsp;'score'<br />
                <div class="notice">Name of the hidden field that holds the score value.</div>
                showCancel:&nbsp;&nbsp;&nbsp;false<br />
                <div class="notice">If will be showed a button to cancel the rating.</div>
                showHalf:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;false<br />
                <div class="notice">If will show half star if come a float number as score.</div>
                starHalf:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'star-half.png'<br />
                <div class="notice">The name of the half star image.</div>
                start:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0<br />
                <div class="notice">Number of stars to be selected.</div>
                starOff:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'star-off.png'<br />
                <div class="notice">Name of the star image off.</div>
                starOn:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'star-on.png'<br />
                <div class="notice">Name of the star image on.</div>
                <span class="comment-script">//onClick:&nbsp;&nbsp;&nbsp;&nbsp;function() { alert('clicked!'); }</span>
                <div class="notice">Function that returns the selected value.</div>
            </div>

            <div class="session">Public functions: *</div>

            <div class="source">$.fn.raty.start(3);</div>
            <div class="description">Starting the rating with 3 stars later. Half star not supported.</div>

            <div class="source">$.fn.raty.readOnly(true);</div>
            <div class="description">Adjusts the rating for read-only later.</div>

            <div class="source">$.fn.raty.click(2);</div>
            <div class="description">Click in the star number 2 later.</div>

        </w:conteudoPagina>
        <div>
            <div style="height: 30px; background-color: #fff"></div>
            <arq:footer photoMgr="${photoMgr}" />
        </div>
    </body>
</html>
