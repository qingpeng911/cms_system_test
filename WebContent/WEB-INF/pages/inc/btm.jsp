<%@ page language="java"  import="java.util.*"  pageEncoding="UTF-8"%>
<style>
	.cmnbtm{height: 36px;background: #3071a9;width: 1000px;margin: 0 auto;line-height: 36px;text-align: center;color:#E7E7E7;}
	.cmnbtm a{font-size: 12px;color:#E7E7E7 !important;text-decoration: none !important;
		font-family:"Segoe UI","Lucida Grande",Helvetica,Arial,"Microsoft YaHei",FreeSans,Arimo,
			"Droid Sans","wenquanyi micro hei","Hiragino Sans GB","Hiragino Sans GB W3",FontAwesome,sans-serif;
		-webkit-transition: all 0.5s; -moz-transition: all 0.5s; -o-transition: all 0.5s;}
	.cmnbtm a:hover{color:white !important}
	#SOHUCS, #cyReward{max-width: 1000px;}
	#cyReward{text-align: center;margin-bottom: 22px;}
	
	@media (max-width: 1000px) {
		.cmnbtm{width:100%;}
	}
</style>

<c:if test="${needcy==1}">
	<!--PC和WAP自适应版-->
	<div id="SOHUCS" sid="${cyid}" ></div> 
	
	<script type="text/javascript"> 
	(function(){ 
	var appid = 'cysHEHjOS'; 
	var conf = 'prod_d88441f85c07ec1e5cecd0cf45872664'; 
	var width = window.innerWidth || document.documentElement.clientWidth; 
	if (width < 960) { 
	window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="http://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>'); } else { var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};loadJs("http://changyan.sohu.com/upload/changyan.js",function(){window.changyan.api.config({appid:appid,conf:conf})}); } })(); </script>
</c:if>

<div class="cmnbtm">
	&copy;<%= 2016==Calendar.getInstance().get(Calendar.YEAR)?"2016":"2016-"+Calendar.getInstance().get(Calendar.YEAR)%>
		<a  target="_blank"  style="font-size:14px" href="http://${YUMING}">${YUMING}</a> &nbsp;
	<a class="" target="_blank" style="text-decoration:underline !important;" href="http://www.miitbeian.gov.cn/"> ${bah}</a>
</div>

