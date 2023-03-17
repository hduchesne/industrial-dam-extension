<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>

<%--<template:addResources type="css" resources="bootstrap.min.css"/>--%>

<c:set var="caption" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="imageNode" value="${currentNode.properties['image'].node}"/>
<c:choose>
    <c:when test="${!empty imageNode && jcr:isNodeType(imageNode, 'cloudymix:cloudyAsset')}">
        <template:module node="${imageNode}" view="hidden.getURL" var="imageURL" editable="false" templateType="txt">
            <template:param name="width" value="${defaultWidth}"/>
        </template:module>
    </c:when>
    <c:when test="${!empty imageNode && jcr:isNodeType(imageNode, 'wdenmix:widenAsset')}">
        <template:module node="${imageNode}" view="hidden.getURL" var="imageURL" editable="false" templateType="txt">
            <template:param name="scale" value="1"/>
            <template:param name="quality" value="72"/>
            <template:param name="size" value="${defaultWidth}"/>
        </template:module>
    </c:when>
    <c:otherwise>
        <c:url var="imageURL" value="${imageNode.url}" context="/"/>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${renderContext.editMode}">
        <template:include view="image">
            <template:param name="class" value="img-fluid"/>
        </template:include>
    </c:when>
    <c:otherwise>
        <div class="scaling-image h-100">
            <div class="frame h-100">
                <div class="feature-img-bg h-100" style="background-image: url('${imageURL}');">
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>


<%--<div class="scaling-image">--%>
<%--    <div class="frame">--%>
<%--        <template:include view="image">--%>
<%--            <template:param name="class" value="img-fluid"/>--%>
<%--        </template:include>--%>
<%--    </div>--%>
<%--</div>--%>
