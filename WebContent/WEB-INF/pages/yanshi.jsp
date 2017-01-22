<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% request.setAttribute("path", request.getContextPath());%>

<!doctype html>
<html>
<head>
<title>tjpcms - 演示</title>
<%@ include file="inc/meta.jsp"%>

<style>
	.sycontent{padding-top:0 !important}
	.panel{text-align: justify;text-indent: 2em;font-size: 15px;border: 1px solid #ddd;-webkit-border-radius: 4px;
	-moz-border-radius: 4px;width: 90%;margin: 0 auto;border-radius: 4px;margin-bottom: 18px;}
	.pnlbd{ padding: 15px;}
	.pnlft{
	    background-color: #f5f5f5;
	    padding: 10px 15px;
	    border-radius: 0 0 4px 4px;
	    border-top: solid 1px #ddd;line-height:175%;}
</style>

</head>
<body>
	<%@ include file="inc/head.jsp"%>
	
	<div class="sycontent" >
		<div class="bread">
			<ul>
				<li><a class="icon-shouye brdsy" href="${path}/"> 首页</a></li>
				<li><a href="#">演示</a></li>
			</ul>
		</div>
		<div class="panel">
			<div class="pnlbd">
				说的再好也不如做得好啊，下面就放出一个基于tjpcms开发的网站的前后台实例，也是首页下载包里的源码编译后的发布版。为了展现作者最大的诚意，此处直接展示官网的前后台：
			</div>
			<div class='pnlft'>
				<p>前台地址：<a target="_blank" href="${path}/">www.tjpcms.com</a></p>
				<p>后台地址：<a target="_blank" href="${path}/htlgn/login.dhtml">www.tjpcms.com/htlgn/login.dhtml</a><label style="font-size:13px;margin-left:15px">用户名/密码：test/test</label></p>
			</div>
		</div>
	</div>
	
	<c:set var="needcy" value="1"/>
	<%@ include file="inc/btm.jsp"%>
	
	<script src="${path}/js/cmn.js"></script>
	<script>
		$(function() {
			
		})
	</script>
</body>
</html>

