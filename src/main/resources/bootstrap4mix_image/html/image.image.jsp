<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<template:addResources type="css" resources="bootstrap.min.css"/>
<c:set var="imageNode" value="${currentNode.properties['image'].node}"/>
<c:if test="${! empty imageNode}">
    <%--
    this view allow to pass as paremeters a class and a style and an id parameters.
     This parameters can be overhidden using the image advanced settings.
     For class and style attribute, we keep the value from parameter as first.
     For ID we keep the value from advanced settings if exists.
    --%>
    <c:set var="class" value="${currentResource.moduleParams.class}"/>
    <c:if test="${! empty class}">
        <c:set var="class" value="${class}"/>
    </c:if>
    <c:set var="style" value="${currentResource.moduleParams.style}"/>
    <c:if test="${! empty style}">
        <c:set var="style" value="${style}"/>
    </c:if>
    <c:set var="id" value="${currentResource.moduleParams.id}"/>
    <c:if test="${! empty id}">
        <c:set var="id" value="${id}"/>
    </c:if>
    <c:set var="alt" value="${imageNode.displayableName}"/>
    <%-- set responsive by default --%>
    <c:set var="responsive" value="true"/>

    <c:if test="${jcr:isNodeType(currentNode, 'bootstrap4mix:imageAdvancedSettings')}">
        <c:set var="imageClass" value="${currentNode.properties.imageClass.string}"/>
        <c:if test="${! empty imageClass}">
            <c:set var="class">${class}${' '}${imageClass}</c:set>
        </c:if>
        <c:set var="imageStyle" value="${currentNode.properties.imageStyle.string}"/>
        <c:if test="${! empty imageStyle}">
            <c:set var="style">${style}<c:if
                    test="${! empty style && fn:endsWith(style,';')}">;</c:if>${imageStyle}</c:set>
        </c:if>
        <c:set var="imageID" value="${currentNode.properties.imageID.string}"/>
        <c:if test="${! empty imageID}">
            <c:set var="id" value="${imageID}"/>
        </c:if>
        <c:set var="responsive" value="${currentNode.properties.responsive.boolean}"/>
        <c:set var="thumbnails" value="${currentNode.properties.thumbnails.boolean}"/>
        <c:if test="${thumbnails}">
            <c:set var="class">${class}${' img-thumbnail'}</c:set>
        </c:if>
        <c:set var="borderRadius" value="${currentNode.properties.borderRadius.string}"/>
        <c:if test="${borderRadius != 'rounded-0'}">
            <c:set var="class">${class}${' '}${borderRadius}</c:set>
        </c:if>
        <c:set var="borderRadiusSize" value="${currentNode.properties.borderRadiusSize.string}"/>
        <c:if test="${borderRadiusSize != 'default'}">
            <c:set var="class">${class}${' '}${borderRadiusSize}</c:set>
        </c:if>

        <c:set var="align" value="${currentNode.properties.align.string}"/>
        <c:choose>
            <c:when test="${align eq 'left'}">
                <c:set var="class">${class}${' float-left'}</c:set>
            </c:when>
            <c:when test="${align eq 'right'}">
                <c:set var="class">${class}${' float-right'}</c:set>
            </c:when>
            <c:when test="${align eq 'center'}">
                <c:set var="class">${class}${' mx-auto d-block'}</c:set>
            </c:when>
        </c:choose>
        <c:set var="altStr" value="${currentNode.properties.alt.string}"/>
        <c:if test="${! empty altStr}">
            <c:set var="alt" value="${altStr}"/>
        </c:if>
    </c:if>
    <c:choose>
        <c:when test="${! responsive}">
            <c:set var="class">${fn:replace(class, 'img-fluid', '')}</c:set>
        </c:when>
        <c:otherwise>
            <c:if test="${! fn:contains(class, 'img-fluid')}">
                <c:set var="class">${class}${' img-fluid'}</c:set>
            </c:if>
        </c:otherwise>
    </c:choose>


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

    <img src="${imageURL}" alt="${fn:escapeXml(alt)}"
         <c:if test="${! empty class}"><c:out value=" "/>class="${fn:escapeXml(class)}"</c:if>
         <c:if test="${! empty style}"><c:out value=" "/>style="${fn:escapeXml(style)}"</c:if>
         <c:if test="${! empty id}"><c:out value=" "/>id="${fn:escapeXml(id)}"</c:if>
         <c:if test="${! empty id}"><c:out value=" "/>id="${fn:escapeXml(id)}"</c:if>
    />
</c:if>
