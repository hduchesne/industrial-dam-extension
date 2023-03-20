<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>

<utility:logger level="DEBUG" value=" ***** owcarouseItemS Industrial-Dam-Extension :  WIN"/>

<c:set var="caption" value="${currentNode.properties.caption.string}"/>
<c:set var="imageNode" value="${currentNode.properties['image'].node}"/>

<c:choose>
    <c:when test="${!empty imageNode && jcr:isNodeType(imageNode, 'cloudymix:cloudyAsset')}">
        <template:module node="${imageNode}" view="hidden.getURL" var="imageURL" editable="false" templateType="txt">
            <template:param name="width" value="2000"/>
        </template:module>
    </c:when>
    <c:when test="${!empty imageNode && jcr:isNodeType(imageNode, 'wdenmix:widenAsset')}">
        <template:module node="${imageNode}" view="hidden.getURL" var="imageURL" editable="false" templateType="txt">
            <template:param name="scale" value="1"/>
            <template:param name="quality" value="72"/>
            <template:param name="size" value="2000"/>
        </template:module>
    </c:when>
    <c:otherwise>
        <c:url var="imageURL" value="${imageNode.url}"/>
    </c:otherwise>
</c:choose>


<c:set var="mediaSource" value="${currentNode.properties['ti:mediaSource'].string}" />
<c:choose>
    <c:when test="${mediaSource eq 'reference'}">
        <c:set var="videoNode" value="${currentNode.properties['ti:video'].node}"/>
        <c:choose>
            <c:when test="${!empty videoNode && jcr:isNodeType(videoNode, 'cloudymix:cloudyAsset')}">
                <template:module node="${videoNode}" view="hidden.getURL" var="videoURL" editable="false" templateType="txt"/>
            </c:when>
            <c:when test="${!empty videoNode && jcr:isNodeType(videoNode, 'wdenmix:widenAsset')}">
                <template:module node="${videoNode}" view="hidden.getURL" var="videoURL" editable="false" templateType="txt"/>
            </c:when>
            <c:otherwise>
                <c:url var="videoURL" value="${currentNode.properties['ti:video'].node.url}"/>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:when test="${mediaSource eq 'url'}">
        <c:url var="videoURL" value="${currentNode.properties['ti:video'].string}"/>
    </c:when>
</c:choose>

<c:choose>
    <c:when test="${renderContext.editMode}">
        <div class="card j-owl-carousel-card-edit">
            <img class="card-img-top" src="${imageURL}" alt="Card image cap">
            <div class="card-body">
                    ${caption}
                    <%--                <h5 class="card-title">Card title</h5>--%>
                    <%--                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>--%>
                    <%--                <a href="#" class="btn btn-primary">Go somewhere</a>--%>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="slider-item" style="background-image: url('${imageURL}');">
            <div class="container">
                <div class="row slider-text align-items-center justify-content-center">
                    <div class="col-lg-7 text-center col-sm-12 element-animate">
                        <c:if test="${not empty videoURL}">
                        <div class="btn-play-wrap mx-auto">
                            <p class="mb-4">
                                <a href="${videoURL}" data-fancybox data-ratio="2" class="btn-play">
                                    <span class="ion ion-ios-play"></span>
                                </a>
                            </p>
                        </div>
                        </c:if>
                            ${caption}
                            <%--                        <h1 class="mb-4"><span>We Are Industrial Company</span></h1>--%>
                            <%--                        <p class="mb-5 w-75">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias iste ipsa excepturi nostrum sequi molestias?</p>--%>
                    </div>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>
