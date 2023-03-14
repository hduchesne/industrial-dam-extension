<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>


<c:set var="body" value="${currentNode.properties.body.string}"/>
<c:set var="imageNode" value="${currentNode.properties['ti:mediaNode'].node}"/>
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
        <c:url var="imageURL" value="${imageNode.url}"/>
    </c:otherwise>
</c:choose>

<div class="inner-page">
    <div class="slider-item" style="background-image: url('${imageURL}');">
        <div class="container">
            <div class="row slider-text align-items-center justify-content-center">
                <div class="col-md-8 text-center col-sm-12 pt-5 element-animate">
                    <%-- --%>
                    ${body}
                    <%--                    <h1 class="pt-5"><span>About Us</span></h1>--%>
                    <%--                    <p class="mb-5 w-75">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero sit, saepe? Rem, libero repellendus eum.</p>--%>
                </div>
            </div>
        </div>
    </div>
</div>
