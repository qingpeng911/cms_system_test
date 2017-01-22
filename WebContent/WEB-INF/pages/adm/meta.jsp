<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:if test="${!empty(jj.gjc)}">
	<c:set var="wzkeys" value=""/>
	<c:forTokens items="${jj.gjc}" delims=" ,，" var="name">
	   <c:set var="wzkeys" value="${wzkeys},${name}"/>
	</c:forTokens>
	<c:if test="${!empty(wzkeys)}">
		<c:set var="wzkeys" value="${fn:substring(wzkeys,1,fn:length(wzkeys))},"/>
	</c:if>
</c:if> 

<meta name="keywords" content="${wzkeys}java cms,开源免费cms,开源java cms,免费java cms,好用的java cms,简单的java cms,最懂你的java cms,tjpcms"/>
<meta name="description" content="${META_DES}"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome="/>
<meta name="renderer" content="webkit"/>
<!-- <meta http-equiv="Cache-Control" content="no-siteapp" />
 -->
 
<c:if test="${empty(title) && !empty(bread)}">
	<c:forTokens items="${bread}" delims=" ," var="name">
	   <c:set var="title" value="${title} - ${name}"/>
	</c:forTokens>
	<c:if test="${!empty(title)}">
		<c:set var="title" value="${fn:substring(title,3,fn:length(title))}"/>
	</c:if>
</c:if>
