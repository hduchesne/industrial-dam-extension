<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<c:set var="mediaNode" value="${currentNode.properties['ti:mediaNode'].node}"/>
<utility:logger level="DEBUG" value="*** damImage.image mediaNode NodeTypes : ${mediaNode.displayableName}"/>

<c:set var="view" value="galleryImage"/>
<c:if test="${!empty mediaNode && jcr:isNodeType(mediaNode, 'wdenmix:widenAsset')}">
    <c:set var="view" value="default"/>
</c:if>
<c:if test="${!empty mediaNode && jcr:isNodeType(mediaNode, 'cloudymix:cloudyAsset')}">
    <c:set var="view" value="default"/>
</c:if>

<template:module node="${mediaNode}" editable="false" view="${view}">
    <template:param name="width" value="${currentResource.moduleParams.width}"/>
    <template:param name="widths" value="${currentResource.moduleParams.widths}"/>
    <template:param name="defaultWidth" value="${currentResource.moduleParams.defaultWidth}"/>
    <template:param name="sizes" value="${currentResource.moduleParams.sizes}"/>
    <template:param name="class" value="${currentResource.moduleParams.class}"/>
</template:module>



