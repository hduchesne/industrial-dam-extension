<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>


<%--<c:set var="linkUrl" value="${currentResource.moduleParams.linkUrl}"/>--%>
<c:set var="body" value="${currentNode.properties.body.string}"/>
<c:set var="imageNode" value="${currentNode.properties['image'].node}"/>
<template:addCacheDependency node="${imageNode}"/>

<c:choose>
    <c:when test="${!empty imageNode && jcr:isNodeType(imageNode, 'cloudymix:cloudyAsset')}">
        <template:module node="${imageNode}" view="hidden.getURL" var="imageURL" editable="false" templateType="txt">
            <template:param name="width" value="1280"/>
        </template:module>
    </c:when>
    <c:when test="${!empty imageNode && jcr: isNodeType(imageNode, 'wdenmix:widenAsset')}">
        <template:module node="${imageNode}" view="hidden.getURL" var="imageURL" editable="false" templateType="txt">
            <template:param name="scale" value="1"/>
            <template:param name="quality" value="72"/>
            <template:param name="size" value="1280"/>
        </template:module>
    </c:when>
    <c:otherwise>
        <c:url var="imageURL" value="${imageNode.url}" context="/"/>
    </c:otherwise>
</c:choose>

<template:include view="hidden.generateLink"/>

<div class="media d-block media-custom text-center">
    <c:choose>
        <c:when test="${not empty moduleMap.linkUrl}">
            <a href="${moduleMap.linkUrl}" target="${moduleMap.linkTarget}">
        </c:when>
        <c:otherwise>
            <div class="a-like">
        </c:otherwise>
    </c:choose>

<%--    <template:module view="image" node="${imageNode}" editable="false">--%>
<%--        <template:param name="class" value="img-fluid"/>--%>
<%--    </template:module>--%>
            <img src="${imageURL}" alt="people" class="img-fluid">
    <c:choose>
        <c:when test="${not empty moduleMap.linkUrl}">
            </a>
        </c:when>
        <c:otherwise>
            </div>
        </c:otherwise>
    </c:choose>

    ${body}
</div>
